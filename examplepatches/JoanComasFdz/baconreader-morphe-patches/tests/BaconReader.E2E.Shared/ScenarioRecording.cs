// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Shared;

/// <summary>
/// What tools/e2e/record.sh reads next to a run's video (each project's BaseE2E writes it, camelCase JSON): the
/// scenario's names and Gherkin, the screen it was played on, the patches its app was patched with (none for the VS Code
/// extension's), when the app's first screen was shown and whether it passed. The app's video is <c>&lt;gif&gt;.mp4</c>,
/// the first screen's time seconds into it; VS Code's is <c>&lt;gif&gt;.webm</c>, with <c>&lt;gif&gt;.home.png</c>, the
/// workbench as the test saw it, which record.sh trims the video at (the e2e tool's find-home: the video's clock runs
/// behind the test's).
/// </summary>
public sealed record ScenarioRecording(
    string Domain,
    string Class,
    string Method,
    string Title,
    string Gherkin,
    string Screen,
    string Gif,
    IReadOnlyList<string> Patches,
    double? HomeShownSeconds,
    bool Passed);
