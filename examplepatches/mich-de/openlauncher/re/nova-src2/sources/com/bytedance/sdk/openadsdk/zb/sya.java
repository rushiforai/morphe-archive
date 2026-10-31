package com.bytedance.sdk.openadsdk.zb;

import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes2.dex */
public class sya extends zb {

    /* renamed from: dj, reason: collision with root package name */
    private volatile boolean f27491dj;
    private int sya;

    /* renamed from: zb, reason: collision with root package name */
    private int f27492zb;

    public sya(int i5, int i11) {
        this.f27492zb = 15;
        this.sya = 3;
        if (i5 <= 0) {
            throw new IllegalArgumentException("Max count must be positive number!");
        }
        this.f27492zb = i5;
        this.sya = i11;
    }

    private void dj(List<File> list) {
        long jZb;
        int size;
        boolean zYcx;
        if (list != null) {
            try {
                if (list.size() != 0 && !(zYcx = ycx((jZb = zb(list)), (size = list.size())))) {
                    TreeMap treeMap = new TreeMap();
                    for (File file : list) {
                        treeMap.put(Long.valueOf(file.lastModified()), file);
                    }
                    for (Map.Entry entry : treeMap.entrySet()) {
                        if (entry != null && !zYcx) {
                            ((Long) entry.getKey()).getClass();
                            File file2 = (File) entry.getValue();
                            long length = file2.length();
                            if (file2.delete()) {
                                size--;
                                jZb -= length;
                            }
                            if (ycx(file2, jZb, size)) {
                                return;
                            }
                        }
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyNY7y6dBg==", "b+E5lA+fZtKOXvtPmTWpO1DIJJkG", "V/w4sQawbNOFbN5RiQ==", Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
            }
        }
    }

    private void sya(List<File> list) {
        long jZb = zb(list);
        int size = list.size();
        if (ycx(jZb, size)) {
            return;
        }
        for (File file : list) {
            long length = file.length();
            if (file.delete()) {
                size--;
                jZb -= length;
            }
            if (ycx(file, jZb, size)) {
                return;
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.zb.zb
    public boolean ycx(long j11, int i5) {
        return i5 <= this.f27492zb;
    }

    @Override // com.bytedance.sdk.openadsdk.zb.zb
    public boolean ycx(File file, long j11, int i5) {
        return i5 <= this.sya;
    }

    @Override // com.bytedance.sdk.openadsdk.zb.zb
    public void ycx(List<File> list) {
        if (this.f27491dj) {
            dj(list);
            this.f27491dj = false;
        } else {
            sya(list);
        }
    }

    public sya(int i5, int i11, boolean z11) {
        this.f27492zb = 15;
        this.sya = 3;
        if (i5 > 0) {
            this.f27492zb = i5;
            this.sya = i11;
            this.f27491dj = z11;
            return;
        }
        throw new IllegalArgumentException("Max count must be positive number!");
    }
}
