// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the inbox.</summary>
public static class InboxSnapshotAssertions
{
    /// <summary>The inbox shows the messages with <paramref name="subjects"/>, in any order, and no other.</summary>
    public static AssertingThat<InboxSnapshot> ShowsTheMessages(this AssertingThat<InboxSnapshot> that, params string[] subjects)
    {
        var shown = that.InstanceToAssert.Subjects;
        Assert.True(
            shown.Order(StringComparer.Ordinal).SequenceEqual(subjects.Order(StringComparer.Ordinal)),
            $"The inbox shows {(shown.IsEmpty ? "no message" : string.Join(", ", shown.Select(subject => $"\"{subject}\"")))}, but {string.Join(", ", subjects.Select(subject => $"\"{subject}\""))} was expected.");
        return that;
    }
}
