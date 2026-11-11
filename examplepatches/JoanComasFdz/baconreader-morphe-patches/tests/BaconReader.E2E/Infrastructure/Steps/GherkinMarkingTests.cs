// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Runtime.CompilerServices;

namespace BaconReader.E2E.Infrastructure.Steps;

/// <summary>
/// <see cref="GherkinMarking.FindLine"/> finds the statement of an async scenario that asked, after an await too, the way a
/// scenario asks BaseE2E for <c>Phone</c>.
/// </summary>
public sealed class GherkinMarkingTests : AskingAsBaseE2EDoes
{
    [Fact]
    public async Task FindLine_AfterAnAwait_IsTheLineOfTheStatementThatAsked()
    {
        await Task.Yield();
        var (found, expected) = (Ask(), Here());

        Assert.Equal(expected, found);
    }

    [Fact]
    public void FindLine_FromOutsideTheScenario_IsNone()
    {
        var found = GherkinMarking.FindLine(typeof(ScenarioStepsTests));

        Assert.Null(found);
    }

    private static int Here([CallerLineNumber] int line = 0) => line;
}

/// <summary>Asks as BaseE2E's <c>Phone</c> does: from a base class of the scenario.</summary>
public abstract class AskingAsBaseE2EDoes
{
    [MethodImpl(MethodImplOptions.NoInlining)]
    protected int? Ask() => GherkinMarking.FindLine(GetType());
}
