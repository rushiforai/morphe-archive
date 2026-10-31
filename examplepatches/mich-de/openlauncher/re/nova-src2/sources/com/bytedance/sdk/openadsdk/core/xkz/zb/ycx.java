package com.bytedance.sdk.openadsdk.core.xkz.zb;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.xkz.zb.sya;

/* loaded from: classes2.dex */
public class ycx extends sya implements Comparable<ycx> {
    public long ycx;

    /* renamed from: com.bytedance.sdk.openadsdk.core.xkz.zb.ycx$ycx, reason: collision with other inner class name */
    public static class C0093ycx {
        private sya.EnumC0092sya sya = sya.EnumC0092sya.TRACKING_URL;
        private final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final long f26504zb;

        public C0093ycx(String str, long j11) {
            this.ycx = str;
            this.f26504zb = j11;
        }

        public ycx ycx() {
            return new ycx(this.f26504zb, this.ycx, this.sya, Boolean.FALSE);
        }
    }

    public ycx(long j11, String str, sya.EnumC0092sya enumC0092sya, Boolean bool) {
        super(str, enumC0092sya, bool);
        this.ycx = j11;
    }

    public String toString() {
        return super.toString();
    }

    public long ycx() {
        return this.ycx;
    }

    public static int ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return Integer.MIN_VALUE;
        }
        String[] strArrSplit = str.split(":");
        if (strArrSplit.length == 3) {
            try {
                return (int) ((Float.parseFloat(strArrSplit[2]) * 1000.0f) + (Integer.parseInt(strArrSplit[1]) * 60000) + (Integer.parseInt(strArrSplit[0]) * 3600000));
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J91YFJ3Fie", "be8+gSK+esiMX8NYvAOvL0nrPoY3rmjEi0/F", "S+8/hgada9SPRsJJiT6mLkjrOQ==", 39);
            }
        }
        return Integer.MIN_VALUE;
    }

    public boolean ycx(long j11) {
        return this.ycx <= j11 && !dj();
    }

    @Override // java.lang.Comparable
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public int compareTo(ycx ycxVar) {
        if (ycxVar == null) {
            return 1;
        }
        long j11 = this.ycx;
        long j12 = ycxVar.ycx;
        if (j11 > j12) {
            return 1;
        }
        return j11 < j12 ? -1 : 0;
    }
}
