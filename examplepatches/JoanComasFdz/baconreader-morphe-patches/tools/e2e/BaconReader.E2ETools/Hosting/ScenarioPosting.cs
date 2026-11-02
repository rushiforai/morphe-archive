// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Hosting;

/// <summary>
/// Posts a PR's recorded scenarios: uploads each run's GIF and MP4 to prs-resources (creating it as a pre-release the
/// first time), posts them as a new comment, then collapses every earlier post still open and hides it as Outdated. A
/// hide or an edit GitHub refuses is a warning, never a failure: the new post is up. Nothing recorded posts nothing.
/// </summary>
public static class ScenarioPosting
{
    public static Result<Unit, string> PostScenarios(E2EToolsOptions options, E2ECommand.PostScenarios command)
    {
        var json = E2EFiles.ReadScenariosJson(command.Out);   // impure
        var entries = json.Bind(JsonReading.ReadScenarios);   // pure
        if (entries is Result<ImmutableArray<ScenarioEntry>, string>.Error unread)
        {
            return new Result<Unit, string>.Error(unread.Failure);
        }

        var recorded = ((Result<ImmutableArray<ScenarioEntry>, string>.Ok)entries).Value;
        if (recorded.IsEmpty)
        {
            E2EFiles.Report("No scenario recorded: nothing to post.");   // impure
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        var read = ReadWorkflowComments(options);   // impure
        if (read is Result<ImmutableArray<PrComment>, string>.Error noComments)
        {
            return new Result<Unit, string>.Error(noComments.Failure);
        }

        var comments = ((Result<ImmutableArray<PrComment>, string>.Ok)read).Value;
        var version = PostVersioning.FindLastVersion(comments) + 1;   // pure
        var files = E2EFiles.FindRecordedFiles(command.Out, recorded);   // impure
        var runs = UploadPlanning.PlanRuns(options.Pr, version, files);   // pure
        var plan = UploadPlanning.PlanUploads(runs, command.Out);   // pure
        var uploaded = UploadRuns(options, command.Out, plan);   // impure
        if (uploaded is Result<Unit, string>.Error notUploaded)
        {
            return notUploaded;
        }

        var changed = DescribeChanges(command);   // impure
        if (changed is Result<string, string>.Error noMessage)
        {
            return new Result<Unit, string>.Error(noMessage.Failure);
        }

        var post = PostWriting.WritePost(options.Repo, version, runs, ((Result<string, string>.Ok)changed).Value);   // pure
        var posted = AddComment(options, post);   // impure
        if (posted is Result<Unit, string>.Error notPosted)
        {
            return notPosted;
        }

        var collapses = PostVersioning.PlanCollapses(comments, version);   // pure
        PostEditing.EditComments(options, collapses);   // impure
        var toCheck = PostVersioning.PlanHides(comments, version, ImmutableHashSet<string>.Empty);   // pure
        var hidden = ReadHidden(options, toCheck);   // impure
        if (hidden is Result<ImmutableHashSet<string>, string>.Error && !options.DryRun)
        {
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        var alreadyHidden = hidden.Match(ok => ok.Value, _ => ImmutableHashSet<string>.Empty);   // pure
        var hides = PostVersioning.PlanHides(comments, version, alreadyHidden);   // pure
        HideComments(options, hides);   // impure
        return new Result<Unit, string>.Ok(new Unit.Value());
    }

    /// <summary>The workflow's comments on the PR (PostVersioning.PickWorkflowComments).</summary>
    public static Result<ImmutableArray<PrComment>, string> ReadWorkflowComments(E2EToolsOptions options)
    {
        var pages = GitHubCli.CallGh(["api", "--paginate", "--slurp", $"repos/{options.Repo}/issues/{options.Pr}/comments?per_page=100"], Optional.None<string>());   // impure
        return pages.Bind(JsonReading.ReadComments).Map(PostVersioning.PickWorkflowComments);   // pure
    }

    private static Result<Unit, string> UploadRuns(E2EToolsOptions options, string outFolder, UploadPlan plan)
    {
        E2EFiles.ReportAll(plan.Notes);   // impure
        if (plan.Files.IsEmpty)
        {
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        var ensured = EnsurePrsRelease(options);   // impure
        if (ensured is Result<Unit, string>.Error notEnsured)
        {
            return notEnsured;
        }

        var staging = E2EFiles.CreateStagingPath();   // impure
        try
        {
            var staged = E2EFiles.StageUpload(outFolder, staging, plan.Files);   // impure
            if (staged is Result<ImmutableArray<string>, string>.Error notStaged)
            {
                return new Result<Unit, string>.Error(notStaged.Failure);
            }

            var targets = ((Result<ImmutableArray<string>, string>.Ok)staged).Value;
            var uploading = plan.Files.Select(file => $"Uploading {file.Asset} to {ReleaseNaming.PrsRelease}").ToImmutableArray();   // pure
            E2EFiles.ReportAll(uploading);   // impure
            if (!options.DryRun)
            {
                var sent = GitHubCli.CallGh(["release", "upload", ReleaseNaming.PrsRelease, .. targets, "--clobber", "--repo", options.Repo], Optional.None<string>());   // impure
                if (sent is Result<string, string>.Error notSent)
                {
                    return new Result<Unit, string>.Error(notSent.Failure);
                }
            }
        }
        finally
        {
            E2EFiles.DeleteStaging(staging);   // impure
        }

        return new Result<Unit, string>.Ok(new Unit.Value());
    }

    /// <summary>
    /// Creates prs-resources, as a pre-release, the first time a PR posts (the owner never has to). Another PR's run may
    /// create it at the same time: a creation GitHub refuses is fine when the release is there after it.
    /// </summary>
    private static Result<Unit, string> EnsurePrsRelease(E2EToolsOptions options)
    {
        var exists = HasPrsRelease(options);   // impure
        if (exists)
        {
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        E2EFiles.Report($"Creating the pre-release {ReleaseNaming.PrsRelease}");   // impure
        if (options.DryRun)
        {
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        // Its tag goes on the repository's first commit: on a newer one, `git describe` could take it for the bundle's
        // previous release (its release workflow lists the commits since the previous tag in the notes).
        var root = ReadRootCommit(options);   // impure
        if (root is Result<string, string>.Error noRoot)
        {
            return new Result<Unit, string>.Error(noRoot.Failure);
        }

        var made = GitHubCli.RunGh(
            ["release", "create", ReleaseNaming.PrsRelease, "--prerelease", "--title", ReleaseNaming.PrsRelease, "--notes", UploadPlanning.PrsReleaseNotes,
             "--target", ((Result<string, string>.Ok)root).Value, "--repo", options.Repo],
            Optional.None<string>());   // impure
        if (made.ExitCode == 0)
        {
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        var madeElsewhere = HasPrsRelease(options);   // impure
        if (madeElsewhere)
        {
            return new Result<Unit, string>.Ok(new Unit.Value());
        }

        return new Result<Unit, string>.Error($"Couldn't create the release {ReleaseNaming.PrsRelease}:\n{made.Errors.Trim()}");
    }

    // The default branch's first commit: the commits list's last page, one commit per page.
    private static Result<string, string> ReadRootCommit(E2EToolsOptions options)
    {
        var headers = GitHubCli.RunGh(["api", "-i", $"repos/{options.Repo}/commits?per_page=1"], Optional.None<string>());   // impure
        var last = System.Text.RegularExpressions.Regex.Match(headers.Output, @"[?&]page=([0-9]+)>; rel=""last""");   // pure
        var page = last.Success ? last.Groups[1].Value : "1";   // pure
        var root = GitHubCli.RunGh(["api", $"repos/{options.Repo}/commits?per_page=1&page={page}", "--jq", ".[0].sha"], Optional.None<string>());   // impure
        var sha = root.Output.Trim();   // pure
        return root.ExitCode == 0 && sha.Length == 40
            ? new Result<string, string>.Ok(sha)
            : new Result<string, string>.Error($"Couldn't read {options.Repo}'s first commit:\n{root.Errors.Trim()}");
    }

    private static bool HasPrsRelease(E2EToolsOptions options)
    {
        var answer = GitHubCli.RunGh(["release", "view", ReleaseNaming.PrsRelease, "--repo", options.Repo, "--json", "tagName"], Optional.None<string>());   // impure
        return answer.ExitCode == 0;
    }

    private static Result<string, string> DescribeChanges(E2ECommand.PostScenarios command)
    {
        var read = E2EFiles.ReadWhatChanged(command.Out);   // impure
        var given = read.Map(text => text.Trim());   // pure
        if (given is not Result<string, string>.Ok { Value.Length: 0 })
        {
            return given;
        }

        var message = GitHubCli.ReadCommitMessage(command.Commit);   // impure
        return message.Map(CommitDescribing.DescribeCommit);   // pure
    }

    private static Result<Unit, string> AddComment(E2EToolsOptions options, string post)
    {
        E2EFiles.Report(post);   // impure
        if (!options.DryRun)
        {
            var body = JsonReading.WriteBody(post);   // pure
            var sent = GitHubCli.CallGh(["api", "-X", "POST", $"repos/{options.Repo}/issues/{options.Pr}/comments", "--input", "-"], Optional.Some(body));   // impure
            if (sent is Result<string, string>.Error notSent)
            {
                return new Result<Unit, string>.Error(notSent.Failure);
            }
        }

        E2EFiles.Report($"Commented on #{options.Pr}.");   // impure
        return new Result<Unit, string>.Ok(new Unit.Value());
    }

    /// <summary>
    /// The node ids of these posts already hidden (GraphQL's isMinimized: REST doesn't say); an error, with a warning, when
    /// GitHub refuses the read or answers something else, so nothing is hidden this time (a dry run prints them all).
    /// </summary>
    private static Result<ImmutableHashSet<string>, string> ReadHidden(E2EToolsOptions options, ImmutableArray<PrComment> comments)
    {
        var ids = PostVersioning.PlanHiddenReads(comments);   // pure
        if (ids.IsEmpty)
        {
            return new Result<ImmutableHashSet<string>, string>.Ok(ImmutableHashSet<string>.Empty);
        }

        var query = JsonReading.WriteHiddenQuery(ids);   // pure
        var answer = GitHubCli.RunGh(["api", "graphql", "--input", "-"], Optional.Some(query));   // impure
        var hidden = answer.ExitCode == 0
            ? JsonReading.ReadHidden(ids, answer.Output)
            : new Result<ImmutableHashSet<string>, string>.Error(answer.Errors.Trim().Length > 0 ? answer.Errors.Trim() : answer.Output.Trim());   // pure
        if (hidden is Result<ImmutableHashSet<string>, string>.Error unread)
        {
            E2EFiles.Report($"::warning::Couldn't read which posts on #{options.Pr} are hidden, so none is hidden: {unread.Failure}");   // impure
        }

        return hidden;
    }

    /// <summary>Hides each post as Outdated; a refusal is a warning: the post is collapsed all the same.</summary>
    private static void HideComments(E2EToolsOptions options, ImmutableArray<PrComment> comments)
    {
        foreach (var comment in comments)
        {
            var firstLine = PostVersioning.ReadFirstLine(comment.Body);   // pure
            E2EFiles.Report($"Hiding comment {comment.Id} as outdated: {firstLine}");   // impure
            if (options.DryRun)
            {
                continue;
            }

            var mutation = JsonReading.WriteHideMutation(comment.NodeId);   // pure
            var answer = GitHubCli.RunGh(["api", "graphql", "--input", "-"], Optional.Some(mutation));   // impure
            if (answer.ExitCode != 0)
            {
                E2EFiles.Report($"::warning::Couldn't hide comment {comment.Id} on #{options.Pr} as outdated: {answer.Errors.Trim()}");   // impure
            }
        }
    }
}
