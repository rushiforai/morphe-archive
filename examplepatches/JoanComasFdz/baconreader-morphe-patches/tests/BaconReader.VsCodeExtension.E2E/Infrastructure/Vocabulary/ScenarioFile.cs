// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using Dunet;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A scenario file of the workspace VS Code for the web opens (Workspace/Scenarios/): one scenario each. A case is added
/// when a test needs it.
/// </summary>
[Union]
public partial record ScenarioFile
{
    /// <summary>Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs: an app scenario played on the phone, and a helper method.</summary>
    public partial record SpoofClient;

    /// <summary>
    /// Scenarios/Startup/Account/SpoofClient/SpoofClientDraft.cs: no scenario file (its name doesn't end in "Tests"), though it
    /// holds SpoofClient's method and [TestDescription].
    /// </summary>
    public partial record SpoofClientDraft;

    /// <summary>Scenarios/LoggedIn/Comments/EmbedCommentImages/EmbedCommentImagesTests.cs: an app scenario played on the phone.</summary>
    public partial record EmbedCommentImages;

    /// <summary>Scenarios/Recordings/LongNameTests.cs: a desktop scenario whose asset names pass 200 characters.</summary>
    public partial record LongName;
}

/// <summary>Each <see cref="ScenarioFile"/>'s path, its scenario's method, domain folder and screens: the only place they live.</summary>
public static class ScenarioFileShowing
{
    /// <summary>"Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs": its path in the workspace, as the explorer nests it.</summary>
    public static string ToPath(this ScenarioFile file) =>
        file.Match(
            spoofClient => "Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs",
            spoofClientDraft => "Scenarios/Startup/Account/SpoofClient/SpoofClientDraft.cs",
            embedCommentImages => "Scenarios/LoggedIn/Comments/EmbedCommentImages/EmbedCommentImagesTests.cs",
            longName => "Scenarios/Recordings/LongNameTests.cs");

    /// <summary>"SpoofClientTests.cs": its name, as its editor tab shows it.</summary>
    public static string ToFileName(this ScenarioFile file) => file.ToPath().Split('/')[^1];

    /// <summary>Its scenario's method name.</summary>
    public static string ToMethod(this ScenarioFile file) =>
        file.Match(
            spoofClient => "BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader",
            spoofClientDraft => "BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader",
            embedCommentImages => "EmbedCommentImagesShowsAGifInACommentAsAnImage",
            longName => "AScenarioWhoseTitleGoesOnAndOnPastTwoHundredCharactersStillFindsItsRecordingBecauseTheWorkflowShortensItsAssetNamesWithAHashAndTheExtensionShortensThemTheSameWay");

    /// <summary>Its scenario's domain folder: its namespace after ".Scenarios.".</summary>
    public static string ToDomain(this ScenarioFile file) =>
        file.Match(
            spoofClient => "Account",
            spoofClientDraft => "Account",
            embedCommentImages => "Comments",
            longName => "Recordings");

    /// <summary>The screens its scenario is played on.</summary>
    public static ImmutableArray<Screen> ToScreens(this ScenarioFile file) =>
        file.Match(
            spoofClient => ImmutableArray.Create(Screen.Phone),
            spoofClientDraft => ImmutableArray.Create(Screen.Phone),
            embedCommentImages => ImmutableArray.Create(Screen.Phone),
            longName => ImmutableArray.Create(Screen.Desktop));
}
