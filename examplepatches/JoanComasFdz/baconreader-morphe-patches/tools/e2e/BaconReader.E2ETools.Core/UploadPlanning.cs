// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.E2ETools.Core;

/// <summary>A file to upload: its path relative to record.sh's output folder, and the asset name it takes in prs-resources.</summary>
public sealed record UploadFile(string Path, string Asset);

/// <summary>What to upload to prs-resources, and a note for each run whose GIF or MP4 is missing.</summary>
public sealed record UploadPlan(ImmutableArray<string> Notes, ImmutableArray<UploadFile> Files);

/// <summary>
/// The post's runs and their files: each run's asset names (<c>pr-&lt;n&gt;-v&lt;version&gt;-&lt;GIF name&gt;</c>, ReleaseNaming), and
/// each run's GIF and MP4, uploaded to prs-resources.
/// </summary>
public static class UploadPlanning
{
    /// <summary>The notes prs-resources carries when the workflow creates it.</summary>
    public const string PrsReleaseNotes =
        "The e2e recordings (GIFs and MP4s) posted on pull requests, kept by the E2E videos workflow "
        + "(docs/hosting.md, \"E2E videos on pull requests\"). Created by it: don't edit.";

    public static ImmutableArray<PlannedRun> PlanRuns(int pr, int version, ImmutableArray<(ScenarioEntry Entry, RecordedFiles Files)> runs) =>
        [.. runs.Select(run => new PlannedRun(
            run.Entry,
            run.Files,
            ReleaseNaming.NameAsset(pr, version, run.Entry.Gif, ".gif"),
            ReleaseNaming.NameAsset(pr, version, run.Entry.Gif, ".mp4")))];

    /// <summary>Each run's GIF and MP4 in the runs' order, each once; a note names a missing file by its path under <paramref name="outFolder"/>.</summary>
    public static UploadPlan PlanUploads(ImmutableArray<PlannedRun> runs, string outFolder) =>
        new([.. runs.SelectMany(run => DescribeMissing(run, outFolder))], [.. runs.SelectMany(ListFiles).Distinct()]);

    private static IEnumerable<UploadFile> ListFiles(PlannedRun run)
    {
        var gif = run.Files.HasGif ? [new UploadFile(run.Entry.Gif, run.GifAsset)] : Array.Empty<UploadFile>();
        var mp4 = run.Files.HasMp4 && run.Entry.Mp4 is Optional<string>.Some video
            ? [new UploadFile(video.Value, run.Mp4Asset)]
            : Array.Empty<UploadFile>();
        return gif.Concat(mp4);
    }

    private static IEnumerable<string> DescribeMissing(PlannedRun run, string outFolder)
    {
        var gif = run.Files.HasGif ? [] : new[] { $"No GIF for {run.Entry.Title} ({outFolder}/{run.Entry.Gif})." };
        var mp4 = run.Files.HasMp4 ? [] : new[] { $"No MP4 for {run.Entry.Title} ({run.Entry.Mp4.Map(path => $"{outFolder}/{path}").UnwrapOr("none recorded")})." };
        return gif.Concat(mp4);
    }
}
