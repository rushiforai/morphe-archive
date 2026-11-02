// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Globalization;
using System.Text.RegularExpressions;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// When the app's first screen ("Home": VS Code's workbench, for the VS Code extension's scenarios) shows in a recorded
/// run's browser video. The video's clock runs behind the test's, by more the longer VS Code took to load, so the time
/// the test noted can't place it. The test also takes a screenshot of the workbench when it notes it
/// (<c>&lt;name&gt;.home.png</c>): ffmpeg scores how alike each frame of the video and that screenshot are (SSIM, 1 when
/// the same), and Home starts at the first frame within a hair of the best score. Without a screenshot (a run whose start
/// failed), at the noted time. The app's own runs (an <c>.mp4</c> from the phone) start on its first screen: record.sh
/// asks this only for a <c>.webm</c>.
/// </summary>
public static partial class HomeFinding
{
    /// <summary>How far under the best score a frame may be and still show Home (the pointer's ring costs about 0.01).</summary>
    private const double SameScreen = 0.02;

    /// <summary>The width both pictures are scaled to before they are compared: enough to tell two screens apart, and fast.</summary>
    private const int ComparedWidth = 320;

    /// <summary>ffmpeg's arguments to print how alike each frame of <paramref name="video"/> and <paramref name="screenshot"/> are.</summary>
    public static ImmutableArray<string> WriteProbeArguments(string video, string screenshot) =>
        ["-nostdin", "-hide_banner", "-i", video, "-loop", "1", "-i", screenshot,
         "-lavfi", $"[0:v]scale={ComparedWidth}:-2,format=gray[run];[1:v]scale={ComparedWidth}:-2,format=gray[home];" +
                   "[run][home]ssim=shortest=1,metadata=print:key=lavfi.ssim.All",
         "-f", "null", "-"];

    /// <summary>The second Home starts, from what the probe printed (its error output); the noted time when it printed no frame.</summary>
    public static double FindHome(double noted, string probe)
    {
        var times = CreateFrameTimePattern().Matches(probe).Select(found => ReadNumber(found.Groups[1].Value));
        var scores = CreateSimilarityPattern().Matches(probe).Select(found => ReadNumber(found.Groups[1].Value));
        var frames = times.Zip(scores).ToImmutableArray();
        var best = frames.Select(frame => frame.Second).DefaultIfEmpty(0.0).Max();
        return frames.Where(frame => frame.Second >= best - SameScreen).Select(frame => frame.First).DefaultIfEmpty(noted).First();
    }

    /// <summary>A second as ffmpeg and record.sh take it: three decimals.</summary>
    public static string FormatSeconds(double seconds) => seconds.ToString("F3", CultureInfo.InvariantCulture);

    /// <summary>The video next to a run's record: <c>&lt;name&gt;.json</c> → <c>&lt;name&gt;.webm</c>.</summary>
    public static string FindVideo(string record) => TrimRecord(record) + ".webm";

    /// <summary>The screenshot of Home next to a run's record: <c>&lt;name&gt;.json</c> → <c>&lt;name&gt;.home.png</c>.</summary>
    public static string FindScreenshot(string record) => TrimRecord(record) + ".home.png";

    /// <summary>The line record.sh reads: domain folder, GIF name, screen and the second to trim the video from.</summary>
    public static string WriteHomeLine(RunRecord record, double home) => $"{record.Domain} {record.Gif} {record.Screen} {FormatSeconds(home)}";

    private static string TrimRecord(string record) =>
        record.EndsWith(".json", StringComparison.Ordinal) ? record[..^".json".Length] : record;

    private static double ReadNumber(string text) => double.Parse(text, CultureInfo.InvariantCulture);

    [GeneratedRegex(@"pts_time:([0-9]+(?:\.[0-9]*)?)")]
    private static partial Regex CreateFrameTimePattern();

    [GeneratedRegex(@"lavfi\.ssim\.All=([0-9]+(?:\.[0-9]*)?)")]
    private static partial Regex CreateSimilarityPattern();
}
