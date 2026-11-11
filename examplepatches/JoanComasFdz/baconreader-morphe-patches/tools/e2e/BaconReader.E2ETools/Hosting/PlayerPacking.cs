// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.IO.Compression;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Hosting;

/// <summary>Packs each run's Gherkin and marks for its player link (<see cref="PlayerLinking"/>): the deflating is the host's.</summary>
public static class PlayerPacking
{
    public static ScenarioEntry Pack(ScenarioEntry entry) =>
        PlayerLinking.WriteData(entry).Match(
            data => entry with { PlayerData = PlayerLinking.WriteFragment(Deflate(data.Value)) },
            _ => entry);

    private static byte[] Deflate(byte[] data)
    {
        using var deflated = new MemoryStream();
        using (var deflating = new DeflateStream(deflated, CompressionLevel.SmallestSize))
        {
            deflating.Write(data);
        }

        return deflated.ToArray();
    }
}
