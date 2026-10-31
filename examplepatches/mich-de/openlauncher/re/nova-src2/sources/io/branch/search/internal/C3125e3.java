package io.branch.search.internal;

import io.sentry.ILogger;
import java.util.Map;

/* renamed from: io.branch.search.internal.e3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final /* synthetic */ class C3125e3 {
    public static void a(Map map, String str, io.sentry.y1 y1Var, String str2, ILogger iLogger) {
        Object obj = map.get(str);
        io.sentry.e3 e3Var = (io.sentry.e3) y1Var;
        e3Var.o(str2);
        e3Var.x(iLogger, obj);
    }
}
