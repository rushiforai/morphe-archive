// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// What a test checks in a settings file "Export settings" wrote. The file names a setting by its key in the app, and a
/// color by its number: the keys and numbers of the settings and colors a test checks are here.
/// </summary>
public static class SettingsFileSnapshotAssertions
{
    /// <summary>The file is in Downloads: it has its maps.</summary>
    public static AssertingThat<SettingsFileSnapshot> IsThere(this AssertingThat<SettingsFileSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.Maps.Count > 0, $"Downloads doesn't hold \"{that.InstanceToAssert.Name}\", but it was expected to.");
        return that;
    }

    /// <summary>The file has BaconReader's <paramref name="setting"/> on.</summary>
    public static AssertingThat<SettingsFileSnapshot> HasOn(this AssertingThat<SettingsFileSnapshot> that, BaconReaderSetting setting) =>
        that.Has("baconreader", Key(setting), "true", $"\"{setting.ToShownText()}\" on");

    /// <summary>The file has the patches' <paramref name="setting"/> on.</summary>
    public static AssertingThat<SettingsFileSnapshot> HasOn(this AssertingThat<SettingsFileSnapshot> that, PatchSetting setting) =>
        that.Has("patches", Key(setting), "true", $"\"{setting.ToShownText()}\" on");

    /// <summary>The file has <paramref name="account"/>'s color <paramref name="color"/>.</summary>
    public static AssertingThat<SettingsFileSnapshot> HasTheColor(this AssertingThat<SettingsFileSnapshot> that, string account, AccountColorChoice color) =>
        that.Has("account_colors", account, Number(color), $"{account}'s color {color.ToShownText()}");

    private static AssertingThat<SettingsFileSnapshot> Has(this AssertingThat<SettingsFileSnapshot> that, string map, string key, string value, string expected)
    {
        var file = that.InstanceToAssert;
        var written = file.Maps.TryGetValue(map, out var values) && values.TryGetValue(key, out var found) ? found : null;
        Assert.True(
            written == value,
            $"\"{file.Name}\" has {(written is null ? $"no {key} in {map}" : $"{key}: {written} in {map}")}, but {expected} ({key}: {value}) was expected.");
        return that;
    }

    private static string Key(BaconReaderSetting setting) =>
        setting switch
        {
            BaconReaderSetting.ShowLargeImage => "showImagesInCommentsScreen",
            _ => throw new ArgumentException($"No key for \"{setting.ToShownText()}\" yet.", nameof(setting)),
        };

    private static string Key(PatchSetting setting) =>
        setting switch
        {
            PatchSetting.ShowUserAvatars => "user_avatars",
            _ => throw new ArgumentException($"No key for \"{setting.ToShownText()}\" yet.", nameof(setting)),
        };

    // Account colors' colors, as Android writes an ARGB color: a signed int.
    private static string Number(AccountColorChoice color) =>
        color switch
        {
            AccountColorChoice.Green => unchecked((int)0xFF4CAF50).ToString(System.Globalization.CultureInfo.InvariantCulture),
            _ => throw new ArgumentException($"No number for \"{color.ToShownText()}\" yet.", nameof(color)),
        };
}
