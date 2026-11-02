// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.E2ETools.Core;

/// <summary>One file of the .vsix: where it comes from, and its name in the zip.</summary>
public sealed record VsixEntry(string From, string Name);

/// <summary>
/// The .vsix of the VS Code extension (tools/vscode-extension), laid out as vsce lays one out: extension/ with
/// package.json, extension.js, README.md and the repository's LICENSE as LICENSE.txt; then extension.vsixmanifest and
/// [Content_Types].xml at its root.
/// </summary>
public static class VsixPacking
{
    public static ImmutableArray<VsixEntry> PlanEntries(string source, string license) =>
        [
            .. new[] { "package.json", "extension.js", "README.md" }.Select(name => new VsixEntry($"{source}/{name}", $"extension/{name}")),
            new VsixEntry(license, "extension/LICENSE.txt"),
            new VsixEntry($"{source}/vsix/extension.vsixmanifest", "extension.vsixmanifest"),
            new VsixEntry($"{source}/vsix/Content_Types.xml", "[Content_Types].xml"),
        ];
}
