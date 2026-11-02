// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.Startup.Account;

/// <summary>A fixture of the VS Code extension's e2e scenarios: an app scenario, as the extension reads it.</summary>
public sealed class SpoofClientTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWith(Patch.SpoofClient)]
    [TestDescription("""
        @phone
        Scenario: BaconReader patched with Spoof client logs in to Reddit as RedReader
          Given BaconReader is patched with "Spoof client"
          And BaconReader is installed
          When I open BaconReader
          Then the feed shows no posts
        """)]
    public async Task BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader(Screen screen)
    {
        // When
        await Phone.Launcher.OpenBaconReaderAsync();
    }

    private static string DescribeLogIn() => "not a scenario: no [TestDescription]";
}
