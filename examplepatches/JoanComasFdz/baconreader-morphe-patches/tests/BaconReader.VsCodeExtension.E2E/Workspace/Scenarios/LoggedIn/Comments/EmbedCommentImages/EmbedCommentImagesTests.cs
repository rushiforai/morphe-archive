// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>A fixture of the VS Code extension's e2e scenarios: an app scenario with no recording yet.</summary>
public sealed class EmbedCommentImagesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Embed comment images shows a GIF in a comment as an image
          Given BaconReader is patched with every patch
          When I open the post's comments
          Then the comment shows the GIF as an image
        """)]
    public async Task EmbedCommentImagesShowsAGifInACommentAsAnImage(Screen screen)
    {
        // When
        await Phone.BaconReader.OpenAsync();
    }
}
