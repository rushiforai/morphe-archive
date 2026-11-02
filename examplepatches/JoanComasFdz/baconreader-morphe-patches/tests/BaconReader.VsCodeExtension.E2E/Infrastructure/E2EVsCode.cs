// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.VsCodeExtension.E2E.Infrastructure;

/// <summary>
/// Where the run's VS Code and recordings are, from the environment: <c>E2E_VSCODE_URL</c> (VS Code for the web with the
/// extension, opened on Workspace/: tools/e2e/record.sh serves it; without it every scenario is skipped),
/// <c>E2E_VIDEO_DIR</c> (where each scenario's video and its record go; without it nothing is recorded) and
/// <c>E2E_ACTION_GAP</c> (the least time between two steps of a recorded scenario, in seconds).
/// </summary>
public static class E2EVsCode
{
    /// <summary>VS Code for the web's address, ending in "/", or null when <c>E2E_VSCODE_URL</c> isn't set.</summary>
    public static string? Url { get; } = ReadNonEmpty("E2E_VSCODE_URL") is { } url ? (url.EndsWith('/') ? url : url + "/") : null;

    /// <summary>Where videos go, or null when the run records none.</summary>
    public static string? VideoDirectory { get; } = ReadNonEmpty("E2E_VIDEO_DIR") is { } dir ? Path.GetFullPath(dir) : null;

    /// <summary>The least time between the end of one step of a recorded scenario and the start of the next (0.4 s by default).</summary>
    public static TimeSpan ActionGap { get; } = ReadNonEmpty("E2E_ACTION_GAP") is { } gap
        ? TimeSpan.FromSeconds(double.Parse(gap, System.Globalization.CultureInfo.InvariantCulture))
        : TimeSpan.FromSeconds(0.4);

    private static string? ReadNonEmpty(string name) =>
        Environment.GetEnvironmentVariable(name) is { Length: > 0 } value ? value : null;
}
