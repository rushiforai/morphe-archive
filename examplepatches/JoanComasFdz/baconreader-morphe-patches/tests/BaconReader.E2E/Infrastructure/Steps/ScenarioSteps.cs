// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Reflection;
using System.Text.RegularExpressions;
using Dunet;

namespace BaconReader.E2E.Infrastructure.Steps;

/// <summary>
/// Which Gherkin line each statement of a scenario plays, read from the scenario's source (embedded in this assembly)
/// by E2E-TEST-CODE-RULES.md, rule h: in <c>// Given</c>, a statement a line, but for the lines BaseE2E plays itself
/// (<c>BaconReader is patched with …</c>, <c>BaconReader is installed</c>); in each <c>// When</c>, an Act a line, its
/// <c>WaitUntil…</c> calls none; in each <c>// Then</c>, an assertion a line, its reads and waits none. The recording
/// marks each line when its statement starts, or, for a Then line, when its assertion passed
/// (<see cref="GherkinMarking"/>). A line is an index in <see cref="Gherkin.Text"/>'s lines.
/// </summary>
public sealed partial record ScenarioSteps(ImmutableArray<int> PlayedByBaseE2E, ImmutableArray<CodeStep> Steps)
{
    /// <summary>
    /// The steps of <paramref name="method"/>'s scenario, from its class's source; an error saying where the scenario
    /// doesn't follow its Gherkin line for line.
    /// </summary>
    public static StepsReading Read(MethodInfo method, string gherkin) =>
        ReadSource(method.DeclaringType!) is { } source
            ? Read(source, method.Name, gherkin)
            : new StepsReading.Failed($"{method.DeclaringType!.Name}'s source isn't embedded in the e2e assembly (BaconReader.E2E.csproj).");

    /// <summary>The steps of the scenario <paramref name="methodName"/> in <paramref name="source"/>.</summary>
    public static StepsReading Read(string source, string methodName, string gherkin)
    {
        var body = ReadBody(source, methodName);
        if (body is null)
        {
            return new StepsReading.Failed($"{methodName} has no body in its class's source.");
        }

        var blocks = ReadGherkinBlocks(gherkin);
        var sections = ReadSections(body.Value);
        var expected = blocks.Select(block => block.Keyword).ToArray();
        var found = sections.Select(section => section.Keyword).ToArray();
        if (!expected.SequenceEqual(found))
        {
            return new StepsReading.Failed(
                $"{methodName}'s blocks are {Describe(found)}, but its Gherkin's are {Describe(expected)}: a // Given, then a // When "
                + "and a // Then for each round (E2E-TEST-CODE-RULES.md, rule h).");
        }

        var played = ImmutableArray.CreateBuilder<int>();
        var steps = ImmutableArray.CreateBuilder<CodeStep>();
        foreach (var (block, section) in blocks.Zip(sections))
        {
            var lines = block.Lines;
            if (block.Keyword == "Given")
            {
                played.AddRange(lines.Where(line => BaseE2ELine().IsMatch(line.Text)).Select(line => line.Index));
                lines = [.. lines.Where(line => !BaseE2ELine().IsMatch(line.Text))];
            }

            var error = block.Keyword == "Then" ? ReadThen(section, lines, steps) : ReadActs(section, lines, steps);
            if (error is not null)
            {
                return new StepsReading.Failed($"{methodName}: {error} (E2E-TEST-CODE-RULES.md, rule h).");
            }
        }

        return new StepsReading.Read(new ScenarioSteps(played.ToImmutable(), steps.ToImmutable()));
    }

    /// <summary>The step the statement starting at <paramref name="sourceLine"/> (1-based, in its file) plays; none if it isn't one.</summary>
    public int IndexOf(int sourceLine) => Steps.Select(step => step.SourceLine).ToList().IndexOf(sourceLine);

    // A Given or a When block: each statement plays the next line, but for those that only get the next ready, in the
    // first of these that leaves a statement a line: a wait (WaitUntil…), a read or a scroll (ScrollTo…, bringing a
    // setting into view); a wait or a read ("And I wait until the comment shows"); none. A statement that plays no line
    // fails as the line before it (the first one before any).
    private static string? ReadActs(Section section, ImmutableArray<GherkinLine> lines, ImmutableArray<CodeStep>.Builder steps)
    {
        var plays = new Func<Statement, bool>[]
        {
            statement => statement.Kind == StatementKind.Act,
            statement => statement.Kind is StatementKind.Act or StatementKind.Scroll,
            statement => true,
        }.FirstOrDefault(playing => section.Statements.Count(playing) == lines.Length);
        if (plays is null)
        {
            var acts = section.Statements.Count(statement => statement.Kind == StatementKind.Act);
            return $"its // {section.Keyword} block at line {section.Line} has {acts} {Plural(acts, "call")} "
                + $"for {lines.Length} {section.Keyword} {Plural(lines.Length, "line")} (a wait, WaitUntil…, a read or a scroll, ScrollTo…, plays none)";
        }

        var next = 0;
        foreach (var statement in section.Statements)
        {
            if (plays(statement))
            {
                steps.Add(new CodeStep(statement.Line, lines[next].Index, lines[next].Index, []));
                next++;
            }
            else
            {
                steps.Add(new CodeStep(statement.Line, null, lines[Math.Max(0, next - 1)].Index, []));
            }
        }

        return null;
    }

