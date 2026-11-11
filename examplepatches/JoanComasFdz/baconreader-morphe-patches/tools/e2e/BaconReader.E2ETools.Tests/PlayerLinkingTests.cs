// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.IO.Compression;
using System.Text;
using BaconReader.E2ETools.Core;
using static BaconReader.E2ETools.Tests.Support.Posts;

namespace BaconReader.E2ETools.Tests;

/// <summary>The data the site's player reads from its link: a run's Gherkin and marks, deflated, in base64url.</summary>
public sealed class PlayerLinkingTests
{
    [Fact]
    public void The_data_is_the_Gherkin_and_each_mark_as_line_seconds_and_failed()
    {
        var run = RunOf("LoginTests", "Logs");
        var entry = run.Entry with { Marks = [new LineMark(1, 0.004, false), new LineMark(3, 12.346, true)] };

        var data = Encoding.UTF8.GetString(Assert.IsType<Optional<byte[]>.Some>(PlayerLinking.WriteData(entry)).Value);

        Assert.Equal("""{"g":"Scenario: Logs","m":[[1,0,0],[3,12.35,1]]}""", data);
    }

    [Fact]
    public void A_run_without_a_Gherkin_has_no_data()
    {
        var run = RunOf("LoginTests", "Logs");

        Assert.IsType<Optional<byte[]>.None>(PlayerLinking.WriteData(run.Entry with { Gherkin = Optional.None<string>() }));
    }

    [Fact]
    public void The_fragment_is_base64url_without_padding() =>
        Assert.Equal("-_8", PlayerLinking.WriteFragment([0xfb, 0xff]));

    [Fact]
    public void The_fragment_inflates_back_to_the_data_as_the_browser_does()
    {
        var data = Encoding.UTF8.GetBytes("""{"g":"Scenario: Logs\n  Given BaconReader is open","m":[]}""");
        using var deflated = new MemoryStream();
        using (var deflating = new DeflateStream(deflated, CompressionLevel.SmallestSize))
        {
            deflating.Write(data);
        }

        var fragment = PlayerLinking.WriteFragment(deflated.ToArray());
        var base64 = fragment.Replace('-', '+').Replace('_', '/');
        using var inflating = new DeflateStream(new MemoryStream(Convert.FromBase64String(base64 + new string('=', (4 - (base64.Length % 4)) % 4))), CompressionMode.Decompress);
        using var inflated = new MemoryStream();
        inflating.CopyTo(inflated);

        Assert.Equal(data, inflated.ToArray());
    }
}
