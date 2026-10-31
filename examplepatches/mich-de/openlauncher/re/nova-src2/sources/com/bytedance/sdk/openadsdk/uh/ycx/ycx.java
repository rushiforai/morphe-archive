package com.bytedance.sdk.openadsdk.uh.ycx;

import android.content.ContentResolver;
import android.database.CharArrayBuffer;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx implements Cursor {
    int sya = 0;
    Map<String, List<String>> ycx;

    /* renamed from: zb, reason: collision with root package name */
    String[] f27095zb;

    public ycx(Map<String, List<String>> map) {
        if (map == null || map.keySet() == null) {
            this.ycx = new HashMap();
            return;
        }
        this.ycx = map;
        try {
            this.f27095zb = (String[]) map.keySet().toArray(new String[map.keySet().size()]);
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTb1gw4w=", "du89thauesiS", "B+cjnBfi", 27);
        }
    }

    @Override // android.database.Cursor, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }

    @Override // android.database.Cursor
    public void copyStringToBuffer(int i5, CharArrayBuffer charArrayBuffer) {
    }

    @Override // android.database.Cursor
    public void deactivate() {
    }

    @Override // android.database.Cursor
    public byte[] getBlob(int i5) {
        return new byte[0];
    }

    @Override // android.database.Cursor
    public int getColumnCount() {
        String[] strArr = this.f27095zb;
        if (strArr != null) {
            return strArr.length;
        }
        return 0;
    }

    @Override // android.database.Cursor
    public int getColumnIndex(String str) {
        String[] strArr = this.f27095zb;
        if (strArr == null || strArr.length == 0) {
            return -1;
        }
        int i5 = 0;
        while (true) {
            String[] strArr2 = this.f27095zb;
            if (i5 >= strArr2.length) {
                return 0;
            }
            if (str.equals(strArr2[i5])) {
                return i5;
            }
            i5++;
        }
    }

    @Override // android.database.Cursor
    public int getColumnIndexOrThrow(String str) throws IllegalArgumentException {
        return 0;
    }

    @Override // android.database.Cursor
    public String getColumnName(int i5) {
        if (i5 < 0) {
            return b.f42142b;
        }
        String[] strArr = this.f27095zb;
        return i5 < strArr.length ? strArr[i5] : b.f42142b;
    }

    @Override // android.database.Cursor
    public String[] getColumnNames() {
        return this.f27095zb;
    }

    @Override // android.database.Cursor
    public int getCount() {
        try {
            String[] strArr = this.f27095zb;
            if (strArr != null && strArr.length != 0) {
                return this.ycx.get(strArr[0]).size();
            }
            return 0;
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTb1gw4w=", "du89thauesiS", "XOs5tgypZ9M=", 39);
            return 0;
        }
    }

    @Override // android.database.Cursor
    public double getDouble(int i5) {
        try {
            return Double.parseDouble(getString(i5));
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTb1gw4w=", "du89thauesiS", "XOs5sQypa8uF", Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE);
            return 0.0d;
        }
    }

    @Override // android.database.Cursor
    public Bundle getExtras() {
        return null;
    }

    @Override // android.database.Cursor
    public float getFloat(int i5) {
        try {
            return Float.parseFloat(getString(i5));
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTb1gw4w=", "du89thauesiS", "XOs5sw+zaNM=", Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE);
            return 0.0f;
        }
    }

    @Override // android.database.Cursor
    public int getInt(int i5) {
        try {
            return Integer.parseInt(getString(i5));
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTb1gw4w=", "du89thauesiS", "XOs5vA2o", 195);
            return 0;
        }
    }

    @Override // android.database.Cursor
    public long getLong(int i5) {
        try {
            return Long.parseLong(getString(i5));
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTb1gw4w=", "du89thauesiS", "XOs5uQyybg==", Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE);
            return 0L;
        }
    }

    @Override // android.database.Cursor
    public Uri getNotificationUri() {
        return null;
    }

    @Override // android.database.Cursor
    public int getPosition() {
        return this.sya;
    }

    @Override // android.database.Cursor
    public short getShort(int i5) {
        try {
            return Short.parseShort(getString(i5));
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTb1gw4w=", "du89thauesiS", "XOs5pguze9M=", 186);
            return (short) 0;
        }
    }

    @Override // android.database.Cursor
    public String getString(int i5) {
        return (i5 < 0 || i5 >= getColumnCount()) ? b.f42142b : this.ycx.get(this.f27095zb[i5]).get(getPosition());
    }

    @Override // android.database.Cursor
    public int getType(int i5) {
        return 0;
    }

    @Override // android.database.Cursor
    public boolean getWantsAllOnMoveCalls() {
        return false;
    }

    @Override // android.database.Cursor
    public boolean isAfterLast() {
        return false;
    }

    @Override // android.database.Cursor
    public boolean isBeforeFirst() {
        return false;
    }

    @Override // android.database.Cursor
    public boolean isClosed() {
        return false;
    }

    @Override // android.database.Cursor
    public boolean isFirst() {
        return this.sya == 0;
    }

    @Override // android.database.Cursor
    public boolean isLast() {
        return this.sya == getCount() - 1;
    }

    @Override // android.database.Cursor
    public boolean isNull(int i5) {
        return getString(i5) == null;
    }

    @Override // android.database.Cursor
    public boolean move(int i5) {
        if (this.sya + i5 >= getCount()) {
            return false;
        }
        this.sya += i5;
        return true;
    }

    @Override // android.database.Cursor
    public boolean moveToFirst() {
        if (getCount() <= 0) {
            return false;
        }
        this.sya = 0;
        return true;
    }

    @Override // android.database.Cursor
    public boolean moveToLast() {
        if (getCount() <= 0) {
            return false;
        }
        this.sya = this.ycx.get(this.f27095zb[0]).size() - 1;
        return true;
    }

    @Override // android.database.Cursor
    public boolean moveToNext() {
        if (this.sya + 1 >= getCount()) {
            return false;
        }
        this.sya++;
        return true;
    }

    @Override // android.database.Cursor
    public boolean moveToPosition(int i5) {
        if (i5 >= getCount()) {
            return false;
        }
        this.sya = i5;
        return true;
    }

    @Override // android.database.Cursor
    public boolean moveToPrevious() {
        int i5 = this.sya;
        if (i5 - 1 < 0) {
            return false;
        }
        this.sya = i5 - 1;
        return true;
    }

    @Override // android.database.Cursor
    public void registerContentObserver(ContentObserver contentObserver) {
    }

    @Override // android.database.Cursor
    public void registerDataSetObserver(DataSetObserver dataSetObserver) {
    }

    @Override // android.database.Cursor
    public boolean requery() {
        return false;
    }

    @Override // android.database.Cursor
    public Bundle respond(Bundle bundle) {
        return null;
    }

    @Override // android.database.Cursor
    public void setExtras(Bundle bundle) {
    }

    @Override // android.database.Cursor
    public void setNotificationUri(ContentResolver contentResolver, Uri uri) {
    }

    @Override // android.database.Cursor
    public void unregisterContentObserver(ContentObserver contentObserver) {
    }

    @Override // android.database.Cursor
    public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
    }
}
