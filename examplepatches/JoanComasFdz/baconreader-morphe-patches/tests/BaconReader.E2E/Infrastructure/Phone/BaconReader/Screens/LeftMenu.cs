// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Appium.Android.Enums;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The main screen's left menu, which the toolbar's menu button opens: "Add account" or the user name logged in, then the
/// account's entries (Profile, Inbox…) and the app's (Subreddit, Settings…).
/// </summary>
public sealed class LeftMenu(AndroidDriver driver)
{
    // "Navigate up", and while it shows the orange envelope of unread messages, "Navigate up, orange envelope" (from
    // the test-only "E2E inbox envelope label").
    private static readonly OpenQA.Selenium.By MenuButton = Locate.DescriptionStartingWith("Navigate up");
    private const string EnvelopeLabel = ", orange envelope";
    private const string Menu = "drawerView";
    private const string Entry = "text";
    // An entry's icon: before an entry of the menu, after one of the accounts (its ✕, "Add account"'s +).
    private const string Icon = "icon";
    // The arrow at the end of a row that opens what it holds: the user name's opens the accounts.
    private const string Arrow = "expand";
    // "Show user avatars" draws an account's avatar over an object replacement character before its name.
    private const string Avatar = "\uFFFC ";
    // "Patches entry in settings"'s line at the bottom of the drawer, under the menu: "Patches <version> (<patcher>)".
    private const string PatchesVersion = "Patches ";
    // The circle "Account colors" puts between an account's name and its ✕: "Color of <user name>".
    private const string CirclePrefix = "Color of ";

    /// <summary>
    /// Opens the menu: taps the toolbar's menu button, after bringing the toolbar back when the posts were scrolled down
    /// (<see cref="Toolbar"/>).
    /// </summary>
    public async Task OpenAsync()
    {
        await Toolbar.BringBackAsync(driver, MenuButton, "The menu button, \"Navigate up\",");
        await OnScreen.PressAsync(driver, MenuButton);
    }

    /// <summary>
    /// Waits until the menu is shown, slid all the way in (where it is no longer changes from one look to the next): a
    /// tap while it still slides lands where its entry is no more.
    /// </summary>
    public Task WaitUntilShownAsync()
    {
        System.Drawing.Rectangle? last = null;
        return Waiting.UntilAsync(
            () =>
            {
                var now = ShownMenu(Screen())?.Bounds;
                var settled = now is not null && now == last;
                last = now;
                return settled;
            },
            TimeSpan.FromSeconds(10),
            "The main screen's left menu sliding in");
    }

    /// <summary>
    /// Taps <paramref name="entry"/>, which opens what it names over the menu. On the emulator BaconReader at times ignored
    /// the tap, and a tap again 20 s later opened it; on the Pixel 6 Pro no tap was ignored in 4 runs of every scenario
    /// (2026-10-31), so it taps once.
    /// </summary>
    public Task ClickAsync(MenuEntry entry) =>
        OnScreen.PressAtAsync(driver, () =>
            (Entries(Screen()).FirstOrDefault(found => found.Text == entry.ToShownText())
            ?? throw new InvalidOperationException($"The left menu shows no \"{entry.ToShownText()}\".")).Center);

    /// <summary>
    /// Taps the test account's user name at the top of the menu (<see cref="TestAccount"/>), which opens the accounts under
    /// it, or closes them.
    /// </summary>
    public Task ClickTheTestAccountsUserNameAsync() =>
        OnScreen.PressAtAsync(driver, () => Entries(Screen()).First(entry => Named(entry.Text.Trim(), TestAccount.UserName)).Center);

    /// <summary>
    /// Taps the arrow next to the account <paramref name="user"/> at the top of the menu (the arrow has no label), which
    /// opens the accounts under it, or closes them. It is the arrow on the same row as the account's name; the
    /// account's row among the accounts has none.
    /// </summary>
    public Task ClickArrowNextToAsync(string user) =>
        OnScreen.PressAtAsync(driver, () =>
        {
            var screen = Screen();
            return Entries(screen).Select(entry => (entry, arrow: ArrowOnRowOf(screen, entry)))
                .First(found => Named(found.entry.Text.Trim(), user) && found.arrow is not null).arrow!.Center;
        });

