// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the patches' settings.</summary>
public static class PatchesSettingsSnapshotAssertions
{
    /// <summary>
    /// The page shows <paramref name="settings"/>, in this order: a page also shows other patches' settings (the Comments
    /// page "Show user avatars" and "Load more comments"), which this leaves out.
    /// </summary>
    public static AssertingThat<PatchesSettingsSnapshot> ShowsTheSettings(this AssertingThat<PatchesSettingsSnapshot> that, params PatchSetting[] settings)
    {
        var shown = that.InstanceToAssert.Settings;
        Assert.True(
            shown.Where(settings.Contains).SequenceEqual(settings),
            $"The settings show {Listed(shown)}, but {Listed(settings)} were expected, in this order.");
        return that;
    }

    private static string Listed(IEnumerable<PatchSetting> settings) =>
        string.Join(", ", settings.Select(setting => $"\"{setting.ToShownText()}\""));

    /// <summary>The patches' settings screen shows.</summary>
    public static AssertingThat<PatchesSettingsScreenSnapshot> IsShown(this AssertingThat<PatchesSettingsScreenSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.Shown, "BaconReader doesn't show the patches' settings, but it was expected.");
        return that;
    }

    /// <summary>The setting's switch is on.</summary>
    public static AssertingThat<PatchSettingSwitchSnapshot> IsOn(this AssertingThat<PatchSettingSwitchSnapshot> that)
    {
        var setting = that.InstanceToAssert;
        Assert.True(setting.On, $"The setting \"{setting.Setting.ToShownText()}\" is off, but on was expected.");
        return that;
    }
}
