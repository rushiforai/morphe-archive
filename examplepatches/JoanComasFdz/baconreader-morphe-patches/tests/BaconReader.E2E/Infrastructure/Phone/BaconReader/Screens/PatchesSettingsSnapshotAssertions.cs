// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the patches' settings.</summary>
public static class PatchesSettingsSnapshotAssertions
{
    /// <summary>The settings shown are <paramref name="settings"/>, in this order, and no other setting a case names.</summary>
    public static AssertingThat<PatchesSettingsSnapshot> ShowsTheSettings(this AssertingThat<PatchesSettingsSnapshot> that, params PatchSetting[] settings)
    {
        var shown = that.InstanceToAssert.Settings;
        Assert.True(
            shown.SequenceEqual(settings),
            $"The settings show {Listed(shown)}, but {Listed(settings)} were expected, in this order.");
        return that;
    }

    private static string Listed(IEnumerable<PatchSetting> settings) =>
        string.Join(", ", settings.Select(setting => $"\"{setting.ToShownText()}\""));
}
