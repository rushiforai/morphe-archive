// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using Dunet;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// One entry of <c>scenarios.json</c> (tools/e2e/record.sh): a scenario (its class and method) played on a screen. Its
/// paths are relative to record.sh's output folder: its GIF and MP4 (<c>&lt;domain folder&gt;/&lt;GIF name&gt;.gif</c>).
/// </summary>
public sealed record ScenarioEntry(
    string Class,
    string Method,
    string Title,
    Optional<string> Gherkin,
    Optional<string> Screen,
    string Gif,
    Optional<string> Mp4,
    ImmutableArray<string> Patches,
    bool Passed,
    RunSelection Selection);

/// <summary>Why record.sh recorded a run: its scenario changed, or only fixture files it uses did (and which).</summary>
[Union]
public partial record RunSelection
{
    partial record Changed();
    partial record Fixtures(ImmutableArray<string> Paths);
}

/// <summary>Which of a run's files are on disk: its GIF and its MP4.</summary>
public sealed record RecordedFiles(bool HasGif, bool HasMp4);

/// <summary>A run ready to upload and post: the names its GIF and MP4 take in prs-resources.</summary>
public sealed record PlannedRun(ScenarioEntry Entry, RecordedFiles Files, string GifAsset, string Mp4Asset);
