// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Hosting;

/// <summary>
/// Impure boundary: the gh CLI (GH_TOKEN) and git, run as child processes. <see cref="RunGh"/> gives the answer as it is,
/// for a call whose refusal is a warning; <see cref="CallGh"/> gives the output, or an error saying what gh said.
/// </summary>
public static class GitHubCli
{
    public static CommandAnswer RunGh(IReadOnlyList<string> arguments, Optional<string> input) => ChildProcesses.RunCommand("gh", arguments, input);

    public static Result<string, string> CallGh(IReadOnlyList<string> arguments, Optional<string> input)
    {
        var answer = RunGh(arguments, input);
        return answer.ExitCode == 0
            ? new Result<string, string>.Ok(answer.Output)
            : new Result<string, string>.Error($"gh {string.Join(' ', arguments)} failed:\n{answer.Errors.Trim()}");
    }

    /// <summary>The full message of a commit (<c>git log -1 --format=%B</c>).</summary>
    public static Result<string, string> ReadCommitMessage(string commit)
    {
        var answer = ChildProcesses.RunCommand("git", ["log", "-1", "--format=%B", commit], Optional.None<string>());
        return answer.ExitCode == 0
            ? new Result<string, string>.Ok(answer.Output)
            : new Result<string, string>.Error($"git log {commit} failed:\n{answer.Errors.Trim()}");
    }
}
