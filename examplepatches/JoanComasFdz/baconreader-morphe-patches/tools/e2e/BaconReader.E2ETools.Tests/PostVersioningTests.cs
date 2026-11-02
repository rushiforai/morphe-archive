// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;
using static BaconReader.E2ETools.Tests.Support.Posts;

namespace BaconReader.E2ETools.Tests;

/// <summary>How a new post collapses and hides the earlier ones, and how closing the PR shrinks them.</summary>
public sealed class PostVersioningTests
{
    [Fact]
    public void A_new_version_collapses_the_previous_post_as_it_was()
    {
        var v1 = CommentOf(1, PostOf(1, ["A", "B"]));

        var edit = Assert.Single(PostVersioning.PlanCollapses([v1], 2));

        Assert.Same(v1, edit.Comment);
        Assert.StartsWith("<details><summary><b>Scenarios (V1)</b> · 2 scenarios · replaced by V2</summary>\n\n", edit.Body);
        Assert.Contains(v1.Body.TrimEnd(), edit.Body);
        Assert.EndsWith("</details>\n", edit.Body);
    }

    [Fact]
    public void A_post_already_collapsed_is_left_as_it_is()
    {
        var v1 = CollapsedOf(1, 1, "A");
        var v2 = CommentOf(2, PostOf(2, ["A", "B", "C"]));

        var edit = Assert.Single(PostVersioning.PlanCollapses([v1, v2], 3));

        Assert.Same(v2, edit.Comment);
        Assert.Contains("<b>Scenarios (V2)</b> · 3 scenarios · replaced by V3", edit.Body);
    }

    [Fact]
    public void A_written_post_reads_its_version_and_collapses_with_its_count()
    {
        var v1 = CommentOf(1, PostWriting.WritePost(Repo, 1, [RunOf("LoginTests", "Logs", passed: false), RunOf("FeedTests", "Scrolls")], "Text."));

        var edit = Assert.Single(PostVersioning.PlanCollapses([v1], 2));

        Assert.Equal(1, PostVersioning.FindLastVersion([v1]));
        Assert.Equal(2, PostVersioning.CountScenarios(v1.Body));
        Assert.StartsWith("<details><summary><b>Scenarios (V1)</b> · 2 scenarios · replaced by V2</summary>\n", edit.Body);
        Assert.Equal(1, PostVersioning.FindLastVersion([CommentOf(1, edit.Body)]));
    }

    [Fact]
    public void Scenarios_under_sections_count_once_each_and_one_reads_singular()
    {
        Assert.Equal(2, PostVersioning.CountScenarios(PostOf(1, ["A", "B"], sections: true)));
        Assert.Contains("· 1 scenario ·", CollapsedOf(1, 1, "A").Body);
    }

    [Fact]
    public void A_collapsed_post_counts_its_scenarios_not_its_own_details()
    {
        var body = CollapsedOf(1, 1, "A", "B").Body;

        Assert.Equal(2, PostVersioning.CountScenarios(body));
        Assert.Equal(3, CountOf(body, "<details>"));
        Assert.Equal(3, CountOf(body, "</details>"));
    }

    [Fact]
    public void Another_comment_of_the_workflow_is_never_edited()
    {
        var other = CommentOf(9, $"Something else\n\n---\n{PostVersioning.Footer}\n");

        Assert.Empty(PostVersioning.PlanCollapses([other], 1));
        Assert.Empty(PostVersioning.PlanShrinks([other]));
    }

    [Fact]
    public void A_new_version_hides_every_earlier_post_open_or_collapsed()
    {
        var v1 = CollapsedOf(1, 1, "A");
        var v2 = CommentOf(2, PostOf(2, ["A"]));

        Assert.Equal([1L, 2L], PostVersioning.PlanHides([v1, v2], 3, new HashSet<string>()).Select(comment => comment.Id));
    }

    [Fact]
    public void A_post_already_hidden_is_left_as_it_is()
    {
        var v1 = CommentOf(1, PostOf(1, ["A"]));
        var v2 = CommentOf(2, PostOf(2, ["A"]));

        Assert.Equal([2L], PostVersioning.PlanHides([v1, v2], 3, new HashSet<string> { "IC_1" }).Select(comment => comment.Id));
    }

    [Fact]
    public void The_newest_a_shrunk_post_and_another_comment_of_the_workflow_are_never_hidden()
    {
        var other = CommentOf(9, $"Something else\n\n---\n{PostVersioning.Footer}\n");
        var newest = CommentOf(3, PostOf(3, ["A"]));

        Assert.Empty(PostVersioning.PlanHides([ShrunkOf(1, 1), other, newest], 3, new HashSet<string>()));
    }

    [Fact]
    public void Closing_shrinks_every_post_but_the_newest_to_its_line()
    {
        var v1 = CollapsedOf(1, 1, "A", "B");
        var v2 = CommentOf(2, PostOf(2, ["A"]));
        var v3 = CommentOf(3, PostOf(3, ["A"]));

        var edits = PostVersioning.PlanShrinks([v1, v2, v3]);

        Assert.Equal([1L, 2L], edits.Select(edit => edit.Comment.Id));
        Assert.Equal("**Scenarios (V1)** · 2 scenarios · replaced by V2 · recordings deleted when the PR closed", PostVersioning.ReadFirstLine(edits[0].Body));
        Assert.Contains("replaced by V3", edits[1].Body);
        Assert.Contains(PostVersioning.Footer, edits[0].Body);
        Assert.DoesNotContain("<details>", edits[0].Body);
    }

    [Fact]
    public void A_shrunk_post_is_left_as_it_is_and_still_counts_its_version()
    {
        var shrunk = ShrunkOf(1, 1);
        var v2 = CommentOf(2, PostOf(2, ["A"]));

        Assert.Empty(PostVersioning.PlanShrinks([shrunk, v2]));
        Assert.Equal(1, PostVersioning.FindLastVersion([shrunk]));
        Assert.Empty(PostVersioning.PlanCollapses([shrunk], 3));
    }

    [Fact]
    public void Versions_count_collapsed_and_shrunk_posts_after_a_reopen() =>
        Assert.Equal(2, PostVersioning.FindLastVersion([ShrunkOf(1, 1), CollapsedOf(2, 2, "A")]));

    [Fact]
    public void Only_the_bots_comments_ending_with_the_footer_are_the_workflows()
    {
        var post = PostOf(1, ["A"]);

        var picked = PostVersioning.PickWorkflowComments([CommentOf(1, post), new(2, "IC_2", "someone", post), CommentOf(3, "No footer")]);

        Assert.Equal([1L], picked.Select(comment => comment.Id));
    }
}
