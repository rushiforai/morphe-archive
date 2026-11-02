// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>An entry of the menu the main screen's "More options" opens, as it names it. A case is added when a test needs it.</summary>
[Union]
public partial record OverflowMenuEntry
{
    public partial record ListView;

    /// <summary>The feed's subreddit's sidebar: greyed out by "Disable unavailable sidebar" on feeds without one.</summary>
    public partial record ViewSidebar;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

public static class OverflowMenuEntryShowing
{
    private static readonly OverflowMenuEntry[] Listed = [new OverflowMenuEntry.ListView(), new OverflowMenuEntry.ViewSidebar()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this OverflowMenuEntry value) =>
        value.Match(
            listView => "List View",
            viewSidebar => "View Sidebar",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="OverflowMenuEntry.Unlisted"/>.</summary>
    public static OverflowMenuEntry ReadOverflowMenuEntry(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new OverflowMenuEntry.Unlisted(shown);
}
