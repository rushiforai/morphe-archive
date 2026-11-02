// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks on the messages Reddit got marked as read.</summary>
public static class RedditReadMessagesSnapshotAssertions
{
    /// <summary>Reddit got exactly the messages with <paramref name="subjects"/> marked as read, each once, in any order.</summary>
    public static AssertingThat<RedditReadMessagesSnapshot> MarkedAsRead(this AssertingThat<RedditReadMessagesSnapshot> that, params string[] subjects)
    {
        var read = that.InstanceToAssert.Subjects;
        Assert.True(
            read.Order(StringComparer.Ordinal).SequenceEqual(subjects.Order(StringComparer.Ordinal)),
            $"Reddit got {(read.IsEmpty ? "no message" : string.Join(", ", read.Select(subject => $"\"{subject}\"")))} marked as read, but {string.Join(", ", subjects.Select(subject => $"\"{subject}\""))} was expected.");
        return that;
    }
}