    /// <summary>Waits until the accounts show under the user name: their last row, "Add account", is there.</summary>
    public Task WaitUntilAccountsShownAsync() =>
        Waiting.UntilAsync(
            () => Accounts(Screen()).Any(entry => entry.Text.Trim() == new MenuEntry.AddAccount().ToShownText()),
            TimeSpan.FromSeconds(10),
            "The left menu's accounts under the user name");

    /// <summary>Waits until the accounts under the user name are closed: "Add account" is no longer there.</summary>
    public Task WaitUntilAccountsClosedAsync() =>
        Waiting.UntilAsync(
            () => !Accounts(Screen()).Any(entry => entry.Text.Trim() == new MenuEntry.AddAccount().ToShownText()),
            TimeSpan.FromSeconds(10),
            "The left menu's accounts under the user name closing");

    /// <summary>
    /// What the menu shows of the accounts: the user name at its top, and the accounts under it, top to bottom (none
    /// while they are closed).
    /// </summary>
    public Task<LeftMenuAccountsSnapshot> ReadAccountsAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            return new LeftMenuAccountsSnapshot(
                Entries(screen).First().Text.Trim(),
                [.. Accounts(screen).Select(entry => MenuEntryShowing.ReadMenuEntry(entry.Text.Trim()))]);
        });

    // Whether a row's text names user, with or without the avatar "Show user avatars" draws before it.
    private static bool Named(string text, string user) => text == user || text == Avatar + user;

    // The arrow whose row is the entry's: the one that spans the entry's middle, up and down.
    private static ScreenNode? ArrowOnRowOf(ScreenSnapshot screen, ScreenNode entry)
    {
        var middle = entry.Bounds.Top + (entry.Bounds.Height / 2);
        return ShownMenu(screen)?.WithAppId(Arrow)
            .FirstOrDefault(arrow => arrow.Displayed && arrow.Bounds.Top <= middle && middle <= arrow.Bounds.Bottom);
    }

    // The accounts' rows: each shows its icon after its text, where the menu's entries show it before.
    private static List<ScreenNode> Accounts(ScreenSnapshot screen)
    {
        if (ShownMenu(screen) is not { } menu)
        {
            return [];
        }

        var icons = menu.WithAppId(Icon).Where(icon => icon.Displayed).Select(icon => icon.Bounds).ToList();
        return [.. Entries(screen).Where(entry =>
            icons.Any(icon => icon.Left >= entry.Bounds.Right && icon.Top < entry.Bounds.Bottom && icon.Bottom > entry.Bounds.Top))];
    }

    /// <summary>
    /// Opens the list of accounts under the user name at the top of the menu (the accounts, "Add account"):
    /// taps the user name, unless the list already shows. BaconReader keeps the list open or closed until an account is
    /// switched to, which closes it.
    /// </summary>
    public async Task OpenTheAccountsAsync()
    {
        if (await Task.Run(() => Accounts(Screen()).Any(entry => entry.Text.Trim() == new MenuEntry.AddAccount().ToShownText())))
        {
            return;
        }

        await OnScreen.PressAtAsync(driver, () => Entries(Screen()).First().Center);
    }

    /// <summary>
    /// Taps the account <paramref name="userName"/> in the list of accounts, which switches to it: the lowest of the
    /// menu's texts with that name, the one at the top being the account in use.
    /// </summary>
    public Task ClickTheAccountAsync(string userName) =>
        OnScreen.PressAtAsync(driver, () => Entries(Screen()).Where(entry => Named(entry.Text.Trim(), userName)).Last().Center);

    /// <summary>Waits until the user name at the top of the menu is <paramref name="userName"/>: the account in use.</summary>
    public Task WaitUntilAccountInUseAsync(string userName) =>
        Waiting.UntilAsync(
            () => Entries(Screen()).FirstOrDefault() is { } top && Named(top.Text.Trim(), userName),
            TimeSpan.FromSeconds(15),
            $"The left menu naming \"{userName}\" at the top");

    /// <summary>Taps the circle <paramref name="circle"/>, such as "Color of e2e_user", which opens the color picker.</summary>
    public Task ClickTheCircleAsync(string circle) =>
        OnScreen.PressAtAsync(driver, () =>
            (Screen().Root.Descendants().FirstOrDefault(found => found.Displayed && found.Description == circle)
            ?? throw new InvalidOperationException($"The left menu shows no \"{circle}\".")).Center);

    /// <summary>Waits until the menu shows the circle <paramref name="circle"/>, such as "Color of e2e_user".</summary>
    public Task WaitUntilCircleShownAsync(string circle) =>
        Waiting.UntilAsync(
            () => Screen().Root.Descendants().Any(found => found.Displayed && found.Description == circle),
            TimeSpan.FromSeconds(10),
            $"The circle \"{circle}\" in the left menu");

    /// <summary>
    /// What the rows of the menu show, top to bottom: each row's text, and on its line "Account colors"' circle, if any,
    /// and its icon at the end (an account's ✕), where they are, and whether the circle is filled with a color or only
    /// an outline, from a screenshot (E2E-TEST-CODE-RULES.md, rule d).
    /// </summary>
    public Task<LeftMenuRowsSnapshot> ReadRowsAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            var circles = screen.Root.Descendants().Where(circle => circle.Displayed && circle.Description.StartsWith(CirclePrefix, StringComparison.Ordinal)).ToList();
            var icons = screen.WithAppId(Menu).SelectMany(menu => menu.WithAppId(Icon)).Where(icon => icon.Displayed).ToList();
            var png = circles.Count > 0 ? driver.GetScreenshot().AsByteArray : [];
            return new LeftMenuRowsSnapshot(
            [
                .. Entries(screen).Select(entry =>
                {
                    var text = entry.Bounds;
                    var circle = circles.FirstOrDefault(found => OnTheLineOf(found.Bounds, text));
                    var icon = icons.Where(found => OnTheLineOf(found.Bounds, text) && found.Bounds.Left > text.Left)
                        .OrderBy(found => found.Bounds.X).LastOrDefault();
                    return new LeftMenuRow(entry.Text.Trim(), text)
                    {
                        Circle = circle?.Description,
                        CircleBounds = circle?.Bounds,
                        CircleFilled = circle is null ? null : Filled(png, circle.Bounds),
                        IconBounds = icon?.Bounds,
                    };
                }),
            ]);
        });

    private ScreenSnapshot Screen() => ScreenSnapshot.Take(driver);

    // The menu while it shows.
    private static ScreenNode? ShownMenu(ScreenSnapshot screen) => screen.WithAppId(Menu).FirstOrDefault(menu => menu.Displayed);

    // The texts of the menu's rows that show, top to bottom.
    private static List<ScreenNode> Entries(ScreenSnapshot screen) =>
        [.. screen.WithAppId(Menu).SelectMany(menu => menu.WithAppId(Entry)).Where(entry => entry.Displayed).OrderBy(entry => entry.Bounds.Y)];

    // Whether a view's middle is on the line of a row's text: the row's views are centered on it.
    private static bool OnTheLineOf(System.Drawing.Rectangle view, System.Drawing.Rectangle text)
    {
        var middle = view.Top + (view.Height / 2);
        return middle >= text.Top - (text.Height / 2) && middle <= text.Bottom + (text.Height / 2);
    }

    // The circle is drawn in the middle of its view, which is twice as wide as it: its middle differs from the view's
    // left edge only when the circle is filled.
    private static bool Filled(byte[] png, System.Drawing.Rectangle circle)
    {
        var middle = new System.Drawing.Point(circle.Left + (circle.Width / 2), circle.Top + (circle.Height / 2));
        return Screenshots.Differs(png, new System.Drawing.Rectangle(middle.X - 4, middle.Y - 4, 8, 8), new System.Drawing.Point(circle.Left + 2, middle.Y));
    }

    /// <summary>Closes the menu, as Android's Back does.</summary>
    public Task CloseAsync() => OnScreen.PressBackAsync(driver);

    /// <summary>
    /// What the button that opens the menu shows: the orange envelope while there are unread messages, otherwise the menu
    /// icon. UiAutomator can't tell the two images apart; the test-only "E2E inbox envelope label" names the envelope in
    /// the button's description.
    /// </summary>
    public Task<LeftMenuButtonSnapshot> ReadButtonAsync() =>
        OnScreen.ReadAsync(driver, () => new LeftMenuButtonSnapshot(
            driver.FindElement(MenuButton).GetAttribute("content-desc")?.EndsWith(EnvelopeLabel, StringComparison.Ordinal) == true));

    /// <summary>
    /// What the drawer shows at its bottom, under the menu: the patches' version, "Patches &lt;version&gt;
    /// (&lt;patcher&gt;)", and whether it is below every entry of the menu.
    /// </summary>
    public Task<LeftMenuFooterSnapshot> ReadFooterAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            var version = screen.Root.Descendants().FirstOrDefault(line => line.Displayed && line.Text.StartsWith(PatchesVersion, StringComparison.Ordinal));
            var lowestEntry = Entries(screen).Select(entry => entry.Bounds.Bottom).DefaultIfEmpty(0).Max();
            return new LeftMenuFooterSnapshot(version?.Text, version is not null && version.Bounds.Top >= lowestEntry);
        });

    /// <summary>What the menu shows: its entries, top to bottom.</summary>
    public Task<LeftMenuSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new LeftMenuSnapshot([.. Entries(Screen()).Select(entry => MenuEntryShowing.ReadMenuEntry(entry.Text.Trim()))]));
}

