package com.travianpatch.notifier;

/**
 * Turns the account's Gold Club flag into what the Hub screen shows. Pure logic (no Android APIs) so
 * it can be checked against sample data off-device.
 */
final class AccountTier {

    private AccountTier() {
    }

    /** goldClub is null when it hasn't been read from the game yet. */
    static String goldClubLine(Boolean goldClub) {
        if (goldClub == null) {
            return "Gold Club: not checked yet";
        }
        return goldClub ? "Gold Club: active" : "Gold Club: not active";
    }
}
