package com.teslacoilsw.conditions.rules;

import b.c0;
import kotlinx.serialization.protobuf.ProtoNumber;

/* loaded from: classes.dex */
public final /* synthetic */ class h implements ProtoNumber {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f45556c;

    public h(int i5) {
        this.f45556c = i5;
    }

    @Override // java.lang.annotation.Annotation
    public final /* synthetic */ Class annotationType() {
        return ProtoNumber.class;
    }

    @Override // java.lang.annotation.Annotation
    public final boolean equals(Object obj) {
        return (obj instanceof ProtoNumber) && this.f45556c == ((ProtoNumber) obj).number();
    }

    @Override // java.lang.annotation.Annotation
    public final int hashCode() {
        return Integer.hashCode(this.f45556c) ^ 1779747127;
    }

    @Override // kotlinx.serialization.protobuf.ProtoNumber
    public final /* synthetic */ int number() {
        return this.f45556c;
    }

    @Override // java.lang.annotation.Annotation
    public final String toString() {
        return c0.i(this.f45556c, "@kotlinx.serialization.protobuf.ProtoNumber(number=", ")");
    }
}
