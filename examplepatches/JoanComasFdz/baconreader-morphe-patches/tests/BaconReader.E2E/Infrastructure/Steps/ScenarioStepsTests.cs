// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Reflection;

namespace BaconReader.E2E.Infrastructure.Steps;

/// <summary>
/// Every scenario plays its Gherkin line for line (E2E-TEST-CODE-RULES.md, rule h), so its recording marks each line
/// when it plays (<see cref="ScenarioSteps"/>): a statement a Given line, an Act a When line, an assertion a Then line.
/// Runs without the phone.
/// </summary>
public sealed class ScenarioStepsTests
{
    public static TheoryData<string> Scenarios() =>
        [.. ScenarioShapeTests.FindScenarios().Select(method => $"{method.DeclaringType!.Name}.{method.Name}")];

    [Theory]
    [MemberData(nameof(Scenarios))]
    public void Scenario_PlaysItsGherkinLineForLine(string scenario)
    {
        var method = ScenarioShapeTests.FindScenarios().Single(found => $"{found.DeclaringType!.Name}.{found.Name}" == scenario);
        var gherkin = Gherkin.Read(method.GetCustomAttribute<TestDescriptionAttribute>()?.Gherkin ?? "");
        ScenarioSteps.Read(method, gherkin.Text).Match(
            read => { },
            failed => Assert.Fail(failed.Why));
    }

    [Fact]
    public void Read_ASmallScenario_GivesEachStatementItsLine()
    {
        const string gherkin = """
            Scenario: Small
              Given Reddit has a post "Hello" in r/e2e
              And BaconReader is patched with every patch
              And BaconReader is open
              When I tap the post "Hello"
              # Why.
              Then the post shows "Hello"
              And the post shows "1 comment"
            """;
        const string source = """
            public sealed class SmallTests : BaseE2E
            {
                public async Task Small(Screen screen)
                {
                    // Given
                    Reddit.HasAPost("Hello", "e2e");
                    await Phone.BaconReader.OpenAsync();

                    // When
                    await Phone.BaconReader.Main.Posts.ClickPostAsync("Hello");
                    await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Hello");

                    // Then
                    // Why.
                    var post = await Phone.BaconReader.Detail.ReadPostAsync();
                    Asserting.That(post)
                        .ShowsTheTitle("Hello")
                        .ShowsTheCount(1).Comments();
                }
            }
            """;

        var read = ScenarioSteps.Read(source, "Small", Gherkin.Read(gherkin).Text);

        var steps = Assert.IsType<StepsReading.Read>(read).Steps;
        Assert.Equal([2], steps.PlayedByBaseE2E);
        Assert.Equal(
            [(6, 1, 1, 0), (7, 3, 3, 0), (10, 4, 4, 0), (11, null, 4, 0), (15, null, 6, 0), (16, null, 6, 2)],
            steps.Steps.Select(step => (step.SourceLine, step.Plays, step.FailsAs, step.Assertions.Length)));
        Assert.Equal(
            [(6, "ShowsTheTitle"), (7, "ShowsTheCount.Comments")],
            steps.Steps[5].Assertions.Select(assertion => (assertion.Line, string.Join('.', assertion.Names))));
    }

    [Fact]
    public void Read_AThenLineWithoutItsAssertion_SaysWhichBlock()
    {
        const string gherkin = """
            Scenario: Small
              Given BaconReader is open
              When I tap the post "Hello"
              Then the post shows "Hello"
              And the post shows "1 comment"
            """;
        const string source = """
                public async Task Small(Screen screen)
                {
                    // Given
                    await Phone.BaconReader.OpenAsync();

                    // When
                    await Phone.BaconReader.Main.Posts.ClickPostAsync("Hello");

                    // Then
                    var post = await Phone.BaconReader.Detail.ReadPostAsync();
                    Asserting.That(post).ShowsTheTitle("Hello").ShowsTheCount(1);
                }
            """;

        var read = ScenarioSteps.Read(source, "Small", Gherkin.Read(gherkin).Text);

        Assert.Equal(
            "Small: its // Then block at line 9 has 1 assertion for 2 Then lines (E2E-TEST-CODE-RULES.md, rule h).",
            Assert.IsType<StepsReading.Failed>(read).Why);
    }
}
