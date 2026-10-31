package com.apm.insight.k;

import com.apm.insight.CrashType;
import java.util.concurrent.ConcurrentLinkedQueue;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    private static ConcurrentLinkedQueue<c> f21691a = new ConcurrentLinkedQueue<>();

    /* renamed from: com.apm.insight.k.c$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {

        /* renamed from: a, reason: collision with root package name */
        static final /* synthetic */ int[] f21692a;

        static {
            int[] iArr = new int[CrashType.values().length];
            f21692a = iArr;
            try {
                iArr[CrashType.JAVA.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                f21692a[CrashType.LAUNCH.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                f21692a[CrashType.NATIVE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public static class a {

        /* renamed from: a, reason: collision with root package name */
        private JSONObject f21693a;

        /* renamed from: b, reason: collision with root package name */
        private JSONObject f21694b;

        /* renamed from: c, reason: collision with root package name */
        private CrashType f21695c;

        public a(JSONObject jSONObject, CrashType crashType) {
            this.f21695c = crashType;
            if (crashType == CrashType.LAUNCH) {
                this.f21693a = ((JSONArray) jSONObject.opt("data")).optJSONObject(0);
            } else {
                this.f21693a = jSONObject;
            }
            this.f21694b = jSONObject.optJSONObject("header");
        }

        public final String a() {
            return this.f21693a.optString("crash_thread_name", null);
        }

        public final long b() {
            return this.f21693a.optInt("app_start_time", -1);
        }

        public final String c() {
            int i5 = AnonymousClass1.f21692a[this.f21695c.ordinal()];
            if (i5 == 1) {
                return this.f21693a.optString("data", null);
            }
            if (i5 == 2) {
                return this.f21693a.optString("stack", null);
            }
            if (i5 != 3) {
                return null;
            }
            return this.f21693a.optString("data", null);
        }
    }

    public static void a(CrashType crashType, JSONObject jSONObject) {
        ConcurrentLinkedQueue<c> concurrentLinkedQueue = f21691a;
        if (concurrentLinkedQueue == null || concurrentLinkedQueue.isEmpty()) {
            return;
        }
        new a(jSONObject, crashType);
        while (!f21691a.isEmpty()) {
            f21691a.poll();
        }
        f21691a = null;
    }
}
