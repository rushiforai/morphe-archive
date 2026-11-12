// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.RegularExpressions;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager.Screens;

/// <summary>What a test checks on Morphe Manager's screen of the app it patched.</summary>
public static partial class PatchedSnapshotAssertions
{
    /// <summary>It says "Patched", with the source <paramref name="source"/> and a version of it ("1.8.2").</summary>
    public static AssertingThat<PatchedSnapshot> SaysPatchedWithTheSource(this AssertingThat<PatchedSnapshot> that, string source)
    {
        var shown = that.InstanceToAssert;
        Assert.True(
            shown.SaysPatched && shown.Source is { } patchedWith && patchedWith.StartsWith(source + " ", StringComparison.Ordinal) && VersionNumber().IsMatch(shown.Version ?? ""),
            $"Morphe Manager shows {(shown.SaysPatched ? "\"Patched\"" : "no \"Patched\"")} with the source \"{shown.Source}\", but \"Patched\" with \"{source}\" and its version was expected.");
        return that;
    }

    [GeneratedRegex(@"^\d+(\.\d+)+(-dev\.\d+)?$")]
    private static partial Regex VersionNumber();
}
