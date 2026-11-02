// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Reflection;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A patch of baconreader-morphe-patches, as its bundle names it. An enum, not a union like the other kinds (rule e): a
/// scenario names its patches in <see cref="PatchedWithAttribute"/>, and an attribute takes only constants. A case is
/// added when a test needs it.
/// </summary>
public enum Patch
{
    SpoofClient,
    DisableFinalReleaseAnnouncement,
    PromptToOpenRedditLinks,
    EmbedCommentImages,
    E2EFakeReddit,
    E2EInboxEnvelopeLabel,
}

/// <summary>What the bundle names each <see cref="Patch"/>: the only place those strings live.</summary>
public static class PatchShowing
{
    /// <summary>The patch's name in the bundle, as <c>morphe-desktop patch --enable</c> takes it and the Gherkin quotes it.</summary>
    public static string ToShownText(this Patch patch) =>
        patch switch
        {
            Patch.SpoofClient => "Spoof client",
            Patch.DisableFinalReleaseAnnouncement => "Disable final release announcement",
            Patch.PromptToOpenRedditLinks => "Prompt to open Reddit links",
            Patch.EmbedCommentImages => "Embed comment images",
            Patch.E2EFakeReddit => "E2E fake Reddit",
            Patch.E2EInboxEnvelopeLabel => "E2E inbox envelope label",
            _ => throw new ArgumentOutOfRangeException(nameof(patch), patch, "A patch with no name in the bundle."),
        };

    /// <summary>
    /// Whether the patch is test-only, in the e2e bundle (e2e-patches/, never released): Morphe Desktop looks for an
    /// <c>--enable</c> only in the <c>--patches</c> file before it.
    /// </summary>
    public static bool IsTestOnly(this Patch patch) => patch is Patch.E2EFakeReddit or Patch.E2EInboxEnvelopeLabel;
}

/// <summary>
/// The patches a Startup scenario's app is patched with, the fewest it needs: BaseE2E patches the clean APK with exactly
/// these (and what they depend on) and installs it before the scenario starts. A scenario that logs in needs
/// <see cref="Patch.SpoofClient"/>. Its Given names each, one a line (E2E-TEST-CODE-RULES.md, rule a).
/// </summary>
[AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
public sealed class PatchedWithAttribute(params Patch[] patches) : Attribute
{
    public IReadOnlyList<Patch> Patches { get; } = patches;
}

/// <summary>
/// A LoggedIn scenario's app: patched with every patch in the bundle, one APK that every LoggedIn scenario shares. Its
/// Given says "And BaconReader is patched with every patch" (E2E-TEST-CODE-RULES.md, rule a).
/// </summary>
[AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
public sealed class PatchedWithEveryPatchAttribute : Attribute;

/// <summary>What a scenario's app is patched with: <see cref="Every"/> patch, or <see cref="Only"/> the ones it names.</summary>
public abstract record PatchSet
{
    private PatchSet()
    {
    }

    /// <summary>Every patch in the bundle (<see cref="PatchedWithEveryPatchAttribute"/>).</summary>
    public sealed record Every : PatchSet;

    /// <summary>Only <paramref name="Patches"/> (<see cref="PatchedWithAttribute"/>).</summary>
    public sealed record Only(IReadOnlyList<Patch> Patches) : PatchSet;

    /// <summary>The text a Gherkin and a recording's "Patched with" give for an app patched with every patch.</summary>
    public const string EveryPatchText = "every patch";

    /// <summary>Whether the app has <paramref name="patch"/>: what decides the dialogs opening it shows.</summary>
    public bool Includes(Patch patch) => this is Every || (this is Only only && only.Patches.Contains(patch));

    /// <summary>"every patch", or each patch's name in the bundle, sorted: the same text for the same APK.</summary>
    public IReadOnlyList<string> ToShownText() =>
        this is Only only ? [.. only.Patches.Select(patch => patch.ToShownText()).Order(StringComparer.Ordinal)] : [EveryPatchText];

    /// <summary>
    /// What a scenario method is patched with, from its attribute; null when it has neither or both of
    /// <see cref="PatchedWithAttribute"/> and <see cref="PatchedWithEveryPatchAttribute"/>.
    /// </summary>
    public static PatchSet? Of(MethodInfo method) =>
        (method.GetCustomAttribute<PatchedWithAttribute>(), method.GetCustomAttribute<PatchedWithEveryPatchAttribute>()) switch
        {
            ({ } only, null) => new Only(only.Patches),
            (null, not null) => new Every(),
            _ => null,
        };
}
