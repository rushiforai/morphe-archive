// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on Reddit's page asking to connect an app with the account.</summary>
public static class ConnectSnapshotAssertions
{
    /// <summary>Reddit asks to connect <paramref name="app"/>, the app "Spoof client" logs in as.</summary>
    public static AssertingThat<ConnectSnapshot> AsksToConnect(this AssertingThat<ConnectSnapshot> that, string app)
    {
        var request = that.InstanceToAssert.Request;
        Assert.True(
            request.Contains($"{app} would like to connect", StringComparison.Ordinal),
            $"Reddit asks \"{request}\", but to connect \"{app}\" was expected.");
        return that;
    }

    /// <summary>Reddit asks it of the test account (<see cref="TestAccount"/>): the login went through.</summary>
    public static AssertingThat<ConnectSnapshot> WithTheTestAccount(this AssertingThat<ConnectSnapshot> that)
    {
        var request = that.InstanceToAssert.Request;
        Assert.True(
            request.Contains($"Hey, {TestAccount.UserName}!", StringComparison.Ordinal),
            $"Reddit asks \"{request}\", but of the test account, \"{TestAccount.UserName}\", was expected.");
        return that;
    }
}
