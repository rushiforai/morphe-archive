// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;
using static BaconReader.E2ETools.Tests.Support.Posts;

namespace BaconReader.E2ETools.Tests;

/// <summary>The post: its sections, each scenario a closed &lt;details&gt;, its Gherkin, its patches, its screen and its links.</summary>
public sealed class PostWritingTests
{
    [Fact]
    public void Both_kinds_show_the_PRs_own_first_then_the_rerecorded_with_their_fixtures()
    {
        var post = PostWriting.WritePost(Repo, 2, [
            RunOf("FeedTests", "Scrolls", Fixtures("Scenarios/Feed/a.json", "Scenarios/Feed/b.json")),
            RunOf("LoginTests", "Logs"),
        ], "Text.");

        var own = post.IndexOf("### Added or changed by this PR", StringComparison.Ordinal);
        var rerecorded = post.IndexOf("### Re-recorded: their fixtures changed", StringComparison.Ordinal);
        var fixtures = "_`Scenarios/Feed/a.json`, `Scenarios/Feed/b.json` changed._";
        Assert.True(own < post.IndexOf("<b>✅ Logs title</b>", StringComparison.Ordinal));
        Assert.True(post.IndexOf("<b>✅ Logs title</b>", StringComparison.Ordinal) < rerecorded);
        Assert.True(rerecorded < post.IndexOf("<b>✅ Scrolls title</b>", StringComparison.Ordinal));
        Assert.True(post.IndexOf("<b>✅ Scrolls title</b>", StringComparison.Ordinal) < post.IndexOf(fixtures, StringComparison.Ordinal));
        Assert.Equal(2, CountOf(post, "\n#### 📱 Phone\n"));
    }

    [Fact]
    public void Each_scenario_is_a_closed_details_holding_its_Gherkin_and_screen_and_the_sections_stay_outside()
    {
        var post = WritePost(RunOf("FeedTests", "Scrolls", Fixtures("f.json")), RunOf("LoginTests", "Logs"));

        var logs = post[post.IndexOf("<b>✅ Logs title</b>", StringComparison.Ordinal)..post.IndexOf("### Re-recorded", StringComparison.Ordinal)];
        Assert.Equal(2, CountOf(post, "<details><summary>"));
        Assert.Equal(2, CountOf(post, "\n</details>\n"));
        Assert.DoesNotContain("<details open", post);
        Assert.Contains("\n<details><summary><b>✅ Logs title</b></summary>\n\n```gherkin\nScenario: Logs\n```", post);
        Assert.EndsWith("</details>", logs.TrimEnd());
        Assert.Contains("#### 📱 Phone", logs);
        Assert.True(post.IndexOf("### Added or changed by this PR", StringComparison.Ordinal) < post.IndexOf("<details>", StringComparison.Ordinal));
        Assert.Equal(2, PostVersioning.CountScenarios(post));
    }

    [Fact]
    public void The_patches_show_under_the_Gherkin_and_above_the_screen()
    {
        var run = RunOf("SpoofClientTests", "Opens");

        var post = WritePost(run with { Entry = run.Entry with { Patches = ["Spoof client", "Hide ads"] } });

        var line = "\n\nPatched with: Spoof client, Hide ads\n\n";
        Assert.Contains(line, post);
        Assert.True(post.IndexOf("```gherkin", StringComparison.Ordinal) < post.IndexOf(line, StringComparison.Ordinal));
        Assert.True(post.IndexOf(line, StringComparison.Ordinal) < post.IndexOf("#### 📱 Phone", StringComparison.Ordinal));
    }

    [Fact]
    public void A_VS_Code_extension_scenario_shows_under_a_Desktop_subtitle()
    {
        var run = RunOf("CodeLensTests", "Plays");

        var post = WritePost(run with { Entry = run.Entry with { Screen = Optional.Some("desktop") } });

        Assert.Contains("\n#### 🖥️ Desktop\n", post);
        Assert.DoesNotContain("📱 Phone", post);
    }

    [Fact]
    public void No_patches_show_no_line() => Assert.DoesNotContain("Patched with", WritePost(RunOf("LoginTests", "Logs")));

    [Fact]
    public void A_title_is_escaped_in_its_summary()
    {
        var run = RunOf("LoginTests", "Logs");

        var post = WritePost(run with { Entry = run.Entry with { Title = "Keeps <b> & <i> as text" } });

        Assert.Contains("<summary><b>✅ Keeps &lt;b&gt; &amp; &lt;i&gt; as text</b></summary>", post);
    }

