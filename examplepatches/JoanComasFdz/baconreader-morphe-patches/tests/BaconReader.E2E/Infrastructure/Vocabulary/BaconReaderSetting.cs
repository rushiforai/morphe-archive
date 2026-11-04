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

    /// <summary>In "Filters": BaconReader hides NSFW posts until it is on.</summary>
    public partial record ShowNsfwPosts;

    /// <summary>In "Filters": on with "Show NSFW posts"; off, "Fix list thumbnails" blurs NSFW thumbnails.</summary>
    public partial record ShowNsfwImages;

    /// <summary>In "Detail View": off by default, and BaconReader shows no media in a post's detail view until it is on.</summary>
    public partial record ShowLargeImage;

    /// <summary>In "Other": on by default; off, BaconReader opens the links in a text in the browser.</summary>
    public partial record OpenLinksInsideApp;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="BaconReaderSetting"/>: the only place those strings live.</summary>
public static class BaconReaderSettingShowing
{
    private static readonly BaconReaderSetting[] Listed = [new BaconReaderSetting.HideRedditAwards(), new BaconReaderSetting.ShowNsfwPosts(), new BaconReaderSetting.ShowNsfwImages(), new BaconReaderSetting.ShowLargeImage(), new BaconReaderSetting.OpenLinksInsideApp()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this BaconReaderSetting value) =>
        value.Match(
            hideRedditAwards => "Hide Reddit Awards",
            showNsfwPosts => "Show NSFW posts",
            showNsfwImages => "Show NSFW images",
            showLargeImage => "Show large image",
            openLinksInsideApp => "Open links inside app",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="BaconReaderSetting.Unlisted"/>.</summary>
    public static BaconReaderSetting ReadBaconReaderSetting(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new BaconReaderSetting.Unlisted(shown);
}
