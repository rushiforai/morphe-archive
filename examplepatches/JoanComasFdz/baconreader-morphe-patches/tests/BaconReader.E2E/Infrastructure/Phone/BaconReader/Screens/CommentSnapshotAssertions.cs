// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Reddit;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a comment: its text, and the GIFs, images and videos "Embed comment images" shows under it.</summary>
public static class CommentSnapshotAssertions
{
    /// <summary>The comment shows <paramref name="images"/> images (not GIFs) under its text.</summary>
    public static AssertingThat<CommentSnapshot> ShowsImages(this AssertingThat<CommentSnapshot> that, int images)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Images == images,
            $"The comment {comment.Name} shows {Media(comment)}, but {images} images were expected.");
        return that;
    }

    /// <summary>The comment shows <paramref name="gifs"/> GIFs under its text.</summary>
    public static AssertingThat<CommentSnapshot> ShowsGifs(this AssertingThat<CommentSnapshot> that, int gifs)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Gifs == gifs,
            $"The comment {comment.Name} shows {Media(comment)}, but {gifs} GIFs were expected.");
        return that;
    }

    /// <summary>The comment shows no image and no GIF.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoImage(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Images == 0 && comment.Gifs == 0,
            $"The comment {comment.Name} shows {Media(comment)}, but no image was expected.");
        return that;
    }

    /// <summary>The comment's text shows no link: the patch dropped the bare link it shows as an image.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoLink(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.False(
            comment.Text.Contains("http", StringComparison.Ordinal),
            $"The comment shows the text \"{comment.Text}\", but no link was expected in it.");
        return that;
    }

    /// <summary>The comment shows a video under its text.</summary>
    public static AssertingThat<CommentSnapshot> ShowsAVideo(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Videos == 1,
            $"The comment {comment.Name} shows {Media(comment)}, but one video was expected.");
        return that;
    }

    /// <summary>The comment shows no video.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoVideo(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Videos == 0,
            $"The comment {comment.Name} shows {Media(comment)}, but no video was expected.");
        return that;
    }

    /// <summary>The comment shows no award icon.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoAward(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(comment.Awards == 0, $"The comment {comment.Name} shows {comment.Awards} award icons, but none was expected.");
        return that;
    }

    /// <summary>The comment shows <paramref name="text"/> under its first GIF, image or video: what follows the media link that starts it.</summary>
    public static AssertingThat<CommentSnapshot> ShowsUnderItsMedia(this AssertingThat<CommentSnapshot> that, string text)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.TextsUnderMedia.Contains(text),
            $"The comment {comment.Name} shows [{string.Join(", ", comment.TextsUnderMedia.Select(shown => $"\"{shown}\""))}] under its media, but \"{text}\" was expected there.");
        return that;
    }

    private static string Media(CommentSnapshot comment) =>
        $"{comment.Images} images, {comment.Gifs} GIFs and {comment.Videos} videos";

    /// <summary>The comment's Imgur album shows the counter <paramref name="counter"/> over its image: "1 / 3".</summary>
    public static AssertingThat<CommentSnapshot> ShowsTheAlbumCounter(this AssertingThat<CommentSnapshot> that, string counter)
    {
        var shown = that.InstanceToAssert.AlbumCounter;
        Assert.True(shown == counter, $"The comment \"{that.InstanceToAssert.Text}\" shows {(shown is null ? "no counter" : $"\"{shown}\"")}, but \"{counter}\" was expected.");
        return that;
    }

    /// <summary>The comment shows no album counter: an album of one image has none.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoAlbumCounter(this AssertingThat<CommentSnapshot> that)
    {
        var shown = that.InstanceToAssert.AlbumCounter;
        Assert.True(shown is null, $"The comment \"{that.InstanceToAssert.Text}\" shows the counter \"{shown}\", but none was expected.");
        return that;
    }

    /// <summary>The comment shows the link "<paramref name="link"/>" on a line of its own: a bare YouTube link, as "Embed comment images" writes it.</summary>
    public static AssertingThat<CommentSnapshot> ShowsTheLink(this AssertingThat<CommentSnapshot> that, string link)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            Lines(comment).Contains(link),
            $"The comment shows the text \"{comment.Text}\", but a line \"{link}\" was expected in it.");
        return that;
    }

    /// <summary>The comment shows the address of the YouTube video <paramref name="video"/> on a line of its own: its link, as Reddit shows it.</summary>
    public static AssertingThat<CommentSnapshot> ShowsTheAddressOf(this AssertingThat<CommentSnapshot> that, YouTubeVideoSnapshot video)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            Lines(comment).Contains(video.Address),
            $"The comment shows the text \"{comment.Text}\", but the address of the YouTube video \"{video.Title}\", \"{video.Address}\", was expected on a line of its own.");
        return that;
    }

    /// <summary>
    /// The comment shows a thumbnail on the line under its link. "Embed comment images" draws it in the text, so the
    /// screen's tree shows it as Android's object replacement character on that line.
    /// </summary>
    public static AssertingThat<CommentSnapshot> ShowsAThumbnailUnderItsLink(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            Lines(comment).Contains(Drawn),
            $"The comment shows the text \"{comment.Text}\", but a thumbnail was expected on a line of its own.");
        return that;
    }

    /// <summary>
    /// The comment "<paramref name="text"/>" shows <paramref name="emotes"/> emotes after its text, on its line.
    /// "Embed comment images" draws an emote in the text, so the screen's tree shows each as Android's object
    /// replacement character.
    /// </summary>
    public static AssertingThat<CommentSnapshot> ShowsEmotesAfterItsText(this AssertingThat<CommentSnapshot> that, string text, int emotes)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Text == $"{text} {new string('￼', emotes)}",
            $"The comment shows the text \"{comment.Text}\", but \"{text}\" followed by {emotes} emote(s) was expected.");
        return that;
    }

    /// <summary>The comment shows no thumbnail drawn in its text.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoThumbnail(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.False(
            Lines(comment).Contains(Drawn),
            $"The comment shows a thumbnail in its text, \"{comment.Text}\", but none was expected.");
        return that;
    }

    /// <summary>
    /// The comment shows a post in place of its link, as "Embed comment images" writes an X or Bluesky post: the line
    /// "<paramref name="header"/>" (its author's name, @handle and date), then the line "<paramref name="text"/>", and no
    /// picture under it.
    /// </summary>
    public static AssertingThat<CommentSnapshot> ShowsThePost(this AssertingThat<CommentSnapshot> that, string header, string text)
    {
        var comment = that.InstanceToAssert;
        var after = LinesAfter(comment, header);
        Assert.True(
            after.Length >= 1 && after[0] == text && (after.Length == 1 || after[1] != Drawn),
            $"The comment shows the text \"{comment.Text}\", but the post \"{header}\" saying \"{text}\", with no picture, was expected.");
        return that;
    }

    /// <summary>
    /// The comment shows a post in place of its link, with a picture: the line "<paramref name="header"/>", the line
    /// "<paramref name="text"/>", then a line with only the picture, which the patch draws in the text.
    /// </summary>
    public static AssertingThat<CommentSnapshot> ShowsThePostWithAPicture(this AssertingThat<CommentSnapshot> that, string header, string text)
    {
        var comment = that.InstanceToAssert;
        var after = LinesAfter(comment, header);
        Assert.True(
            after.Length >= 2 && after[0] == text && after[1] == Drawn,
            $"The comment shows the text \"{comment.Text}\", but the post \"{header}\" saying \"{text}\", with a picture under it, was expected.");
        return that;
    }

    /// <summary>The comment shows a post in place of its link: the line "<paramref name="header"/>", then its text, ending with "<paramref name="ending"/>".</summary>
    public static AssertingThat<CommentSnapshot> ShowsThePostEndingWith(this AssertingThat<CommentSnapshot> that, string header, string ending)
    {
        var comment = that.InstanceToAssert;
        var after = LinesAfter(comment, header);
        Assert.True(
            after.Length >= 1 && after[0].EndsWith(ending, StringComparison.Ordinal),
            $"The comment shows the text \"{comment.Text}\", but the post \"{header}\", its text ending with \"{ending}\", was expected.");
        return that;
    }

    /// <summary>The comment shows the address of the link it was written with, on a line of its own, as Reddit shows it.</summary>
    public static AssertingThat<CommentSnapshot> ShowsTheAddressOf(this AssertingThat<CommentSnapshot> that, LinkSnapshot link)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            Lines(comment).Contains(link.Address),
            $"The comment shows the text \"{comment.Text}\", but the address of {link.What}, \"{link.Address}\", was expected on a line of its own.");
        return that;
    }

    // The lines after the line "header"; none without it.
    private static string[] LinesAfter(CommentSnapshot comment, string header) =>
        Lines(comment).SkipWhile(line => line != header).Skip(1).ToArray();

    // What the screen's tree shows for a picture drawn in a text: U+FFFC, the object replacement character.
    private const string Drawn = "\uFFFC";

    private static string[] Lines(CommentSnapshot comment) => comment.Text.Split('\n');
}
