// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// Where the scenarios play and what they patch, from the environment (README, "Run and record"):
/// - <c>E2E_APPIUM_URL</c>, <c>E2E_ADB_SERIAL</c>, <c>E2E_APPIUM_UDID</c>: the phone, as its connection script exports them
///   (README, "The phone"); without <c>E2E_APPIUM_URL</c> every scenario is skipped;
/// - <c>E2E_VIDEO_DIR</c>: where a recorded run leaves its video and record (tools/e2e/record.sh sets it); unset, nothing
///   is recorded and nothing is paced;
/// - <c>E2E_ACTION_GAP</c>: the least seconds between two steps of a recorded scenario (default 0.4);
/// - <c>E2E_BUNDLE</c>: the Morphe bundle (<c>.mpp</c>) to patch with, by default the newest one <c>./gradlew buildAndroid</c> builds;
/// - <c>E2E_TEST_BUNDLE</c>: the <c>.mpp</c> of the test-only patches, by default the newest one <c>./gradlew buildAndroid</c>
///   builds in e2e-patches/ (never released);
/// - <c>E2E_FAKE_REDDIT_URL</c>: the fake Reddit server "E2E fake Reddit" points the app at (default
///   <c>http://127.0.0.1:5080</c>);
/// - <c>E2E_BASE_APK</c>: the clean APK to patch, by default BaconReader Premium 6.1.4's in <c>E2E_ARTIFACTS_DIR</c>, the
///   folder the connection script downloads it to.
/// </summary>
public static class E2EDevice
{
    /// <summary>The package of the app the scenarios play: BaconReader Premium 6.1.4.</summary>
    public const string Package = "com.onelouder.baconreader.premium";

    /// <summary>
    /// The device as the Appium server sees it, <c>E2E_APPIUM_UDID</c>: by default <see cref="AdbSerial"/>, as an Appium
    /// running next to the tests sees it; an Appium running next to the phone sees it under its own name.
    /// </summary>
    public static string AppiumUdid => Environment.GetEnvironmentVariable("E2E_APPIUM_UDID") is { Length: > 0 } udid ? udid : AdbSerial;

    public static Uri? AppiumUrl => Environment.GetEnvironmentVariable("E2E_APPIUM_URL") is { Length: > 0 } url ? new Uri(url) : null;

    public static string AdbSerial => Environment.GetEnvironmentVariable("E2E_ADB_SERIAL") is { Length: > 0 } serial ? serial : "127.0.0.1:15555";

    public static string? VideoDirectory => Environment.GetEnvironmentVariable("E2E_VIDEO_DIR") is { Length: > 0 } videos ? videos : null;

    public static TimeSpan ActionGap =>
        double.TryParse(Environment.GetEnvironmentVariable("E2E_ACTION_GAP"), System.Globalization.CultureInfo.InvariantCulture, out var seconds)
            ? TimeSpan.FromSeconds(seconds)
            : TimeSpan.FromSeconds(0.4);

    public static string Bundle =>
        Environment.GetEnvironmentVariable("E2E_BUNDLE") is { Length: > 0 } bundle
            ? bundle
            : NewestBundle("patches");

    public static string TestBundle =>
        Environment.GetEnvironmentVariable("E2E_TEST_BUNDLE") is { Length: > 0 } bundle
            ? bundle
            : NewestBundle("e2e-patches");

    /// <summary>
    /// The fake Reddit server's URL as the phone reaches it, <c>E2E_FAKE_REDDIT_URL</c>: by default
    /// <c>http://127.0.0.1:5080</c>, the test process's port that <c>adb reverse tcp:5080 tcp:5080</c> forwards.
    /// </summary>
    public static string FakeRedditUrl =>
        Environment.GetEnvironmentVariable("E2E_FAKE_REDDIT_URL") is { Length: > 0 } url ? url : "http://127.0.0.1:5080";

    public static string BaseApk =>
        Environment.GetEnvironmentVariable("E2E_BASE_APK") is { Length: > 0 } apk
            ? apk
            : Environment.GetEnvironmentVariable("E2E_ARTIFACTS_DIR") is { Length: > 0 } artifacts && Directory.Exists(artifacts)
                ? Directory.EnumerateFiles(artifacts, Package + "-6.1.4-clean-base-*.apk").SingleOrDefault()
                  ?? Path.Combine(artifacts, Package + "-6.1.4-clean-base.apk")
                : Package + "-6.1.4-clean-base.apk (set E2E_ARTIFACTS_DIR or E2E_BASE_APK)";

    /// <summary>What the scenarios keep between runs: each set of patches' APK and the test key that signs them.</summary>
    public static string WorkFolder => Path.Combine(RepoRoot, "build", "e2e");

    /// <summary>The repository's root (the folder with settings.gradle.kts): build/ lives there.</summary>
    public static string RepoRoot { get; } = FindRepoRoot();

    // The newest .mpp a patches project (patches, e2e-patches) built: <project>/build/libs/<project>-<version>.mpp.
    private static string NewestBundle(string project)
    {
        var built = Path.Combine(RepoRoot, project, "build", "libs");
        return Directory.Exists(built)
            ? Directory.EnumerateFiles(built, project + "-*.mpp").OrderByDescending(File.GetLastWriteTimeUtc).FirstOrDefault() ?? Path.Combine(built, project + "-<version>.mpp")
            : Path.Combine(built, project + "-<version>.mpp");
    }

    private static string FindRepoRoot()
    {
        for (var folder = new DirectoryInfo(AppContext.BaseDirectory); folder is not null; folder = folder.Parent)
        {
            if (File.Exists(Path.Combine(folder.FullName, "settings.gradle.kts")))
            {
                return folder.FullName;
            }
        }

        return Directory.GetCurrentDirectory();
    }
}
