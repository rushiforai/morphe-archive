package com.bytedance.sdk.component.ycx;

import android.text.TextUtils;
import b.c0;

/* loaded from: classes2.dex */
public class xkz {

    /* renamed from: dj, reason: collision with root package name */
    public final String f24142dj;
    public final String fby;

    /* renamed from: lt, reason: collision with root package name */
    public final String f24143lt;
    public final String lud;
    public final String sya;

    /* renamed from: ul, reason: collision with root package name */
    public final String f24144ul;
    public final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    public final String f24145zb;

    public static final class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private String f24146dj;

        /* renamed from: lt, reason: collision with root package name */
        private String f24147lt;
        private String lud;
        private String sya;

        /* renamed from: ul, reason: collision with root package name */
        private String f24148ul;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f24149zb;

        private ycx() {
        }

        public ycx dj(String str) {
            this.f24146dj = str;
            return this;
        }

        public ycx lt(String str) {
            this.f24147lt = str;
            return this;
        }

        public ycx lud(String str) {
            this.lud = str;
            return this;
        }

        public ycx sya(String str) {
            this.sya = str;
            return this;
        }

        public ycx ul(String str) {
            this.f24148ul = str;
            return this;
        }

        public ycx ycx(String str) {
            this.ycx = str;
            return this;
        }

        public ycx zb(String str) {
            this.f24149zb = str;
            return this;
        }

        public xkz ycx() {
            return new xkz(this);
        }
    }

    public static ycx ycx() {
        return new ycx();
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("methodName: ");
        sb2.append(this.f24142dj);
        sb2.append(", params: ");
        sb2.append(this.lud);
        sb2.append(", callbackId: ");
        sb2.append(this.f24143lt);
        sb2.append(", type: ");
        sb2.append(this.sya);
        sb2.append(", version: ");
        return c0.q(sb2, this.f24145zb, ", ");
    }

    private xkz(String str, int i5) {
        this.f24145zb = null;
        this.sya = null;
        this.f24142dj = null;
        this.lud = null;
        this.f24143lt = str;
        this.f24144ul = null;
        this.ycx = i5;
        this.fby = null;
    }

    public static xkz ycx(String str, int i5) {
        return new xkz(str, i5);
    }

    public static boolean ycx(xkz xkzVar) {
        return xkzVar == null || xkzVar.ycx != 1 || TextUtils.isEmpty(xkzVar.f24142dj) || TextUtils.isEmpty(xkzVar.lud);
    }

    private xkz(ycx ycxVar) {
        this.f24145zb = ycxVar.ycx;
        this.sya = ycxVar.f24149zb;
        this.f24142dj = ycxVar.sya;
        this.lud = ycxVar.f24146dj;
        this.f24143lt = ycxVar.lud;
        this.f24144ul = ycxVar.f24147lt;
        this.ycx = 1;
        this.fby = ycxVar.f24148ul;
    }
}
