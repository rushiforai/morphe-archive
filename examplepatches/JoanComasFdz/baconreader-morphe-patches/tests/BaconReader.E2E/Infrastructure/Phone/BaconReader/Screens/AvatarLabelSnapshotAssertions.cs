// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// What a test checks on the reply screen and the inbox, where "Show user avatars" puts the author's avatar before the
/// name: an object replacement character, "￼ ", that the avatar is drawn over.
/// </summary>
public static class AvatarLabelSnapshotAssertions
{
    private const string Avatar = "￼ ";

    /// <summary>
    /// The reply screen shows "<paramref name="replyTo"/>", such as "Reply to avatar_user in r/e2e as e2e_user", with the
    /// avatar of "<paramref name="user"/>" before the name.
    /// </summary>
    public static AssertingThat<ReplyScreenSnapshot> ShowsWithAnAvatarBefore(this AssertingThat<ReplyScreenSnapshot> that, string replyTo, string user)
    {
        var shown = that.InstanceToAssert.ReplyTo;
        var expected = replyTo.Replace(user, Avatar + user, StringComparison.Ordinal);
        Assert.True(shown == expected, $"The reply screen shows \"{shown}\", but \"{replyTo}\" with an avatar before \"{user}\" was expected.");
        return that;
    }

    /// <summary>
    /// The message's label shows "<paramref name="label"/>", such as "Hello: from e2e_sender", with the avatar of
    /// "<paramref name="user"/>" before the name.
    /// </summary>
    public static AssertingThat<InboxMessageSnapshot> ShowsWithAnAvatarBefore(this AssertingThat<InboxMessageSnapshot> that, string label, string user)
    {
        var shown = that.InstanceToAssert.Label;
        var expected = label.Replace(user, Avatar + user, StringComparison.Ordinal);
        Assert.True(shown == expected, $"The message \"{that.InstanceToAssert.Subject}\" shows \"{shown}\", but \"{label}\" with an avatar before \"{user}\" was expected.");
        return that;
    }
}
