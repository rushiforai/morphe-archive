// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The reply screen (PostActivity), "Post Comment", which "Comment" in a comment's action bar opens, and "Reply" in the
/// inbox with "Inbox comment reply screen": "Reply to &lt;author&gt; in r/&lt;subreddit&gt; as &lt;you&gt;" over the
/// text being answered, then the text box. Its send button is described "Attach media", as the button before it, so it
/// is found by its id.
/// </summary>
public sealed class ReplyScreen(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By ReplyTo = Locate.AppId("ReplyCommentSubText");
    private static readonly OpenQA.Selenium.By Replied = Locate.AppId("ReplyCommentText");
    private static readonly OpenQA.Selenium.By Send = Locate.AppId("action_send");
    private static readonly OpenQA.Selenium.By AttachMediaButton = Locate.AppId("action_attach_media");

    /// <summary>The text box, with "Markdown editor"'s formats and counter.</summary>
    public MarkdownEditor Editor { get; } = new(driver);

    /// <summary>The dialog "Attach media" opens: "Camera", "Gallery", "Draw".</summary>
    public AttachMedia AttachMedia { get; } = new(driver);

    /// <summary>
    /// Taps "Attach media", which opens its dialog. Found by its id: the send button next to it is described "Attach media"
    /// too.
    /// </summary>
    public Task ClickAttachMediaAsync() => OnScreen.PressAsync(driver, AttachMediaButton);

    /// <summary>Waits until the screen shows whom the reply answers.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, ReplyTo, TimeSpan.FromSeconds(10), "The reply screen, \"Post Comment\"");

    /// <summary>Taps the send button, which posts the reply and closes the screen.</summary>
    public Task ClickSendAsync() => OnScreen.PressAsync(driver, Send);

    /// <summary>What the screen shows over the text box: "Reply to … in r/… as …", over the text being answered.</summary>
    public Task<ReplyScreenSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new ReplyScreenSnapshot(driver.FindElement(ReplyTo).Text, driver.FindElement(Replied).Text));
}

/// <summary>
/// What the reply screen shows over its text box: "Reply to ￼ avatar_user in r/e2e as e2e_user", over the text being
/// answered.
/// </summary>
public sealed record ReplyScreenSnapshot(string ReplyTo, string Replied);
