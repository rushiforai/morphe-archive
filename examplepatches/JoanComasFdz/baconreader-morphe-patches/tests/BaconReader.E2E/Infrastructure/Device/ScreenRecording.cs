// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using System.Globalization;

namespace BaconReader.E2E.Infrastructure.Device;

/// <summary>
/// Records the device's screen while a scenario plays, with Android's own <c>screenrecord</c>, on the device: 576 px
/// wide in the screen's shape (<see cref="VideoSize"/>) at 1 Mbit/s (a cloud session reaches the device at ~3–4 Mbit/s:
/// a minute is a few MB to pull). <c>screenrecord</c> stops by itself after 3 minutes, so a loop on the device starts the next part until told to stop; <see cref="StopAsync"/> pulls the parts
/// and joins them with ffmpeg.
/// <para>
/// Android draws no touch of its own for Appium's taps (<c>show_touches</c> shows only a real touchscreen's, and as a
/// faint dot), so <see cref="StopAsync"/> draws a ring onto the video at each tap <see cref="NoteTap"/> was told of, from
/// before the tap until <see cref="RingAfterTap"/> after it was sent. The video's time comes from the device's: each part notes the device's uptime when
/// its encoder starts (<c>screenrecord --verbose</c> says "Content area is…" right before), and
/// <see cref="StartAsync"/> measures how far the device's uptime is from this machine's clock (to within half an adb
/// round trip, ~0.1 s).
/// </para>
/// </summary>
public sealed class ScreenRecording
{
    private const string Folder = "/sdcard/e2e/recording";
    private const string StopFile = "/data/local/tmp/e2e/recording.stop";

    // The ring (RecordingOverlay's TapRingScript in the extension's e2e tests): #ff3d7f, 5 px, with a lighter glow, on a
    // 64×64 image drawn at the tap's center, on a 576 px wide video.
    private const int RingSize = 64;
    private const string Ring =
        "geq=r=255:g=61:b=127:a='if(between(hypot(X-32,Y-32),22,27),255,if(between(hypot(X-32,Y-32),27,31),90,0))'";

    // The video's width, a multiple of 16 as video encoders want.
    private const int VideoWidth = 576;

    // The emulator shows a tap's effect ~0.3 s after it, and a dialog takes a second to go: the ring stays until the
    // screen starts changing.
    private const double RingAfterTap = 0.5;

    private readonly double deviceAheadSeconds;
    private readonly int screenWidth;
    private readonly int screenHeight;
    private readonly List<Tap> taps = [];

    private ScreenRecording(double deviceAheadSeconds, int screenWidth, int screenHeight)
    {
        this.deviceAheadSeconds = deviceAheadSeconds;
        this.screenWidth = screenWidth;
        this.screenHeight = screenHeight;
    }

    /// <summary>Starts recording the screen.</summary>
    public static async Task<ScreenRecording> StartAsync()
    {
        await Commands.ShellAsync($"rm -rf {Folder} {StopFile}; mkdir -p {Folder} /data/local/tmp/e2e");
        var (width, height) = await ReadScreenSizeAsync();
        // Detached from adb (nohup, &), so the loop outlives this shell; each part is a new file, 0.mp4, 1.mp4…, with the
        // device's uptime when its encoder started in 0.start, 1.start…
        await Commands.ShellAsync(
            $"nohup sh -c 'i=0; while [ ! -f {StopFile} ]; do screenrecord --verbose --size {VideoSize(width, height)} --bit-rate 1000000 --time-limit 180 {Folder}/$i.mp4 2>&1"
            + $" | while IFS= read -r line; do case \"$line\" in \"Content area\"*) cut -d\" \" -f1 /proc/uptime > {Folder}/$i.start;; esac; done;"
            + " i=$((i+1)); done' > /dev/null 2>&1 &");
        await WaitUntilRecordingAsync();
        return new ScreenRecording(await MeasureDeviceAheadAsync(), width, height);
    }

    /// <summary>
    /// Notes a tap at (<paramref name="x"/>, <paramref name="y"/>), in the screen's pixels, to be drawn from
    /// <paramref name="shown"/> to <paramref name="sent"/> (<see cref="Stopwatch.GetTimestamp"/>s).
    /// </summary>
    public void NoteTap(int x, int y, long shown, long sent)
    {
        lock (taps)
        {
            taps.Add(new Tap((double)x / screenWidth, (double)y / screenHeight, ToDeviceUptime(shown), ToDeviceUptime(sent)));
        }
    }