    // A Then block: each assertion, chained after Asserting.That, plays the next line; a read or a wait plays none, and its
    // failure is the next line to check.
    private static string? ReadThen(Section section, ImmutableArray<GherkinLine> lines, ImmutableArray<CodeStep>.Builder steps)
    {
        var assertions = section.Statements.Sum(statement => statement.Assertions.Length);
        if (assertions != lines.Length)
        {
            return $"its // Then block at line {section.Line} has {assertions} {Plural(assertions, "assertion")} "
                + $"for {lines.Length} Then {Plural(lines.Length, "line")}";
        }

        var next = 0;
        foreach (var statement in section.Statements)
        {
            var checks = statement.Assertions.Select((names, at) => new Assertion(names, lines[next + at].Index)).ToImmutableArray();
            steps.Add(new CodeStep(statement.Line, null, lines[Math.Min(next, lines.Length - 1)].Index, checks));
            next += checks.Length;
        }

        return null;
    }

    private static string Describe(string[] keywords) => keywords.Length == 0 ? "none" : string.Join(", ", keywords);

    private static string Plural(int count, string word) => count == 1 ? word : word + "s";

    // The scenario class's source, embedded as Scenarios/<folders>/<class>.cs.
    private static string? ReadSource(Type scenario)
    {
        var assembly = typeof(ScenarioSteps).Assembly;
        var name = assembly.GetManifestResourceNames().SingleOrDefault(resource => resource.EndsWith("/" + scenario.Name + ".cs", StringComparison.Ordinal));
        if (name is null)
        {
            return null;
        }

        using var reader = new StreamReader(assembly.GetManifestResourceStream(name)!);
        return reader.ReadToEnd();
    }

    // The Gherkin's Given, When and Then blocks, each its keyword's line and the And lines after it.
    private static ImmutableArray<GherkinBlock> ReadGherkinBlocks(string gherkin)
    {
        var blocks = new List<(string Keyword, List<GherkinLine> Lines)>();
        var lines = gherkin.Split('\n');
        for (var index = 0; index < lines.Length; index++)
        {
            var text = lines[index].Trim();
            var keyword = text.Split(' ', 2)[0];
            if (keyword is "Given" or "When" or "Then")
            {
                blocks.Add((keyword, [new GherkinLine(index, text)]));
            }
            else if (keyword is "And" or "But" && blocks.Count > 0)
            {
                blocks[^1].Lines.Add(new GherkinLine(index, text));
            }
        }

        return [.. blocks.Select(block => new GherkinBlock(block.Keyword, [.. block.Lines]))];
    }

    // The method's body: its lines, numbered from 1 in the file.
    private static ImmutableArray<(int Number, string Text)>? ReadBody(string source, string methodName)
    {
        var lines = source.Replace("\r\n", "\n").Split('\n');
        var signature = Array.FindIndex(lines, line => Regex.IsMatch(line, $@"\bTask\s+{Regex.Escape(methodName)}\s*\("));
        if (signature < 0)
        {
            return null;
        }

        var open = Array.FindIndex(lines, signature, line => line.Trim() == "{");
        if (open < 0)
        {
            return null;
        }

        var indent = lines[open].Length - lines[open].TrimStart().Length;
        var close = Array.FindIndex(lines, open + 1, line => line.TrimEnd() == new string(' ', indent) + "}");
        if (close < 0)
        {
            return null;
        }

        return [.. Enumerable.Range(open + 1, close - open - 1).Select(at => (at + 1, lines[at]))];
    }

    // The body's // Given, // When and // Then sections and their statements, each from its first line to its ";";
    // comments are left out.
    private static ImmutableArray<Section> ReadSections(ImmutableArray<(int Number, string Text)> lines)
    {
        var sections = new List<(string Keyword, int Line, List<(int Line, List<string> Text)> Statements)>();
        foreach (var (number, text) in lines)
        {
            var trimmed = text.Trim();
            if (trimmed is "// Given" or "// When" or "// Then")
            {
                sections.Add((trimmed[3..], number, []));
            }
            else if (trimmed.Length == 0 || trimmed.StartsWith("//", StringComparison.Ordinal) || sections.Count == 0)
            {
                continue;
            }
            else if (sections[^1].Statements.Count == 0 || sections[^1].Statements[^1].Text[^1].EndsWith(';'))
            {
                sections[^1].Statements.Add((number, [trimmed]));
            }
            else
            {
                sections[^1].Statements[^1].Text.Add(trimmed);
            }
        }

        return [.. sections.Select(section => new Section(
            section.Keyword,
            section.Line,
            [.. section.Statements.Select(statement => Statement.Read(statement.Line, [.. statement.Text]))]))];
    }

