// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// The JSON the tool reads: record.sh's <c>scenarios.json</c>, a recorded run's record, and GitHub's answers through
/// <c>gh api --paginate --slurp</c> (one array per page), each to its records; and the JSON bodies it sends. A text that
/// isn't the JSON expected is an error saying what was being read; a missing or mistyped field is none, never an exception.
/// </summary>
public static class JsonReading
{
    public static Result<ImmutableArray<ScenarioEntry>, string> ReadScenarios(string json) =>
        ParseArray(json, "scenarios.json").Bind(entries => ReadEach(entries, ReadScenario, "scenarios.json"));

    public static Result<ImmutableArray<PrComment>, string> ReadComments(string json) =>
        ReadPages(json, "the PR's comments", item =>
            ReadNumber(item, "id").Bind(id =>
            ReadString(item, "node_id").Bind(nodeId =>
            ReadString(item["user"] ?? new JsonObject(), "login").Map(login =>
            new PrComment(id, nodeId, login, ReadText(item, "body").UnwrapOr("")))))
            .ToResult(() => "a comment lacks its id, node_id or user's login"));

    public static Result<ImmutableArray<Release>, string> ReadReleases(string json) =>
        ReadPages(json, "the releases", item =>
            ReadNumber(item, "id").Bind(id => ReadString(item, "tag_name").Map(tag => new Release(id, tag)))
            .ToResult(() => "a release lacks its id or tag_name"));

    public static Result<ImmutableArray<ReleaseAsset>, string> ReadAssets(string json) =>
        ReadPages(json, "a release's assets", item =>
            ReadNumber(item, "id").Bind(id => ReadString(item, "name").Map(name => new ReleaseAsset(id, name)))
            .ToResult(() => "an asset lacks its id or name"));

    /// <summary>The record a recorded run wrote next to its video; an error saying which field it lacks.</summary>
    public static Result<RunRecord, string> ReadRunRecord(string json) =>
        ParseNode(json)
            .Bind(node => node is JsonObject record ? Optional.Some(record) : Optional.None<JsonObject>())
            .ToResult(() => "a run's record isn't a JSON object.")
            .Bind(record =>
                ReadString(record, "domain").Bind(domain =>
                ReadString(record, "class").Bind(cls =>
                ReadString(record, "method").Bind(method =>
                ReadString(record, "title").Bind(title =>
                ReadString(record, "screen").Bind(screen =>
                ReadString(record, "gif").Bind(gif =>
                ReadFlag(record, "passed").Map(passed =>
                new RunRecord(
                    domain, cls, method, title, ReadString(record, "gherkin"), screen, gif, ReadTexts(record, "patches"),
                    ReadDecimal(record, "homeShownSeconds"), passed))))))))
                .ToResult(() => "a run's record lacks its domain, class, method, title, screen, gif or passed."));

    /// <summary>The files a <c>scenarios.json</c> lists, each once in the order they come: each entry's GIF, then its MP4.</summary>
    /// <summary>The VS Code build a package.json pins: its config.vscodeCommit (the VS Code extension's scenarios' runner).</summary>
    public static Result<string, string> ReadVsCodeCommit(string json) =>
        ParseNode(json)
            .Bind(node => node?["config"] is JsonObject config ? ReadText(config, "vscodeCommit") : Optional.None<string>())
            .ToResult(() => "the package.json has no config.vscodeCommit.");

    public static Result<ImmutableArray<string>, string> ReadListedFiles(string json) =>
        ParseArray(json, "scenarios.json").Map(entries => entries
            .OfType<JsonObject>()
            .SelectMany(entry => new[] { "gif", "mp4" }.Select(name => ReadText(entry, name)))
            .OfType<Optional<string>.Some>()
            .Select(some => some.Value)
            .Distinct()
            .ToImmutableArray());

    /// <summary>
    /// The node ids of these posts already hidden, from GraphQL's answer to <see cref="WriteHiddenQuery"/> (its nodes in the
    /// order asked); an error holding the answer when it has no such nodes.
    /// </summary>
    public static Result<ImmutableHashSet<string>, string> ReadHidden(ImmutableArray<string> ids, string json) =>
        ParseNode(json)
            .Bind(root => root?["data"]?["nodes"] is JsonArray nodes ? Optional.Some(nodes) : Optional.None<JsonArray>())
            .Match<Result<ImmutableHashSet<string>, string>>(
                nodes => new Result<ImmutableHashSet<string>, string>.Ok([.. ids.Zip(nodes.Value)
                    .Where(pair => pair.Second is JsonObject node && ReadFlag(node, "isMinimized").UnwrapOr(false))
                    .Select(pair => pair.First)]),
                _ => new Result<ImmutableHashSet<string>, string>.Error(json.Trim()));

