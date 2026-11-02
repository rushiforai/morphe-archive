// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>The command line the e2e scripts and the E2E videos workflow give the tool.</summary>
public sealed class CommandReadingTests
{
    private static readonly Optional<string> Environment = Optional.Some("Owner/repo");

    [Fact]
    public void Post_reads_its_options()
    {
        var command = Unwrap(CommandReading.ReadCommand(["post", "--pr", "7", "--commit", "abc"], Environment));

        Assert.Equal(new E2EToolsOptions(7, "Owner/repo", new E2ECommand.PostScenarios("abc", "out"), DryRun: false), Assert.IsType<ToolCommand.Post>(command).Options);
    }

    [Fact]
    public void Each_script_step_takes_its_files()
    {
        Assert.Equal(["a.trx", "b.trx"], Assert.IsType<ToolCommand.ReportRuns>(Unwrap(CommandReading.ReadCommand(["report-runs", "a.trx", "b.trx"], Environment))).TestResults);
        var write = Assert.IsType<ToolCommand.WriteScenarios>(Unwrap(CommandReading.ReadCommand(["write-scenarios", "out", "sel.tsv", "a.json", "b.json"], Environment)));
        Assert.Equal(("out", "sel.tsv"), (write.Out, write.Selection));
        Assert.Equal(["a.json", "b.json"], write.Records);
        Assert.Empty(Assert.IsType<ToolCommand.WriteScenarios>(Unwrap(CommandReading.ReadCommand(["write-scenarios", "out", "sel.tsv"], Environment))).Records);
        Assert.Equal(new ToolCommand.ListFiles("out/scenarios.json"), Unwrap(CommandReading.ReadCommand(["list-files", "out/scenarios.json"], Environment)));
        Assert.IsType<ToolCommand.FindFreePort>(Unwrap(CommandReading.ReadCommand(["free-port"], Environment)));
        Assert.Equal(new ToolCommand.ReadVsCodeCommit("package.json"), Unwrap(CommandReading.ReadCommand(["vscode-commit", "package.json"], Environment)));
        Assert.Equal(new ToolCommand.FindHome("a.json"), Unwrap(CommandReading.ReadCommand(["find-home", "a.json"], Environment)));
        Assert.Equal(new ToolCommand.PackVsix("ext", "LICENSE", "x.vsix"), Unwrap(CommandReading.ReadCommand(["pack-vsix", "ext", "LICENSE", "x.vsix"], Environment)));
    }

    [Theory]
    [InlineData(new string[0], "No command.")]
    [InlineData(new[] { "list-flows" }, "Unknown command 'list-flows'.")]
    [InlineData(new[] { "find-home" }, "'find-home' takes other arguments.")]
    [InlineData(new[] { "report-runs" }, "'report-runs' takes other arguments.")]
    [InlineData(new[] { "write-scenarios", "out" }, "'write-scenarios' takes other arguments.")]
    [InlineData(new[] { "list-files", "a.json", "b.json" }, "'list-files' takes other arguments.")]
    public void A_wrong_command_line_says_what_is_wrong_and_shows_the_usage(string[] args, string error)
    {
        var failure = Assert.IsType<Result<ToolCommand, string>.Error>(CommandReading.ReadCommand(args, Environment)).Failure;

        Assert.StartsWith(error, failure);
        Assert.Contains("write-scenarios <out dir>", failure);
    }

    private static ToolCommand Unwrap(Result<ToolCommand, string> result) => Assert.IsType<Result<ToolCommand, string>.Ok>(result).Value;
}
