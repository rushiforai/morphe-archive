// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// The record a recorded run writes next to its video (BaconReader.E2E's <c>ScenarioRecording</c>, camelCase JSON):
/// its domain folder, scenario, Gherkin, screen, GIF name (without its extension), the patches its app was patched with,
/// the second the app's first screen showed (none when it never did), whether it passed, and when each line of its
/// Gherkin played in its video (none for the VS Code extension's runs).
/// </summary>
public sealed record RunRecord(
    string Domain,
    string Class,
    string Method,
    string Title,
    Optional<string> Gherkin,
    string Screen,
    string Gif,
    ImmutableArray<string> Patches,
    Optional<double> HomeShownSeconds,
    bool Passed)
{
    public ImmutableArray<LineMark> Marks { get; init; } = [];
}

/// <summary>
/// When a line of a run's Gherkin played in its video: the line, an index in the Gherkin's lines; the seconds into the
/// video; and whether the run failed there.
/// </summary>
public sealed record LineMark(int Line, double Seconds, bool Failed);

/// <summary>An unrecorded run, from the test results: its name ("… [📱 Phone]"), outcome and time.</summary>
public sealed record TestRun(string Name, string Outcome, double Seconds);

/// <summary>The scenario classes record.sh picked with --changed-since: those that changed, and those only a fixture file selected.</summary>
public sealed record ClassSelection(ImmutableHashSet<string> Changed, ImmutableDictionary<string, ImmutableArray<string>> Fixtures);
