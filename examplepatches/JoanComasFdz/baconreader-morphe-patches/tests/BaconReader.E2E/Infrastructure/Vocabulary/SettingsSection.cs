// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>An entry of BaconReader's settings menu, as it names it. A case is added when a test needs it.</summary>
[Union]
public partial record SettingsSection
{
    /// <summary>The last entry, which "Patches entry in settings" adds: it opens the patches' settings.</summary>
    public partial record Patches;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="SettingsSection"/>: the only place those strings live.</summary>
public static class SettingsSectionShowing
{
    private static readonly SettingsSection[] Listed = [new SettingsSection.Patches()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this SettingsSection value) =>
        value.Match(
            patches => "Patches",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="SettingsSection.Unlisted"/>.</summary>
    public static SettingsSection ReadSettingsSection(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new SettingsSection.Unlisted(shown);
}
