// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>When Home shows in a recorded run's video, from how alike each frame and the test's screenshot of Home are.</summary>
public sealed class HomeFindingTests
{
    // A desktop run as ffmpeg printed it: the startup screen (a progress row completing at 4.88 s), Home from 15.48 s
    // (the test noted it at 14.09 s), the pointer's ring at 18 s, then the designer.
    private const string Probe = """
        [Parsed_metadata_5 @ 0x1] frame:0    pts:0       pts_time:0
        [Parsed_metadata_5 @ 0x1] lavfi.ssim.All=0.612000
        [Parsed_metadata_5 @ 0x1] frame:1    pts:4880    pts_time:4.88
        [Parsed_metadata_5 @ 0x1] lavfi.ssim.All=0.791000
        frame=  120 fps=0.0 q=-0.0 size=       0kB time=00:00:04.80 bitrate=N/A speed=   0x    [Parsed_metadata_5 @ 0x1] frame:2    pts:15360   pts_time:15.36
        [Parsed_metadata_5 @ 0x1] lavfi.ssim.All=0.787000
        [Parsed_metadata_5 @ 0x1] frame:3    pts:15480   pts_time:15.48
        [Parsed_metadata_5 @ 0x1] lavfi.ssim.All=0.996355
        [Parsed_metadata_5 @ 0x1] frame:4    pts:15520   pts_time:15.52
        [Parsed_metadata_5 @ 0x1] lavfi.ssim.All=0.996385
        [Parsed_metadata_5 @ 0x1] frame:5    pts:18000   pts_time:18
        [Parsed_metadata_5 @ 0x1] lavfi.ssim.All=0.980000
        [Parsed_metadata_5 @ 0x1] frame:6    pts:19400   pts_time:19.4
        [Parsed_metadata_5 @ 0x1] lavfi.ssim.All=0.620000
        [Parsed_ssim_4 @ 0x1] SSIM Y:0.739196 (5.836864) All:0.739196 (5.836864)
        """;

    [Fact]
    public void Home_starts_at_the_first_frame_that_looks_like_the_screenshot_however_late_after_the_noted_time() =>
        Assert.Equal("15.480", HomeFinding.FormatSeconds(HomeFinding.FindHome(14.09, Probe)));

    [Fact]
    public void A_startup_screen_frame_never_counts_as_Home_however_close_to_the_noted_time() =>
        Assert.Equal("15.480", HomeFinding.FormatSeconds(HomeFinding.FindHome(4.88, Probe)));

    [Fact]
    public void A_frame_a_hair_under_the_best_still_shows_Home() =>
        Assert.Equal("2.000", HomeFinding.FormatSeconds(HomeFinding.FindHome(1.0,
            "pts_time:1\nlavfi.ssim.All=0.790000\npts_time:2\nlavfi.ssim.All=0.981000\npts_time:3\nlavfi.ssim.All=0.996000\n")));

    [Fact]
    public void Without_a_frame_it_is_the_noted_time() =>
        Assert.Equal("3.000", HomeFinding.FormatSeconds(HomeFinding.FindHome(3.0, "ffmpeg printed no frame")));

    [Fact]
    public void The_probe_asks_ffmpeg_to_compare_each_frame_with_the_screenshot_both_320_pixels_wide_in_grey() =>
        Assert.Equal(
            ["-nostdin", "-hide_banner", "-i", "out/.videos/a.webm", "-loop", "1", "-i", "out/.videos/a.home.png",
             "-lavfi", "[0:v]scale=320:-2,format=gray[run];[1:v]scale=320:-2,format=gray[home];[run][home]ssim=shortest=1,metadata=print:key=lavfi.ssim.All",
             "-f", "null", "-"],
            HomeFinding.WriteProbeArguments("out/.videos/a.webm", "out/.videos/a.home.png"));

    [Fact]
    public void A_runs_video_and_screenshot_are_next_to_its_record_and_its_line_gives_what_record_sh_reads()
    {
        var record = new RunRecord("Recordings", "CodeLensTests", "Opens", "Opens", Optional.None<string>(), "desktop", "opens-desktop", [], Optional.Some(14.09), true);

        Assert.Equal("out/.videos/opens-desktop.webm", HomeFinding.FindVideo("out/.videos/opens-desktop.json"));
        Assert.Equal("out/.videos/opens-desktop.home.png", HomeFinding.FindScreenshot("out/.videos/opens-desktop.json"));
        Assert.Equal("Recordings opens-desktop desktop 15.480", HomeFinding.WriteHomeLine(record, HomeFinding.FindHome(14.09, Probe)));
    }
}
