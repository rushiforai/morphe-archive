// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.RegularExpressions;
using NetArchTest.Rules;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests.Architecture;

/// <summary>
/// The e2e tool's logic is a pure project: it touches no files, processes, network or console (its host does), and the
/// host needs nothing else, so the workflow builds it in seconds.
/// </summary>
public sealed class PureProjectTests
{
    [Fact]
    public void The_pure_project_uses_no_IO_processes_network_or_console() =>
        AssertNone(
            Types.InAssembly(typeof(PostWriting).Assembly).ShouldNot().HaveDependencyOnAny("System.IO", "System.Diagnostics.Process", "System.Net", "System.Console").GetResult(),
            "BaconReader.E2ETools.Core must not use System.IO, System.Diagnostics.Process, System.Net or System.Console");

    [Fact]
    public void The_host_references_only_the_pure_project()
    {
        var project = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "..", "BaconReader.E2ETools", "BaconReader.E2ETools.csproj"));   // impure

        var references = Regex.Matches(project, "ProjectReference Include=\"([^\"]+)\"").Select(found => Path.GetFileName(found.Groups[1].Value.Replace('\\', '/')));   // pure

        Assert.Equal(["BaconReader.E2ETools.Core.csproj"], references);
    }

    private static void AssertNone(NetArchTest.Rules.TestResult result, string rule) =>
        Assert.True(result.IsSuccessful, $"{rule}: {string.Join(", ", result.FailingTypeNames ?? [])}");
}
