package com.apm.insight;

import android.text.TextUtils;
import org.json.JSONArray;

/* loaded from: classes2.dex */
public final class b implements ICrashCallback, IOOMCallback {

    /* renamed from: a, reason: collision with root package name */
    private IOOMCallback f21414a;

    /* renamed from: b, reason: collision with root package name */
    private ICrashCallback f21415b;

    /* renamed from: c, reason: collision with root package name */
    private String f21416c;

    public b(String str, ICrashCallback iCrashCallback) {
        this.f21416c = str;
        this.f21415b = iCrashCallback;
    }

    public final void a(CrashType crashType, Throwable th2, Thread thread, long j11, JSONArray jSONArray) {
        CrashType crashType2;
        Throwable th3;
        Thread thread2;
        long j12;
        if (this.f21414a == null || jSONArray == null) {
            return;
        }
        int i5 = 0;
        while (i5 < jSONArray.length()) {
            if (TextUtils.equals(a.a(jSONArray.optJSONObject(i5), "header", "aid"), this.f21416c)) {
                crashType2 = crashType;
                th3 = th2;
                thread2 = thread;
                j12 = j11;
                this.f21414a.onCrash(crashType2, th3, thread2, j12);
            } else {
                crashType2 = crashType;
                th3 = th2;
                thread2 = thread;
                j12 = j11;
            }
            i5++;
            crashType = crashType2;
            th2 = th3;
            thread = thread2;
            j11 = j12;
        }
    }

    @Override // com.apm.insight.ICrashCallback
    public final void onCrash(CrashType crashType, String str, Thread thread) {
    }

    @Override // com.apm.insight.IOOMCallback
    public final void onCrash(CrashType crashType, Throwable th2, Thread thread, long j11) {
    }

    public b(String str, IOOMCallback iOOMCallback) {
        this.f21416c = str;
        this.f21414a = iOOMCallback;
    }

    public final void a(CrashType crashType, String str, Thread thread, JSONArray jSONArray) {
        if (this.f21415b == null || jSONArray == null) {
            return;
        }
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            if (TextUtils.equals(a.a(jSONArray.optJSONObject(i5), "header", "aid"), this.f21416c)) {
                this.f21415b.onCrash(crashType, str, thread);
            }
        }
    }

    public final void a(CrashType crashType, String str, String str2, String str3) {
        d dVarA;
        if (this.f21415b == null || (dVarA = d.a(this.f21416c)) == null || !dVarA.a(str3, str2)) {
            return;
        }
        this.f21415b.onCrash(crashType, str, null);
    }
}
