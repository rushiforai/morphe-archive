// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.VsCodeExtension.E2E.Infrastructure;

/// <summary>The fake release names its assets as the workflow does (runs without a browser).</summary>
public sealed class AssetNamingTests
{
    [Fact]
    public void AShortName_IsThePrTheVersionAndTheGifName() =>
        Assert.Equal(
            "pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4",
            AssetNaming.NameAsset(41, 1, "Account", "bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone", ".mp4"));

    [Fact]
    public void ANamePastTwoHundredCharacters_KeepsItsStartAndAHashOfItsGifPath() =>
        // Written by tools/e2e's ReleaseNaming.NameAsset for the same GIF.
        Assert.Equal(
            "pr-112-v3-a-scenario-whose-title-goes-on-and-on-past-two-hundred-characters-still-finds-its-recording-because-the-workflow-shortens-its-asset-names-with-a-hash-and-the-extension-shortens-1732f032.mp4",
            AssetNaming.NameAsset(
                112,
                3,
                "Recordings",
                "a-scenario-whose-title-goes-on-and-on-past-two-hundred-characters-still-finds-its-recording-because-the-workflow-shortens-its-asset-names-with-a-hash-and-the-extension-shortens-them-the-same-way-desktop",
                ".mp4"));
}
