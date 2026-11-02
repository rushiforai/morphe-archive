// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>The menu a message of the inbox opens when tapped: "Reply", "Mark read", "Open profile"…</summary>
public sealed class MessageMenu(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Entry = Locate.AndroidId("text1");

    /// <summary>Waits until the menu shows its first entry, "Reply".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.Text(new MessageMenuEntry.Reply().ToShownText()), TimeSpan.FromSeconds(10), "The message's menu");

    /// <summary>Taps <paramref name="entry"/>.</summary>
    public Task ClickAsync(MessageMenuEntry entry) => OnScreen.PressAsync(driver, Locate.Text(entry.ToShownText()));

    /// <summary>What the menu offers: its entries, top to bottom.</summary>
    public Task<MessageMenuSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new MessageMenuSnapshot(
            [.. driver.FindElements(Entry).Select(entry => MessageMenuEntryShowing.ReadMessageMenuEntry(entry.Text.Trim()))]));
}

/// <summary>What a message's menu offers: its entries, top to bottom.</summary>
public sealed record MessageMenuSnapshot(ImmutableArray<MessageMenuEntry> Entries);
