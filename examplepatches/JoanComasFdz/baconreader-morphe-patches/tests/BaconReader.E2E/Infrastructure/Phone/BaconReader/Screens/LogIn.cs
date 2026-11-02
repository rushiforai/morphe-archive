// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The screen "Add account" opens: Reddit's login pages in BaconReader's web view, the fake Reddit's, made like Reddit's
/// (the same field ids and texts). First "Log In" ("Email or username", "Password"), then the page asking to connect the
/// app "Spoof client" logs in as with the account ("Accept"), which takes BaconReader back to its main screen, logged in.
/// </summary>
public sealed class LogIn(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By WebPage = Locate.WebPage();
    private static readonly OpenQA.Selenium.By UserName = Locate.WebFieldIn("login-username");
    private static readonly OpenQA.Selenium.By Password = Locate.WebFieldIn("login-password");
    private static readonly OpenQA.Selenium.By LogInButton = Locate.ButtonWithText("Log In");
    private static readonly OpenQA.Selenium.By Connect = Locate.TextContaining("would like to connect with your reddit account");
    private static readonly OpenQA.Selenium.By Accept = Locate.ButtonWithText("Accept");

    /// <summary>Waits until Reddit's "Log In" shows, its user name field ready.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, UserName, TimeSpan.FromSeconds(10), "Reddit's \"Log In\"");

    /// <summary>Types the test account's user name (<see cref="TestAccount"/>) in "Email or username".</summary>
    public Task TypeTheTestAccountsUserNameAsync() => TypeAsync(UserName, TestAccount.UserName);

    /// <summary>Types the test account's password (<see cref="TestAccount"/>) in "Password".</summary>
    public Task TypeTheTestAccountsPasswordAsync() => TypeAsync(Password, TestAccount.Password);

    /// <summary>Taps "Log In" (the button, not the title above the form).</summary>
    public Task ClickLogInAsync() => OnScreen.PressAsync(driver, LogInButton);

    /// <summary>Waits until Reddit asks to connect the app with the account.</summary>
    public Task WaitUntilConnectShownAsync() =>
        Waiting.UntilShownAsync(driver, Connect, TimeSpan.FromSeconds(10), "Reddit's \"… would like to connect with your reddit account\"");

    /// <summary>What Reddit's page asking to connect shows: its request, "Hey, &lt;user&gt;! &lt;app&gt; would like to connect with your reddit account".</summary>
    public Task<ConnectSnapshot> ReadConnectAsync() =>
        OnScreen.ReadAsync(driver, () => new ConnectSnapshot(driver.FindElement(Connect).Text.Trim()));

    /// <summary>
    /// Taps "Accept", below the permissions, scrolling down to it first when it's off the screen: Reddit hands
    /// BaconReader the login, and BaconReader goes back to its main screen.
    /// </summary>
    public async Task ClickAcceptAsync()
    {
        await OnScreen.ScrollToAsync(driver, WebPage, Accept, "Reddit's \"Accept\"");
        await OnScreen.PressAsync(driver, Accept);
    }

    // Waits for the field (while the keyboard opens, the web view resizes and briefly hands Android no views), taps it,
    // waits until it has the focus (the web view hands Android new views for it), then sets its text at once: typed key
    // by key, the keyboard turned "e2e_user"'s "_" into "." and the login page closed. The fake Reddit, unlike Reddit,
    // takes a login whose fields were filled in without a key pressed. On the emulator the web view at times handed
    // Android new views between two of those steps, and it started again; on the Pixel 6 Pro it never did in 4 runs of
    // every scenario (2026-10-31).
    private async Task TypeAsync(OpenQA.Selenium.By field, string text)
    {
        await Waiting.UntilShownAsync(driver, field, TimeSpan.FromSeconds(10), "Reddit's login field");
        await OnScreen.PressAsync(driver, field);
        await Waiting.UntilAsync(
            () => driver.FindElements(field).Any(element => element.GetAttribute("focused") == "true"),
            TimeSpan.FromSeconds(10),
            "Reddit's login field taking the focus");
        await OnScreen.ActAsync(driver, field, element => element.SendKeys(text));
    }
}

/// <summary>What Reddit's page asking to connect shows: its request, as one line.</summary>
public sealed record ConnectSnapshot(string Request);
