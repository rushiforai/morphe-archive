// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>The command line the E2E videos workflow gives the tool.</summary>
public sealed class E2EToolsOptionsTests
{
    private static readonly Optional<string> Environment = Optional.Some("Owner/repo");

    [Fact]
    public void Post_takes_the_PR_the_commit_and_the_output_folder()
    {
        var options = Unwrap(OptionsReading.ReadOptions(["post", "--pr", "7", "--commit", "abc", "--out", "e2e-gifs"], Environment));

        Assert.Equal(new E2EToolsOptions(7, "Owner/repo", new E2ECommand.PostScenarios("abc", "e2e-gifs"), DryRun: false), options);
    }

    [Fact]
    public void The_output_folder_is_out_by_default_and_repo_overrides_the_environment()
    {
        var options = Unwrap(OptionsReading.ReadOptions(["post", "--pr", "7", "--commit", "abc", "--repo", "Other/repo", "--dry-run"], Environment));

        Assert.Equal(new E2EToolsOptions(7, "Other/repo", new E2ECommand.PostScenarios("abc", "out"), DryRun: true), options);
    }

    [Fact]
    public void Closed_needs_no_commit_and_merged_says_the_PR_was_merged()
    {
        Assert.Equal(new E2ECommand.ClosePr(true), Unwrap(OptionsReading.ReadOptions(["post", "--pr", "7", "--closed", "--merged"], Environment)).Command);
        Assert.Equal(new E2ECommand.ClosePr(false), Unwrap(OptionsReading.ReadOptions(["post", "--pr", "7", "--closed"], Environment)).Command);
    }

    [Theory]
    [InlineData("No commit: pass --commit (or --closed).", "post", "--pr", "7")]
    [InlineData("No PR: pass --pr.", "post", "--commit", "abc")]
    [InlineData("'--pr' is a number, not 'seven'.", "post", "--pr", "seven")]
    [InlineData("'--out' needs a value.", "post", "--pr", "7", "--out")]
    [InlineData("Unknown option '--force'.", "post", "--pr", "7", "--force")]
    [InlineData("The command is 'post'.", "--pr", "7")]
    public void A_wrong_command_line_says_what_is_wrong(string error, params string[] args) =>
        Assert.StartsWith(error, Assert.IsType<Result<E2EToolsOptions, string>.Error>(OptionsReading.ReadOptions(args, Environment)).Failure);

    [Fact]
    public void No_repository_in_the_options_or_the_environment_is_an_error()
    {
        var read = OptionsReading.ReadOptions(["post", "--pr", "7", "--closed", "--repo", ""], Optional.None<string>());

        Assert.Equal("No repository: pass --repo or set GITHUB_REPOSITORY.", Assert.IsType<Result<E2EToolsOptions, string>.Error>(read).Failure);
    }

    [Theory]
    [InlineData("repo")]
    [InlineData("Owner/")]
    [InlineData("a/b/c")]
    public void A_repository_is_an_owner_and_a_name(string repo) =>
        Assert.Equal($"The repository is <owner>/<repo>, not '{repo}'.",
            Assert.IsType<Result<E2EToolsOptions, string>.Error>(OptionsReading.ReadOptions(["post", "--pr", "7", "--closed", "--repo", repo], Environment)).Failure);

    private static E2EToolsOptions Unwrap(Result<E2EToolsOptions, string> result) => Assert.IsType<Result<E2EToolsOptions, string>.Ok>(result).Value;
}
