// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a section of BaconReader's settings.</summary>
public static class SettingsSectionSnapshotAssertions
{
    /// <summary>The section doesn't offer <paramref name="setting"/>.</summary>
    public static AssertingThat<SettingsSectionSnapshot> DoesntOffer(this AssertingThat<SettingsSectionSnapshot> that, BaconReaderSetting setting)
    {
        var shown = that.InstanceToAssert.Settings;
        Assert.False(
            shown.Contains(setting),
            $"The settings offer {string.Join(", ", shown.Select(found => $"\"{found.ToShownText()}\""))}, but \"{setting.ToShownText()}\" wasn't expected.");
        return that;
    }
}
