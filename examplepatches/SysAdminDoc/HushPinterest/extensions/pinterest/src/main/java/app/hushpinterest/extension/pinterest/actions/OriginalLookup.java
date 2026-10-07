/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import java.io.IOException;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Asks Pinterest's media host whether it keeps the original behind a size Pinterest supplied.
 * Pinterest's app requests display sizes only, so most live pins reach a download this way. Each
 * question is a HEAD request to the supplied host that follows no redirect, and only a 200 with
 * the image type the address names counts. Worker threads only.
 */
final class OriginalLookup {
    private OriginalLookup() {}

    /** Tests replace it so they never reach the network. */
    static volatile PinTransfer.Connection connection = PinTransfer.NETWORK;

    /**
     * The original image behind a stand-in size when the media host has one, otherwise the
     * stand-in itself. With a suffix, only an original of that type counts, for a file whose name
     * and type were already chosen.
     */
    static PinMedia.Source find(PinMedia.Source standIn, String suffix) {
        for (PinMedia.Source original : PinMedia.originals(standIn)) {
            if (suffix != null && !suffix.equals(original.suffix)) continue;
            try {
                if (PinTransfer.present(original, connection)) {
                    HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "original image found on media host");
                    return original;
                }
            } catch (IOException | RuntimeException unreachable) {
                // One failed question means the host can't answer now. Don't wait out the rest.
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "original image lookup unreachable");
                return standIn;
            }
        }
        HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "largest supplied size used");
        return standIn;
    }
}
