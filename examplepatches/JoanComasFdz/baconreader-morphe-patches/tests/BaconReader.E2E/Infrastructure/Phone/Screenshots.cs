// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Drawing;
using BaconReader.E2E.Infrastructure.Device;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// What a screenshot shows in one spot, for the checks the screen's tree can't answer: whether a patch drew something
/// where no view of its own is, such as the disc behind an avatar in a comment's author line, and whether two image views
/// show the same picture. It never says which colour, only whether the spot differs from the plain background at its
/// corner (E2E-TEST-CODE-RULES.md, rule d), or how far two pictures are apart. The crops are decoded by ffmpeg, which the
/// e2e tests already need.
/// </summary>
public static class Screenshots
{
    // How far a channel may stray from the background before a pixel counts as drawn: the faint disc behind an avatar is
    // a light grey on white.
    private const int Tolerance = 8;

    // How many of the spot's pixels must be drawn: a few stray ones are the text's anti-aliasing.
    private const double DrawnShare = 0.05;

    // The side of the grid a picture is shrunk to before two are compared: its colours, not its details or its size.
    private const int PictureGrid = 8;

    // How far apart, on average per channel of the grid, two pictures may be and still be the same one: a picture shown
    // twice at the same size comes out the same, and the fake's different pictures are far apart.
    private const int SamePictureDistance = 12;

    /// <summary>
    /// What the PNG <paramref name="png"/> shows in each of <paramref name="spots"/>, in pixels, shrunk to a small grid of
    /// colours: enough to tell one picture from another, whatever its size.
    /// </summary>
    public static ImmutableArray<Picture> Pictures(byte[] png, IEnumerable<Rectangle> spots)
    {
        var folder = Directory.CreateTempSubdirectory("e2e-screenshot-");
        try
        {
            var image = Path.Combine(folder.FullName, "screen.png");
            File.WriteAllBytes(image, png);
            var pictures = ImmutableArray.CreateBuilder<Picture>();
            foreach (var spot in spots)
            {
                var raw = Path.Combine(folder.FullName, $"picture-{pictures.Count}.rgb");
                Commands.RunOrFailAsync(
                    "ffmpeg", "-v", "error", "-y", "-i", image,
                    "-vf", $"crop={spot.Width}:{spot.Height}:{spot.Left}:{spot.Top},scale={PictureGrid}:{PictureGrid}:flags=area",
                    "-f", "rawvideo", "-pix_fmt", "rgb24", raw).GetAwaiter().GetResult();
                pictures.Add(new Picture([.. File.ReadAllBytes(raw)]));
            }

            return pictures.ToImmutable();
        }
        finally
        {
            folder.Delete(recursive: true);
        }
    }

    /// <summary>A picture shown on the screen, shrunk to a small grid of colours (<see cref="Pictures"/>).</summary>
    public sealed record Picture(ImmutableArray<byte> Grid)
    {
        /// <summary>Whether it shows the same picture as <paramref name="other"/>.</summary>
        public bool LooksLike(Picture other) =>
            Grid.Length == other.Grid.Length
            && Grid.Zip(other.Grid, (a, b) => Math.Abs(a - b)).Sum() <= SamePictureDistance * Grid.Length;
    }

    /// <summary>
    /// Whether the PNG <paramref name="png"/> shows something in <paramref name="spot"/>, in pixels: more than a few of its
    /// pixels differ from its top-left one, which a round avatar or disc doesn't reach.
    /// </summary>
    public static bool Differs(byte[] png, Rectangle spot) => Differs(png, spot, spot.Location);

    /// <summary>
    /// Whether the PNG <paramref name="png"/> shows something in <paramref name="spot"/>, in pixels: more than a few of its
    /// pixels differ from the plain background at <paramref name="background"/>, a point outside what may be drawn (the
    /// inside of an outlined circle is the background, a filled one's isn't).
    /// </summary>
    public static bool Differs(byte[] png, Rectangle spot, Point background)
    {
        var folder = Directory.CreateTempSubdirectory("e2e-screenshot-");
        try
        {
            var image = Path.Combine(folder.FullName, "screen.png");
            var raw = Path.Combine(folder.FullName, "spot.rgb");
            var backgroundRaw = Path.Combine(folder.FullName, "background.rgb");
            File.WriteAllBytes(image, png);
            Commands.RunOrFailAsync(
                "ffmpeg", "-v", "error", "-y", "-i", image,
                "-vf", $"crop={spot.Width}:{spot.Height}:{spot.Left}:{spot.Top}",
                "-f", "rawvideo", "-pix_fmt", "rgb24", raw).GetAwaiter().GetResult();
            Commands.RunOrFailAsync(
                "ffmpeg", "-v", "error", "-y", "-i", image,
                "-vf", $"crop=1:1:{background.X}:{background.Y}",
                "-f", "rawvideo", "-pix_fmt", "rgb24", backgroundRaw).GetAwaiter().GetResult();
            var pixels = File.ReadAllBytes(raw);
            var plain = File.ReadAllBytes(backgroundRaw);
            var backgroundColor = (plain[0], plain[1], plain[2]);
            var drawn = 0;
            for (var i = 0; i + 2 < pixels.Length; i += 3)
            {
                if (Math.Abs(pixels[i] - backgroundColor.Item1) > Tolerance
                    || Math.Abs(pixels[i + 1] - backgroundColor.Item2) > Tolerance
                    || Math.Abs(pixels[i + 2] - backgroundColor.Item3) > Tolerance)
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
