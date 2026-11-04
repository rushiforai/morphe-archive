// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a comment's author line, where "Show user avatars" puts the author's avatar.</summary>
public static class CommentAuthorLineSnapshotAssertions
{
    // The avatar isn't text: "Show user avatars" draws it over an object replacement character, then a space.
    private const string Avatar = "￼ ";

    /// <summary>The author line shows no avatar before the name.</summary>
    public static AssertingThat<CommentAuthorLineSnapshot> ShowsNoAvatar(this AssertingThat<CommentAuthorLineSnapshot> that)
    {
        var line = that.InstanceToAssert;
        Assert.True(
            !line.Text.StartsWith(Avatar, StringComparison.Ordinal),
            $"The comment \"{line.Comment}\" shows an avatar before its author's name, \"{line.Text}\", but none was expected.");
        return that;
    }

    /// <summary>The author line shows an avatar before the name "<paramref name="user"/>".</summary>
    public static AssertingThat<CommentAuthorLineSnapshot> ShowsAnAvatarBefore(this AssertingThat<CommentAuthorLineSnapshot> that, string user)
    {
        var line = that.InstanceToAssert;
        Assert.True(
            line.Text.StartsWith(Avatar + user + " ", StringComparison.Ordinal),
            $"The comment \"{line.Comment}\" shows \"{line.Text}\" as its author line, but an avatar before \"{user}\" was expected.");
        return that;
    }

    /// <summary>The author line is taller than it was with the avatar size <paramref name="size"/>, <paramref name="before"/>.</summary>
    public static AssertingThat<CommentAuthorLineSnapshot> IsTallerThanWith(this AssertingThat<CommentAuthorLineSnapshot> that, AvatarSize size, CommentAuthorLineSnapshot before)
    {
        var line = that.InstanceToAssert;
        Assert.True(
            line.Height > before.Height,
            $"The author line of \"{line.Comment}\" is {line.Height} px tall, but taller than with \"{size.ToShownText()}\" ({before.Height} px) was expected.");
        return that;
    }

    /// <summary>Something is drawn where the comment shows its avatar: a faint disc, behind a see-through avatar.</summary>
    public static AssertingThat<AvatarSpotSnapshot> ShowsAFaintDisc(this AssertingThat<AvatarSpotSnapshot> that)
    {
        var spot = that.InstanceToAssert;
        Assert.True(spot.Drawn, $"Nothing is drawn before the author's name of \"{spot.Comment}\", but a faint disc was expected.");
        return that;
    }

    /// <summary>Nothing is drawn where the comment shows its avatar.</summary>
    public static AssertingThat<AvatarSpotSnapshot> ShowsNothing(this AssertingThat<AvatarSpotSnapshot> that)
    {
        var spot = that.InstanceToAssert;
        Assert.True(!spot.Drawn, $"Something is drawn before the author's name of \"{spot.Comment}\", but nothing was expected.");
        return that;
    }
}
