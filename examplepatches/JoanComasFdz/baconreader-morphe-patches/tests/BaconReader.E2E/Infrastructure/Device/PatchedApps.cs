// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using BaconReader.E2E.Infrastructure.Vocabulary;

namespace BaconReader.E2E.Infrastructure.Device;

/// <summary>
/// Patches the clean BaconReader APK with a scenario's patches and installs it on the phone, as cheaply as a slow
/// link to it allows (a cloud session's reaches it at ~3–4 Mbit/s):
/// - the released bundle and the test-only one (e2e-patches/) are both loaded, and "E2E fake Reddit" gets the fake Reddit
///   server's URL (<see cref="E2EDevice.FakeRedditUrl"/>), in every scenario's app (<see cref="Always"/>);
/// - Morphe Desktop runs with <c>--exclusive</c> and an <c>--enable</c> for each patch: a Startup scenario's own, or, for
///   a LoggedIn scenario's every patch, each one the bundle lists (<c>list-patches</c>), so a patch off by default is in too;
/// - each set of patches is patched once per bundle (<c>build/e2e/patched/&lt;hash&gt;.apk</c>; Morphe Desktop takes about six seconds);
/// - every APK is signed with the one key Morphe Desktop keeps next to its jar (<c>morphe.keystore</c>), so one installs over
///   another; an install signed with another key (the owner's, another session's) is uninstalled first;
/// - an APK already installed (the device's copy has the same SHA-256) isn't sent again: sending one takes ~40 s.
/// </summary>
public static partial class PatchedApps
{
    private const string DeviceApk = "/data/local/tmp/e2e/app.apk";
    private static readonly SemaphoreSlim OneAtATime = new(1, 1);

    /// <summary>
    /// The patches every scenario's app is patched with, besides those its Given names, which never name these: "E2E
    /// fake Reddit", so the app talks to the fake Reddit, never to Reddit; "E2E inbox envelope label", so a test sees
    /// the orange envelope of unread messages in the left-menu button's description.
    /// </summary>
    public static IReadOnlyList<Patch> Always { get; } = [Patch.E2EFakeReddit, Patch.E2EInboxEnvelopeLabel];

    private static string MorpheDesktop =>
        Environment.GetEnvironmentVariable("E2E_MORPHE_DESKTOP") is { Length: > 0 } jar ? jar : "/opt/patch-tools/morphe-desktop.jar";

    /// <summary>
    /// Patches the clean APK with <paramref name="patchSet"/> and <see cref="Always"/> (once per bundle) and returns the
    /// patched APK.
    /// </summary>
    public static async Task<string> PatchAsync(PatchSet patchSet)
    {
        await OneAtATime.WaitAsync();
        try
        {
            CheckExists(E2EDevice.Bundle, "the bundle: build it with ./gradlew buildAndroid (README)");
            CheckExists(E2EDevice.TestBundle, "the e2e bundle: ./gradlew buildAndroid builds it too (README)");
            CheckExists(MorpheDesktop, "Morphe Desktop: tools/morphe-desktop.sh installs it (E2E_MORPHE_DESKTOP names another jar)");
            CheckExists(E2EDevice.BaseApk, "the clean BaconReader APK: the phone's connection script downloads it (README, \"The phone\")");
            var patches = new PatchSet.Only([.. (patchSet is PatchSet.Only only ? only.Patches : []).Union(Always)]);
            // The released bundle's patches to --enable: a Startup scenario's own, or every one it lists.
            IReadOnlyList<string> released = patchSet is PatchSet.Every
                ? await ReadPatchNamesAsync(E2EDevice.Bundle)
                : [.. patches.Patches.Where(patch => !patch.IsTestOnly()).Select(patch => patch.ToShownText())];
            var testOnly = patches.Patches.Where(patch => patch.IsTestOnly()).Select(patch => patch.ToShownText());
            IReadOnlyList<string> names = [.. released.Concat(testOnly).Order(StringComparer.Ordinal)];
            var key = Hash(
                $"{HashFile(E2EDevice.Bundle)}\n{HashFile(E2EDevice.TestBundle)}\n{HashFile(E2EDevice.BaseApk)}\n{E2EDevice.FakeRedditUrl}\n{string.Join('\n', names)}")[..16];
            var patched = Path.Combine(E2EDevice.WorkFolder, "patched", key + ".apk");
            if (File.Exists(patched))
            {
                return patched;
            }

            Directory.CreateDirectory(Path.GetDirectoryName(patched)!);
            var writing = Path.Combine(Path.GetDirectoryName(patched)!, key + "-writing.apk");
            var report = Path.ChangeExtension(writing, ".json");
            var arguments = new List<string>
            {
                "-jar", MorpheDesktop, "patch",
                "--patches", E2EDevice.Bundle,
                "--exclusive",
                "--result-file", report,
                "--out", writing,
            };
            // Each --enable and --options belongs to the --patches file before it.
            foreach (var name in released)
            {
                arguments.AddRange(["--enable", name]);
            }

            arguments.AddRange(["--patches", E2EDevice.TestBundle]);
            if (patches.Patches.Contains(Patch.E2EFakeReddit))
            {
                arguments.AddRange(["--options", $"baseUrl={E2EDevice.FakeRedditUrl}", "--enable", Patch.E2EFakeReddit.ToShownText()]);
            }

            if (patches.Patches.Contains(Patch.E2EInboxEnvelopeLabel))
            {
                arguments.AddRange(["--enable", Patch.E2EInboxEnvelopeLabel.ToShownText()]);
            }

            arguments.Add(E2EDevice.BaseApk);
            var ran = await Commands.RunAsync("java", [.. arguments]);
            var log = ran.Output + ran.Error;
            if (!ran.Succeeded || !File.Exists(report) || !AppliedEvery(File.ReadAllText(report), names))
            {
                throw new InvalidOperationException($"Morphe Desktop couldn't apply every patch of {string.Join(", ", names)}:\n{log}");
            }

            File.Delete(report);
            File.Move(writing, patched, overwrite: true);
            return patched;
        }
        finally
        {
            OneAtATime.Release();
        }
    }

