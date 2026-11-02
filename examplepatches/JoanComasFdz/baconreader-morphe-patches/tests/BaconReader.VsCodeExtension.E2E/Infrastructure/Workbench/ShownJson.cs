// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.Json;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>
/// How a page object reads what a script it runs in the page returns (camelCase JSON) into its records: Playwright only
/// builds types with a parameterless constructor, so the script's result comes back as JSON and is read here.
/// </summary>
public static class ShownJson
{
    /// <summary>camelCase names, read case-insensitively.</summary>
    public static JsonSerializerOptions Options { get; } = new(JsonSerializerDefaults.Web);

    /// <summary>Reads <paramref name="json"/> as a <typeparamref name="T"/>.</summary>
    public static T Read<T>(string json) => JsonSerializer.Deserialize<T>(json, Options)!;
}
