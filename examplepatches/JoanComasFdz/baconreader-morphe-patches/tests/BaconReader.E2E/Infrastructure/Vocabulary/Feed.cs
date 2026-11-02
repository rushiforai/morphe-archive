// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>A feed of posts, as the main screen's toolbar names it. A case is added when a test needs it.</summary>
[Union]
public partial record Feed
{
    public partial record FrontPage;

    public partial record All;

    public partial record Popular;

    public partial record Friends;

    /// <summary>Reddit removed it in December 2024; "Remove Random feeds" takes it out of the feed list.</summary>
    public partial record Random;

    /// <summary>Reddit removed it in December 2024; "Remove Random feeds" takes it out of the feed list.</summary>
    public partial record MyRandom;

    /// <summary>A subreddit's feed, named by the subreddit's name without "r/" ("e2e").</summary>
    public partial record Subreddit(string Name);

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="Feed"/>: the only place those strings live.</summary>
public static class FeedShowing
{
    private static readonly Feed[] Listed = [new Feed.FrontPage(), new Feed.All(), new Feed.Popular(), new Feed.Friends(), new Feed.Random(), new Feed.MyRandom()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this Feed value) =>
        value.Match(
            frontPage => "Front Page",
            all => "All",
            popular => "Popular",
            friends => "Friends",
            random => "Random",
            myRandom => "My Random",
            subreddit => subreddit.Name,
            unlisted => unlisted.Shown);

    /// <summary>
    /// The case the app's <paramref name="shown"/> text names, or <see cref="Feed.Unlisted"/>: a subreddit's name reads as
    /// unlisted, and compares with <see cref="Feed.Subreddit"/> by the text shown.
    /// </summary>
    public static Feed ReadFeed(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new Feed.Unlisted(shown);
}
