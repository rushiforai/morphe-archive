// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Globalization;

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// What a run tells about its scenarios, installs, retries and waits, so it shows which scenario plays, how many APKs it
/// sent to the phone, which retries fired and how long each wait took. A scenario's start and end, an install and a
/// retry that fires write a line to xunit's diagnostic messages (printed with the run, as it goes, xunit.runner.json);
/// an install and a retry to the scenario's output too; a wait writes its time only to the scenario's output, in the
/// run's .trx (record.sh writes it in out/.results/).
/// </summary>
public static class RunLog
{
    /// <summary>Notes that <paramref name="retry"/> fired: it tries again, its <paramref name="attempt"/>th time, because <paramref name="why"/>.</summary>
    public static void RetryFired(string retry, int attempt, string why)
    {
        var line = $"retry fired: {retry}, attempt {attempt}: {why}";
        TestContext.Current.SendDiagnosticMessage($"{TestContext.Current.TestMethod?.MethodName}: {line}");
        TestContext.Current.TestOutputHelper?.WriteLine(line);
    }

    /// <summary>Notes that the scenario sent <paramref name="apk"/> to the phone and installed it, in <paramref name="took"/>.</summary>
    public static void Installed(string apk, TimeSpan took)
    {
        var line = string.Create(CultureInfo.InvariantCulture, $"installed: {apk} in {took.TotalSeconds:0} s");
        TestContext.Current.SendDiagnosticMessage($"{TestContext.Current.TestMethod?.MethodName}: {line}");
        TestContext.Current.TestOutputHelper?.WriteLine(line);
    }

    /// <summary>Notes that the scenario started, so a long run's log shows which one plays.</summary>
    public static void Started() =>
        TestContext.Current.SendDiagnosticMessage($"{TestContext.Current.TestMethod?.MethodName}: started");

    /// <summary>Notes how the scenario ended, <paramref name="passed"/> or not, <paramref name="took"/> after it started.</summary>
    public static void Ended(bool passed, TimeSpan took) =>
        TestContext.Current.SendDiagnosticMessage(string.Create(
            CultureInfo.InvariantCulture,
            $"{TestContext.Current.TestMethod?.MethodName}: {(passed ? "passed" : "FAILED")} in {took.TotalSeconds:0} s"));

    /// <summary>Notes how long the wait for <paramref name="what"/> took, of its <paramref name="limit"/>, and whether it saw it.</summary>
    public static void WaitTook(string what, TimeSpan took, TimeSpan limit, bool seen) =>
        TestContext.Current.TestOutputHelper?.WriteLine(string.Create(
            CultureInfo.InvariantCulture,
            $"wait {(seen ? "took" : "timed out")}: {took.TotalSeconds:0.0} s of {limit.TotalSeconds:0} s: {what}"));
}
