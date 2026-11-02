// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Globalization;
using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// A recording's runs → its <c>scenarios.json</c>, which <c>post</c> reads (<see cref="JsonReading.ReadScenarios"/>) and
/// push-gifs.sh lists the files of: one entry per run, in the records' order, with the run's names, Gherkin, patches,
/// screen, GIF and MP4 (under its domain folder), startup time, result and why it was picked (<see cref="ClassSelection"/>).
/// Also the summary record.sh prints.
/// </summary>
public static class ScenarioListing
{
    private static readonly JsonSerializerOptions Indented = new() { WriteIndented = true, Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping };

    /// <summary>
    /// record.sh's selection lines ("&lt;class&gt;\tchanged", or "&lt;class&gt;\tfixtures\t&lt;path&gt;" per changed fixture)
    /// → the classes that changed and each fixture-only class's fixtures, sorted and once each.
    /// </summary>
    public static ClassSelection ReadSelection(string tsv)
    {
        var lines = tsv.Split('\n').Select(line => line.TrimEnd('\r').Split('\t')).ToImmutableArray();
        var changed = lines.Where(parts => parts.Length >= 2 && parts[1] == "changed").Select(parts => parts[0]).ToImmutableHashSet();
        var fixtures = lines
            .Where(parts => parts.Length == 3 && parts[1] == "fixtures")
            .GroupBy(parts => parts[0])
            .ToImmutableDictionary(group => group.Key, group => group.Select(parts => parts[2]).Distinct().Order(StringComparer.Ordinal).ToImmutableArray());
        return new ClassSelection(changed, fixtures);
    }

    /// <summary>The <c>scenarios.json</c> text.</summary>
    public static string WriteScenarios(ImmutableArray<RunRecord> records, ClassSelection selection) =>
        new JsonArray([.. records.Select(record => WriteEntry(record, selection))]).ToJsonString(Indented);

    /// <summary>The summary record.sh prints: each run's result, startup time and GIF, and why a fixture-only one was re-recorded.</summary>
    public static ImmutableArray<string> WriteSummary(ImmutableArray<RunRecord> records, ClassSelection selection) =>
        ["", "Scenarios:", .. records.Select(record => WriteSummaryLine(record, selection))];

    private static JsonObject WriteEntry(RunRecord record, ClassSelection selection) =>
        new([.. WriteRunFields(record), .. WriteSelectionFields(FindFixtures(record, selection))]);

    private static ImmutableArray<KeyValuePair<string, JsonNode?>> WriteRunFields(RunRecord record) =>
        [
            new("domain", record.Domain),
            new("class", record.Class),
            new("method", record.Method),
            new("title", record.Title),
            new("gherkin", record.Gherkin.Match<JsonNode?>(some => JsonValue.Create(some.Value), _ => null)),
            new("patches", new JsonArray([.. record.Patches.Select(patch => JsonValue.Create(patch))])),
            new("screen", record.Screen),
            new("gif", $"{record.Domain}/{record.Gif}.gif"),
            new("mp4", $"{record.Domain}/{record.Gif}.mp4"),
            new("startupSeconds", RoundStartup(record).Match<JsonNode?>(some => JsonValue.Create(some.Value), _ => null)),
            new("passed", record.Passed),
        ];

    /// <summary>"changed", or "fixtures" with the fixture files that alone picked the run's class.</summary>
    private static ImmutableArray<KeyValuePair<string, JsonNode?>> WriteSelectionFields(Optional<ImmutableArray<string>> fixtures) =>
        fixtures.Match<ImmutableArray<KeyValuePair<string, JsonNode?>>>(
            paths => [new("selected", "fixtures"), new("fixtures", new JsonArray([.. paths.Value.Select(path => JsonValue.Create(path))]))],
            _ => [new("selected", "changed")]);

    /// <summary>The fixtures that alone picked a run's class; none when the class changed itself (changed wins) or was named.</summary>
    private static Optional<ImmutableArray<string>> FindFixtures(RunRecord record, ClassSelection selection) =>
        selection.Fixtures.TryGetValue(record.Class, out var paths) && !selection.Changed.Contains(record.Class)
            ? Optional.Some(paths)
            : Optional.None<ImmutableArray<string>>();

    /// <summary>The startup time to a tenth of a second; none when the app's first screen never showed.</summary>
    private static Optional<double> RoundStartup(RunRecord record) => record.HomeShownSeconds.Map(seconds => Math.Round(seconds, 1));

    private static string WriteSummaryLine(RunRecord record, ClassSelection selection)
    {
        var startup = RoundStartup(record).Match(some => $"startup {some.Value.ToString("F1", CultureInfo.InvariantCulture)} s", _ => "app never shown");
        var why = FindFixtures(record, selection).Match(some => $"  (re-recorded: {string.Join(", ", some.Value)} changed)", _ => "");
        return $"  {(record.Passed ? "passed" : "FAILED")}  {startup,16}  {record.Domain}/{record.Gif}.gif{why}";
    }
}
