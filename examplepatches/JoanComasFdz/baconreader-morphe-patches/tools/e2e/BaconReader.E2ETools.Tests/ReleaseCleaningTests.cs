// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;
using static BaconReader.E2ETools.Tests.Support.Posts;

namespace BaconReader.E2ETools.Tests;

/// <summary>What prs-resources keeps when the PR closes.</summary>
public sealed class ReleaseCleaningTests
{
    [Fact]
    public void Prs_resources_keeps_the_PRs_newest_version_only_and_never_touches_other_names()
    {
        var held = AssetsOf("pr-7-v1-a-phone.gif", "pr-7-v2-a-phone.mp4", "pr-7-v10-b-phone.gif", "pr-70-v1-a-phone.gif", "owners-own.png");

        Assert.Equal(["pr-7-v1-a-phone.gif", "pr-7-v2-a-phone.mp4"], ReadNames(ReleaseCleaning.PlanPrDeletions(held, 7)));
    }

    [Fact]
    public void A_PR_with_no_assets_deletes_nothing() =>
        Assert.Empty(ReleaseCleaning.PlanPrDeletions(AssetsOf("pr-3-v1-a-phone.gif"), 7));

    [Fact]
    public void Only_prs_resources_is_cleaned()
    {
        Assert.Equal(Optional.Some(new Release(3, ReleaseNaming.PrsRelease)), ReleaseCleaning.FindPrsRelease([new(1, "v1.0"), new(3, ReleaseNaming.PrsRelease)]));
        Assert.Equal(Optional.None<Release>(), ReleaseCleaning.FindPrsRelease([new(1, "rules-mods-arms-resources")]));
    }

    [Fact]
    public void A_cleaned_release_says_what_it_kept_and_warns_near_its_limit()
    {
        var held = AssetsOf([.. Enumerable.Range(0, 902).Select(at => $"pr-3-v1-x{at}.gif"), "pr-7-v1-a.gif", "pr-7-v2-a.gif"]);

        var lines = ReleaseCleaning.DescribeCleaned("prs-resources", held, [held[^2]], 7);

        Assert.Equal(
            ["prs-resources: kept 1 asset(s) of PR #7; it holds 903 of at most 1,000 assets.",
             "::warning::prs-resources holds 903 of at most 1,000 assets (docs/hosting.md, \"The release's limit\")."],
            lines);
    }
}
