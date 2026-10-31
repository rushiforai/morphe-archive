package com.google.android.exoplayer2;

import android.os.SystemClock;
import android.text.TextUtils;
import b.c0;
import fe.k0;
import gf.u;
import wf.a;
import wf.v;

/* loaded from: classes3.dex */
public final class ExoPlaybackException extends PlaybackException {

    /* renamed from: c, reason: collision with root package name */
    public final int f31434c;

    /* renamed from: d, reason: collision with root package name */
    public final String f31435d;

    /* renamed from: e, reason: collision with root package name */
    public final int f31436e;

    /* renamed from: f, reason: collision with root package name */
    public final k0 f31437f;

    /* renamed from: g, reason: collision with root package name */
    public final int f31438g;

    /* renamed from: h, reason: collision with root package name */
    public final u f31439h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f31440i;

    public ExoPlaybackException(int i5, Exception exc, int i11) {
        this(i5, exc, i11, null, -1, null, 4, false);
    }

    public final ExoPlaybackException a(u uVar) {
        String message = getMessage();
        int i5 = v.f94376a;
        return new ExoPlaybackException(message, getCause(), this.f31443a, this.f31434c, this.f31435d, this.f31436e, this.f31437f, this.f31438g, uVar, this.f31444b, this.f31440i);
    }

    public ExoPlaybackException(String str, Throwable th2, int i5, int i11, String str2, int i12, k0 k0Var, int i13, u uVar, long j11, boolean z11) {
        super(i5, j11, str, th2);
        a.e(!z11 || i11 == 1);
        a.e(th2 != null || i11 == 3);
        this.f31434c = i11;
        this.f31435d = str2;
        this.f31436e = i12;
        this.f31437f = k0Var;
        this.f31438g = i13;
        this.f31439h = uVar;
        this.f31440i = z11;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public ExoPlaybackException(int i5, Throwable th2, int i11, String str, int i12, k0 k0Var, int i13, boolean z11) {
        String str2;
        int i14;
        k0 k0Var2;
        String string;
        String str3;
        if (i5 == 0) {
            str2 = str;
            i14 = i12;
            k0Var2 = k0Var;
            string = "Source error";
        } else if (i5 != 1) {
            if (i5 != 3) {
                string = "Unexpected runtime error";
            } else {
                string = "Remote error";
            }
            str2 = str;
            i14 = i12;
            k0Var2 = k0Var;
        } else {
            StringBuilder sb2 = new StringBuilder();
            str2 = str;
            sb2.append(str2);
            sb2.append(" error, index=");
            i14 = i12;
            sb2.append(i14);
            sb2.append(", format=");
            k0Var2 = k0Var;
            sb2.append(k0Var2);
            sb2.append(", format_supported=");
            int i15 = v.f94376a;
            if (i13 == 0) {
                str3 = "NO";
            } else if (i13 == 1) {
                str3 = "NO_UNSUPPORTED_TYPE";
            } else if (i13 == 2) {
                str3 = "NO_UNSUPPORTED_DRM";
            } else if (i13 == 3) {
                str3 = "NO_EXCEEDS_CAPABILITIES";
            } else if (i13 == 4) {
                str3 = "YES";
            } else {
                throw new IllegalStateException();
            }
            sb2.append(str3);
            string = sb2.toString();
        }
        this(TextUtils.isEmpty(null) ? string : c0.E(string, ": null"), th2, i11, i5, str2, i14, k0Var2, i13, null, SystemClock.elapsedRealtime(), z11);
    }
}
