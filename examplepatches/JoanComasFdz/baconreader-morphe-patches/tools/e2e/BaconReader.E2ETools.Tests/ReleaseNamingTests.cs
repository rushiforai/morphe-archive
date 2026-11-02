// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>The names a run's recordings take in prs-resources, and how the cleanup reads them back.</summary>
public sealed class ReleaseNamingTests
{
    [Fact]
    public void A_runs_GIF_and_MP4_share_their_stem()
    {
        Assert.Equal("pr-7-v2-opens-phone.gif", ReleaseNaming.NameAsset(7, 2, "Account/opens-phone.gif", ".gif"));
        Assert.Equal("pr-7-v2-opens-phone.mp4", ReleaseNaming.NameAsset(7, 2, "Account/opens-phone.gif", ".mp4"));
    }

    [Fact]
    public void A_name_past_200_characters_keeps_its_start_and_ends_with_a_hash_of_the_GIFs_path()
    {
        var gif = "Comments/" + string.Concat(Enumerable.Repeat("a-scenario-whose-title-goes-on-", 8)) + "phone.gif";

        var name = ReleaseNaming.NameAsset(7, 2, gif, ".gif");
        var other = ReleaseNaming.NameAsset(140, 12, gif, ".mp4");

        Assert.Equal(ReleaseNaming.MaxName, name.Length);
        Assert.StartsWith("pr-7-v2-a-scenario-whose-title-goes-on-", name);
        Assert.Matches("-[0-9a-f]{8}\\.gif$", name);
        Assert.Equal(name[^12..^4], other[^12..^4]);
    }

    [Fact]
    public void A_long_name_is_the_one_the_VS_Code_extension_looks_for()
    {
        // tools/vscode-extension/test/extension.test.js expects this name for the same GIF.
        var gif = "Comments/" + string.Concat(Enumerable.Repeat("a-scenario-whose-name-goes-on-and-on-", 5)) + "past-two-hundred-characters-phone.gif";

        Assert.Equal(
            "pr-112-v3-" + string.Concat(Enumerable.Repeat("a-scenario-whose-name-goes-on-and-on-", 4)) + "a-scenario-whose-name-goes-on-ceafb6b5.gif",
            ReleaseNaming.NameAsset(112, 3, gif, ".gif"));
    }

    [Theory]
    [InlineData("pr-7-v2-opens-phone.gif", 7, 2)]
    [InlineData("pr-70-v10-x.mp4", 70, 10)]
    public void A_name_reads_back_as_its_PR_and_version(string name, int pr, int version) =>
        Assert.Equal(Optional.Some(new AssetName(pr, version)), ReleaseNaming.ReadAsset(name));

    [Theory]
    [InlineData("owners-own.png")]
    [InlineData("pr-7-opens.gif")]
    [InlineData("pr-x-v1-a.gif")]
    public void Any_other_name_reads_as_none(string name) =>
        Assert.Equal(Optional.None<AssetName>(), ReleaseNaming.ReadAsset(name));
}
