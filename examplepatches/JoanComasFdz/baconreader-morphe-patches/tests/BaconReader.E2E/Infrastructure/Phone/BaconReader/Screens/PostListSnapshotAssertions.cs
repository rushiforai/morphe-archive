// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the main screen's list of posts.</summary>
public static class PostListSnapshotAssertions
{
    /// <summary>The list shows the posts titled <paramref name="titles"/>, in any order.</summary>
    public static AssertingThat<PostListSnapshot> ShowsThePosts(this AssertingThat<PostListSnapshot> that, params string[] titles)
    {
        var shown = that.InstanceToAssert.Titles;
        var missing = titles.Where(title => !shown.Contains(title)).ToArray();
        Assert.True(
            missing.Length == 0,
            $"The feed shows {Listed(shown)}, but {Listed(missing)} was expected too.");
        return that;
    }

    /// <summary>The list shows no post.</summary>
    public static AssertingThat<PostListSnapshot> ShowsNoPosts(this AssertingThat<PostListSnapshot> that)
    {
        var shown = that.InstanceToAssert.Titles;
        Assert.True(shown.IsEmpty, $"The feed shows {Listed(shown)}, but no post was expected.");
        return that;
    }

    /// <summary>The list shows, instead of posts, the error "<paramref name="error"/>".</summary>
    public static AssertingThat<PostListSnapshot> ShowsTheError(this AssertingThat<PostListSnapshot> that, string error)
    {
        var shown = that.InstanceToAssert.Message;
        Assert.True(
            shown == error,
            shown is null ? $"The feed shows no error, but \"{error}\" was expected." : $"The feed shows the error \"{shown}\", but \"{error}\" was expected.");
        return that;
    }

    /// <summary>The post shows <paramref name="points"/> points.</summary>
    public static AssertingThat<PostSnapshot> ShowsPoints(this AssertingThat<PostSnapshot> that, int points)
    {
        var post = that.InstanceToAssert;
        Assert.True(
            post.Points == points.ToString(System.Globalization.CultureInfo.InvariantCulture),
            $"The post \"{post.Title}\" shows {post.Points} points, but {points} was expected.");
        return that;
    }

    private static string Listed(IEnumerable<string> titles) =>
        titles.Any() ? string.Join(", ", titles.Select(title => $"\"{title}\"")) : "no post";
}