    /// <summary>Installs <paramref name="apk"/> on the phone, with its runtime permissions granted, unless it's already the one installed.</summary>
    public static async Task InstallAsync(string apk)
    {
        var sha = HashFile(apk);
        if (await ReadInstalledShaAsync() == sha)
        {
            return;
        }

        var installing = System.Diagnostics.Stopwatch.StartNew();
        await Commands.ShellAsync("mkdir -p /data/local/tmp/e2e");
        await Commands.AdbAsync("push", apk, DeviceApk);
        var installed = await Commands.ShellAsync($"pm install -r -g {DeviceApk} 2>&1 || true");
        if (installed.Contains("INSTALL_FAILED_UPDATE_INCOMPATIBLE", StringComparison.Ordinal))
        {
            await Commands.ShellAsync($"pm uninstall {E2EDevice.Package}");
            installed = await Commands.ShellAsync($"pm install -g {DeviceApk} 2>&1 || true");
        }

        await Commands.ShellAsync($"rm -f {DeviceApk}");
        if (!installed.Contains("Success", StringComparison.Ordinal))
        {
            throw new InvalidOperationException($"Installing {Path.GetFileName(apk)} failed: {installed}");
        }

        RunLog.Installed(Path.GetFileName(apk), installing.Elapsed);
    }

    /// <summary>
    /// Leaves the installed app as if just installed: stopped, its data cleared (logins, settings, what it cached), and no
    /// link it declares selected on Android's "Open by default" screen, which clearing its data keeps ("Prompt to open
    /// Reddit links" asks only while none of its Reddit links is); with its notifications denied, as if the user had
    /// answered "Don’t allow". Otherwise Android asks "Allow BaconReader Premium to send you notifications?" when
    /// BaconReader opens its next screen ("Add account"), over it, not as it opens: Android requests the question at
    /// launch, but drops it. No scenario is about it, so none answers it (docs/given-when-then-test-rules.md, section 4).
    /// </summary>
    public static async Task ResetAsync()
    {
        const string notifications = "android.permission.POST_NOTIFICATIONS";
        await Commands.ShellAsync($"am force-stop {E2EDevice.Package}");
        await Commands.ShellAsync($"pm clear {E2EDevice.Package}");
        await Commands.ShellAsync(
            $"pm set-app-links-user-selection --user 0 --package {E2EDevice.Package} false all"
            + $" && pm set-app-links-allowed --user 0 --package {E2EDevice.Package} true");
        // USER_SET: the user answered, so Android doesn't ask (PermissionPolicyService asks only when it isn't set).
        await Commands.ShellAsync(
            $"pm revoke {E2EDevice.Package} {notifications} && pm set-permission-flags {E2EDevice.Package} {notifications} user-set");
    }

    private static async Task<string?> ReadInstalledShaAsync()
    {
        var path = await Commands.ShellAsync($"pm path {E2EDevice.Package} | grep base.apk | sed 's/^package://' || true");
        if (path.Length == 0)
        {
            return null;
        }

        var sum = await Commands.ShellAsync($"sha256sum {path}");
        return sum.Split(' ', 2)[0];
    }

    // Every patch a bundle lists, by name ("Name: Spoof client"), as --enable takes it.
    private static async Task<IReadOnlyList<string>> ReadPatchNamesAsync(string bundle)
    {
        var listed = await Commands.RunOrFailAsync("java", "-jar", MorpheDesktop, "list-patches", "--patches", bundle);
        var names = PatchName().Matches(listed).Select(match => match.Groups[1].Value.Trim()).ToArray();
        return names.Length > 0 ? names : throw new InvalidOperationException($"Morphe Desktop lists no patch in {bundle}:\n{listed}");
    }

    [GeneratedRegex(@"^Name: (.+)$", RegexOptions.Multiline)]
    private static partial Regex PatchName();

    // Morphe Desktop's report of the run: it succeeded, none failed, and every patch asked for was applied (it also applies what they depend on).
    private static bool AppliedEvery(string report, IReadOnlyList<string> names)
    {
        using var json = JsonDocument.Parse(report);
        var root = json.RootElement;
        var applied = root.GetProperty("appliedPatches").EnumerateArray().Select(patch => patch.GetString()).ToHashSet();
        return root.GetProperty("success").GetBoolean()
            && root.GetProperty("failedPatches").GetArrayLength() == 0
            && names.All(applied.Contains);
    }

    private static void CheckExists(string path, string what)
    {
        if (!File.Exists(path))
        {
            throw new FileNotFoundException($"{path} is missing: {what}.", path);
        }
    }

    private static string HashFile(string path)
    {
        using var stream = File.OpenRead(path);
        return Convert.ToHexStringLower(SHA256.HashData(stream));
    }

    private static string Hash(string text) => Convert.ToHexStringLower(SHA256.HashData(Encoding.UTF8.GetBytes(text)));
}
