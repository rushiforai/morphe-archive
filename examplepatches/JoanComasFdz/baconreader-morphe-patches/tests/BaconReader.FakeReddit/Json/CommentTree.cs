// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Json;

/// <summary>
/// Which comments of a post a comment tree shows; the others are behind a "load more comments" (kind <c>more</c>) under
/// their parent. Reddit sends about 200 comments unless the request's <c>limit</c> asks for more, up to 500: the
/// highest-ranked ones, a level at a time, so the top-level comments come before any reply.
/// </summary>
public sealed class CommentTree
{
    /// <summary>Reddit's default when the request has no <c>limit</c>.</summary>
    public const int DefaultLimit = 200;

    /// <summary>The most Reddit sends, whatever the <c>limit</c>.</summary>
    public const int MaxLimit = 500;

    private readonly HashSet<Comment>? shown;
    private readonly Func<IEnumerable<Comment>, IEnumerable<Comment>> order;

    private CommentTree(HashSet<Comment>? shown, bool flat, Func<IEnumerable<Comment>, IEnumerable<Comment>>? order = null)
    {
        this.shown = shown;
        IsFlat = flat;
        this.order = order ?? (comments => comments);
    }

    /// <summary>Every comment: a comment as a test builds it, or a thread a link to one comment shows.</summary>
    public static CommentTree Whole { get; } = new(null, flat: false);

    /// <summary>No replies at all: comments as <c>api/morechildren</c> sends them, flat, each naming its parent.</summary>
    public static CommentTree Flat { get; } = new(null, flat: true);

    /// <summary>Whether its things leave out every reply.</summary>
    public bool IsFlat { get; }

    /// <summary>
    /// The first <paramref name="limit"/> comments of <paramref name="comments"/> (null: <see cref="DefaultLimit"/>;
    /// at most <see cref="MaxLimit"/>), level by level, each level in <paramref name="order"/>.
    /// </summary>
    public static CommentTree Limited(IEnumerable<Comment> comments, int? limit, Func<IEnumerable<Comment>, IEnumerable<Comment>> order)
    {
        var left = Math.Clamp(limit ?? DefaultLimit, 1, MaxLimit);
        var shown = new HashSet<Comment>();
        var level = order(comments).ToList();
        while (level.Count > 0 && left > 0)
        {
            var next = new List<Comment>();
            foreach (var comment in level)
            {
                if (left == 0)
                {
                    break;
                }

                shown.Add(comment);
                left--;
                next.AddRange(order(comment.Replies));
            }

            level = next;
        }

        return new CommentTree(shown, flat: false, order);
    }

    /// <summary>The comments of one parent in the tree's order: the sort the request asked for.</summary>
    public IEnumerable<Comment> InOrder(IEnumerable<Comment> comments) => order(comments);

    /// <summary>Whether <paramref name="comment"/> is in the tree, rather than behind a "load more comments".</summary>
    public bool Shows(Comment comment) => shown is null || shown.Contains(comment);
}
