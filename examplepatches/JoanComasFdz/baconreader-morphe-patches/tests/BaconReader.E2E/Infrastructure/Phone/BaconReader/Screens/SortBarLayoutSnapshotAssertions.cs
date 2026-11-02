// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of where the sort bar's buttons are.</summary>
public static class SortBarLayoutSnapshotAssertions
{
    /// <summary>"Search comments" sits on the sort bar's row, right before "COLLAPSE ALL", without overlapping it.</summary>
    public static AssertingThat<SortBarLayoutSnapshot> SearchSitsRightBeforeCollapseAll(this AssertingThat<SortBarLayoutSnapshot> that)
    {
        var bar = that.InstanceToAssert;
        var sameRow = Math.Abs((bar.Search.Top + bar.Search.Bottom) / 2 - (bar.CollapseAll.Top + bar.CollapseAll.Bottom) / 2) <= bar.Search.Height / 4;
        Assert.True(
            sameRow && bar.Search.Right <= bar.CollapseAll.Left && bar.CollapseAll.Left - bar.Search.Right <= bar.Search.Width,
            $"\"Search comments\" is at {bar.Search} and \"COLLAPSE ALL\" at {bar.CollapseAll}, but \"Search comments\" was expected on its row, right before it.");
        return that;
    }
}
