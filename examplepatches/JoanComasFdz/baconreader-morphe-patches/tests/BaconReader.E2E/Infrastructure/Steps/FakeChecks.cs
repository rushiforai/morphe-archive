// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Frozen;
using System.Reflection;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Steps;

/// <summary>
/// Which Then lines check what the fake Reddit saw, not the phone's screen: those whose assertions are the fake's, the
/// <c>…SnapshotAssertions</c> classes of <see cref="Reddit"/>'s namespace. A recording shows the setup page for them
/// (<see cref="GherkinMarking"/>), with the snapshots they check (<see cref="IsChecked"/>).
/// </summary>
public static class FakeChecks
{
    private static readonly string FakeNamespace = typeof(Reddit.Reddit).Namespace!;

    private static readonly MethodInfo[] Assertions = [.. typeof(FakeChecks).Assembly.GetTypes()
        .Where(type => type is { IsAbstract: true, IsSealed: true } && type.Name.EndsWith("SnapshotAssertions", StringComparison.Ordinal))
        .SelectMany(type => type.GetMethods(BindingFlags.Public | BindingFlags.Static))];

    private static readonly FrozenSet<string> FakeNames = Assertions
        .Where(method => method.DeclaringType!.Namespace == FakeNamespace).Select(method => method.Name).ToFrozenSet();

    private static readonly FrozenSet<string> PhoneNames = Assertions
        .Where(method => method.DeclaringType!.Namespace != FakeNamespace).Select(method => method.Name).ToFrozenSet();

    private static readonly FrozenSet<Type> CheckedTypes = Assertions
        .Where(method => method.DeclaringType!.Namespace == FakeNamespace)
        .Select(method => method.GetParameters().FirstOrDefault()?.ParameterType)
        .Where(type => type is { IsGenericType: true } && type.GetGenericTypeDefinition() == typeof(AssertingThat<>))
        .Select(type => type!.GetGenericArguments()[0])
        .ToFrozenSet();

    /// <summary>Whether the Then line of <paramref name="assertion"/> checks what the fake saw.</summary>
    public static bool IsAboutTheFake(Assertion assertion) =>
        assertion.Names.Any(FakeNames.Contains) && !assertion.Names.Any(PhoneNames.Contains);

    /// <summary>Whether a Then line checks snapshots of <paramref name="snapshot"/>'s type: the setup page shows those.</summary>
    public static bool IsChecked(Type snapshot) => CheckedTypes.Contains(snapshot);
}
