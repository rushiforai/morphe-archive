// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on BaconReader's settings menu.</summary>
public static class SettingsMenuSnapshotAssertions
{
    /// <summary>The menu lists <paramref name="section"/> last.</summary>
    public static AssertingThat<SettingsMenuSnapshot> ShowsLast(this AssertingThat<SettingsMenuSnapshot> that, SettingsSection section)
    {
        var sections = that.InstanceToAssert.Sections;
        Assert.True(
            !sections.IsEmpty && sections[^1] == section,
            $"The settings show {string.Join(", ", sections.Select(shown => $"\"{shown.ToShownText()}\""))}, but \"{section.ToShownText()}\" last was expected.");
        return that;
    }
}
