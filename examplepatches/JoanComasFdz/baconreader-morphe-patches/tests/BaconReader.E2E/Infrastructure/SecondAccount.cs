// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure;

/// <summary>
/// An account a scenario's Given makes besides the test account: "Reddit has a second account "&lt;name&gt;"". Its
/// password is made from its name, so the Gherkin names only the account: "I type the password of "&lt;name&gt;"".
/// </summary>
public static class SecondAccount
{
    /// <summary>The password the fake Reddit takes for the second account <paramref name="name"/>.</summary>
    public static string PasswordOf(string name) => name + "-password";
}
