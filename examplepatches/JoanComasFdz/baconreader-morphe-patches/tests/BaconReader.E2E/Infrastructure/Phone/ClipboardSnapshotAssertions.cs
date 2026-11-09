// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>What a test checks on Android's clipboard.</summary>
public static class ClipboardSnapshotAssertions
{
    /// <summary>The clipboard holds exactly <paramref name="text"/>.</summary>
    public static AssertingThat<ClipboardSnapshot> Holds(this AssertingThat<ClipboardSnapshot> that, string text)
    {
        var held = that.InstanceToAssert.Text;
        Assert.True(held == text, $"The clipboard holds \"{held}\", but \"{text}\" was expected.");
        return that;
    }
}
