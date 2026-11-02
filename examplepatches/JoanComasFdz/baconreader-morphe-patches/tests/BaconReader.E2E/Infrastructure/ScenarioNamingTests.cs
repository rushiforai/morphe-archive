// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure;

/// <summary>The scenario names record.sh and the PR's GIFs rely on (runs without the phone).</summary>
public sealed class ScenarioNamingTests
{
    [Fact]
    public void MethodName_IsTheTitlesWordsEachCapitalized() =>
        Assert.Equal(
            "BaconReaderPatchedWithSpoofClientOpensOnTheFrontPage",
            ScenarioNaming.ToMethodName("BaconReader patched with Spoof client opens on the front page"));

    [Fact]
    public void MethodName_LeavesOutPunctuationAndEmoji() =>
        Assert.Equal(
            "SpoofClientLogsYouInAgain",
            ScenarioNaming.ToMethodName("Spoof client: logs you in, again · 🥓"));

    [Fact]
    public void GifName_IsTheMethodNameKebaberizedWithItsScreen() =>
        Assert.Equal(
            "bacon-reader-patched-with-spoof-client-opens-on-the-front-page-phone",
            ScenarioNaming.ToGifName("BaconReaderPatchedWithSpoofClientOpensOnTheFrontPage", Screen.Phone));

    [Theory]
    [InlineData("EmbedCommentImagesShowsAGifInACommentAsAnImage", "embed-comment-images-shows-a-gif-in-a-comment-as-an-image-phone")]
    [InlineData("BaconReaderPatchedWithSpoofClientOpensOnTheFrontPage", "bacon-reader-patched-with-spoof-client-opens-on-the-front-page-phone")]
    [InlineData("BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader", "bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone")]
    [InlineData("BaconReaderLoggedInShowsThePostsRedditHasInAll", "bacon-reader-logged-in-shows-the-posts-reddit-has-in-all-phone")]
    [InlineData("ReapersTitheGives3StacksForAKillOf3", "reapers-tithe-gives3-stacks-for-a-kill-of3-phone")]
    public void GifName_OfTheScenariosSoFar(string methodName, string gifName) =>
        Assert.Equal(gifName, ScenarioNaming.ToGifName(methodName, Screen.Phone));

    [Theory]
    [InlineData("Embed comment images shows a GIF in a comment as an image", "EmbedCommentImagesShowsAGifInACommentAsAnImage")]
    [InlineData("BaconReader patched with E2E fake Reddit opens", "BaconReaderPatchedWithE2eFakeRedditOpens")]
    [InlineData("Opens with E2E", "OpensWithE2e")]
    [InlineData("Loads a URL", "LoadsAUrl")]
    [InlineData("Gives 3 stacks for a kill of 3", "Gives3StacksForAKillOf3")]
    public void MethodName_KeepsOnlyTheFirstCapitalOfAWordInCapitals(string title, string methodName) =>
        Assert.Equal(methodName, ScenarioNaming.ToMethodName(title));

    [Theory]
    [InlineData("Embed comment images shows a GIF in a comment as an image", "embed-comment-images-shows-a-gif-in-a-comment-as-an-image-phone")]
    [InlineData("BaconReader patched with E2E fake Reddit opens", "bacon-reader-patched-with-e2e-fake-reddit-opens-phone")]
    [InlineData("Opens with E2E", "opens-with-e2e-phone")]
    [InlineData("Loads a URL", "loads-a-url-phone")]
    public void GifName_OfATitleWithAWordInCapitalsKeepsItsWords(string title, string gifName) =>
        Assert.Equal(gifName, ScenarioNaming.ToGifName(ScenarioNaming.ToMethodName(title), Screen.Phone));

    [Fact]
    public void DomainFolder_IsTheNamespaceUnderScenarios() =>
        Assert.Equal("Startup/Account", ScenarioNaming.ToDomainFolder(typeof(Scenarios.Startup.Account.SpoofClientTests)));

    [Fact]
    public void DomainFolder_KeepsE2EWhole() =>
        Assert.Equal("LoggedIn/E2E", ScenarioNaming.ToDomainFolder(typeof(Scenarios.LoggedIn.E2E.E2EFakeRedditTests)));

    [Fact]
    public void DomainFolder_OfANamespaceOutsideScenariosIsUnsorted() =>
        Assert.Equal("Unsorted", ScenarioNaming.ToDomainFolder("BaconReader.E2E.Infrastructure"));

    [Fact]
    public void Gherkin_ReadsItsTagsTitleAndDedentedText()
    {
        var gherkin = Gherkin.Read("""
            @phone
            Scenario: BaconReader opens
              Given BaconReader is patched with "Spoof client" and installed
            """);

        Assert.Equal(["@phone"], gherkin.Tags);
        Assert.Equal("BaconReader opens", gherkin.Title);
        Assert.Equal("@phone\nScenario: BaconReader opens\n  Given BaconReader is patched with \"Spoof client\" and installed", gherkin.Text);
    }
}
