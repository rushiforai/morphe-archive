// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>The inbox (InboxActivity), which the left menu's "Inbox" opens: the account's messages, newest first.</summary>
public sealed class Inbox(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Body = Locate.AppId("bodyView");
    private static readonly OpenQA.Selenium.By Label = Locate.AppId("labelView");

    /// <summary>Waits until the inbox shows a message.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Body, TimeSpan.FromSeconds(10), "A message in the inbox");

    /// <summary>
    /// The label over the message "<paramref name="subject"/>": "&lt;subject&gt;: from &lt;author&gt;", with the author's
    /// avatar before the name when "Show user avatars" is on.
    /// </summary>
    public Task<InboxMessageSnapshot> ReadMessageAsync(string subject) =>
        OnScreen.ReadAsync(driver, () => new InboxMessageSnapshot(
            subject,
            driver.FindElements(Label).Select(label => label.Text).FirstOrDefault(label => label.StartsWith(subject + ": ", StringComparison.Ordinal))
                ?? throw new InvalidOperationException($"The message \"{subject}\" isn't in the inbox.")));

    /// <summary>Taps the private message "<paramref name="subject"/>", by its subject, which opens its menu.</summary>
    public Task ClickTheMessageAsync(string subject) => OnScreen.PressAsync(driver, Locate.AppIdWithText("subjectView", subject));

    /// <summary>Taps the message saying "<paramref name="body"/>", which opens its menu.</summary>
    public Task ClickMessageAsync(string body) => OnScreen.PressAsync(driver, Locate.AppIdWithText("bodyView", body));
}

/// <summary>A message of the inbox: its subject, and the label over it ("Hello: from ￼ e2e_sender").</summary>
public sealed record InboxMessageSnapshot(string Subject, string Label);
