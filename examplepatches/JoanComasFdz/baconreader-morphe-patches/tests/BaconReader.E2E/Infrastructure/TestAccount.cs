// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// The account the scenarios log in with: the fake Reddit's, which BaseE2E creates before each scenario. A Gherkin
/// names it "the test account", never its user name or password.
/// </summary>
public static class TestAccount
{
    public const string UserName = "e2e_user";

    public const string Password = "e2e-password";
}
