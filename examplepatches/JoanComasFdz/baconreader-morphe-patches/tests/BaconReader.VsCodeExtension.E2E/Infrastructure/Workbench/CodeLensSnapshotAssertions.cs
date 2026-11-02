// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>What a test checks on the editor's CodeLens.</summary>
public static class CodeLensSnapshotAssertions
{
    /// <summary>
    /// The CodeLens above the file's scenario's method (the row right above its "public async Task" line, between its
    /// attributes and its declaration, where VS Code also shows other extensions' CodeLens) reads exactly <paramref name="items"/>.
    /// </summary>
    public static AssertingThat<CodeLensSnapshot> ReadsAboveTheScenario(this AssertingThat<CodeLensSnapshot> that, params string[] items)
    {
        var above = that.InstanceToAssert.Rows.Where(IsAboveAScenario).ToArray();
        Assert.True(above.Length == 1, $"The editor shows {above.Length} CodeLens rows above a scenario's method, but one was expected.");
        Assert.True(
            above[0].Items.SequenceEqual(items),
            $"The CodeLens above the scenario's method reads {Quote(above[0].Items)}, but {Quote(items)} was expected.");
        return that;
    }

    /// <summary>No CodeLens row sits above anything but a scenario (a helper method has none).</summary>
    public static AssertingThat<CodeLensSnapshot> HasNoOtherCodeLens(this AssertingThat<CodeLensSnapshot> that)
    {
        var others = that.InstanceToAssert.Rows.Where(row => !IsAboveAScenario(row)).ToArray();
        Assert.True(
            others.Length == 0,
            $"The editor shows a CodeLens above {string.Join(", ", others.Select(row => $"\"{row.LineBelow}\""))}, but only the scenario should have one.");
        return that;
    }

    /// <summary>No line of the file has a CodeLens.</summary>
    public static AssertingThat<CodeLensSnapshot> HasNoCodeLens(this AssertingThat<CodeLensSnapshot> that)
    {
        var rows = that.InstanceToAssert.Rows;
        Assert.True(
            rows.IsEmpty,
            $"The editor shows a CodeLens above {string.Join(", ", rows.Select(row => $"\"{row.LineBelow}\""))}, but none was expected.");
        return that;
    }

    private static bool IsAboveAScenario(CodeLensRow row) => row.LineBelow.StartsWith("public async Task", StringComparison.Ordinal);

    private static string Quote(IEnumerable<string> items) => string.Join(" | ", items.Select(item => $"\"{item}\""));
}
