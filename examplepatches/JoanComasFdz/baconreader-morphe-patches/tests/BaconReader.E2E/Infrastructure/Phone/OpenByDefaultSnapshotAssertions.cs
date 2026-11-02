// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>What a test checks on Android's "Open by default" screen.</summary>
public static class OpenByDefaultSnapshotAssertions
{
    /// <summary>The screen is "Open by default", for the app Android names <paramref name="app"/>.</summary>
    public static AssertingThat<OpenByDefaultSnapshot> IsOpenByDefaultFor(this AssertingThat<OpenByDefaultSnapshot> that, string app)
    {
        var shown = that.InstanceToAssert;
        Assert.True(
            shown is { Title: "Open by default" } && shown.App == app,
            $"Android shows \"{shown.Title}\" for \"{shown.App}\", but \"Open by default\" for \"{app}\" was expected.");
        return that;
    }

    /// <summary>"Links to open in this app" lists no link.</summary>
    public static AssertingThat<OpenByDefaultSnapshot> ListsNoLink(this AssertingThat<OpenByDefaultSnapshot> that)
    {
        var links = that.InstanceToAssert.Links;
        Assert.True(
            links.IsEmpty,
            $"\"Links to open in this app\" lists {string.Join(", ", links.Select(link => $"\"{link.ToShownText()}\""))}, but no link was expected.");
        return that;
    }

    /// <summary>"Links to open in this app" lists <paramref name="link"/>.</summary>
    public static AssertingThat<OpenByDefaultSnapshot> ListsLink(this AssertingThat<OpenByDefaultSnapshot> that, AppLink link)
    {
        var links = that.InstanceToAssert.Links;
        Assert.True(
            links.Contains(link),
            $"\"Links to open in this app\" lists [{string.Join(", ", links.Select(shown => $"\"{shown.ToShownText()}\""))}], but \"{link.ToShownText()}\" was expected among them.");
        return that;
    }
}
