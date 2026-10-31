package com.apm.insight.runtime;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    private static long f21866a = -30000;

    /* renamed from: b, reason: collision with root package name */
    private static File f21867b;

    public static void a(long j11) throws Throwable {
        if (j11 - f21866a < 30000) {
            return;
        }
        f21866a = j11;
        try {
            if (f21867b == null) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                f21867b = new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/TrackInfo/" + ((jCurrentTimeMillis - (jCurrentTimeMillis % 86400000)) / 86400000) + "/" + com.apm.insight.e.f());
            }
            com.apm.insight.l.f.a(f21867b, String.valueOf(System.currentTimeMillis()), false);
        } catch (IOException unused) {
        }
    }

    public static String a(long j11, String str) {
        try {
            return com.apm.insight.l.f.a(new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/TrackInfo/" + ((j11 - (j11 % 86400000)) / 86400000) + "/" + str), "\n");
        } catch (Throwable th2) {
            return th2.getMessage();
        }
    }

    public static void a() {
        File file = new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/TrackInfo/");
        String[] list = file.list();
        if (list != null && list.length > 5) {
            Arrays.sort(list);
            for (int i5 = 0; i5 < list.length - 5; i5++) {
                com.apm.insight.l.f.a(new File(file, list[i5]));
            }
        }
    }
}
