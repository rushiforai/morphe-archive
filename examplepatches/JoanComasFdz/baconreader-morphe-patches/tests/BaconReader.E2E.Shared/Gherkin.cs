// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.E2E.Shared;

/// <summary>
/// A scenario's Gherkin (<see cref="TestDescriptionAttribute"/>), read: the tags before its <c>Scenario:</c> line,
/// its title, and the whole text with its common indentation removed.
/// </summary>
public sealed record Gherkin(ImmutableArray<string> Tags, string Title, string Text)
{
    private const string ScenarioKeyword = "Scenario:";

    /// <summary>Reads <paramref name="text"/>; a text without a <c>Scenario:</c> line has an empty title.</summary>
    public static Gherkin Read(string text)
    {
        var lines = text.Replace("\r\n", "\n").Split('\n');
        var scenario = Array.FindIndex(lines, line => line.TrimStart().StartsWith(ScenarioKeyword, StringComparison.Ordinal));
        var tags = lines
            .Take(scenario < 0 ? 0 : scenario)
            .SelectMany(line => line.Split(' ', StringSplitOptions.RemoveEmptyEntries))
            .Where(word => word.StartsWith('@'))
            .ToImmutableArray();
        var title = scenario < 0 ? "" : lines[scenario].TrimStart()[ScenarioKeyword.Length..].Trim();
        return new Gherkin(tags, title, Dedent(lines));
    }

    private static string Dedent(string[] lines)
    {
        var filled = lines.Where(line => line.Trim().Length > 0).ToArray();
        var indent = filled.Length == 0 ? 0 : filled.Min(line => line.Length - line.TrimStart().Length);
        return string.Join("\n", lines.Select(line => line.Length >= indent ? line[indent..].TrimEnd() : line.Trim())).Trim('\n');
    }
}
