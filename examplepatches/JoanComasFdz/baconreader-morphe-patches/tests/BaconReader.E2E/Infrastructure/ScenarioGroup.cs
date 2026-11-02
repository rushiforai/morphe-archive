// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// The two groups of scenarios, by the first folder under Scenarios/ (E2E-TEST-CODE-RULES.md, rule g):
/// - <see cref="Startup"/>: patches that change how the app starts, before the main screen (the login, the first-start
///   dialogs); each scenario is patched with only the patches its Given names;
/// - <see cref="LoggedIn"/>: everything else; every scenario is patched with every patch, one APK for all of them.
/// </summary>
public enum ScenarioGroup
{
    Startup,
    LoggedIn,
}

/// <summary>Which group a scenario class is in.</summary>
public static class ScenarioGroups
{
    /// <summary>The group whose folder a scenario class's namespace is under, or null outside both.</summary>
    public static ScenarioGroup? Of(Type testClass) =>
        ScenarioNaming.ToDomainFolder(testClass).Split('/')[0] switch
        {
            nameof(ScenarioGroup.Startup) => ScenarioGroup.Startup,
            nameof(ScenarioGroup.LoggedIn) => ScenarioGroup.LoggedIn,
            _ => null,
        };
}
