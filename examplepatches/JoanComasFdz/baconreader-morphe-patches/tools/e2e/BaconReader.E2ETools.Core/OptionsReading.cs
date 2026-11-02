// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2ETools.Core;

/// <summary>What the tool does: post a PR's recorded scenarios, or clean up after the PR closed.</summary>
[Union]
public partial record E2ECommand
{
    /// <summary>Post the scenarios recorded in <see cref="Out"/>; <see cref="Commit"/>'s message says what changed.</summary>
    partial record PostScenarios(string Commit, string Out);

    /// <summary>The PR closed (<see cref="Merged"/> when it was merged): clean prs-resources, shrink the posts.</summary>
    partial record ClosePr(bool Merged);
}

/// <summary>
/// The command line: <c>post --pr &lt;n&gt; --commit &lt;sha&gt; [--out &lt;dir&gt;]</c> or <c>post --pr &lt;n&gt; --closed [--merged]</c>,
/// with <c>[--repo &lt;owner/repo&gt;]</c> (by default GITHUB_REPOSITORY) and <c>[--dry-run]</c> (prints instead of writing).
/// </summary>
public sealed record E2EToolsOptions(int Pr, string Repo, E2ECommand Command, bool DryRun);

/// <summary>The command line → the options, or what is wrong with it.</summary>
public static class OptionsReading
{
    public const string Usage =
        "usage: dotnet run --project tools/e2e/BaconReader.E2ETools -- post --pr <n> (--commit <sha> [--out <dir>] | --closed [--merged]) [--repo <owner/repo>] [--dry-run]";

    public static Result<E2EToolsOptions, string> ReadOptions(IReadOnlyList<string> args, Optional<string> environmentRepo) =>
        args.Count == 0 || args[0] != "post"
            ? new Result<E2EToolsOptions, string>.Error($"The command is 'post'. {Usage}")
            : ReadFlags(args, 1, new Given(Optional.None<int>(), environmentRepo.Bind(repo => repo.Length > 0 ? Optional.Some(repo) : Optional.None<string>()), Optional.None<string>(), "out", false, false, false))
                .Bind(ToOptions);

    private static Result<Given, string> ReadFlags(IReadOnlyList<string> args, int at, Given given) =>
        at >= args.Count
            ? new Result<Given, string>.Ok(given)
            : args[at] switch
            {
                "--closed" => ReadFlags(args, at + 1, given with { Closed = true }),
                "--merged" => ReadFlags(args, at + 1, given with { Merged = true }),
                "--dry-run" => ReadFlags(args, at + 1, given with { DryRun = true }),
                "--pr" or "--repo" or "--commit" or "--out" when at + 1 >= args.Count =>
                    new Result<Given, string>.Error($"'{args[at]}' needs a value. {Usage}"),
                "--pr" => int.TryParse(args[at + 1], out var pr)
                    ? ReadFlags(args, at + 2, given with { Pr = Optional.Some(pr) })
                    : new Result<Given, string>.Error($"'--pr' is a number, not '{args[at + 1]}'. {Usage}"),
                "--repo" => ReadFlags(args, at + 2, given with { Repo = args[at + 1].Length > 0 ? Optional.Some(args[at + 1]) : Optional.None<string>() }),
                "--commit" => ReadFlags(args, at + 2, given with { Commit = Optional.Some(args[at + 1]) }),
                "--out" => ReadFlags(args, at + 2, given with { Out = args[at + 1] }),
                _ => new Result<Given, string>.Error($"Unknown option '{args[at]}'. {Usage}"),
            };

    private static Result<E2EToolsOptions, string> ToOptions(Given given) =>
        (given.Pr, given.Repo, given.Commit) switch
        {
            (Optional<int>.None, _, _) => new Result<E2EToolsOptions, string>.Error($"No PR: pass --pr. {Usage}"),
            (_, Optional<string>.None, _) => new Result<E2EToolsOptions, string>.Error("No repository: pass --repo or set GITHUB_REPOSITORY."),
            (_, Optional<string>.Some repo, _) when !IsRepo(repo.Value) =>
                new Result<E2EToolsOptions, string>.Error($"The repository is <owner>/<repo>, not '{repo.Value}'."),
            (Optional<int>.Some pr, Optional<string>.Some repo, _) when given.Closed =>
                new Result<E2EToolsOptions, string>.Ok(new E2EToolsOptions(pr.Value, repo.Value, new E2ECommand.ClosePr(given.Merged), given.DryRun)),
            (Optional<int>.Some pr, Optional<string>.Some repo, Optional<string>.Some commit) =>
                new Result<E2EToolsOptions, string>.Ok(new E2EToolsOptions(pr.Value, repo.Value, new E2ECommand.PostScenarios(commit.Value, given.Out), given.DryRun)),
            _ => new Result<E2EToolsOptions, string>.Error("No commit: pass --commit (or --closed)."),
        };

    /// <summary>An <c>&lt;owner&gt;/&lt;repo&gt;</c>: two names around one slash.</summary>
    private static bool IsRepo(string repo) => repo.Split('/') is [{ Length: > 0 }, { Length: > 0 }];
}

/// <summary>What the command line gave, before it is checked whole.</summary>
internal sealed record Given(
    Optional<int> Pr, Optional<string> Repo, Optional<string> Commit, string Out, bool Closed, bool Merged, bool DryRun);
