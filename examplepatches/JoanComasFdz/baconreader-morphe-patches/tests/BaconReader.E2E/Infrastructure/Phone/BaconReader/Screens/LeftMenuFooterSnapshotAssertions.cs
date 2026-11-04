// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks at the bottom of the main screen's drawer.</summary>
public static class LeftMenuFooterSnapshotAssertions
{
    /// <summary>
    /// The drawer shows the patches' version at its bottom, under the menu: "Patches &lt;version&gt; (&lt;patcher&gt;)",
    /// which changes with each build and patcher.
    /// </summary>
    public static AssertingThat<LeftMenuFooterSnapshot> ShowsThePatchesVersionAtItsBottom(this AssertingThat<LeftMenuFooterSnapshot> that)
    {
        var footer = that.InstanceToAssert;
        Assert.True(
            footer.PatchesVersion is { } version && version.EndsWith(')') && version.Contains(" (", StringComparison.Ordinal) && footer.BelowTheMenu,
            footer.PatchesVersion is null
                ? "The left menu shows no patches' version, but \"Patches <version> (<patcher>)\" at its bottom was expected."
                : $"The left menu shows \"{footer.PatchesVersion}\"{(footer.BelowTheMenu ? "" : " above its last entry")}, but \"Patches <version> (<patcher>)\" at its bottom was expected.");
        return that;
    }
}
