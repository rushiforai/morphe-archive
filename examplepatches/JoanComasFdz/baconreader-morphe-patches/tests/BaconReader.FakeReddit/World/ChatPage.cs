// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>
/// Reddit's chat, <c>https://www.reddit.com/chat</c>, which the "Reddit chat" patch shows in a web view and "E2E fake
/// Reddit" moves to <c>&lt;base&gt;/chat</c> with the rest of www.reddit.com. Reddit's chat is a website behind a login,
/// with no API, so the fake answers it with a plain page of its own, not Reddit's: the heading "Chats", then a link
/// each <see cref="AddLink"/> made, by its text, at its address.
/// </summary>
public sealed class ChatPage
{
    private readonly object sync;
    private readonly List<ChatLink> links = [];

    internal ChatPage(RedditWorld world) => sync = world.Sync;

    /// <summary>The page's heading.</summary>
    public const string Heading = "Chats";

    /// <summary>Adds a link to the page: <paramref name="text"/>, to <paramref name="address"/>.</summary>
    public void AddLink(string text, string address)
    {
        lock (sync)
        {
            links.Add(new ChatLink(text, address));
        }
    }

    /// <summary>The page's links, in the order they were added.</summary>
    public IReadOnlyList<ChatLink> Links
    {
        get
        {
            lock (sync)
            {
                return [.. links];
            }
        }
    }

    internal void Reset() => links.Clear();
}

/// <summary>A link of the chat page: its text and its address.</summary>
public sealed record ChatLink(string Text, string Address);
