// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>A small media file the fake ships, to put in posts and comments.</summary>
/// <param name="Extension">The file extension, without the dot.</param>
public sealed record MediaAsset(string ContentType, string Extension, int Width, int Height, byte[] Bytes)
{
    /// <summary>An animated GIF, 240×180, two seconds.</summary>
    public static MediaAsset Gif { get; } = Load("e2e.gif", "image/gif", 240, 180);

    /// <summary>A JPEG photo, 320×240.</summary>
    public static MediaAsset Jpeg { get; } = Load("e2e.jpg", "image/jpeg", 320, 240);

    /// <summary>A PNG image, 320×240.</summary>
    public static MediaAsset Png { get; } = Load("e2e.png", "image/png", 320, 240);

    /// <summary>An MP4 video with an audio track, 320×240, two seconds.</summary>
    public static MediaAsset Mp4 { get; } = Load("e2e.mp4", "video/mp4", 320, 240);

    /// <summary>An MP4 video with an audio track, 320×240, ten seconds: long enough to watch it play.</summary>
    public static MediaAsset LongMp4 { get; } = Load("e2e-video.mp4", "video/mp4", 320, 240);

    /// <summary>
    /// A video as Reddit serves one uploaded to v.redd.it, ten seconds, 320×240, without sound: this DASH playlist, whose
    /// one rendition is <see cref="DashVideo"/>, at <c>DASH_240.mp4</c> next to it.
    /// </summary>
    public static MediaAsset DashPlaylist { get; } = Load("e2e-dash.mpd", "application/dash+xml", 320, 240);

    /// <summary>The rendition <see cref="DashPlaylist"/> names, <c>DASH_240.mp4</c>: a fragmented MP4.</summary>
    public static MediaAsset DashVideo { get; } = Load("e2e-dash.mp4", "video/mp4", 320, 240);

    private static MediaAsset Load(string name, string contentType, int width, int height)
    {
        using var stream = typeof(MediaAsset).Assembly.GetManifestResourceStream("Media/" + name)
            ?? throw new InvalidOperationException($"The fake's asset {name} isn't embedded.");
        using var bytes = new MemoryStream();
        stream.CopyTo(bytes);
        return new MediaAsset(contentType, Path.GetExtension(name).TrimStart('.'), width, height, bytes.ToArray());
    }
}
