// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Hosting;

/// <summary>Edits the workflow's earlier posts (collapsed by a new post, shrunk when the PR closes).</summary>
public static class PostEditing
{
    /// <summary>Replaces each post's body; a refusal (a body past GitHub's 65,536 characters) is a warning: the new post is up.</summary>
    public static void EditComments(E2EToolsOptions options, ImmutableArray<CommentEdit> edits)
    {
        foreach (var edit in edits)
        {
            var firstLine = PostVersioning.ReadFirstLine(edit.Body);   // pure
            E2EFiles.Report($"Editing comment {edit.Comment.Id}: {firstLine}");   // impure
            if (options.DryRun)
            {
                continue;
            }

            var body = JsonReading.WriteBody(edit.Body);   // pure
            var answer = GitHubCli.RunGh(["api", "-X", "PATCH", $"repos/{options.Repo}/issues/comments/{edit.Comment.Id}", "--input", "-"], Optional.Some(body));   // impure
            if (answer.ExitCode != 0)
            {
                E2EFiles.Report($"::warning::Couldn't edit comment {edit.Comment.Id} on #{options.Pr}: {answer.Errors.Trim()}");   // impure
            }
        }
    }
}
