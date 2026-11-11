// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// Reddit's emotes, whose GIFs the fake Reddit serves too ("E2E fake Reddit" moves www.redditstatic.com to it), in the
/// Gherkins' words. Reddit sends the same placeholder, the Snoomoji "dizzy_face", for every emote
/// (<see cref="RedditEmotes"/>).
/// </summary>
public sealed partial class Reddit
{
    /// <summary>"Reddit served the Snoomoji "&lt;name&gt;"": the statuses of the requests for its GIF, oldest first.</summary>
    public SnoomojiRequestsSnapshot ReadRequestsForTheSnoomoji(string name)
    {
        var path = "/_media/" + RedditEmotes.SnoomojiGif(name);
        return Checked<SnoomojiRequestsSnapshot>(new(name, [.. world.Requests.Where(request => request.Method == "GET" && request.Path == path).Select(request => request.Status)]), name);
    }

    /// <summary>Waits until Reddit served the Snoomoji <paramref name="name"/>'s GIF: the patch loads it once its comment shows.</summary>
    public Task WaitUntilTheSnoomojiIsServedAsync(string name) =>
        WaitUntilAsync(
            () => ReadRequestsForTheSnoomoji(name).Statuses.Contains(200),
            TimeSpan.FromSeconds(15),
            $"Reddit didn't serve the Snoomoji \"{name}\" within 15 s.");
}

/// <summary>The statuses of the requests for the GIF of the Snoomoji <c>Name</c>, oldest first.</summary>
public sealed record SnoomojiRequestsSnapshot(string Name, ImmutableArray<int> Statuses);
