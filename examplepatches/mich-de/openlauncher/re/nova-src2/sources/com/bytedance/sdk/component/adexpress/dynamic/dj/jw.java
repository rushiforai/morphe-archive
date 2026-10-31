package com.bytedance.sdk.component.adexpress.dynamic.dj;

import java.util.Arrays;

/* loaded from: classes2.dex */
public class jw {
    public float ycx;

    /* renamed from: zb, reason: collision with root package name */
    public float f23317zb;

    public jw(float f11, float f12) {
        this.ycx = f11;
        this.f23317zb = f12;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            jw jwVar = (jw) obj;
            if (Float.compare(jwVar.ycx, this.ycx) == 0 && Float.compare(jwVar.f23317zb, this.f23317zb) == 0) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{Float.valueOf(this.ycx), Float.valueOf(this.f23317zb)});
    }
}
