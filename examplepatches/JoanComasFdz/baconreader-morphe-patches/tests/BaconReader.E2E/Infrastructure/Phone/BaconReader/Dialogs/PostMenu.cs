// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// The menu a post's or a comment's ⋮ opens: on a card, on an action bar, or at the bottom of the post's screen. Each
/// offers "Block User".
/// </summary>
public sealed class PostMenu(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Entry = Locate.AppId("title");

    /// <summary>Waits until the menu shows "Block User", which every one of them offers.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(
            driver,
            Locate.AppIdWithText("title", new PostMenuEntry.BlockUser().ToShownText()),
            TimeSpan.FromSeconds(10),
            "The menu of the post's or the comment's ⋮");

    /// <summary>What the menu offers: its entries, top to bottom.</summary>
    public Task<PostMenuSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new PostMenuSnapshot(
            [.. driver.FindElements(Entry).Where(entry => entry.Displayed).Select(entry => PostMenuEntryShowing.ReadPostMenuEntry(entry.Text.Trim()))]));
}

/// <summary>What a post's or a comment's menu offers: its entries, top to bottom.</summary>
public sealed record PostMenuSnapshot(ImmutableArray<PostMenuEntry> Entries);
