// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Reflection;
using BaconReader.E2E.Infrastructure.Vocabulary;
using Xunit.Sdk;
using Xunit.v3;

[assembly: CollectionBehavior(typeof(BaconReader.E2E.Infrastructure.ScenarioCollections))]
[assembly: TestCollectionOrderer(typeof(BaconReader.E2E.Infrastructure.ScenarioOrder))]
[assembly: TestCaseOrderer(typeof(BaconReader.E2E.Infrastructure.ScenarioOrder))]

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// The order the scenarios run in (E2E-TEST-CODE-RULES.md, rule f), so the phone gets each APK once: sending one takes
/// 1–3 minutes over the slow link.
/// 1. the tests that aren't scenarios (the shape and naming tests), which need no phone;
/// 2. the Startup scenarios, those with the same patches together;
/// 3. the LoggedIn scenarios, all on the one APK with every patch;
/// then by class and method, so a run is the same each time.
/// xunit runs the test collections in the order this gives them, and a collection's tests by their class, then in the
/// order this gives them inside it. Each class is a collection of its own (<see cref="ScenarioCollections"/>), named by
/// its place (<see cref="CollectionNameOf"/>), so ordering the collections by name orders the classes.
/// </summary>
public sealed class ScenarioOrder : ITestCollectionOrderer, ITestCaseOrderer
{
    public IReadOnlyCollection<TTestCollection> OrderTestCollections<TTestCollection>(IReadOnlyCollection<TTestCollection> testCollections)
        where TTestCollection : ITestCollection =>
        [.. testCollections.OrderBy(collection => collection.TestCollectionDisplayName, StringComparer.Ordinal)];

    public IReadOnlyCollection<TTestCase> OrderTestCases<TTestCase>(IReadOnlyCollection<TTestCase> testCases)
        where TTestCase : notnull, ITestCase =>
        [.. testCases.OrderBy(testCase => testCase is IXunitTestCase xunit ? KeyOf(xunit.TestMethod.Method) : KeyOf(null), KeyComparer)];

    /// <summary>
    /// "2 LoggedIn · every patch · BaconReader.E2E.Scenarios.LoggedIn.Comments.EmbedCommentImagesTests": a class's
    /// collection, named by the place of its first test (<see cref="KeyOf"/>), so the names sort as the classes run.
    /// </summary>
    public static string CollectionNameOf(Type testClass)
    {
        var first = testClass.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly)
            .Where(method => method.GetCustomAttributes<FactAttribute>(inherit: true).Any())
            .Select(KeyOf)
            .Order(KeyComparer)
            .FirstOrDefault() ?? new Key(0, "", testClass.FullName ?? testClass.Name, "");
        var group = ScenarioGroups.Of(testClass)?.ToString() ?? (testClass.IsSubclassOf(typeof(BaseE2E)) ? "Neither group" : "Without the phone");
        return $"{first.Group} {group} · {first.Patches.Replace('\n', ',')} · {testClass.FullName}";
    }

    /// <summary>Where a test method runs: its group, its patches, its class and its name.</summary>
    public static Key KeyOf(MethodInfo? method)
    {
        var testClass = method?.ReflectedType;
        var scenario = testClass is not null && testClass.IsSubclassOf(typeof(BaseE2E));
        var rank = !scenario ? 0 : ScenarioGroups.Of(testClass!) switch
        {
            ScenarioGroup.Startup => 1,
            ScenarioGroup.LoggedIn => 2,
            // Neither (ScenarioShapeTests fails it): last, apart from both groups.
            _ => 3,
        };
        var patches = scenario && PatchSet.Of(method!) is { } set ? string.Join('\n', set.ToShownText()) : "";
        return new Key(rank, patches, testClass?.FullName ?? "", method?.Name ?? "");
    }

    /// <summary>A test method's place in the run, compared field by field.</summary>
    public sealed record Key(int Group, string Patches, string Class, string Method);

    /// <summary>Compares two <see cref="Key"/>s: by group, then patches, class and method, ordinally.</summary>
    public static IComparer<Key> KeyComparer { get; } = Comparer<Key>.Create((left, right) =>
        left.Group != right.Group ? left.Group.CompareTo(right.Group)
        : string.CompareOrdinal(left.Patches, right.Patches) is var patches and not 0 ? patches
        : string.CompareOrdinal(left.Class, right.Class) is var classes and not 0 ? classes
        : string.CompareOrdinal(left.Method, right.Method));
}

/// <summary>
/// One test collection per class, as xunit's default, but named by the class's place in the run
/// (<see cref="ScenarioOrder.CollectionNameOf"/>), which <see cref="ScenarioOrder"/> orders the collections by.
/// </summary>
public sealed class ScenarioCollections(IXunitTestAssembly testAssembly) : TestCollectionFactoryBase(testAssembly)
{
    public override string DisplayName => "collection-per-class, in the scenarios' order";

    protected override IXunitTestCollection GetDefaultTestCollection(Type testClass) =>
        new XunitTestCollection(TestAssembly, null, disableParallelization: false, ScenarioOrder.CollectionNameOf(testClass));
}
