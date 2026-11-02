// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>A choice of "Auto-load "load more comments"": the most replies a "load more comments" loads by itself with.</summary>
[Union]
public partial record RepliesToAutoLoad
{
    public partial record Off;
    public partial record UpTo2Replies;
    public partial record UpTo3Replies;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

public static class RepliesToAutoLoadShowing
{
    private static readonly RepliesToAutoLoad[] Listed =
        [new RepliesToAutoLoad.Off(), new RepliesToAutoLoad.UpTo2Replies(), new RepliesToAutoLoad.UpTo3Replies()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this RepliesToAutoLoad value) =>
        value.Match(
            off => "Off",
            upTo2Replies => "Up to 2 replies",
            upTo3Replies => "Up to 3 replies",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="RepliesToAutoLoad.Unlisted"/>.</summary>
    public static RepliesToAutoLoad ReadRepliesToAutoLoad(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new RepliesToAutoLoad.Unlisted(shown);
}
