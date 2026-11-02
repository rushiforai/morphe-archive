// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text;
using System.Text.RegularExpressions;
using Humanizer;

namespace BaconReader.E2E.Shared;

/// <summary>A scenario's names, from its Gherkin's title, its method's name and its class's namespace.</summary>
public static partial class ScenarioNaming
{
    private const string ScenariosNamespace = ".Scenarios.";

    /// <summary>
    /// "Reaper's Tithe gives 3 stacks for a kill of 3" → "ReapersTitheGives3StacksForAKillOf3": the method's name for a
    /// Gherkin's title. Each run of letters and digits is a word (an apostrophe joins its word), its first letter upper
    /// case. A word in capitals keeps only its first one ("a GIF" → "AGif", "E2E" → "E2e"), so the GIF name can still
    /// tell its words apart: "AGIF" would be one word.
    /// </summary>
    public static string ToMethodName(string title)
    {
        var name = new StringBuilder();
        foreach (Match word in Word().Matches(title.Replace("'", "").Replace("’", "")))
        {
            var text = word.Value;
            var inCapitals = text.Count(char.IsAsciiLetter) > 1 && !text.Any(char.IsAsciiLetterLower);
            name.Append(char.ToUpperInvariant(text[0])).Append(inCapitals ? text[1..].ToLowerInvariant() : text[1..]);
        }

        return name.ToString();
    }

    /// <summary>"bacon-reader-patched-with-spoof-client-opens-phone": a run's GIF name, its method's name kebaberized.</summary>
    public static string ToGifName(string methodName, Screen screen) =>
        $"{methodName.Kebaberize()}-{screen.ToString().ToLowerInvariant()}";

    /// <summary>
    /// "Startup/Account", "LoggedIn/Comments/ShowTables": a scenario class's domain folder under its project's Scenarios/,
    /// its namespace after ".Scenarios."; "Unsorted" outside it. The recordings' folder (tools/e2e/record.sh) is named by
    /// it.
    /// </summary>
    public static string ToDomainFolder(Type testClass) => ToDomainFolder(testClass.Namespace);

    /// <inheritdoc cref="ToDomainFolder(Type)"/>
    public static string ToDomainFolder(string? @namespace) =>
        (@namespace ?? "") is var name && name.IndexOf(ScenariosNamespace, StringComparison.Ordinal) is var at && at >= 0
            ? name[(at + ScenariosNamespace.Length)..].Replace('.', '/')
            : "Unsorted";

    [GeneratedRegex("[A-Za-z0-9]+")]
    private static partial Regex Word();
}
