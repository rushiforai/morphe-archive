package jx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w extends y {

    /* renamed from: b, reason: collision with root package name */
    public final String f70430b;

    public w(String str) {
        super(System.currentTimeMillis());
        this.f70430b = str;
    }

    @Override // jx.y
    public final boolean a(String str) {
        return Intrinsics.b(this.f70430b, str);
    }
}
