// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Reddit's chat, <c>www.reddit.com/chat</c> and its pages, which the "Reddit chat" patch loads in a web view: the
/// fake's own plain page (<see cref="ChatPage"/>), not Reddit's chat.
/// </summary>
internal static class Chat
{
    public static void Map(WebApplication app, RedditWorld world)
    {
        app.MapGet("/chat", () => Page(world));
        app.MapGet("/chat/{**rest}", () => Page(world));
    }

    private static IResult Page(RedditWorld world)
    {
        var html = new StringBuilder();
        html.Append("<!DOCTYPE html><html><head><meta name=\"viewport\" content=\"width=device-width\"><title>Reddit chat</title></head><body>");
        html.Append($"<h1>{ChatPage.Heading}</h1>");
        foreach (var link in world.Chat.Links)
        {
            html.Append($"<p><a href=\"{WebUtility.HtmlEncode(link.Address)}\">{WebUtility.HtmlEncode(link.Text)}</a></p>");
        }

        html.Append("</body></html>");
        return Results.Content(html.ToString(), "text/html; charset=utf-8");
    }
}
