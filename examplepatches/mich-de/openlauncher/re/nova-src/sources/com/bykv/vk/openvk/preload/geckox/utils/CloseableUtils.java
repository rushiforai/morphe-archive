package com.bykv.vk.openvk.preload.geckox.utils;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import java.io.Closeable;
import java.io.IOException;

/* loaded from: classes2.dex */
public class CloseableUtils {
    public static boolean close(Closeable closeable) throws IOException {
        if (closeable == null) {
            return true;
        }
        try {
            closeable.close();
            return true;
        } catch (IOException e3) {
            GeckoLogger.e("gecko-debug-tag", "close:", e3);
            return false;
        }
    }

    public static boolean close(Cursor cursor) {
        if (cursor == null) {
            return true;
        }
        try {
            cursor.close();
            return true;
        } catch (Exception e3) {
            GeckoLogger.e("gecko-debug-tag", "close:", e3);
            return false;
        }
    }

    public static boolean close(SQLiteDatabase sQLiteDatabase) {
        if (sQLiteDatabase == null) {
            return true;
        }
        try {
            sQLiteDatabase.close();
            return true;
        } catch (Exception e3) {
            GeckoLogger.e("gecko-debug-tag", "close:", e3);
            return false;
        }
    }
}
