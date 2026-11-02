// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// What a test checks of what a comment reads as to accessibility: with "Hide formatted spoilers", a hidden spoiler reads
/// as "spoiler", since its box only paints over its text.
/// </summary>
public static class CommentReadingSnapshotAssertions
{
    /// <summary>The comment, a spoiler, is hidden: it reads as "spoiler".</summary>
    public static AssertingThat<CommentReadingSnapshot> IsHiddenBehindASpoiler(this AssertingThat<CommentReadingSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.ReadAs == "spoiler",
            $"The comment \"{comment.Text}\" reads as \"{comment.ReadAs}\", but it was expected hidden, read as \"spoiler\".");
        return that;
    }

    /// <summary>The comment shows its spoiler: it reads as its text.</summary>
    public static AssertingThat<CommentReadingSnapshot> ShowsItsSpoiler(this AssertingThat<CommentReadingSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.ReadAs == comment.Text,
            $"The comment \"{comment.Text}\" reads as \"{comment.ReadAs}\", but its spoiler was expected shown, read as its text.");
        return that;
    }
}
