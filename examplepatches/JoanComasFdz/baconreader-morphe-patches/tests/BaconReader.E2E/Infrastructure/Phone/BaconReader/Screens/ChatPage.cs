// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// "Reddit chat"'s Chat, which shows in the main screen in place of the posts, under the toolbar: Reddit's chat website
/// in a web view. The fake Reddit answers it with a plain page of its own (BaconReader.FakeReddit's <c>ChatPage</c>),
/// whose texts and links the screen's tree shows.
/// </summary>
public sealed class ChatPage(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By WebPage = Locate.AnyWebPage();

    /// <summary>Waits until the chat shows <paramref name="text"/>: its page loaded.</summary>
    public Task WaitUntilShownAsync(string text) =>
        Waiting.UntilAsync(() => Texts().Contains(text), TimeSpan.FromSeconds(15), $"The chat showing \"{text}\"");

    /// <summary>What the chat shows: its page's texts, top to bottom.</summary>
    public Task<ChatPageSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new ChatPageSnapshot([.. Texts()]));

    /// <summary>Taps the chat's link "<paramref name="text"/>".</summary>
    public Task ClickLinkAsync(string text) =>
        OnScreen.PressAsync(driver, () => driver.FindElement(WebPage).FindElement(Locate.Text(text)));

    private IReadOnlyList<string> Texts() =>
        driver.FindElements(WebPage).FirstOrDefault(page => page.Displayed)?.FindElements(Locate.AnyText())
            .OrderBy(text => text.Location.Y).Select(text => text.Text.Trim()).Distinct().ToList() ?? [];
}

/// <summary>The chat: its page's texts, top to bottom, none when it doesn't show.</summary>
public sealed record ChatPageSnapshot(System.Collections.Immutable.ImmutableArray<string> Texts);
