// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using BaconReader.E2E.Infrastructure.Device;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// What a screenshot shows in one spot, for the one kind of check the screen's tree can't answer: whether a patch drew
/// something where no view of its own is, such as the disc behind an avatar in a comment's author line. It never says
/// which colour, only whether the spot differs from the plain background at its corner (E2E-TEST-CODE-RULES.md, rule d).
/// The crop is decoded by ffmpeg, which the e2e tests already need.
/// </summary>
public static class Screenshots
{
    // How far a channel may stray from the background before a pixel counts as drawn: the faint disc behind an avatar is
    // a light grey on white.
    private const int Tolerance = 8;

    // How many of the spot's pixels must be drawn: a few stray ones are the text's anti-aliasing.
    private const double DrawnShare = 0.05;

    /// <summary>
    /// Whether the PNG <paramref name="png"/> shows something in <paramref name="spot"/>, in pixels: more than a few of its
    /// pixels differ from its top-left one, which a round avatar or disc doesn't reach.
    /// </summary>
    public static bool Differs(byte[] png, Rectangle spot)
    {
        var folder = Directory.CreateTempSubdirectory("e2e-screenshot-");
        try
        {
            var image = Path.Combine(folder.FullName, "screen.png");
            var raw = Path.Combine(folder.FullName, "spot.rgb");
            File.WriteAllBytes(image, png);
            Commands.RunOrFailAsync(
                "ffmpeg", "-v", "error", "-y", "-i", image,
                "-vf", $"crop={spot.Width}:{spot.Height}:{spot.Left}:{spot.Top}",
                "-f", "rawvideo", "-pix_fmt", "rgb24", raw).GetAwaiter().GetResult();
            var pixels = File.ReadAllBytes(raw);
            var background = (pixels[0], pixels[1], pixels[2]);
            var drawn = 0;
            for (var i = 0; i + 2 < pixels.Length; i += 3)
            {
                if (Math.Abs(pixels[i] - background.Item1) > Tolerance
                    || Math.Abs(pixels[i + 1] - background.Item2) > Tolerance
                    || Math.Abs(pixels[i + 2] - background.Item3) > Tolerance)
                {
                    drawn++;
                }
            }

            return drawn > pixels.Length / 3 * DrawnShare;
        }
        finally
        {
            folder.Delete(recursive: true);
        }
    }
}
