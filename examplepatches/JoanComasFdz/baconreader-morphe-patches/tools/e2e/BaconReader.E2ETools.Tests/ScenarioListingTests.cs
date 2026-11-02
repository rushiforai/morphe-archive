// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>A recording's runs → its scenarios.json (what post reads) and the summary record.sh prints.</summary>
public sealed class ScenarioListingTests
{
    private static readonly RunRecord Spoof = new(
        "Account", "SpoofClientTests", "OpensTheFrontPage", "Opens the front page",
        Optional.Some("@phone\nScenario: Opens the front page"), "phone", "opens-the-front-page-phone", ["Spoof client"], Optional.Some(2.345), true);

    private static readonly RunRecord Feed = new(
        "Comments/ShowTables", "TablesTests", "Shows", "Shows a table", Optional.None<string>(), "phone", "shows-phone", [], Optional.None<double>(), false);

    [Fact]
    public void The_selection_keeps_the_changed_classes_and_each_fixture_only_class_s_fixtures_sorted_once()
    {
        var selection = ScenarioListing.ReadSelection("A\tchanged\nB\tfixtures\tz.json\nB\tfixtures\ta.json\nB\tfixtures\ta.json\n\n");

        Assert.Equal(["A"], selection.Changed);
        Assert.Equal(["a.json", "z.json"], selection.Fixtures["B"]);
    }

    [Fact]
    public void Scenarios_json_holds_each_run_with_its_patches_and_its_selection()
    {
        var selection = ScenarioListing.ReadSelection("SpoofClientTests\tfixtures\tFixtures/front.json\n");

        var json = ScenarioListing.WriteScenarios([Spoof, Feed], selection);

        Assert.Equal(
            """
            [
              {
                "domain": "Account",
                "class": "SpoofClientTests",
                "method": "OpensTheFrontPage",
                "title": "Opens the front page",
                "gherkin": "@phone\nScenario: Opens the front page",
                "patches": [
                  "Spoof client"
                ],
                "screen": "phone",
                "gif": "Account/opens-the-front-page-phone.gif",
                "mp4": "Account/opens-the-front-page-phone.mp4",
                "startupSeconds": 2.3,
                "passed": true,
                "selected": "fixtures",
                "fixtures": [
                  "Fixtures/front.json"
                ]
              },
              {
                "domain": "Comments/ShowTables",
                "class": "TablesTests",
                "method": "Shows",
                "title": "Shows a table",
                "gherkin": null,
                "patches": [],
                "screen": "phone",
                "gif": "Comments/ShowTables/shows-phone.gif",
                "mp4": "Comments/ShowTables/shows-phone.mp4",
                "startupSeconds": null,
                "passed": false,
                "selected": "changed"
              }
            ]
            """.ReplaceLineEndings("\n"),
            json.ReplaceLineEndings("\n"));
    }

    [Fact]
    public void Scenarios_json_is_what_post_reads()
    {
        var entries = Assert.IsType<Result<ImmutableArray<ScenarioEntry>, string>.Ok>(
            JsonReading.ReadScenarios(ScenarioListing.WriteScenarios([Spoof, Feed], ScenarioListing.ReadSelection("")))).Value;

        Assert.Equal(["Spoof client"], entries[0].Patches);
        Assert.Equal(Optional.Some("phone"), entries[0].Screen);
        Assert.Empty(entries[1].Patches);
        Assert.Equal(Optional.Some("Comments/ShowTables/shows-phone.mp4"), entries[1].Mp4);
        Assert.IsType<RunSelection.Changed>(entries[1].Selection);
    }

    [Fact]
    public void No_run_is_an_empty_list() =>
        Assert.Equal("[]", ScenarioListing.WriteScenarios([], ScenarioListing.ReadSelection("")));

    [Fact]
    public void The_summary_gives_each_runs_result_startup_and_gif_and_why_it_was_re_recorded() =>
        Assert.Equal(
            [
                "",
                "Scenarios:",
                "  passed     startup 2.3 s  Account/opens-the-front-page-phone.gif  (re-recorded: a.json, b.json changed)",
                "  FAILED   app never shown  Comments/ShowTables/shows-phone.gif",
            ],
            ScenarioListing.WriteSummary([Spoof, Feed], ScenarioListing.ReadSelection("SpoofClientTests\tfixtures\tb.json\nSpoofClientTests\tfixtures\ta.json\nTablesTests\tchanged\nTablesTests\tfixtures\tc.json\n")));
}
