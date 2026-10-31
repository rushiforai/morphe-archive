package com.fyber.inneractive.sdk.util;

import android.net.Uri;
import java.util.List;

/* loaded from: classes3.dex */
public final class m1 implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final l1 f31202a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f31203b;

    /* renamed from: c, reason: collision with root package name */
    public final List f31204c;

    public m1(l1 l1Var, Uri uri, List list) {
        this.f31202a = l1Var;
        this.f31203b = uri;
        this.f31204c = list;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f31202a.mPriority.compareTo(((m1) obj).f31202a.mPriority);
    }
}
