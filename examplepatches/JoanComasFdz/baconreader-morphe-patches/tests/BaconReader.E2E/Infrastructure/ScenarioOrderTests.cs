// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Reflection;
using BaconReader.E2E.Scenarios.LoggedIn.Comments;
using BaconReader.E2E.Scenarios.LoggedIn.E2E;
using BaconReader.E2E.Scenarios.Startup.Account;
using Xunit.v3;

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// The run's order (<see cref="ScenarioOrder"/>, E2E-TEST-CODE-RULES.md, rule f): the tests without the phone, then the
/// Startup scenarios, then the LoggedIn ones, each set of patches together, so the phone gets each APK once.
/// </summary>
public sealed class ScenarioOrderTests
{
    [Fact]
    public void Project_OrdersTheCollectionsAndTheTestsInThemByTheScenariosOrder()
    {
        var assembly = typeof(ScenarioOrder).Assembly;
        Assert.Equal(typeof(ScenarioCollections), assembly.GetCustomAttribute<CollectionBehaviorAttribute>()?.CollectionFactoryType);
        Assert.Equal(typeof(ScenarioOrder), assembly.GetCustomAttribute<TestCollectionOrdererAttribute>()?.OrdererType);
        Assert.Equal(typeof(ScenarioOrder), assembly.GetCustomAttribute<TestCaseOrdererAttribute>()?.OrdererType);
    }

    [Fact]
    public void Collections_RunTheClassesWithoutThePhoneThenStartupThenLoggedIn()
    {
        Type[] classes = [typeof(E2EFakeRedditTests), typeof(EmbedCommentImagesTests), typeof(ScenarioShapeTests), typeof(SpoofClientTests)];

        var ordered = classes.OrderBy(ScenarioOrder.CollectionNameOf, StringComparer.Ordinal);

        Assert.Equal([typeof(ScenarioShapeTests), typeof(SpoofClientTests), typeof(EmbedCommentImagesTests), typeof(E2EFakeRedditTests)], ordered);
    }

    [Fact]
    public void Collection_IsNamedByItsClasssPlace() =>
        Assert.Equal(
            "1 Startup · Spoof client · BaconReader.E2E.Scenarios.Startup.Account.SpoofClientTests",
            ScenarioOrder.CollectionNameOf(typeof(SpoofClientTests)));

    [Fact]
    public void Group_IsTheFirstFolderUnderScenarios()
    {
        Assert.Equal(ScenarioGroup.Startup, ScenarioGroups.Of(typeof(SpoofClientTests)));
        Assert.Equal(ScenarioGroup.LoggedIn, ScenarioGroups.Of(typeof(EmbedCommentImagesTests)));
        Assert.Equal(ScenarioGroup.LoggedIn, ScenarioGroups.Of(typeof(E2EFakeRedditTests)));
        Assert.Null(ScenarioGroups.Of(typeof(ScenarioShapeTests)));
    }

    [Fact]
    public void Order_RunsTheTestsWithoutThePhoneThenStartupThenLoggedIn()
    {
        var methods = new[]
        {
            Method<EmbedCommentImagesTests>(nameof(EmbedCommentImagesTests.EmbedCommentImagesShowsTheMediaOfCommentsAndPostTextsAndFollowsItsSettings)),
            Method<SpoofClientTests>(nameof(SpoofClientTests.BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader)),
            Method<E2EFakeRedditTests>(nameof(E2EFakeRedditTests.BaconReaderLoggedInShowsThePostsRedditHasInAll)),
            Method<ScenarioOrderTests>(nameof(Group_IsTheFirstFolderUnderScenarios)),
        };

        var ordered = methods.OrderBy(ScenarioOrder.KeyOf, ScenarioOrder.KeyComparer).Select(method => method.Name);

        Assert.Equal(
            [
                nameof(Group_IsTheFirstFolderUnderScenarios),
                nameof(SpoofClientTests.BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader),
                nameof(EmbedCommentImagesTests.EmbedCommentImagesShowsTheMediaOfCommentsAndPostTextsAndFollowsItsSettings),
                nameof(E2EFakeRedditTests.BaconReaderLoggedInShowsThePostsRedditHasInAll),
            ],
            ordered);
    }

    [Fact]
    public void Order_PutsTheStartupScenariosWithTheSamePatchesTogether()
    {
        var spoofClient = new ScenarioOrder.Key(1, "E2E fake Reddit\nSpoof client", "Z.SpoofClientTests", "A");
        var other = new ScenarioOrder.Key(1, "Disable final release announcement\nE2E fake Reddit", "A.OtherTests", "B");
        var spoofClientAgain = new ScenarioOrder.Key(1, "E2E fake Reddit\nSpoof client", "A.OtherTests", "C");

        var ordered = new[] { spoofClient, other, spoofClientAgain }.Order(ScenarioOrder.KeyComparer);

        Assert.Equal([other, spoofClientAgain, spoofClient], ordered);
    }

    [Fact]
    public void Order_GivesEveryLoggedInScenarioTheSamePatches()
    {
        var keys = typeof(BaseE2E).Assembly.GetTypes()
            .Where(type => type.IsSubclassOf(typeof(BaseE2E)) && ScenarioGroups.Of(type) == ScenarioGroup.LoggedIn)
            .SelectMany(type => type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly))
            .Select(ScenarioOrder.KeyOf)
            .ToArray();

        Assert.NotEmpty(keys);
        Assert.All(keys, key => Assert.Equal(Vocabulary.PatchSet.EveryPatchText, key.Patches));
    }

    private static MethodInfo Method<T>(string name) => typeof(T).GetMethod(name)!;
}
