package androidx.recyclerview.widget;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public s2 f15056a;

    /* renamed from: b, reason: collision with root package name */
    public s2 f15057b;

    /* renamed from: c, reason: collision with root package name */
    public final int f15058c;

    /* renamed from: d, reason: collision with root package name */
    public final int f15059d;

    /* renamed from: e, reason: collision with root package name */
    public final int f15060e;

    /* renamed from: f, reason: collision with root package name */
    public final int f15061f;

    public n(s2 s2Var, s2 s2Var2, int i5, int i11, int i12, int i13) {
        this.f15056a = s2Var;
        this.f15057b = s2Var2;
        this.f15058c = i5;
        this.f15059d = i11;
        this.f15060e = i12;
        this.f15061f = i13;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ChangeInfo{oldHolder=");
        sb2.append(this.f15056a);
        sb2.append(", newHolder=");
        sb2.append(this.f15057b);
        sb2.append(", fromX=");
        sb2.append(this.f15058c);
        sb2.append(", fromY=");
        sb2.append(this.f15059d);
        sb2.append(", toX=");
        sb2.append(this.f15060e);
        sb2.append(", toY=");
        return a2.c.m(sb2, this.f15061f, AbstractJsonLexerKt.END_OBJ);
    }
}
