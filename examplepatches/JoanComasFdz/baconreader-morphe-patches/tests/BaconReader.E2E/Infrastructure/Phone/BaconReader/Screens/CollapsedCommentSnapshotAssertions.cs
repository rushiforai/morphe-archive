// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of a collapsed comment.</summary>
public static class CollapsedCommentSnapshotAssertions
{
    /// <summary>The comment shows <paramref name="hidden"/> ("1 hidden comment") under it.</summary>
    public static AssertingThat<CollapsedCommentSnapshot> ShowsHidden(this AssertingThat<CollapsedCommentSnapshot> that, string hidden)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Hidden == hidden,
            $"The comment {comment.Name} shows {(comment.Hidden is null ? "nothing" : $"\"{comment.Hidden}\"")} under it, but \"{hidden}\" was expected.");
        return that;
    }

    /// <summary>The comment hides no comment: it shows no "1 hidden comment" under it.</summary>
    public static AssertingThat<CollapsedCommentSnapshot> HidesNoComment(this AssertingThat<CollapsedCommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(comment.Hidden is null, $"The comment {comment.Name} shows \"{comment.Hidden}\" under it, but no hidden comment was expected.");
        return that;
    }
}
