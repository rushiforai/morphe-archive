// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure.Device;

/// <summary>
/// Lets the phone reach the fake Reddit, which runs in the test process: the phone's port forwarded to this machine's
/// (<c>adb reverse</c>).
/// </summary>
public static class FakeRedditLink
{
    /// <summary>
    /// Forwards the phone's port of <see cref="E2EDevice.FakeRedditUrl"/> to the same port here, afresh each time: a
    /// forward is lost when adb loses the device, and one still listed can forward nothing after adb reconnects (seen
    /// on the phone: the app's requests hung until the forward was added again).
    /// </summary>
    public static async Task EnsureAsync()
    {
        var port = new Uri(E2EDevice.FakeRedditUrl).Port;
        await Commands.AdbAsync("reverse", "--remove-all");
        await Commands.AdbAsync("reverse", $"tcp:{port}", $"tcp:{port}");
    }
}
