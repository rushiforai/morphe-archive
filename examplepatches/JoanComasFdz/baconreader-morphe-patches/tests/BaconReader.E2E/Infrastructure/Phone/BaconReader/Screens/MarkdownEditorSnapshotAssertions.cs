// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a text box "Markdown editor" made.</summary>
public static class MarkdownEditorSnapshotAssertions
{
    /// <summary>The bar offers exactly <paramref name="formats"/>, in this order.</summary>
    public static AssertingThat<MarkdownBarSnapshot> ShowsTheFormats(this AssertingThat<MarkdownBarSnapshot> that, params MarkdownFormat[] formats)
    {
        var shown = that.InstanceToAssert.Formats;
        Assert.True(
            shown.SequenceEqual(formats),
            $"The bar shows the formats {Names(shown)}, but {Names(formats)}, in this order, were expected.");
        return that;
    }

    /// <summary>The text box holds exactly "<paramref name="text"/>".</summary>
    public static AssertingThat<MarkdownTextBoxSnapshot> ShowsTheText(this AssertingThat<MarkdownTextBoxSnapshot> that, string text)
    {
        var shown = that.InstanceToAssert.Text;
        Assert.True(shown == text, $"The text box shows \"{shown}\", but \"{text}\" was expected.");
        return that;
    }

    /// <summary>The counter shows "<paramref name="counter"/>".</summary>
    public static AssertingThat<MarkdownTextBoxSnapshot> ShowsTheCounter(this AssertingThat<MarkdownTextBoxSnapshot> that, string counter)
    {
        var shown = that.InstanceToAssert.Counter;
        Assert.True(
            shown == counter,
            shown is null ? $"No counter shows, but \"{counter}\" was expected." : $"The counter shows \"{shown}\", but \"{counter}\" was expected.");
        return that;
    }

    private static string Names(IEnumerable<MarkdownFormat> formats) => string.Join(", ", formats.Select(format => $"\"{format.ToShownText()}\""));
}
