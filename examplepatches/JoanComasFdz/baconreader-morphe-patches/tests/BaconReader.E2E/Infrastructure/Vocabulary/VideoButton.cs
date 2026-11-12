// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A button over a video playing in a comment ("Embed comment images"), shown with the player's controls, by what it
/// says to a screen reader: it switches the video's size, or opens and closes its full screen.
/// </summary>
[Union]
public partial record VideoButton
{
    public partial record ShrinkVideo;
    public partial record EnlargeVideo;
    public partial record FullScreen;
    public partial record ExitFullScreen;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

public static class VideoButtonShowing
{
    private static readonly VideoButton[] Listed =
        [new VideoButton.ShrinkVideo(), new VideoButton.EnlargeVideo(), new VideoButton.FullScreen(), new VideoButton.ExitFullScreen()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this VideoButton value) =>
        value.Match(
            shrinkVideo => "Shrink video",
            enlargeVideo => "Enlarge video",
            fullScreen => "Full screen",
            exitFullScreen => "Exit full screen",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="VideoButton.Unlisted"/>.</summary>
    public static VideoButton ReadVideoButton(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new VideoButton.Unlisted(shown);
}
