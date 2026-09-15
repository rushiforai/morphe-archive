/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.blockauthor;

import android.content.Context;

import app.morphe.extension.tiktok.settings.L10n;

/** Localized UI sentences for the typed block transport outcomes. */
public final class BlockAuthorMessages {
    private BlockAuthorMessages() {
    }

    public static String blockFailure(
            Context context,
            BlockAuthorService.Result result,
            String author
    ) {
        if (result == BlockAuthorService.Result.REJECTED) {
            return L10n.f(context,
                    "TikTok rejected the request to block %1$s", author);
        }
        return L10n.f(context, "Could not confirm block for %1$s", author);
    }

    public static String unblockResult(
            Context context,
            BlockAuthorService.Result result,
            String author
    ) {
        if (result == BlockAuthorService.Result.CONFIRMED) {
            return L10n.f(context, "Unblocked %1$s", author);
        }
        if (result == BlockAuthorService.Result.REJECTED) {
            return L10n.f(context,
                    "TikTok rejected the request to unblock %1$s", author);
        }
        return L10n.f(context, "Could not confirm unblock for %1$s", author);
    }
}
