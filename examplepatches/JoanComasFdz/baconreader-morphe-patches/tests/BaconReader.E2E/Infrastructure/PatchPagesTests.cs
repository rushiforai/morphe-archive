// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.RegularExpressions;

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// Each patch's page, docs/patches/&lt;patch&gt;.md (AGENTS.md, "Patch pages"), names the e2e scenarios that show it, and
/// its one-line summary is its row in docs/patches.md, so the user guide built from them shows each scenario once, under
/// its patch. Runs without the phone.
/// </summary>
public sealed partial class PatchPagesTests
{
    // The test-only patch "E2E fake Reddit" is never released, so it has no page.
    private const string TestOnlyDomain = "BaconReader.E2E.Scenarios.LoggedIn.E2E";

    [Fact]
    public void Every_scenario_is_on_one_patch_page()
    {
        var listed = ReadPages().SelectMany(page => page.Scenarios.Select(scenario => (page.File, Scenario: scenario))).ToList();
        var scenarios = ScenarioShapeTests.FindScenarios()
            .Select(method => method.DeclaringType!)
            .Where(type => type.Namespace != TestOnlyDomain)
            .Select(type => type.Name)
            .Distinct();

        Assert.All(scenarios, scenario => Assert.True(
            listed.Count(page => page.Scenario == scenario) == 1,
            $"{scenario} should be on one page of docs/patches/, its patch's, but it is on: "
            + $"{string.Join(", ", listed.Where(page => page.Scenario == scenario).Select(page => page.File).DefaultIfEmpty("none"))}."));
    }

    [Fact]
    public void Every_scenario_a_page_names_exists()
    {
        var scenarios = ScenarioShapeTests.FindScenarios().Select(method => method.DeclaringType!.Name).ToHashSet();

        Assert.All(
            ReadPages().SelectMany(page => page.Scenarios.Select(scenario => (page.File, Scenario: scenario))),
            page => Assert.True(scenarios.Contains(page.Scenario), $"docs/patches/{page.File} names {page.Scenario}, which isn't a scenario."));
    }

    [Fact]
    public void Every_page_is_its_row_in_the_index()
    {
        var index = File.ReadAllText(Path.Combine(FindRepository(), "docs", "patches.md"));

        Assert.All(ReadPages(), page => Assert.Contains($"| [{page.Name}](patches/{page.File}) | {page.Summary} |\n", index.ReplaceLineEndings("\n")));
    }

    private static List<Page> ReadPages() =>
        [.. Directory.GetFiles(Path.Combine(FindRepository(), "docs", "patches"), "*.md").Order(StringComparer.Ordinal).Select(Page.Read)];

    // The repository's root: the first folder up from the test's output that holds AGENTS.md.
    private static string FindRepository()
    {
        for (var folder = new DirectoryInfo(AppContext.BaseDirectory); folder is not null; folder = folder.Parent)
        {
            if (File.Exists(Path.Combine(folder.FullName, "AGENTS.md")))
            {
                return folder.FullName;
            }
        }

        throw new InvalidOperationException("No AGENTS.md above the tests' output: the patch pages can't be found.");
    }

    private sealed partial record Page(string File, string Name, string Summary, IReadOnlyList<string> Scenarios)
    {
        public static Page Read(string path)
        {
            var lines = System.IO.File.ReadAllLines(path);
            var scenarios = lines.Select(line => ScenariosLine().Match(line)).FirstOrDefault(found => found.Success);
            var title = Array.FindIndex(lines, line => line.StartsWith("# ", StringComparison.Ordinal));
            var summary = title < 0 ? "" : lines.Skip(title + 1).FirstOrDefault(line => line.Trim().Length > 0) ?? "";
            return new Page(
                Path.GetFileName(path),
                title < 0 ? "" : lines[title][2..],
                summary,
                scenarios is null ? [] : [.. scenarios.Groups[1].Value.Split(',', StringSplitOptions.TrimEntries | StringSplitOptions.RemoveEmptyEntries)]);
        }

        [GeneratedRegex(@"^<!-- scenarios:(.*)-->$")]
        private static partial Regex ScenariosLine();
    }
}
