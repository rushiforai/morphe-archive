package com.fyber.inneractive.sdk.tcf;

import a2.c;
import java.util.ArrayList;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public String f31107b;

    /* renamed from: d, reason: collision with root package name */
    public int f31109d;

    /* renamed from: e, reason: collision with root package name */
    public int f31110e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f31111f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f31112g;

    /* renamed from: a, reason: collision with root package name */
    public final b f31106a = new b();

    /* renamed from: c, reason: collision with root package name */
    public boolean f31108c = false;

    public final void a() {
        b bVar = this.f31106a;
        bVar.f31114b += 78;
        this.f31109d = bVar.a(12);
        this.f31110e = this.f31106a.a(12);
        this.f31106a.f31114b += 50;
        boolean[] zArr = new boolean[24];
        for (int i5 = 0; i5 < 24; i5++) {
            zArr[i5] = this.f31106a.a();
        }
        boolean z11 = zArr[0];
        this.f31112g = !z11;
        this.f31106a.f31114b += 37;
        ArrayList arrayList = new ArrayList();
        int iA = this.f31106a.a(16);
        if (this.f31106a.a()) {
            int iA2 = this.f31106a.a(12);
            for (int i11 = 0; i11 < iA2; i11++) {
                boolean zA = this.f31106a.a();
                int iA3 = this.f31106a.a(16);
                if (zA) {
                    int iA4 = this.f31106a.a(16);
                    while (iA3 <= iA4) {
                        arrayList.add(Integer.valueOf(iA3));
                        iA3++;
                    }
                } else {
                    arrayList.add(Integer.valueOf(iA3));
                }
            }
        } else {
            for (int i12 = 1; i12 <= iA; i12++) {
                if (this.f31106a.a()) {
                    arrayList.add(Integer.valueOf(i12));
                }
            }
        }
        this.f31111f = arrayList.contains(262);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GppTcf{mCmpVersion=");
        sb2.append(this.f31110e);
        sb2.append(", mCmpId=");
        sb2.append(this.f31109d);
        sb2.append(", mConsentStatus=");
        sb2.append(this.f31111f);
        sb2.append(", mIsPurpose1Disabled=");
        return c.p(sb2, this.f31112g, AbstractJsonLexerKt.END_OBJ);
    }
}
