// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.Chrome;

/// <summary>Chrome, the phone's browser: the pages a user opens in it.</summary>
public sealed class ChromeApp(AndroidDriver driver)
{
    private const string Package = "com.android.chrome";

    // Its address bar: the page's address without its scheme, then what Chrome says of the connection
    // ("127.0.0.1:5080/_media/example.com/10003e2epage.html. Connection is not secure").
    private static readonly OpenQA.Selenium.By AddressBar = Locate.ChromeId("url_bar");

    /// <summary>A repository's page on GitHub, its README under its files.</summary>
    public GitHubRepository GitHubRepository { get; } = new(driver);

    /// <summary>morphe.software's page that offers to add a patch source to Morphe Manager.</summary>
    public MorpheAddSource MorpheAddSource { get; } = new(driver);

    /// <summary>Opens <paramref name="address"/> in Chrome, as typing it in its address bar does.</summary>
    public Task OpenAsync(string address) =>
        OnScreen.DoAsync(driver, () => driver.ExecuteScript("mobile: deepLink", new Dictionary<string, object> { ["url"] = address, ["package"] = Package }));

    /// <summary>Waits until Chrome shows a page, its address in its address bar: a link another app opened in it.</summary>
    public Task WaitUntilPageShownAsync() =>
        Waiting.UntilShownAsync(driver, AddressBar, TimeSpan.FromSeconds(15), "A page in Chrome");

    /// <summary>Taps Android's Back, which closes the tab another app opened and goes back to that app, BaconReader.</summary>
    public Task GoBackToBaconReaderAsync() => OnScreen.PressBackAsync(driver);

    /// <summary>What Chrome's address bar shows.</summary>
    public Task<ChromePageSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new ChromePageSnapshot(driver.FindElement(AddressBar).Text));
}

/// <summary>What Chrome's address bar shows: the page's address without its scheme, then what Chrome says of the connection.</summary>
public sealed record ChromePageSnapshot(string AddressBar);
