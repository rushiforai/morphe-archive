// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using Dunet;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// What the tool is asked to do: <c>post</c> (the E2E videos workflow) or one of the steps the e2e scripts call
/// (tools/e2e/record.sh, tools/e2e/push-gifs.sh, .devcontainer/install-e2e-recordings-extension.sh).
/// </summary>
[Union]
public partial record ToolCommand
{
    /// <summary>Post a PR's recorded scenarios, or clean up after it closed (<see cref="OptionsReading"/>).</summary>
    partial record Post(E2EToolsOptions Options);

    /// <summary>Each unrecorded run's result and time, from the test results (TRX files).</summary>
    partial record ReportRuns(ImmutableArray<string> TestResults);

    /// <summary>The recording's <c>scenarios.json</c>, written in <see cref="Out"/> from its runs' records.</summary>
    partial record WriteScenarios(string Out, string Selection, ImmutableArray<string> Records);

    /// <summary>The files a <c>scenarios.json</c> lists: each run's GIF and MP4.</summary>
    partial record ListFiles(string Scenarios);

    /// <summary>A free local TCP port, for VS Code for the web.</summary>
    partial record FindFreePort();

    /// <summary>The VS Code build the VS Code extension's scenarios run on: its runner's package.json's config.vscodeCommit.</summary>
    partial record ReadVsCodeCommit(string PackageJson);

    /// <summary>When VS Code's workbench shows in a recorded run's video (<see cref="HomeFinding"/>).</summary>
    partial record FindHome(string Record);

    /// <summary>The VS Code extension packed into a .vsix (<see cref="VsixPacking"/>).</summary>
    partial record PackVsix(string Source, string License, string Vsix);
}

/// <summary>The command line → the command, or what is wrong with it.</summary>
public static class CommandReading
{
    public const string Usage = """
        usage: dotnet run --project tools/e2e/BaconReader.E2ETools -- <command>
          post --pr <n> (--commit <sha> [--out <dir>] | --closed [--merged]) [--repo <owner/repo>] [--dry-run]
          report-runs <test results .trx>...
          write-scenarios <out dir> <selection .tsv> <run record .json>...
          list-files <scenarios.json>
          free-port
          vscode-commit <package.json>
          find-home <run record .json>
          pack-vsix <extension folder> <license> <.vsix>
        """;

    public static Result<ToolCommand, string> ReadCommand(IReadOnlyList<string> args, Optional<string> environmentRepo) =>
        args.ToArray() switch
        {
            ["post", ..] => OptionsReading.ReadOptions(args, environmentRepo).Map(options => (ToolCommand)new ToolCommand.Post(options)),
            ["report-runs", .. var results] when results.Length > 0 => Read(new ToolCommand.ReportRuns([.. results])),
            ["write-scenarios", var outFolder, var selection, .. var records] => Read(new ToolCommand.WriteScenarios(outFolder, selection, [.. records])),
            ["list-files", var scenarios] => Read(new ToolCommand.ListFiles(scenarios)),
            ["free-port"] => Read(new ToolCommand.FindFreePort()),
            ["vscode-commit", var packageJson] => Read(new ToolCommand.ReadVsCodeCommit(packageJson)),
            ["find-home", var record] => Read(new ToolCommand.FindHome(record)),
            ["pack-vsix", var source, var license, var vsix] => Read(new ToolCommand.PackVsix(source, license, vsix)),
            [var command, ..] when IsCommand(command) => new Result<ToolCommand, string>.Error($"'{command}' takes other arguments.\n{Usage}"),
            [var command, ..] => new Result<ToolCommand, string>.Error($"Unknown command '{command}'.\n{Usage}"),
            _ => new Result<ToolCommand, string>.Error($"No command.\n{Usage}"),
        };

    private static Result<ToolCommand, string> Read(ToolCommand command) => new Result<ToolCommand, string>.Ok(command);

    private static bool IsCommand(string command) => command is "report-runs" or "write-scenarios" or "list-files" or "free-port" or "vscode-commit" or "find-home" or "pack-vsix";
}
