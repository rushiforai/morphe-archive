// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>RedReader's identity, which "Spoof client" sends Reddit by default: what a test expects Reddit to see.</summary>
public static class RedReader
{
    public const string ClientId = "yH0aTnJEt6qUgGn835B4vg";

    public const string RedirectUri = "redreader://rr_oauth_redir";

    public const string UserAgent = "org.quantumbadger.redreader/1.25.1";
}
