// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a checkbox of BaconReader's settings.</summary>
public static class BaconReaderCheckboxSnapshotAssertions
{
    /// <summary>The setting's checkbox is ticked.</summary>
    public static AssertingThat<BaconReaderCheckboxSnapshot> IsTicked(this AssertingThat<BaconReaderCheckboxSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.Ticked, $"\"{that.InstanceToAssert.Setting.ToShownText()}\" isn't ticked, but it was expected to be.");
        return that;
    }
}
