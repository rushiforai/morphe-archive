// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Reflection;
using System.Text.RegularExpressions;

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// Every scenario keeps the shape E2E-TEST-CODE-RULES.md (rule a) gives it, so it stays one to one with the Gherkin it
/// implements (runs without the phone): a theory played on the phone, its Gherkin in
/// <see cref="TestDescriptionAttribute"/>, its name the Gherkin's title, its screen tags its attributes, in the Startup or
/// the LoggedIn group (<see cref="ScenarioGroup"/>), and patched as its Given says: a Startup scenario with exactly the
/// patches its Given names, one a line (<see cref="Vocabulary.PatchedWithAttribute"/>; never one BaseE2E adds to every
/// scenario), a LoggedIn one with every patch (<see cref="Vocabulary.PatchedWithEveryPatchAttribute"/>). A screen
/// attribute twice doesn't compile.
/// </summary>
public sealed partial class ScenarioShapeTests
{
    public static TheoryData<string> Scenarios() =>
        [.. FindScenarios().Select(method => $"{method.DeclaringType!.Name}.{method.Name}")];

    [Theory]
    [MemberData(nameof(Scenarios))]
    public void Scenario_IsPlayedOnThePhone(string scenario)
    {
        var method = Find(scenario);
        Assert.True(method.GetCustomAttribute<TheoryAttribute>() is not null, $"{scenario} should be a [Theory], played by its [PlayOnPhone].");
        Assert.True(method.GetCustomAttributes<PlayOnAttribute>().Any(), $"{scenario} has no [PlayOnPhone]: it would never be played.");
        Assert.True(
            method.GetCustomAttributes<PlayOnAttribute>().All(play => play.Screen == Screen.Phone),
            $"{scenario} is played on another screen than the phone: BaconReader runs on the phone only ([PlayOnDesktop] is the VS Code extension's).");
        Assert.True(
            method.GetParameters() is [{ ParameterType: var type }] && type == typeof(Screen),
            $"{scenario} should take one parameter, the Screen its attribute plays it on.");
    }

    [Theory]
    [MemberData(nameof(Scenarios))]
    public void Scenario_IsNamedAfterItsGherkinsTitle(string scenario)
    {
        var method = Find(scenario);
        var gherkin = ReadGherkin(method, scenario);
        Assert.True(gherkin.Title.Length > 0, $"{scenario}'s [TestDescription] has no \"Scenario:\" line.");
        Assert.Equal(ScenarioNaming.ToMethodName(gherkin.Title), method.Name);
    }

    [Theory]
    [MemberData(nameof(Scenarios))]
    public void Scenario_IsPlayedOnTheScreensItsGherkinTags(string scenario)
    {
        var method = Find(scenario);
        var gherkin = ReadGherkin(method, scenario);
        var played = method.GetCustomAttributes<PlayOnAttribute>().Select(play => play.Screen.ToTag()).Order();
        Assert.Equal(gherkin.Tags.Order(), played);
    }

    [Theory]
    [MemberData(nameof(Scenarios))]
    public void Scenario_IsInTheStartupOrTheLoggedInGroup(string scenario)
    {
        var method = Find(scenario);
        Assert.True(
            ScenarioGroups.Of(method.DeclaringType!) is not null,
            $"{scenario} is in Scenarios/{ScenarioNaming.ToDomainFolder(method.DeclaringType!)}: a scenario goes under Scenarios/Startup/ "
            + "(how the app starts: patched with only the patches its Given names) or Scenarios/LoggedIn/ (patched with every patch).");
    }

