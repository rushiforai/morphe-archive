// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Reflection;
using Xunit;
using Xunit.Sdk;
using Xunit.v3;

namespace BaconReader.E2E.Shared;

/// <summary>
/// The screen a scenario is played on (each project's E2E-TEST-CODE-RULES.md, rule a): a scenario's <c>[PlayOnPhone]</c>
/// or <c>[PlayOnDesktop]</c> plays it once, and the project's <c>BaseE2E</c> opens the app on that screen. The app's
/// scenarios (tests/BaconReader.E2E) are played on the phone; the VS Code extension's
/// (tests/BaconReader.VsCodeExtension.E2E) on the desktop.
/// </summary>
public enum Screen
{
    /// <summary>The phone: a Pixel 6 Pro, 1080×2340, Android 17.</summary>
    Phone,

    /// <summary>A desktop browser window, 1280×800, with a mouse: VS Code for the web.</summary>
    Desktop,
}

/// <summary>What the PR shows for each <see cref="Screen"/>, and its Gherkin tag.</summary>
public static class ScreenShowing
{
    /// <summary>"📱 Phone", "🖥️ Desktop": the run's label in the test's name and the PR's subtitle.</summary>
    public static string ToLabel(this Screen screen) =>
        screen switch
        {
            Screen.Desktop => "🖥️ Desktop",
            _ => "📱 Phone",
        };

    /// <summary>"@phone", "@desktop": the Gherkin tag that asks for the screen.</summary>
    public static string ToTag(this Screen screen) => "@" + screen.ToString().ToLowerInvariant();
}

/// <summary>Plays the scenario on the phone (<see cref="Screen.Phone"/>). At most once per scenario.</summary>
[AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
public sealed class PlayOnPhoneAttribute() : PlayOnAttribute(Screen.Phone);

/// <summary>Plays the scenario on a desktop window (<see cref="Screen.Desktop"/>). At most once per scenario.</summary>
[AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
public sealed class PlayOnDesktopAttribute() : PlayOnAttribute(Screen.Desktop);

/// <summary>
/// One play of a scenario on <see cref="Screen"/>: a theory row whose one argument is the screen, labelled "📱 Phone"
/// or "🖥️ Desktop".
/// </summary>
public abstract class PlayOnAttribute(Screen screen) : DataAttribute
{
    /// <summary>The screen this attribute plays the scenario on.</summary>
    public Screen Screen { get; } = screen;

    public override ValueTask<IReadOnlyCollection<ITheoryDataRow>> GetData(MethodInfo testMethod, DisposalTracker disposalTracker) =>
        new([new TheoryDataRow<Screen>(Screen) { Label = Screen.ToLabel() }]);

    public override bool SupportsDiscoveryEnumeration() => true;
}
