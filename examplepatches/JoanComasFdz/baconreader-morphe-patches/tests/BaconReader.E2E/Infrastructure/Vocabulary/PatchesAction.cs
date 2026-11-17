// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A row of the patches' settings that runs something when tapped, rather than holding a value, as its title names it.
/// A case is added when a test needs it.
/// </summary>
[Union]
public partial record PatchesAction
{
    /// <summary>"Export and import settings": saves the settings to a file.</summary>
    public partial record ExportSettings;

    /// <summary>"Export and import settings": replaces the settings with a file's.</summary>
    public partial record ImportSettings;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="PatchesAction"/>: the only place those strings live.</summary>
public static class PatchesActionShowing
{
    /// <summary>Every action a case names.</summary>
    public static IReadOnlyList<PatchesAction> Listed { get; } =
    [
        new PatchesAction.ExportSettings(),
        new PatchesAction.ImportSettings(),
    ];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this PatchesAction value) =>
        value.Match(
            exportSettings => "Export settings",
            importSettings => "Import settings",
            unlisted => unlisted.Shown);

    /// <summary>The action the app shows as <paramref name="shown"/>, or <see cref="PatchesAction.Unlisted"/>.</summary>
    public static PatchesAction ReadPatchesAction(string shown) =>
        Listed.FirstOrDefault(action => action.ToShownText() == shown) ?? new PatchesAction.Unlisted(shown);
}
