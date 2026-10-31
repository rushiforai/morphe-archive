package m3;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class i0 implements b {

    /* renamed from: a, reason: collision with root package name */
    public final String f75910a;

    public /* synthetic */ i0(String str) {
        this.f75910a = str;
    }

    public static final /* synthetic */ i0 a(String str) {
        return new i0(str);
    }

    public final /* synthetic */ String b() {
        return this.f75910a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof i0) {
            return Intrinsics.b(this.f75910a, ((i0) obj).f75910a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f75910a.hashCode();
    }

    public final String toString() {
        return c1.m(')', "StringAnnotation(value=", this.f75910a);
    }
}