    [Theory]
    [MemberData(nameof(Scenarios))]
    public void Scenario_IsPatchedWithThePatchesItsGivenNames(string scenario)
    {
        var method = Find(scenario);
        var given = ReadGiven(ReadGherkin(method, scenario));
        var named = given.Select(line => PatchLine().Match(line)).Where(match => match.Success).Select(match => match.Groups[1].Value).ToArray();
        var saysEveryPatch = given.Any(line => EveryPatchLine().IsMatch(line));
        switch (ScenarioGroups.Of(method.DeclaringType!), Vocabulary.PatchSet.Of(method))
        {
            case (_, null):
                Assert.Fail($"{scenario} needs one of [PatchedWith(…)] (Startup) or [PatchedWithEveryPatch] (LoggedIn): BaseE2E wouldn't know what to patch BaconReader with.");
                break;
            case (ScenarioGroup.LoggedIn, Vocabulary.PatchSet.Every):
                Assert.True(
                    saysEveryPatch && named.Length == 0,
                    $"{scenario} is patched with every patch, so its Given says so in one line, and names no patch: "
                    + "And BaconReader is patched with every patch.");
                break;
            case (ScenarioGroup.LoggedIn, Vocabulary.PatchSet.Only):
                Assert.Fail($"{scenario} is a LoggedIn scenario: it's patched with every patch, [PatchedWithEveryPatch]. A scenario patched with only some is a Startup one.");
                break;
            case (_, Vocabulary.PatchSet.Every):
                Assert.Fail($"{scenario} isn't a LoggedIn scenario, so it's patched with only the patches its Given names, [PatchedWith(…)], not every patch.");
                break;
            case (_, Vocabulary.PatchSet.Only only):
                var patched = only.Patches.Select(Vocabulary.PatchShowing.ToShownText).ToArray();
                Assert.True(
                    !saysEveryPatch && named.Order().SequenceEqual(patched.Order()),
                    $"{scenario} is patched with [{string.Join(", ", patched)}], but its Given names [{string.Join(", ", named)}], one patch a line: "
                    + "And BaconReader is patched with \"<patch>\".");
                foreach (var always in Device.PatchedApps.Always.Where(only.Patches.Contains))
                {
                    Assert.Fail($"{scenario} names \"{Vocabulary.PatchShowing.ToShownText(always)}\", which BaseE2E adds to every scenario: leave it out.");
                }

                break;
        }
    }

    // The Given block: its Given line and the And lines after it, up to the first When, each trimmed.
    private static string[] ReadGiven(Gherkin gherkin) =>
        [.. gherkin.Text.Split('\n')
            .Select(line => line.Trim())
            .SkipWhile(line => !line.StartsWith("Given ", StringComparison.Ordinal))
            .TakeWhile(line => !line.StartsWith("When ", StringComparison.Ordinal) && !line.StartsWith("Then ", StringComparison.Ordinal))
            .Where(line => line.StartsWith("Given ", StringComparison.Ordinal) || line.StartsWith("And ", StringComparison.Ordinal))];

    [GeneratedRegex("^(?:Given|And) BaconReader is patched with \"([^\"]+)\"$")]
    private static partial Regex PatchLine();

    [GeneratedRegex("^(?:Given|And) BaconReader is patched with every patch$")]
    private static partial Regex EveryPatchLine();

    private static Gherkin ReadGherkin(MethodInfo method, string scenario) =>
        method.GetCustomAttribute<TestDescriptionAttribute>() is { } description
            ? Gherkin.Read(description.Gherkin)
            : throw new Xunit.Sdk.XunitException($"{scenario} has no [TestDescription] with the Gherkin it implements.");

    private static MethodInfo Find(string scenario) =>
        FindScenarios().Single(method => $"{method.DeclaringType!.Name}.{method.Name}" == scenario);

    private static IEnumerable<MethodInfo> FindScenarios() =>
        typeof(BaseE2E).Assembly.GetTypes()
            // The explorer sets the app up as a scenario does, but is a tool (README, "Exploring the app before writing a Gherkin").
            .Where(type => type.IsSubclassOf(typeof(BaseE2E)) && !type.IsAbstract && type != typeof(Exploring.Explorer))
            .SelectMany(type => type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly))
            .Where(method => method.GetCustomAttributes<FactAttribute>(inherit: true).Any())
            .OrderBy(method => method.DeclaringType!.Name)
            .ThenBy(method => method.Name);
}