    [GeneratedRegex(@"^(?:Given|And) BaconReader is (?:patched with .+|installed)$")]
    private static partial Regex BaseE2ELine();

    private enum StatementKind
    {
        Act,
        Wait,
        Scroll,
        Assert,
    }

    private sealed record GherkinLine(int Index, string Text);

    private sealed record GherkinBlock(string Keyword, ImmutableArray<GherkinLine> Lines);

    private sealed record Section(string Keyword, int Line, ImmutableArray<Statement> Statements);

    // A statement: where it starts, what it does (a wait, WaitUntil…, or a read; a scroll, ScrollTo…; another act), and
    // the assertions chained after its
    // Asserting.That(…), a source line each (one Then line: .AsksToConnect(…).WithTheTestAccount() is one), each the
    // names it calls.
    private sealed partial record Statement(int Line, StatementKind Kind, ImmutableArray<ImmutableArray<string>> Assertions)
    {
        public static Statement Read(int line, ImmutableArray<string> code)
        {
            var that = code[0].IndexOf("Asserting.That(", StringComparison.Ordinal);
            if (that < 0)
            {
                var text = string.Concat(code);
                var kind = WaitCall().IsMatch(text) ? StatementKind.Wait : ScrollCall().IsMatch(text) ? StatementKind.Scroll : StatementKind.Act;
                return new Statement(line, kind, []);
            }

            // The first line's calls after That(…), then each line that starts with a call, with the lines that go on
            // with its arguments.
            var lines = new List<string> { code[0][SkipArguments(code[0], that + "Asserting.That(".Length)..] };
            foreach (var text in code.Skip(1))
            {
                if (text.StartsWith('.'))
                {
                    lines.Add(text);
                }
                else
                {
                    lines[^1] += text;
                }
            }

            return new Statement(line, StatementKind.Assert, [.. lines.Select(text => Calls(text).ToImmutableArray()).Where(names => !names.IsEmpty)]);
        }

        // The names called at the top level of a chain: .Name(…).Other<T>(…).
        private static IEnumerable<string> Calls(string chain)
        {
            var at = 0;
            while (at < chain.Length)
            {
                var call = ChainedCall().Match(chain, at);
                if (!call.Success || call.Index != at)
                {
                    yield break;
                }

                yield return call.Groups[1].Value;
                at = SkipArguments(chain, call.Index + call.Length);
            }
        }

        // Where the arguments that start at `from` (right after their "(") end: right after their ")", strings skipped.
        private static int SkipArguments(string code, int from)
        {
            var depth = 1;
            var at = from;
            while (at < code.Length && depth > 0)
            {
                switch (code[at])
                {
                    case '"':
                        at++;
                        while (at < code.Length && code[at] != '"')
                        {
                            at += code[at] == '\\' ? 2 : 1;
                        }

                        break;
                    case '(':
                        depth++;
                        break;
                    case ')':
                        depth--;
                        break;
                }

                at++;
            }

            return at;
        }

        [GeneratedRegex(@"\.(?:WaitUntil|Read)\w*\(")]
        private static partial Regex WaitCall();

        [GeneratedRegex(@"\.ScrollTo\w*\(")]
        private static partial Regex ScrollCall();

        [GeneratedRegex(@"\s*\.(\w+)(?:<[^>()]*>)?\(")]
        private static partial Regex ChainedCall();
    }
}

/// <summary>
/// A statement of a scenario: where it starts in its file (1-based); the Gherkin line it plays, if any (an Act, a Given);
/// the line that fails if it does (a wait's or a read's is the line it serves); and the assertions chained in it, each
/// with the Then line it checks.
/// </summary>
public sealed record CodeStep(int SourceLine, int? Plays, int FailsAs, ImmutableArray<Assertion> Assertions);

/// <summary>An assertion of a Then block, by the names it calls (one line of its chain), and the Then line it checks.</summary>
public sealed record Assertion(ImmutableArray<string> Names, int Line);

/// <summary>A scenario's steps, or why its code doesn't follow its Gherkin line for line.</summary>
[Union]
public partial record StepsReading
{
    public partial record Read(ScenarioSteps Steps);

    public partial record Failed(string Why);
}
