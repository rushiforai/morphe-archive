// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>What a test checks on a toast.</summary>
public static class ToastSnapshotAssertions
{
    /// <summary>The toast says <paramref name="text"/>.</summary>
    public static AssertingThat<ToastSnapshot> Says(this AssertingThat<ToastSnapshot> that, string text)
    {
        Assert.True(that.InstanceToAssert.Text == text, $"A toast says \"{that.InstanceToAssert.Text}\", but \"{text}\" was expected.");
        return that;
    }
}