    /// <summary>Stops recording and writes the video to <paramref name="target"/> (an MP4), with a ring at each tap.</summary>
    public async Task StopAsync(string target)
    {
        await Commands.ShellAsync($"touch {StopFile}; pkill -2 screenrecord || true");
        // screenrecord finishes its file after SIGINT; the loop sees the stop file and ends.
        for (var tries = 0; tries < 50 && (await Commands.ShellAsync("pidof screenrecord || true")).Length > 0; tries++)
        {
            await Task.Delay(200);
        }

        var parts = (await Commands.ShellAsync($"ls {Folder}"))
            .Split('\n', StringSplitOptions.RemoveEmptyEntries)
            .Where(name => name.EndsWith(".mp4", StringComparison.Ordinal))
            .OrderBy(name => int.Parse(Path.GetFileNameWithoutExtension(name), CultureInfo.InvariantCulture))
            .ToArray();
        var starts = await ReadPartStartsAsync();
        var local = Path.Combine(Path.GetTempPath(), "e2e-recording-" + Guid.NewGuid().ToString("N"));
        Directory.CreateDirectory(local);
        try
        {
            foreach (var part in parts)
            {
                await Commands.AdbAsync("pull", $"{Folder}/{part}", Path.Combine(local, part));
            }

            await Commands.ShellAsync($"rm -rf {Folder} {StopFile}");
            if (parts.Length == 0)
            {
                return;
            }

            Directory.CreateDirectory(Path.GetDirectoryName(target)!);
            var joined = Path.Combine(local, "joined.mp4");
            if (parts.Length == 1)
            {
                File.Copy(Path.Combine(local, parts[0]), joined);
            }
            else
            {
                var list = Path.Combine(local, "parts.txt");
                await File.WriteAllLinesAsync(list, parts.Select(part => $"file '{Path.Combine(local, part)}'"));
                await Commands.RunOrFailAsync("ffmpeg", "-v", "error", "-y", "-f", "concat", "-safe", "0", "-i", list, "-c", "copy", joined);
            }

            var drawn = DrawnTaps(await ReadTimelineAsync(local, parts, starts));
            if (drawn.Count == 0)
            {
                File.Copy(joined, target, overwrite: true);
            }
            else
            {
                await DrawRingsAsync(joined, drawn, target);
            }
        }
        finally
        {
            Directory.Delete(local, recursive: true);
        }
    }

    // screenrecord takes a moment, up to a few seconds on a busy device, to start encoding: a scenario that starts at
    // once would miss its first frames.
    private static async Task WaitUntilRecordingAsync()
    {
        for (var tries = 0; tries < 50; tries++)
        {
            if ((await Commands.ShellAsync($"cat {Folder}/0.start 2> /dev/null || true")).Length > 0)
            {
                return;
            }

            await Task.Delay(200);
        }

        throw new InvalidOperationException("screenrecord didn't start on the phone.");
    }

    private static async Task<(int Width, int Height)> ReadScreenSizeAsync()
    {
        // "Physical size: 1080x1920", and "Override size: …" after it when one is set.
        var size = (await Commands.ShellAsync("wm size")).Split('\n')[^1].Split(':')[1].Trim().Split('x');
        return (int.Parse(size[0], CultureInfo.InvariantCulture), int.Parse(size[1], CultureInfo.InvariantCulture));
    }

    // VideoWidth wide and as tall as the screen's shape, rounded to 16 px: 576x1248 for the Pixel 6 Pro's 1080×2340. A
    // fixed 9:16 size would squash its taller screen.
    private static string VideoSize(int width, int height) =>
        FormattableString.Invariant($"{VideoWidth}x{(int)Math.Round(VideoWidth * (double)height / width / 16) * 16}");

    // How many seconds the device's uptime is ahead of this machine's clock: from the quickest of a few round trips,
    // taken as read halfway through.
    private static async Task<double> MeasureDeviceAheadAsync()
    {
        var best = (RoundTrip: double.MaxValue, Ahead: 0.0);
        for (var sample = 0; sample < 3; sample++)
        {
            var before = Stopwatch.GetTimestamp();
            var uptime = ParseUptime(await Commands.ShellAsync("cat /proc/uptime"));
            var after = Stopwatch.GetTimestamp();
            var roundTrip = Stopwatch.GetElapsedTime(before, after).TotalSeconds;
            if (roundTrip < best.RoundTrip)
            {
                best = (roundTrip, uptime - Seconds((before + after) / 2));
            }
        }

        return best.Ahead;
    }

