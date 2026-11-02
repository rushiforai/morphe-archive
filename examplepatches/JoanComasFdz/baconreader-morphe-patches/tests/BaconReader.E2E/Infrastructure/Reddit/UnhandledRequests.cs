// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// The requests the app made that the fake Reddit couldn't answer: each one is Reddit data a scenario's screen may miss
/// or an endpoint the fake lacks, so BaseE2E fails the scenario that made it. <see cref="Ignored"/> lists the few no
/// scenario cares about.
/// </summary>
public static class UnhandledRequests
{
    /// <summary>
    /// Requests no scenario cares about, by path, each with why: none yet. A path joins only when a scenario shows
    /// that BaconReader makes the request and that its answer changes nothing the scenarios check.
    /// </summary>
    public static readonly ImmutableDictionary<string, string> Ignored = ImmutableDictionary<string, string>.Empty;

    /// <summary>What the app asked of <paramref name="world"/> that it couldn't answer, but the ignored requests.</summary>
    public static ImmutableArray<RecordedRequest> Of(RedditWorld world) =>
        [.. world.Unhandled.Where(request => !Ignored.ContainsKey(request.Path))];

    /// <summary>The failure message: each unhandled request, as the app sent it.</summary>
    public static string Describe(ImmutableArray<RecordedRequest> unhandled) =>
        "The app made requests the fake Reddit doesn't answer (it said 404); add the endpoint, or the data the scenario's "
        + "Given is missing:\n"
        + string.Join('\n', unhandled.Select(request => $"  {request.Method} {request.Path}{request.Query}"));
}
