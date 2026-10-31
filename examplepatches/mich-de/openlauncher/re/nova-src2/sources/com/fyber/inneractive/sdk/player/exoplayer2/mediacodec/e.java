package com.fyber.inneractive.sdk.player.exoplayer2.mediacodec;

import android.text.TextUtils;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f30077a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f30078b;

    public e(boolean z11, String str) {
        this.f30077a = str;
        this.f30078b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && obj.getClass() == e.class) {
            e eVar = (e) obj;
            if (TextUtils.equals(this.f30077a, eVar.f30077a) && this.f30078b == eVar.f30078b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f30077a;
        return (((str == null ? 0 : str.hashCode()) + 31) * 31) + (this.f30078b ? 1231 : 1237);
    }
}