    // Each part's device uptime when its encoder started, by part number.
    private static async Task<Dictionary<int, double>> ReadPartStartsAsync() =>
        (await Commands.ShellAsync($"cd {Folder} && for start in *.start; do echo \"${{start%.start}} $(cat \"$start\")\"; done 2> /dev/null || true"))
            .Split('\n', StringSplitOptions.RemoveEmptyEntries)
            .Select(line => line.Split(' '))
            .Where(fields => fields.Length == 2 && fields[1].Length > 0)
            .ToDictionary(fields => int.Parse(fields[0], CultureInfo.InvariantCulture), fields => ParseUptime(fields[1]));

    // Where each part starts in the joined video and on the device's uptime, for the parts whose start is known.
    private static async Task<List<(double VideoAt, double DeviceAt)>> ReadTimelineAsync(string local, string[] parts, Dictionary<int, double> starts)
    {
        var timeline = new List<(double VideoAt, double DeviceAt)>();
        var videoAt = 0.0;
        foreach (var part in parts)
        {
            if (starts.TryGetValue(int.Parse(Path.GetFileNameWithoutExtension(part), CultureInfo.InvariantCulture), out var deviceAt))
            {
                timeline.Add((videoAt, deviceAt));
            }

            // A part with no frames (the screen stood still from the moment it began) has no duration: "N/A".
            var duration = await Commands.RunOrFailAsync("ffprobe", "-v", "error", "-show_entries", "format=duration", "-of", "csv=p=0", Path.Combine(local, part));
            videoAt += double.TryParse(duration, NumberStyles.Float, CultureInfo.InvariantCulture, out var seconds) ? seconds : 0;
        }

        return timeline;
    }

    // Each tap in the video's seconds, in the part the tap was shown in; none when no part's start is known.
    private List<(Tap Tap, double From, double To)> DrawnTaps(List<(double VideoAt, double DeviceAt)> timeline)
    {
        lock (taps)
        {
            return timeline.Count == 0 ? [] : [.. taps.Select(tap =>
            {
                var part = timeline.LastOrDefault(part => part.DeviceAt <= tap.Shown, timeline[0]);
                var from = Math.Max(0, part.VideoAt + tap.Shown - part.DeviceAt);
                return (tap, from, Math.Max(from, part.VideoAt + tap.Sent - part.DeviceAt) + RingAfterTap);
            })];
        }
    }

    // screenrecord writes a frame only when the screen changes: fps= gives every ring frames to be drawn on.
    private static Task DrawRingsAsync(string video, List<(Tap Tap, double From, double To)> drawn, string target)
    {
        var graph = new List<string>
        {
            "[0:v]fps=30[v0]",
            $"color=c=black@0:s={RingSize}x{RingSize},format=rgba,{Ring},split={drawn.Count}"
                + string.Concat(Enumerable.Range(0, drawn.Count).Select(ring => $"[r{ring}]")),
        };
        for (var ring = 0; ring < drawn.Count; ring++)
        {
            var (tap, from, to) = drawn[ring];
            graph.Add(FormattableString.Invariant(
                $"[v{ring}][r{ring}]overlay=x=W*{tap.X:0.####}-w/2:y=H*{tap.Y:0.####}-h/2:shortest=1:enable='between(t,{from:0.###},{to:0.###})'[v{ring + 1}]"));
        }

        return Commands.RunOrFailAsync(
            "ffmpeg", "-v", "error", "-y", "-i", video, "-filter_complex", string.Join(';', graph), "-map", $"[v{drawn.Count}]",
            "-c:v", "libx264", "-preset", "veryfast", "-crf", "18", "-pix_fmt", "yuv420p", target);
    }

    private double ToDeviceUptime(long timestamp) => Seconds(timestamp) + deviceAheadSeconds;

    private static double Seconds(long timestamp) => (double)timestamp / Stopwatch.Frequency;

    // /proc/uptime: "<seconds up> <seconds idle>".
    private static double ParseUptime(string uptime) => double.Parse(uptime.Split(' ')[0], CultureInfo.InvariantCulture);

    // A tap at (X, Y), fractions of the screen's width and height, shown and sent at those device uptimes.
    private sealed record Tap(double X, double Y, double Shown, double Sent);
}
