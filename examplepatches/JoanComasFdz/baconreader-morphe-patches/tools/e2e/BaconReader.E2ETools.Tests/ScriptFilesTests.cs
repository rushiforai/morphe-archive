// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>
/// The files the e2e scripts hand the tool: a run's record (BaconReader.E2E.Shared's ScenarioRecording), scenarios.json's
/// files, the VS Code runner's package.json and the VS Code extension's .vsix.
/// </summary>
public sealed class ScriptFilesTests
{
    /// <summary>A ScenarioRecording as BaseE2E serializes it, camelCase.</summary>
    private const string Recording = """
        {"domain": "Account", "class": "SpoofClientTests", "method": "Opens", "title": "Opens", "gherkin": "Scenario: x",
         "screen": "phone", "gif": "opens-phone", "patches": ["Spoof client", "Hide ads"], "homeShownSeconds": 3.25, "passed": true}
        """;

    [Fact]
    public void A_runs_record_is_read_with_its_patches_and_home_time()
    {
        var record = Assert.IsType<Result<RunRecord, string>.Ok>(JsonReading.ReadRunRecord(Recording)).Value;

        Assert.Equal(("Account", "SpoofClientTests", "Opens", "Opens", "phone", "opens-phone", true), (record.Domain, record.Class, record.Method, record.Title, record.Screen, record.Gif, record.Passed));
        Assert.Equal(Optional.Some("Scenario: x"), record.Gherkin);
        Assert.Equal(["Spoof client", "Hide ads"], record.Patches);
        Assert.Equal(Optional.Some(3.25), record.HomeShownSeconds);
    }

    [Fact]
    public void A_record_without_home_time_or_patches_has_none()
    {
        var record = Assert.IsType<Result<RunRecord, string>.Ok>(JsonReading.ReadRunRecord(
            Recording.Replace("3.25", "null").Replace("\"patches\": [\"Spoof client\", \"Hide ads\"], ", ""))).Value;

        Assert.Equal(Optional.None<double>(), record.HomeShownSeconds);
        Assert.Empty(record.Patches);
    }

    [Fact]
    public void A_record_without_its_names_is_an_error() =>
        Assert.IsType<Result<RunRecord, string>.Error>(JsonReading.ReadRunRecord("""{"domain": "Account"}"""));

    [Fact]
    public void The_listed_files_are_each_gif_and_mp4_once_in_order()
    {
        var json = """
            [{"gif": "A/a-phone.gif", "mp4": "A/a-phone.mp4"},
             {"gif": "A/a-phone.gif", "mp4": "A/a-phone.mp4"},
             {"gif": "B/b-phone.gif", "mp4": null}]
            """;

        Assert.Equal(
            ["A/a-phone.gif", "A/a-phone.mp4", "B/b-phone.gif"],
            Assert.IsType<Result<ImmutableArray<string>, string>.Ok>(JsonReading.ReadListedFiles(json)).Value);
        Assert.Empty(Assert.IsType<Result<ImmutableArray<string>, string>.Ok>(JsonReading.ReadListedFiles("[]")).Value);
    }

    [Fact]
    public void The_VS_Code_build_is_the_package_json_s_config_vscodeCommit()
    {
        Assert.Equal("abc123", Assert.IsType<Result<string, string>.Ok>(JsonReading.ReadVsCodeCommit("""{"config": {"vscodeCommit": "abc123"}}""")).Value);
        Assert.IsType<Result<string, string>.Error>(JsonReading.ReadVsCodeCommit("""{"config": {}}"""));
    }

    [Fact]
    public void The_vsix_lays_the_extension_out_as_vsce_does() =>
        Assert.Equal(
            [
                new VsixEntry("ext/package.json", "extension/package.json"),
                new VsixEntry("ext/extension.js", "extension/extension.js"),
                new VsixEntry("ext/README.md", "extension/README.md"),
                new VsixEntry("LICENSE", "extension/LICENSE.txt"),
                new VsixEntry("ext/vsix/extension.vsixmanifest", "extension.vsixmanifest"),
                new VsixEntry("ext/vsix/Content_Types.xml", "[Content_Types].xml"),
            ],
            VsixPacking.PlanEntries("ext", "LICENSE"));
}
