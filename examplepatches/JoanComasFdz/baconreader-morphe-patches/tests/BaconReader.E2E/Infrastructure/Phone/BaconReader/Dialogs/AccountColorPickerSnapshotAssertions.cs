// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on "Account colors"' color picker.</summary>
public static class AccountColorPickerSnapshotAssertions
{
    /// <summary>The dialog is titled <paramref name="title"/> and offers <paramref name="choices"/>, in this order, and nothing else.</summary>
    public static AssertingThat<AccountColorPickerSnapshot> Offers(this AssertingThat<AccountColorPickerSnapshot> that, string title, params AccountColorChoice[] choices)
    {
        var shown = that.InstanceToAssert;
        Assert.True(shown.Title == title, $"The color picker is titled \"{shown.Title}\", but \"{title}\" was expected.");
        Assert.True(
            shown.Choices.SequenceEqual(choices),
            $"\"{shown.Title}\" offers {Listed(shown.Choices)}, but {Listed(choices)} was expected.");
        return that;
    }

    private static string Listed(IEnumerable<AccountColorChoice> choices) =>
        string.Join(", ", choices.Select(choice => $"\"{choice.ToShownText()}\""));
}
