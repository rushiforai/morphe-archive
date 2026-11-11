// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Reflection;
using BaconReader.E2E.Scenarios.LoggedIn.Media;

namespace BaconReader.E2E.Infrastructure.Steps;

/// <summary>
/// <see cref="FakeChecks"/> tells a Then line that checks what the fake saw from one that checks the screen (runs
/// without the phone).
/// </summary>
public sealed class FakeChecksTests
{
    [Fact]
    public void A_check_of_what_RedGIFs_answered_is_about_the_fake_and_one_of_the_video_playing_is_not()
    {
        var method = typeof(FixRedgifsApiTests).GetMethod(nameof(FixRedgifsApiTests.FixRedgifsApiPlaysRedGIFsVideosWithATemporaryTokenAndWithANewOneOnceThePhoneJoinsAnotherNetwork))!;
        var gherkin = Gherkin.Read(method.GetCustomAttribute<TestDescriptionAttribute>()!.Gherkin).Text;
        var lines = gherkin.Split('\n');
        var steps = Assert.IsType<StepsReading.Read>(ScenarioSteps.Read(method, gherkin)).Steps;

        var fake = steps.Steps.SelectMany(step => step.Assertions).ToLookup(FakeChecks.IsAboutTheFake, assertion => lines[assertion.Line].Trim());

        Assert.Equal(
            ["And RedGIFs answered the video of \"First clip\" to BaconReader's temporary token and User-Agent", "And BaconReader asked RedGIFs for a new temporary token"],
            fake[true]);
        Assert.Equal(["Then the video plays", "Then the video plays"], fake[false]);
    }

    [Fact]
    public void The_snapshots_the_fakes_checks_read_are_checked_and_a_link_read_for_a_check_of_the_screen_is_not()
    {
        Assert.True(FakeChecks.IsChecked(typeof(Reddit.RedGifsLookupsSnapshot)));
        Assert.False(FakeChecks.IsChecked(typeof(Reddit.LinkSnapshot)));
    }
}
