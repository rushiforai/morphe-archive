// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Reddit;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.Chrome;

/// <summary>What a test checks on Chrome.</summary>
public static class ChromePageSnapshotAssertions
{
    /// <summary>Chrome shows <paramref name="page"/>: its address bar starts with the page's address without its scheme.</summary>
    public static AssertingThat<ChromePageSnapshot> ShowsThePage(this AssertingThat<ChromePageSnapshot> that, WebPage page)
    {
        var shown = that.InstanceToAssert.AddressBar;
        var address = page.Address[(page.Address.IndexOf("://", StringComparison.Ordinal) + 3)..];
        Assert.True(
            shown.StartsWith(address, StringComparison.Ordinal),
            $"Chrome shows \"{shown}\", but the page \"{address}\" was expected.");
        return that;
    }
}
