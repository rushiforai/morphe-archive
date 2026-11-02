// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// record.sh --no-video: no scenario writes its record, so each run's result and time come from the test results (a TRX
/// file per project), printed as one table. A run is "passed", "FAILED" or "skipped"; none that passed or failed (none
/// matched, or all skipped) is "No scenario ran.".
/// </summary>
public static partial class RunReporting
{
    private static readonly XNamespace TeamTest = "http://microsoft.com/schemas/VisualStudio/TeamTest/2010";

    /// <summary>The runs a TRX file holds; an error naming <paramref name="file"/> when it isn't one.</summary>
    public static Result<ImmutableArray<TestRun>, string> ReadTestRuns(string trx, string file) =>
        ParseXml(trx).Match<Result<ImmutableArray<TestRun>, string>>(
            document => document.Value.Descendants(TeamTest + "UnitTestResult").Select(ReadTestRun).CombineAll().MapError(failures => $"{file}: {failures[0]}"),
            _ => new Result<ImmutableArray<TestRun>, string>.Error($"{file} isn't a test results file."));

    /// <summary>The table, its runs by name: outcome, seconds, name.</summary>
    public static ImmutableArray<string> WriteReport(ImmutableArray<TestRun> runs) =>
        ["", "Runs (unrecorded):", .. runs
            .OrderBy(run => run.Name, StringComparer.Ordinal)
            .Select(run => $"  {DescribeOutcome(run.Outcome),7}  {run.Seconds.ToString("F1", CultureInfo.InvariantCulture),5} s  {run.Name}")];

    /// <summary>Whether a run passed or failed: one that ran.</summary>
    public static bool HasRunAny(ImmutableArray<TestRun> runs) => runs.Any(run => run.Outcome is "Passed" or "Failed");

    /// <summary>A run: its name and outcome, which every TRX result has; its time is 0 when it has none (a run not executed).</summary>
    private static Result<TestRun, string> ReadTestRun(XElement result) =>
        (Optional.FromNullable((string?)result.Attribute("testName")), Optional.FromNullable((string?)result.Attribute("outcome"))) switch
        {
            (Optional<string>.Some name, Optional<string>.Some outcome) =>
                new Result<TestRun, string>.Ok(new TestRun(DecodeName(name.Value), outcome.Value, ReadSeconds((string?)result.Attribute("duration") ?? "0:0:0"))),
            _ => new Result<TestRun, string>.Error("a test result lacks its testName or outcome"),
        };

    private static string DescribeOutcome(string outcome) =>
        outcome switch
        {
            "Passed" => "passed",
            "Failed" => "FAILED",
            "NotExecuted" => "skipped",
            _ => outcome,
        };

    /// <summary>A duration "hh:mm:ss.fffffff" in seconds; 0 when it isn't one.</summary>
    private static double ReadSeconds(string duration) =>
        duration.Split(':') is [var hours, var minutes, var seconds]
        && int.TryParse(hours, CultureInfo.InvariantCulture, out var h)
        && int.TryParse(minutes, CultureInfo.InvariantCulture, out var m)
        && double.TryParse(seconds, CultureInfo.InvariantCulture, out var s)
            ? (h * 3600) + (m * 60) + s
            : 0;

    /// <summary>The screen in a run's name ("[📱 Phone]") comes escaped ("📱"): decoded back.</summary>
    private static string DecodeName(string name) =>
        CreateEscapedCharsPattern().Replace(name, found => DecodeEscapes(found.Value));

    private static string DecodeEscapes(string escapes) =>
        new StringBuilder().AppendJoin("", escapes.Split(@"\u", StringSplitOptions.RemoveEmptyEntries)
            .Select(code => (char)int.Parse(code, NumberStyles.HexNumber, CultureInfo.InvariantCulture))).ToString();

    /// <summary>The parsed TRX; none for a text that isn't XML (the parser's only way to say so is its exception).</summary>
    private static Optional<XDocument> ParseXml(string trx)
    {
        try
        {
            return Optional.Some(XDocument.Parse(trx));
        }
        catch (XmlException)
        {
            return Optional.None<XDocument>();
        }
    }

    [GeneratedRegex(@"(?:\\u[0-9a-fA-F]{4})+")]
    private static partial Regex CreateEscapedCharsPattern();
}
