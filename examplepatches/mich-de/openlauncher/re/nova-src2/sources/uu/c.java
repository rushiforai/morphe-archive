package uu;

import h6.f1;
import h6.j1;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final List f91549a;

    /* renamed from: b, reason: collision with root package name */
    public final yu.a f91550b;

    public c(List formElements, yu.a formArguments) {
        Intrinsics.g(formElements, "formElements");
        Intrinsics.g(formArguments, "formArguments");
        this.f91549a = formElements;
        this.f91550b = formArguments;
    }

    @Override // h6.j1
    public final f1 create(Class cls) {
        return new f(this.f91549a, this.f91550b);
    }
}