    /// <summary>GraphQL's isMinimized of each of these comments (REST doesn't say).</summary>
    public static string WriteHiddenQuery(ImmutableArray<string> ids) =>
        new JsonObject
        {
            ["query"] = "query($ids: [ID!]!) { nodes(ids: $ids) { ... on IssueComment { isMinimized } } }",
            ["variables"] = new JsonObject { ["ids"] = new JsonArray([.. ids.Select(id => JsonValue.Create(id))]) },
        }.ToJsonString();

    /// <summary>GraphQL's minimizeComment of a comment, as Outdated.</summary>
    public static string WriteHideMutation(string nodeId) =>
        new JsonObject
        {
            ["query"] = "mutation($id: ID!) { minimizeComment(input: {subjectId: $id, classifier: OUTDATED}) { minimizedComment { isMinimized } } }",
            ["variables"] = new JsonObject { ["id"] = nodeId },
        }.ToJsonString();

    /// <summary>A comment's body, as REST takes it to post or edit one.</summary>
    public static string WriteBody(string body) => new JsonObject { ["body"] = body }.ToJsonString();

    private static Result<ScenarioEntry, string> ReadScenario(JsonNode entry) =>
        ReadString(entry, "class").Bind(cls =>
        ReadString(entry, "method").Bind(method =>
        ReadString(entry, "title").Bind(title =>
        ReadString(entry, "gif").Bind(gif =>
        ReadFlag(entry, "passed").Map(passed =>
        new ScenarioEntry(
            cls, method, title, ReadText(entry, "gherkin"), ReadText(entry, "screen"), gif, ReadText(entry, "mp4"),
            ReadTexts(entry, "patches"), passed, ReadSelection(entry)))))))
        .ToResult(() => "an entry lacks its class, method, title, gif or passed");

    /// <summary>"fixtures" with the fixture files that changed, or else "changed".</summary>
    private static RunSelection ReadSelection(JsonNode entry) =>
        ReadText(entry, "selected").UnwrapOr("") == "fixtures"
            ? new RunSelection.Fixtures(ReadTexts(entry, "fixtures"))
            : new RunSelection.Changed();

    /// <summary>An array field's texts (each item that is a non-empty text); empty when it is missing or not an array.</summary>
    private static ImmutableArray<string> ReadTexts(JsonNode item, string name) =>
        [.. (item[name] as JsonArray ?? [])
            .Select(value => value is JsonValue text && text.TryGetValue(out string? found) && found.Length > 0 ? Optional.Some(found) : Optional.None<string>())
            .OfType<Optional<string>.Some>()
            .Select(some => some.Value)];

    /// <summary>A text field, empty or not; none when it is missing or not text.</summary>
    private static Optional<string> ReadString(JsonNode item, string name) =>
        item[name] is JsonValue value && value.TryGetValue(out string? text) ? Optional.Some(text) : Optional.None<string>();

    /// <summary>A text field; none when it is missing, null or empty.</summary>
    private static Optional<string> ReadText(JsonNode item, string name) =>
        ReadString(item, name).Bind(text => text.Length > 0 ? Optional.Some(text) : Optional.None<string>());

    private static Optional<long> ReadNumber(JsonNode item, string name) =>
        item[name] is JsonValue value && value.TryGetValue(out long number) ? Optional.Some(number) : Optional.None<long>();

    /// <summary>A number field; none when it is missing, null or not a number.</summary>
    private static Optional<double> ReadDecimal(JsonNode item, string name) =>
        item[name] is JsonValue value && value.TryGetValue(out double number) ? Optional.Some(number) : Optional.None<double>();

    private static Optional<bool> ReadFlag(JsonNode item, string name) =>
        item[name] is JsonValue value && value.TryGetValue(out bool flag) ? Optional.Some(flag) : Optional.None<bool>();

    private static Result<ImmutableArray<T>, string> ReadPages<T>(string json, string what, Func<JsonNode, Result<T, string>> read) =>
        ParseArray(json, what).Bind(pages => ReadEach([.. pages.SelectMany(page => page as JsonArray ?? [])], read, what));

    private static Result<JsonArray, string> ParseArray(string json, string what) =>
        ParseNode(json).Match<Result<JsonArray, string>>(
            node => node.Value is JsonArray array
                ? new Result<JsonArray, string>.Ok(array)
                : new Result<JsonArray, string>.Error($"{what} isn't a JSON array."),
            _ => new Result<JsonArray, string>.Error($"{what} isn't JSON."));

    /// <summary>The parsed JSON; none for a text that isn't JSON (the parser's only way to say so is its exception).</summary>
    private static Optional<JsonNode?> ParseNode(string json)
    {
        try
        {
            return Optional.Some(JsonNode.Parse(json));
        }
        catch (JsonException)
        {
            return Optional.None<JsonNode?>();
        }
    }

    private static Result<ImmutableArray<T>, string> ReadEach<T>(IEnumerable<JsonNode?> items, Func<JsonNode, Result<T, string>> read, string what) =>
        items.OfType<JsonNode>().Select(read).CombineAll().MapError(failures => $"{what}: {failures[0]}");
}
