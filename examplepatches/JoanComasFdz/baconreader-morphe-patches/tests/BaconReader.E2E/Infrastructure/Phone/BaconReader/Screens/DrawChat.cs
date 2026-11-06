// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Interactions;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// BaconReader's drawing screen (DrawChat), which "Draw" in "Attach media" opens: a canvas over the brushes and colours,
/// and "Accept" in the toolbar, which puts the drawing in the reply.
/// </summary>
public sealed class DrawChat(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Brush = Locate.AppId("drawChatBrush");
    private static readonly OpenQA.Selenium.By Sizes = Locate.AppId("drawChatPixel");
    private static readonly OpenQA.Selenium.By Accept = Locate.Description("Accept");
    private static readonly OpenQA.Selenium.By Camera = Locate.Description("Camera");

    /// <summary>Waits until the screen shows its brushes.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Brush, TimeSpan.FromSeconds(10), "The drawing screen");

    /// <summary>
    /// Draws a line across the canvas, from a quarter of its width and height to three quarters: the canvas is everything
    /// between the toolbar and the brushes' sizes.
    /// </summary>
    public Task DrawALineAsync() =>
        OnScreen.TouchAsync(driver, () => driver.FindElement(Sizes), sizes =>
        {
            var window = driver.Manage().Window.Size;
            var canvas = Rectangle.FromLTRB(0, window.Height / 8, window.Width, sizes.Location.Y);
            var finger = new PointerInputDevice(PointerKind.Touch, "finger");
            var line = new ActionSequence(finger, 0);
            line.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, canvas.Left + (canvas.Width / 4), canvas.Top + (canvas.Height / 4), TimeSpan.Zero));
            line.AddAction(finger.CreatePointerDown(MouseButton.Touch));
            line.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, canvas.Left + (canvas.Width * 3 / 4), canvas.Top + (canvas.Height * 3 / 4), TimeSpan.FromMilliseconds(400)));
            line.AddAction(finger.CreatePointerUp(MouseButton.Touch));
            driver.PerformActions([line]);
        });

    /// <summary>Taps "Accept", which closes the screen and puts the drawing in the reply.</summary>
    public Task ClickAcceptAsync() => OnScreen.PressAsync(driver, Accept);

    /// <summary>Taps "Camera", which opens the "Choose" dialog of a background (<see cref="Background"/>).</summary>
    public Task ClickCameraAsync() => OnScreen.PressAsync(driver, Camera);

    /// <summary>The "Choose" dialog "Camera" opens: where the drawing's background comes from.</summary>
    public Dialogs.DrawingBackgroundChoice Background { get; } = new(driver);

    /// <summary>What the screen shows: whether its brushes are there.</summary>
    public Task<DrawChatSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new DrawChatSnapshot(driver.FindElements(Brush).Count > 0));
}

/// <summary>The drawing screen: whether it shows, by its brushes.</summary>
public sealed record DrawChatSnapshot(bool Shown);
