// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>record.sh's scenarios.json and GitHub's answers, read into the tool's records.</summary>
public sealed class JsonReadingTests
{
    [Fact]
    public void A_scenarios_entry_keeps_its_fields_patches_and_fixtures()
    {
        var json = """
            [{"domain": "Account", "class": "SpoofClientTests", "method": "Opens", "title": "Opens",
              "gherkin": "Scenario: opens", "patches": ["Spoof client"], "screen": "phone", "gif": "Account/opens-phone.gif",
              "mp4": "Account/opens-phone.mp4", "startupSeconds": 1.5, "passed": false,
              "selected": "fixtures", "fixtures": ["a.json"]}]
            """;

        var entry = Assert.Single(Unwrap(JsonReading.ReadScenarios(json)));

        Assert.Equal("SpoofClientTests", entry.Class);
        Assert.Equal(Optional.Some("phone"), entry.Screen);
        Assert.Equal(["Spoof client"], entry.Patches);
        Assert.False(entry.Passed);
        Assert.Equal(["a.json"], Assert.IsType<RunSelection.Fixtures>(entry.Selection).Paths);
    }

    [Fact]
    public void A_scenarios_entry_without_selected_or_patches_reads_as_changed_with_none()
    {
        var json = """[{"class": "LoginTests", "method": "Logs", "title": "T", "gherkin": null, "screen": "phone", "gif": "Account/l.gif", "mp4": null, "passed": true}]""";

        var entry = Assert.Single(Unwrap(JsonReading.ReadScenarios(json)));

        Assert.IsType<RunSelection.Changed>(entry.Selection);
        Assert.Equal(Optional.None<string>(), entry.Gherkin);
        Assert.Equal(Optional.None<string>(), entry.Mp4);
        Assert.Empty(entry.Patches);
    }

    [Fact]
    public void An_entry_missing_what_it_needs_is_an_error_saying_so() =>
        Assert.Equal(
            "scenarios.json: an entry lacks its class, method, title, gif or passed",
            Assert.IsType<Result<ImmutableArray<ScenarioEntry>, string>.Error>(JsonReading.ReadScenarios("""[{"class": "LoginTests"}]""")).Failure);

    [Fact]
    public void Text_that_isnt_JSON_is_an_error_saying_what_was_read() =>
        Assert.StartsWith("the PR's comments isn't JSON", Assert.IsType<Result<ImmutableArray<PrComment>, string>.Error>(JsonReading.ReadComments("<html>")).Failure);

    [Fact]
    public void Every_page_of_comments_is_read_and_a_null_body_is_empty()
    {
        var json = """[[{"id": 1, "node_id": "IC_1", "user": {"login": "github-actions[bot]"}, "body": "a"}], [{"id": 2, "node_id": "IC_2", "user": {"login": "x"}, "body": null}]]""";

        Assert.Equal([new PrComment(1, "IC_1", "github-actions[bot]", "a"), new PrComment(2, "IC_2", "x", "")], Unwrap(JsonReading.ReadComments(json)));
    }

    [Fact]
    public void Releases_and_assets_are_read_from_every_page()
    {
        Assert.Equal([new Release(5, "prs-resources")], Unwrap(JsonReading.ReadReleases("""[[{"id": 5, "tag_name": "prs-resources"}]]""")));
        Assert.Equal([new ReleaseAsset(1, "a.gif"), new ReleaseAsset(2, "b.mp4")], Unwrap(JsonReading.ReadAssets("""[[{"id": 1, "name": "a.gif"}], [{"id": 2, "name": "b.mp4"}]]""")));
    }

    [Fact]
    public void The_hidden_posts_are_those_GraphQL_answers_minimized_in_the_order_asked() =>
        Assert.Equal(["IC_2"], Unwrap(JsonReading.ReadHidden(["IC_1", "IC_2", "IC_3"], """{"data": {"nodes": [{"isMinimized": false}, {"isMinimized": true}, null]}}""")));

    [Fact]
    public void A_GraphQL_answer_without_nodes_is_an_error_holding_the_answer() =>
        Assert.Equal("""{"errors": []}""", Assert.IsType<Result<ImmutableHashSet<string>, string>.Error>(JsonReading.ReadHidden(["IC_1"], """{"errors": []}""")).Failure);

    [Fact]
    public void A_body_is_sent_as_JSON_whatever_it_holds()
    {
        var body = "a \"quoted\" & <b>\n📱";

        Assert.Equal(body, System.Text.Json.Nodes.JsonNode.Parse(JsonReading.WriteBody(body))!["body"]!.GetValue<string>());
    }

    private static T Unwrap<T>(Result<T, string> result) => Assert.IsType<Result<T, string>.Ok>(result).Value;
}
