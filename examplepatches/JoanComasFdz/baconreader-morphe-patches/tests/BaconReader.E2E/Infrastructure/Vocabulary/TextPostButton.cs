// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>The button of a text post in the post list that opens its text ("Text post icon"), as its description names it. A case is added when a test needs it.</summary>
[Union]
public partial record TextPostButton
{
    /// <summary>While the text is closed: its chevron points down.</summary>
    public partial record ShowPostText;

    /// <summary>While the text is open: its chevron points up.</summary>
    public partial record HidePostText;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="TextPostButton"/>: the only place those strings live.</summary>
public static class TextPostButtonShowing
{
    private static readonly TextPostButton[] Listed = [new TextPostButton.ShowPostText(), new TextPostButton.HidePostText()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this TextPostButton value) =>
        value.Match(
            showPostText => "Show post text",
            hidePostText => "Hide post text",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="TextPostButton.Unlisted"/>.</summary>
    public static TextPostButton ReadTextPostButton(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new TextPostButton.Unlisted(shown);
}
