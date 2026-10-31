package com.fyber.inneractive.sdk.model.vast;

import android.text.TextUtils;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public Integer f28606a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f28607b;

    /* renamed from: c, reason: collision with root package name */
    public String f28608c;

    /* renamed from: d, reason: collision with root package name */
    public l f28609d;

    /* renamed from: e, reason: collision with root package name */
    public String f28610e;

    /* renamed from: f, reason: collision with root package name */
    public String f28611f;

    /* renamed from: g, reason: collision with root package name */
    public String f28612g;

    /* renamed from: i, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.vast.b f28614i;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f28613h = new ArrayList();

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f28615j = new ArrayList();

    public final boolean a() {
        return (TextUtils.isEmpty(this.f28611f) && TextUtils.isEmpty(this.f28610e) && this.f28609d == null) ? false : true;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Companion:  w:");
        sb2.append(this.f28606a);
        sb2.append(" h:");
        sb2.append(this.f28607b);
        sb2.append(" ctr:");
        sb2.append(this.f28612g);
        sb2.append(" clt:");
        sb2.append(this.f28613h);
        if (!TextUtils.isEmpty(this.f28611f)) {
            sb2.append(" html:");
            sb2.append(this.f28611f);
        }
        if (this.f28609d != null) {
            sb2.append(" static:");
            sb2.append(this.f28609d.f28618b);
            sb2.append("creative:");
            sb2.append(this.f28609d.f28617a);
        }
        if (!TextUtils.isEmpty(this.f28610e)) {
            sb2.append(" iframe:");
            sb2.append(this.f28610e);
        }
        sb2.append(" events:");
        sb2.append(this.f28615j);
        if (this.f28614i != null) {
            sb2.append(" reason:");
            sb2.append(this.f28614i.f28400a);
            sb2.append(" exception:");
            sb2.append(this.f28614i.getMessage());
        }
        return sb2.toString();
    }
}
