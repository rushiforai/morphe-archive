// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>A setting of a section of BaconReader's own settings ("List View", "Detail View"), as it names it. A case is added when a test needs it.</summary>
[Union]
public partial record BaconReaderSetting
{
    /// <summary>In "List View" and in "Detail View"; "Remove awards" removes both.</summary>
    public partial record HideRedditAwards;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="BaconReaderSetting"/>: the only place those strings live.</summary>
public static class BaconReaderSettingShowing
{
    private static readonly BaconReaderSetting[] Listed = [new BaconReaderSetting.HideRedditAwards()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this BaconReaderSetting value) =>
        value.Match(
            hideRedditAwards => "Hide Reddit Awards",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="BaconReaderSetting.Unlisted"/>.</summary>
    public static BaconReaderSetting ReadBaconReaderSetting(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new BaconReaderSetting.Unlisted(shown);
}