/// <summary>What the rows of the left menu show, top to bottom.</summary>
public sealed record LeftMenuRowsSnapshot(ImmutableArray<LeftMenuRow> Rows);

/// <summary>
/// A row of the left menu: its text and where it is, and on its line "Account colors"' circle (its description, such as
/// "Color of e2e_user", and whether it is filled with a color rather than an outline), and the icon at its end.
/// </summary>
public sealed record LeftMenuRow(string Text, System.Drawing.Rectangle TextBounds)
{
    public string? Circle { get; init; }

    public System.Drawing.Rectangle? CircleBounds { get; init; }

    public bool? CircleFilled { get; init; }

    public System.Drawing.Rectangle? IconBounds { get; init; }
}

/// <summary>What the toolbar's button that opens the left menu shows: the orange envelope of unread messages, or the menu icon.</summary>
public sealed record LeftMenuButtonSnapshot(bool ShowsTheOrangeEnvelope);

/// <summary>What the left menu shows: its entries, top to bottom.</summary>
public sealed record LeftMenuSnapshot(ImmutableArray<MenuEntry> Entries);

/// <summary>
/// What the left menu shows of the accounts: the user name at its top ("￼ e2e_user", with the avatar "Show user avatars"
/// draws before it), and the rows of the accounts under it, top to bottom (the accounts, "Add account"), empty while
/// they are closed.
/// </summary>
public sealed record LeftMenuAccountsSnapshot(string UserName, ImmutableArray<MenuEntry> Rows);

/// <summary>
/// What the drawer shows at its bottom: the patches' version ("Patches unknown (Reseam 0.35.1)"; null when none shows),
/// and whether it is below every entry of the menu.
/// </summary>
public sealed record LeftMenuFooterSnapshot(string? PatchesVersion, bool BelowTheMenu);
