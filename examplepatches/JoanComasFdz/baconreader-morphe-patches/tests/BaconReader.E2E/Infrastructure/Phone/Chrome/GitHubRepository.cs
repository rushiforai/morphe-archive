// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Interactions;

namespace BaconReader.E2E.Infrastructure.Phone.Chrome;

/// <summary>
/// A repository's page on GitHub, in Chrome: its files, then its README, whose first link adds the repository to the
/// patcher's manager.
/// </summary>
public sealed class GitHubRepository(AndroidDriver driver)
{
    // The page's list of files, which shows once it loaded; the README comes below it.
    private static readonly OpenQA.Selenium.By Files = Locate.TextContaining("Folders and files");
    private static readonly OpenQA.Selenium.By AddToMorpheManager = Locate.Description("➕ Add to Morphe Manager");

    /// <summary>Waits until the page shows the repository's files.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Files, TimeSpan.FromSeconds(30), "The repository's page on GitHub");

    /// <summary>
    /// Taps the README's "➕ Add to Morphe Manager", swiping the page up to it, as a finger does. Chrome's page answers
    /// UiAutomator's scroll gesture as if it couldn't scroll further each time (2026-11-10), so it is swiped.
    /// </summary>
    public async Task ClickAddToMorpheManagerAsync()
    {
        for (var swipes = 0; !OnTheScreen(); swipes++)
        {
            if (swipes == 15)
            {
                throw new InvalidOperationException("The README's \"➕ Add to Morphe Manager\" wasn't on the screen after 15 swipes.");
            }

            await OnScreen.DoAsync(driver, SwipeUp);
        }

        await OnScreen.PressAsync(driver, AddToMorpheManager);
    }

    // Whether the link is on the screen, above its bottom quarter, where a tap lands on it.
    private bool OnTheScreen()
    {
        var height = driver.Manage().Window.Size.Height;
        return driver.FindElements(AddToMorpheManager).Any(link => link.Displayed && link.Location.Y > 0 && link.Location.Y < height * 3 / 4);
    }

    // A swipe up the middle of the screen, from 3/4 of its height to 1/3: the page moves up by about half a screen.
    private void SwipeUp()
    {
        var size = driver.Manage().Window.Size;
        var from = new Point(size.Width / 2, size.Height * 3 / 4);
        var to = new Point(size.Width / 2, size.Height / 3);
        var finger = new PointerInputDevice(PointerKind.Touch, "finger");
        var swipe = new ActionSequence(finger, 0);
        swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, from.X, from.Y, TimeSpan.Zero));
        swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
        swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, to.X, to.Y, TimeSpan.FromMilliseconds(500)));
        swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
        OnScreen.PerformSwipe(driver, swipe, from, to);
    }
}
