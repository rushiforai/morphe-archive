// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>A button of the main screen's toolbar, as its description names it. A case is added when a test needs it.</summary>
[Union]
public partial record ToolbarButton
{
    /// <summary>Loads the feed again, or the chat.</summary>
    public partial record Refresh;

    /// <summary>Opens the search.</summary>
    public partial record Search;

    /// <summary>Opens the toolbar's menu.</summary>
    public partial record MoreOptions;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="ToolbarButton"/>: the only place those strings live.</summary>
public static class ToolbarButtonShowing
{
    /// <summary>The buttons the toolbar can show, in its order.</summary>
    public static readonly ToolbarButton[] Listed = [new ToolbarButton.Search(), new ToolbarButton.Refresh(), new ToolbarButton.MoreOptions()];

    /// <summary>What the app shows for <paramref name="value"/>: its description.</summary>
    public static string ToShownText(this ToolbarButton value) =>
        value.Match(
            refresh => "Refresh",
            search => "Search",
            moreOptions => "More options",
            unlisted => unlisted.Shown);
}
