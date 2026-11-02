// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;
using static BaconReader.E2ETools.Tests.Support.Posts;

namespace BaconReader.E2ETools.Tests;

/// <summary>Which files go to prs-resources, and what a missing file says.</summary>
public sealed class UploadPlanningTests
{
    [Fact]
    public void Each_runs_GIF_then_MP4_is_uploaded_in_the_runs_order()
    {
        var plan = UploadPlanning.PlanUploads([WithMp4(RunOf("LoginTests", "Logs")), RunOf("FeedTests", "Scrolls")], "out");

        Assert.Equal(["pr-1-v1-Logs-phone.gif", "pr-1-v1-Logs-phone.mp4", "pr-1-v1-Scrolls-phone.gif"], plan.Files.Select(file => file.Asset));
        Assert.Equal("Account/Logs-phone.mp4", plan.Files[1].Path);
    }

    [Fact]
    public void A_missing_GIF_or_MP4_is_a_note_and_nothing_to_upload_is_no_file()
    {
        var run = RunOf("LoginTests", "Logs");

        var plan = UploadPlanning.PlanUploads([run with { Files = run.Files with { HasGif = false } }], "e2e-gifs");

        Assert.Equal(["No GIF for Logs title (e2e-gifs/Account/Logs-phone.gif).", "No MP4 for Logs title (e2e-gifs/Account/Logs-phone.mp4)."], plan.Notes);
        Assert.Empty(plan.Files);
    }

    [Fact]
    public void Runs_are_named_for_their_PR_and_version()
    {
        var entry = RunOf("LoginTests", "Logs").Entry with { Gif = "Account/logs-in-phone.gif" };

        var run = Assert.Single(UploadPlanning.PlanRuns(7, 3, [(entry, new RecordedFiles(true, true))]));

        Assert.Equal(("pr-7-v3-logs-in-phone.gif", "pr-7-v3-logs-in-phone.mp4"), (run.GifAsset, run.Mp4Asset));
    }
}
