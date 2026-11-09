// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on the dialog of "Select text".</summary>
public static class SelectTextDialogSnapshotAssertions
{
    /// <summary>The dialog shows exactly <paramref name="paragraphs"/>, in this order.</summary>
    public static AssertingThat<SelectTextDialogSnapshot> ShowsTheText(this AssertingThat<SelectTextDialogSnapshot> that, params string[] paragraphs)
    {
        var shown = that.InstanceToAssert.Paragraphs;
        Assert.True(
            shown.SequenceEqual(paragraphs),
            $"The dialog shows {Listed(shown)}, but {Listed(paragraphs)} was expected.");
        return that;
    }

    private static string Listed(IEnumerable<string> paragraphs) =>
        string.Join(", then ", paragraphs.Select(paragraph => $"\"{paragraph}\""));
}
