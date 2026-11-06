// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>
/// Reddit's emotes in comments, as its API sent them on 2026-11-05 (an r/wallstreetbets comment of 2024 with two of
/// the subreddit's emotes): <c>![img](emote|&lt;pack&gt;|&lt;name&gt;)</c> in the body, and for every emote, whichever
/// it is, the same placeholder, the Snoomoji <c>dizzy_face</c>: in <c>body_html</c>
/// (<c>&lt;img src="…/dizzy_face.gif" width="60" height="60" style="vertical-align:middle"&gt;</c>) and in
/// <c>media_metadata</c> (an <c>AnimatedImage</c> whose <c>s.gif</c> is that GIF, <c>t</c> <c>sticker</c>). The
/// Snoomoji (Reddit's own emotes, the pack <c>free_emotes_pack</c>) are GIFs at <see cref="SnoomojiPath"/>, which the
/// fake serves under <c>/_media/</c>. A subreddit's own emote (the pack <c>t5_&lt;subreddit id&gt;</c>) had its own
/// image in <c>media_metadata</c> until 2024 (the Arctic Shift archive); Reddit sends only the placeholder now. No
/// comment written since early 2025 has an emote.
/// </summary>
public static class RedditEmotes
{
    /// <summary>Where redditstatic.com serves the Snoomoji, <c>&lt;name&gt;.gif</c>, under the fake's <c>/_media/</c>.</summary>
    public const string SnoomojiPath = "www.redditstatic.com/marketplace-assets/v1/core/emotes/snoomoji_emotes/free_emotes_pack/";

    /// <summary>The Snoomoji Reddit sends in place of every emote.</summary>
    public const string Placeholder = "dizzy_face";

    /// <summary>The size Reddit gives the placeholder, in <c>body_html</c> and <c>media_metadata</c>.</summary>
    public const int Size = 60;

    /// <summary>The path of the Snoomoji <paramref name="name"/>'s GIF in the media store.</summary>
    public static string SnoomojiGif(string name) => $"{SnoomojiPath}{name}.gif";

    /// <summary>
    /// The emote <paramref name="id"/> (<c>emote|&lt;pack&gt;|&lt;name&gt;</c>), as Reddit sends it: the placeholder,
    /// which the media store serves, as does the Snoomoji <paramref name="snoomoji"/>'s own GIF, when it is one.
    /// </summary>
    internal static UploadedMedia Add(RedditWorld world, string id, string? snoomoji)
    {
        world.AddMedia(SnoomojiGif(Placeholder), MediaAsset.Gif.ContentType, MediaAsset.Gif.Bytes);
        if (snoomoji is not null)
        {
            world.AddMedia(SnoomojiGif(snoomoji), MediaAsset.Gif.ContentType, MediaAsset.Gif.Bytes);
        }

        return new UploadedMedia(id, MediaAsset.Gif.ContentType, SnoomojiGif(Placeholder), Size, Size);
    }
}
