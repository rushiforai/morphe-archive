// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager.Screens;

/// <summary>
/// Morphe Manager's screen of the app it patched: "Patched", the app, its version, its patches, the source it patched
/// with ("JoanComasFdz BaconReader Patches 1.8.2") and "Install".
/// </summary>
public sealed class Patched(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.Text("Patched");
    private static readonly OpenQA.Selenium.By Install = Locate.Text("Install");

    /// <summary>Waits until it patched the app: its patching takes seconds on the phone, a minute at most.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Install, TimeSpan.FromSeconds(180), "Morphe Manager's \"Patched\"");

    /// <summary>Taps "Install".</summary>
    public Task ClickInstallAsync() => OnScreen.PressAsync(driver, Install);

    /// <summary>What the screen shows: whether it says "Patched", and the source it patched with, after "Source".</summary>
    public Task<PatchedSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var lines = driver.FindElements(Locate.AnyText()).Select(line => line.Text.Trim()).ToList();
            var source = lines.IndexOf("Source") is var at and >= 0 && at + 1 < lines.Count ? lines[at + 1] : null;
            return new PatchedSnapshot(driver.FindElements(Title).Count > 0, source);
        });
}

/// <summary>
/// What Morphe Manager's screen of the patched app shows: whether it says "Patched", and the source it patched with, its
/// name then its version ("JoanComasFdz BaconReader Patches 1.8.2").
/// </summary>
public sealed record PatchedSnapshot(bool SaysPatched, string? Source)
{
    /// <summary>The source's version: its last word.</summary>
    public string? Version => Source?.Split(' ')[^1];
}
