// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// <see cref="OnScreen"/> hands the view a wait found to the step right after it only when the step looks for it with
/// the same locator.
/// </summary>
public sealed class OnScreenTests
{
    [Fact]
    public void SameLocator_TellsUiSelectorsApartByWhatTheyLookFor()
    {
        Assert.False(OnScreen.SameLocator(Locate.Text("Open Reddit links with BaconReader?"), Locate.Text("Not now")));
    }

    [Fact]
    public void SameLocator_MatchesTheSameUiSelectorMadeTwice()
    {
        Assert.True(OnScreen.SameLocator(Locate.Text("Not now"), Locate.Text("Not now")));
    }

    [Fact]
    public void SameLocator_TellsIdsApart()
    {
        Assert.False(OnScreen.SameLocator(Locate.AppId("toolbarTitle"), Locate.AppId("rv_links")));
        Assert.True(OnScreen.SameLocator(Locate.AppId("toolbarTitle"), Locate.AppId("toolbarTitle")));
    }
}