    [Fact]
    public void Only_rerecorded_scenarios_leave_out_the_PRs_own_heading()
    {
        var post = WritePost(RunOf("FeedTests", "Scrolls", Fixtures("Fixtures/feed.json")));

        Assert.DoesNotContain("Added or changed by this PR", post);
        Assert.Contains("### Re-recorded: their fixtures changed", post);
        Assert.Contains("_`Fixtures/feed.json` changed._", post);
    }

    [Fact]
    public void Only_the_PRs_own_scenarios_have_no_section_headings()
    {
        var post = WritePost(RunOf("LoginTests", "Logs"));

        Assert.DoesNotContain("###", post.Replace("####", "", StringComparison.Ordinal));
        Assert.Contains("\n<details><summary><b>✅ Logs title</b></summary>\n", post);
    }

    [Fact]
    public void A_failing_scenario_is_marked_on_its_summary_and_its_screen()
    {
        var post = WritePost(RunOf("LoginTests", "Logs", passed: false), RunOf("FeedTests", "Scrolls"));

        Assert.Contains("<details><summary><b>❌ Logs title</b></summary>", post);
        Assert.Contains("<details><summary><b>✅ Scrolls title</b></summary>", post);
        Assert.Equal(1, CountOf(post, "#### ❌ 📱 Phone"));
    }

    [Fact]
    public void The_heading_counts_the_scenarios_and_marks_them_all_passed()
    {
        var post = WritePost(RunOf("LoginTests", "Logs"), RunOf("FeedTests", "Scrolls", Fixtures("f.json")));

        Assert.StartsWith("## ✅ Scenarios (V1) · 2 scenarios\n\n**What changed**", post);
    }

    [Fact]
    public void The_heading_counts_the_failed_scenarios_and_one_reads_singular()
    {
        Assert.StartsWith("## ❌ Scenarios (V1) · 2 scenarios · 1 failed\n", WritePost(RunOf("LoginTests", "Logs", passed: false), RunOf("FeedTests", "Scrolls")));
        Assert.StartsWith("## ✅ Scenarios (V1) · 1 scenario\n", WritePost(RunOf("LoginTests", "Logs")));
    }

    [Fact]
    public void A_runs_GIF_and_player_link_point_at_prs_resources_and_the_sites_player()
    {
        var post = WritePost(WithMp4(RunOf("LoginTests", "Logs")));

        Assert.Contains("(https://github.com/Owner/repo/releases/download/prs-resources/pr-1-v1-Logs-phone.gif)", post);
        Assert.Contains("](https://owner.github.io/repo/e2e-player.html?v=pr-1-v1-Logs-phone.mp4)", post);
        Assert.Contains("\n[▶ Play MP4](https://owner.github.io/repo/e2e-player.html?v=pr-1-v1-Logs-phone.mp4)\n", post);
    }

    [Fact]
    public void The_player_is_on_the_owners_pages_lowercased() =>
        Assert.Equal(
            "https://joancomasfdz.github.io/baconreader-reseam-patches/e2e-player.html?v=pr-3-v1-a-phone.mp4",
            PostWriting.LinkPlayer("JoanComasFdz/baconreader-reseam-patches", "pr-3-v1-a-phone.mp4"));

    [Fact]
    public void A_run_without_its_MP4_shows_its_GIF_unlinked()
    {
        var post = WritePost(RunOf("LoginTests", "Logs"));

        Assert.Contains("\n![Logs title · 📱 Phone](https://github.com/Owner/repo/releases/download/prs-resources/pr-1-v1-Logs-phone.gif)\n", post);
        Assert.DoesNotContain("Play MP4", post);
    }

    [Fact]
    public void A_run_without_its_GIF_says_so_under_its_screen()
    {
        var run = RunOf("LoginTests", "Logs");

        var post = WritePost(run with { Files = run.Files with { HasGif = false } });

        Assert.Contains("\n#### 📱 Phone\n\n_No recording._\n", post);
        Assert.DoesNotContain("![", post);
    }

    [Fact]
    public void The_post_starts_with_its_version_and_what_changed_and_ends_with_the_footer()
    {
        var post = PostWriting.WritePost(Repo, 3, [RunOf("LoginTests", "Logs")], "Ported the poster.");

        Assert.StartsWith("## ✅ Scenarios (V3) · 1 scenario\n\n**What changed**\n\nPorted the poster.\n\n", post);
        Assert.EndsWith($"\n---\n{PostVersioning.Footer}\n", post);
    }
}
