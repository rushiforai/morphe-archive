// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Hosting;

/// <summary>
/// The PR closed: prs-resources keeps the PR's newest version and loses its older ones (ReleaseCleaning), logging each name
/// deleted and the release's count, then every post but the newest shrinks to its one line. Merged or not, the same
/// happens: the newest post stays as the PR's record either way.
/// </summary>
public static class PrClosing
{
    public static Result<Unit, string> ClosePr(E2EToolsOptions options, E2ECommand.ClosePr command)
    {
        E2EFiles.Report($"PR #{options.Pr} {(command.Merged ? "was merged" : "closed without merging")}.");   // impure
        var cleaned = CleanPrsRelease(options);   // impure
        return cleaned.Bind(_ => ShrinkPosts(options));   // impure
    }

    private static Result<Unit, string> CleanPrsRelease(E2EToolsOptions options)
    {
        var pages = GitHubCli.CallGh(["api", "--paginate", "--slurp", $"repos/{options.Repo}/releases?per_page=100"], Optional.None<string>());   // impure
        var found = pages.Bind(JsonReading.ReadReleases).Map(ReleaseCleaning.FindPrsRelease);   // pure
        if (found is Result<Optional<Release>, string>.Error noReleases)
        {
            return new Result<Unit, string>.Error(noReleases.Failure);
        }

        if (((Result<Optional<Release>, string>.Ok)found).Value is not Optional<Release>.Some release)
        {
            E2EFiles.Report($"There is no {ReleaseNaming.PrsRelease} release: nothing to clean there.");   // impure
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        var assetPages = GitHubCli.CallGh(["api", "--paginate", "--slurp", $"repos/{options.Repo}/releases/{release.Value.Id}/assets?per_page=100"], Optional.None<string>());   // impure
        var read = assetPages.Bind(JsonReading.ReadAssets);   // pure
        if (read is Result<ImmutableArray<ReleaseAsset>, string>.Error noAssets)
        {
            return new Result<Unit, string>.Error(noAssets.Failure);
        }

        var assets = ((Result<ImmutableArray<ReleaseAsset>, string>.Ok)read).Value;
        var deleted = ReleaseCleaning.PlanPrDeletions(assets, options.Pr);   // pure
        foreach (var asset in deleted)
        {
            E2EFiles.Report($"{release.Value.Tag}: deleting {asset.Name}");   // impure
            if (options.DryRun)
            {
                continue;
            }

            var gone = GitHubCli.CallGh(["api", "-X", "DELETE", $"repos/{options.Repo}/releases/assets/{asset.Id}"], Optional.None<string>());   // impure
            if (gone is Result<string, string>.Error notGone)
            {
                return new Result<Unit, string>.Error(notGone.Failure);
            }
        }

        var lines = ReleaseCleaning.DescribeCleaned(release.Value.Tag, assets, deleted, options.Pr);   // pure
        E2EFiles.ReportAll(lines);   // impure
        return new Result<Unit, string>.Ok(new Unit.Value());
    }

    /// <summary>Every post but the newest becomes its one line, its recordings deleted with its version.</summary>
    private static Result<Unit, string> ShrinkPosts(E2EToolsOptions options)
    {
        var read = ScenarioPosting.ReadWorkflowComments(options);   // impure
        var edits = read.Map(PostVersioning.PlanShrinks);   // pure
        if (edits is Result<ImmutableArray<CommentEdit>, string>.Error noComments)
        {
            return new Result<Unit, string>.Error(noComments.Failure);
        }

        var shrinks = ((Result<ImmutableArray<CommentEdit>, string>.Ok)edits).Value;
        if (shrinks.IsEmpty)
        {
            E2EFiles.Report($"No earlier post on #{options.Pr} to shrink.");   // impure
        }

        PostEditing.EditComments(options, shrinks);   // impure
        return new Result<Unit, string>.Ok(new Unit.Value());
    }
}
