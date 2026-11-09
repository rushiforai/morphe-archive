// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>What "Embed comment images" shows in a comment's media while it waits for a tap to load it.</summary>
[Union]
public partial record MediaPrompt
{
    public partial record TapToLoadImage;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

public static class MediaPromptShowing
{
    /// <summary>Every prompt a case names.</summary>
    public static IReadOnlyList<MediaPrompt> Listed { get; } = [new MediaPrompt.TapToLoadImage()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this MediaPrompt value) =>
        value.Match(
            tapToLoadImage => "Tap to load image",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="MediaPrompt.Unlisted"/>.</summary>
    public static MediaPrompt ReadMediaPrompt(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new MediaPrompt.Unlisted(shown);
}
