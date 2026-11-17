// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on a dialog.</summary>
public static class DialogSnapshotAssertions
{
    /// <summary>The dialog <paramref name="title"/> says <paramref name="message"/>.</summary>
    public static AssertingThat<DialogSnapshot> Says(this AssertingThat<DialogSnapshot> that, string title, string message)
    {
        var shown = that.InstanceToAssert;
        Assert.True(
            shown.Title == title && shown.Message == message,
            $"The dialog \"{shown.Title}\" says \"{shown.Message}\", but \"{title}\" saying \"{message}\" was expected.");
        return that;
    }
}
