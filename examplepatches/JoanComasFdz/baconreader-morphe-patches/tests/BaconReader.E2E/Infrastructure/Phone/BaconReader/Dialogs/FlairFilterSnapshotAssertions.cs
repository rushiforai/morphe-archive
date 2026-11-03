// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on "Show posts with flair".</summary>
public static class FlairFilterSnapshotAssertions
{
    /// <summary>The dialog offers exactly the flairs <paramref name="flairs"/>, in this order.</summary>
    public static AssertingThat<FlairFilterSnapshot> Offers(this AssertingThat<FlairFilterSnapshot> that, params string[] flairs)
    {
        var shown = that.InstanceToAssert.Flairs.Select(choice => choice.Flair).ToArray();
        Assert.True(shown.SequenceEqual(flairs), $"\"Show posts with flair\" offers {Listed(shown)}, but {Listed(flairs)} was expected, in this order.");
        return that;
    }

    /// <summary>The dialog ticks exactly the flairs <paramref name="flairs"/>; none, without any.</summary>
    public static AssertingThat<FlairFilterSnapshot> Ticks(this AssertingThat<FlairFilterSnapshot> that, params string[] flairs)
    {
        var ticked = that.InstanceToAssert.Flairs.Where(choice => choice.Ticked).Select(choice => choice.Flair).ToArray();
        Assert.True(
            ticked.Order().SequenceEqual(flairs.Order()),
            $"\"Show posts with flair\" ticks {(ticked.Length == 0 ? "no flair" : Listed(ticked))}, but {(flairs.Length == 0 ? "none" : Listed(flairs))} was expected.");
        return that;
    }

    /// <summary>The dialog says <paramref name="message"/> instead of offering flairs.</summary>
    public static AssertingThat<FlairFilterSnapshot> Says(this AssertingThat<FlairFilterSnapshot> that, string message)
    {
        var snapshot = that.InstanceToAssert;
        Assert.True(
            snapshot.Message == message && snapshot.Flairs.IsEmpty,
            snapshot.Message is null
                ? $"\"Show posts with flair\" offers {Listed(snapshot.Flairs.Select(choice => choice.Flair))}, but the message \"{message}\" was expected."
                : $"\"Show posts with flair\" says \"{snapshot.Message}\", but \"{message}\" was expected.");
        return that;
    }

    private static string Listed(IEnumerable<string> flairs) => string.Join(", ", flairs.Select(flair => $"\"{flair}\""));
}
