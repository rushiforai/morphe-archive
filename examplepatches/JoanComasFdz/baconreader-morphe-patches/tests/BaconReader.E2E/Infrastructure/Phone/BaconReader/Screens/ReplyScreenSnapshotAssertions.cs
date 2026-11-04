// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the reply screen.</summary>
public static class ReplyScreenSnapshotAssertions
{
    /// <summary>The screen shows "<paramref name="replyTo"/>" over the text it answers, "<paramref name="replied"/>".</summary>
    public static AssertingThat<ReplyScreenSnapshot> ShowsOver(this AssertingThat<ReplyScreenSnapshot> that, string replyTo, string replied)
    {
        var screen = that.InstanceToAssert;
        Assert.True(
            screen.ReplyTo == replyTo && screen.Replied == replied,
            $"The reply screen shows \"{screen.ReplyTo}\" over \"{screen.Replied}\", but \"{replyTo}\" over \"{replied}\" was expected.");
        return that;
    }
}
