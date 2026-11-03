package net.gtvbox.videoplayer;

import android.util.Log;
import java.util.List;
import z3.p;

/**
 * Hook methods for the Vimu subtitle selection dialog.
 * Called from patched smali to inject addon subtitle options and handle their selection.
 */
public final class VimuSubDialog {
    private static final String TAG = "VimuSubDialog";

    private VimuSubDialog() {}

    public static p.c[] rows(Object fragment, p.c[] stock) {
        try {
            if (stock == null || stock.length < 2) return stock;
            p.c lastRow = stock[stock.length - 1];
            if (lastRow == null || lastRow.d != -999) return stock;

            List<VimuAddonSubs.Entry> addons = VimuTracks.dialogAddons();
            if (addons == null || addons.isEmpty()) return stock;

            int extIdx = -1;
            for (int i = 1; i < stock.length - 1; i++) {
                p.c row = stock[i];
                if (row != null && row.b == 1 && row.d == 0) {
                    extIdx = i;
                    break;
                }
            }

            int loaded = -1;
            if (extIdx != -1) {
                loaded = VimuTracks.dialogLoaded(fragment);
                if (loaded < 0 || loaded >= addons.size()) {
                    loaded = -1;
                }
            }

            if (loaded >= 0 && extIdx != -1) {
                stock[extIdx].c = VimuAddonSubs.rowLabel(addons.get(loaded));
            }

            int[] ids = VimuAddonSubs.rowsToAdd(addons.size(), loaded);
            if (ids == null || ids.length == 0) return stock;

            int L = stock.length;
            p.c[] result = new p.c[L + ids.length];
            
            // Copy 0 to L-2 (the "Off" row and all existing subtitle tracks)
            System.arraycopy(stock, 0, result, 0, L - 1);
            
            // Append new addon rows
            int destIdx = L - 1;
            for (int i = 0; i < ids.length; i++) {
                int addonIndex = ids[i];
                p.c newRow = new p.c();
                newRow.a = stock[0] != null ? stock[0].a : null;
                newRow.b = 1;
                newRow.d = VimuAddonSubs.rowId(addonIndex);
                newRow.c = VimuAddonSubs.rowLabel(addons.get(addonIndex));
                result[destIdx++] = newRow;
            }
            
            // Append the "Download subtitles" row at the end
            result[destIdx] = lastRow;

            return result;
        } catch (Throwable t) {
            Log.w(TAG, "rows modification failed", t);
            return stock;
        }
    }

    public static boolean select(Object fragment, int id) {
        if (!VimuAddonSubs.isRowId(id)) {
            return false;
        }
        try {
            VimuTracks.pickAddon(fragment, VimuAddonSubs.rowIndex(id));
        } catch (Throwable t) {
            Log.w(TAG, "select addon failed", t);
        }
        return true;
    }
}
