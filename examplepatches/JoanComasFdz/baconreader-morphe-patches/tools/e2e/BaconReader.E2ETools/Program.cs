// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;
using BaconReader.E2ETools.Hosting;

// Impure → pure → impure: read the command, then post the recorded scenarios on the PR, clean up after it closed, or run
// one of the steps the e2e scripts call (tools/e2e/README.md). Every write to GitHub goes through the gh CLI; --dry-run
// prints instead of writing.
var environmentRepo = Environment.GetEnvironmentVariable("GITHUB_REPOSITORY");   // impure
var repo = Optional.FromNullable(environmentRepo);   // pure
var command = CommandReading.ReadCommand(args, repo);   // pure
if (command is Result<ToolCommand, string>.Error badCommand)
{
    E2EFiles.ReportError(badCommand.Failure);   // impure
    return 2;
}

var done = ((Result<ToolCommand, string>.Ok)command).Value.Match(
    post => post.Options.Command is E2ECommand.PostScenarios scenarios
        ? ScenarioPosting.PostScenarios(post.Options, scenarios)
        : PrClosing.ClosePr(post.Options, (E2ECommand.ClosePr)post.Options.Command),
    RecordingSteps.ReportRuns,
    RecordingSteps.WriteScenarios,
    RecordingSteps.ListFiles,
    _ => RecordingSteps.FindFreePort(),
    RecordingSteps.ReadVsCodeCommit,
    RecordingSteps.FindHome,
    RecordingSteps.PackVsix);   // impure
if (done is Result<Unit, string>.Error failed)
{
    E2EFiles.ReportError(failed.Failure);   // impure
    return 1;
}

return 0;
