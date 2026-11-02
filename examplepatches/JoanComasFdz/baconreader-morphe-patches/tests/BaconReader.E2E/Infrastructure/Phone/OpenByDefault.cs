// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Text.RegularExpressions;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// Android's "Open by default" screen for an app (App info → Open by default), which "Set up" on "Open Reddit links with
/// BaconReader?" opens: the app, how its web links open, and "Links to open in this app", the links selected, with "Add
/// link" to select more. On Android 17 the screen's title is its toolbar's content description, not a text.
/// </summary>
public sealed partial class OpenByDefault(AndroidDriver driver)
{
    private const string ScreenTitle = "Open by default";
    private const string LinksHeading = "Links to open in this app";
    private const string AddLinkText = "Add link";

    private static readonly OpenQA.Selenium.By Title = Locate.Description(ScreenTitle);
    private static readonly OpenQA.Selenium.By App = Locate.SettingsId("entity_header_title");
    private static readonly OpenQA.Selenium.By Rows = Locate.AndroidId("title");
    private static readonly OpenQA.Selenium.By AddLink = Locate.Text(AddLinkText);

    /// <summary>The dialog "Add link" opens: the links the app declares, each to tick, then "Add".</summary>
    public SupportedLinks SupportedLinks { get; } = new(driver);

    /// <summary>Waits until the screen is shown, with the app it is for.</summary>
    public async Task WaitUntilShownAsync()
    {
        await Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "Android's \"Open by default\" screen");
        await Waiting.UntilShownAsync(driver, App, TimeSpan.FromSeconds(10), "The app \"Open by default\" is for");
    }

    /// <summary>Taps "Add link", which opens the links the app declares (<see cref="SupportedLinks"/>).</summary>
    public Task ClickAddLinkAsync() => OnScreen.PressAsync(driver, AddLink);

    /// <summary>
    /// What the screen shows: its title, the app it is for, and the links listed under "Links to open in this app",
    /// without the count of verified links Android lists first ("0 verified links").
    /// </summary>
    public Task<OpenByDefaultSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var title = driver.FindElements(Title).Count > 0 ? ScreenTitle : "";
            var app = driver.FindElement(App).Text.Trim();
            var rows = driver.FindElements(Rows).Select(row => row.Text.Trim()).ToList();
            var links = rows
                .SkipWhile(row => row != LinksHeading)
                .Skip(1)
                .TakeWhile(row => row != AddLinkText)
                .Where(row => !VerifiedLinks().IsMatch(row))
                .Select(AppLinkShowing.ReadAppLink);
            return new OpenByDefaultSnapshot(title, app, [.. links]);
        });

    [GeneratedRegex(@"^\d+ verified links?$")]
    private static partial Regex VerifiedLinks();
}

/// <summary>
/// The dialog "Add link" opens on "Open by default", titled with their count ("7 supported links"): each link the app
/// declares, ticked or not, then "Cancel" and "Add".
/// </summary>
public sealed class SupportedLinks(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By List = Locate.SettingsId("select_dialog_listview");
    private static readonly OpenQA.Selenium.By Add = Locate.Text("Add");

    private static OpenQA.Selenium.By Link(AppLink link) => Locate.Text(link.ToShownText());

    /// <summary>Waits until the dialog is shown, with its links.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, List, TimeSpan.FromSeconds(10), "The links \"Add link\" lists");

    /// <summary>Ticks <paramref name="link"/>.</summary>
    public Task TickAsync(AppLink link) => OnScreen.PressAsync(driver, Link(link));

    /// <summary>Taps "Add": the links ticked open in the app, and the dialog closes.</summary>
    public Task ClickAddAsync() => OnScreen.PressAsync(driver, Add);
}

/// <summary>
/// What "Open by default" shows: its title, the app it is for, and the links listed under "Links to open in this app".
/// </summary>
public sealed record OpenByDefaultSnapshot(string Title, string App, ImmutableArray<AppLink> Links);
