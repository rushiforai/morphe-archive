// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A link BaconReader declares it opens, as Android's "Open by default" screen names it ("Add link" lists them). A case is
/// added when a test needs it.
/// </summary>
[Union]
public partial record AppLink
{
    public partial record RedditCom;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What Android shows for each <see cref="AppLink"/>: the only place those strings live.</summary>
public static class AppLinkShowing
{
    private static readonly AppLink[] Listed = [new AppLink.RedditCom()];

    /// <summary>What Android shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this AppLink value) =>
        value.Match(
            redditCom => "reddit.com",
            unlisted => unlisted.Shown);

    /// <summary>The case Android's <paramref name="shown"/> text names, or <see cref="AppLink.Unlisted"/>.</summary>
    public static AppLink ReadAppLink(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new AppLink.Unlisted(shown);
}
