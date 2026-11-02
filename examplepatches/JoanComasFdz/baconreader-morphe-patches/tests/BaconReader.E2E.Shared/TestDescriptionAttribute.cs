// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Shared;

/// <summary>
/// The Gherkin a scenario implements, word for word as the PR's acceptance criterion writes it (E2E-TEST-CODE-RULES.md,
/// rule a): its screen tags, its <c>Scenario:</c> title (the method's name) and its rounds of When and Then. The PR's
/// e2e comment shows it under the scenario's title, above its GIFs.
/// </summary>
[AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
public sealed class TestDescriptionAttribute(string gherkin) : Attribute
{
    /// <summary>The Gherkin text.</summary>
    public string Gherkin { get; } = gherkin;
}
