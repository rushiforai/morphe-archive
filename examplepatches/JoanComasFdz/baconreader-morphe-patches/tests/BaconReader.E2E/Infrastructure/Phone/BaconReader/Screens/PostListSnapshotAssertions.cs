// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
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

    /// <summary>The list shows exactly the posts <paramref name="posts"/>, each with its flair, in any order.</summary>
    public static AssertingThat<PostListSnapshot> ShowsOnlyThePosts(this AssertingThat<PostListSnapshot> that, params ShownPost[] posts)
    {
        var shown = that.InstanceToAssert.Posts;
        Assert.True(
            shown.Order(ByTitle).SequenceEqual(posts.Order(ByTitle)),
            $"The feed shows {Described(shown)}, but only {Described(posts)} was expected.");
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

    /// <summary>The post shows a thumbnail, not blurred.</summary>
    public static AssertingThat<PostSnapshot> ShowsAThumbnail(this AssertingThat<PostSnapshot> that) =>
        ShowsThumbnail(that, PostThumbnail.Shown, "a thumbnail");

    /// <summary>The post shows a thumbnail that isn't blurred.</summary>
    public static AssertingThat<PostSnapshot> ShowsAThumbnailThatIsntBlurred(this AssertingThat<PostSnapshot> that) =>
        ShowsThumbnail(that, PostThumbnail.Shown, "a thumbnail that isn't blurred");

    /// <summary>The post shows a blurred thumbnail.</summary>
    public static AssertingThat<PostSnapshot> ShowsABlurredThumbnail(this AssertingThat<PostSnapshot> that) =>
        ShowsThumbnail(that, PostThumbnail.Blurred, "a blurred thumbnail");

    /// <summary>The post's card, in the card list, shows an image under its title.</summary>
    public static AssertingThat<PostSnapshot> ShowsAnImageInItsCard(this AssertingThat<PostSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.ShowsCardImage, $"The card of the post \"{that.InstanceToAssert.Title}\" shows no image, but one was expected.");
        return that;
    }

    /// <summary>The post shows BaconReader's gallery indicator over its thumbnail.</summary>
    public static AssertingThat<PostSnapshot> ShowsTheGalleryIndicator(this AssertingThat<PostSnapshot> that)
    {
        var post = that.InstanceToAssert;
        Assert.True(post.ShowsGalleryIndicator, $"The post \"{post.Title}\" shows no gallery indicator, but it was expected over its thumbnail.");
        return that;
    }

    private static AssertingThat<PostSnapshot> ShowsThumbnail(AssertingThat<PostSnapshot> that, PostThumbnail expected, string what)
    {
        var post = that.InstanceToAssert;
        var shown = post.Thumbnail switch
        {
            PostThumbnail.None => "no thumbnail",
            PostThumbnail.Blurred => "a blurred thumbnail",
            _ => "a thumbnail that isn't blurred",
        };
        Assert.True(post.Thumbnail == expected, $"The post \"{post.Title}\" shows {shown}, but {what} was expected.");
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

    /// <summary>The post shows no award icon.</summary>
    public static AssertingThat<PostSnapshot> ShowsNoAward(this AssertingThat<PostSnapshot> that)
    {
        var post = that.InstanceToAssert;
        Assert.True(post.Awards == 0, $"The post \"{post.Title}\" shows {post.Awards} award icons, but none was expected.");
        return that;
    }

    /// <summary>The post's button that opens its text is described <paramref name="button"/>.</summary>
    public static AssertingThat<PostSnapshot> ShowsTheTextButton(this AssertingThat<PostSnapshot> that, TextPostButton button)
    {
        var post = that.InstanceToAssert;
        Assert.True(
            post.TextButton == button,
            post.TextButton is null
                ? $"The post \"{post.Title}\" shows no button described \"{button.ToShownText()}\": it has no described button that opens its text."
                : $"The post \"{post.Title}\" shows \"{post.TextButton.ToShownText()}\", but \"{button.ToShownText()}\" was expected.");
        return that;
    }

    /// <summary>The post shows its text, <paramref name="text"/>, under it.</summary>
    public static AssertingThat<PostSnapshot> ShowsTheText(this AssertingThat<PostSnapshot> that, string text)
    {
        var post = that.InstanceToAssert;
        Assert.True(
            post.Text == text,
            post.Text is null ? $"The post \"{post.Title}\" shows no text, but \"{text}\" was expected." : $"The post \"{post.Title}\" shows the text \"{post.Text}\", but \"{text}\" was expected.");
        return that;
    }

    /// <summary>The post shows no text under it.</summary>
    public static AssertingThat<PostSnapshot> ShowsNoText(this AssertingThat<PostSnapshot> that)
    {
        var post = that.InstanceToAssert;
        Assert.True(post.Text is null, $"The post \"{post.Title}\" shows the text \"{post.Text}\", but none was expected.");
        return that;
    }

    private static readonly Comparer<ShownPost> ByTitle = Comparer<ShownPost>.Create((a, b) => string.CompareOrdinal(a.Title, b.Title));

    private static string Described(IEnumerable<ShownPost> posts) =>
        posts.Any()
            ? string.Join(", ", posts.Select(post => post.Flair is null ? $"\"{post.Title}\"" : $"\"{post.Title}\" with the flair \"{post.Flair}\""))
            : "no post";

    private static string Listed(IEnumerable<string> titles) =>
        titles.Any() ? string.Join(", ", titles.Select(title => $"\"{title}\"")) : "no post";
}
