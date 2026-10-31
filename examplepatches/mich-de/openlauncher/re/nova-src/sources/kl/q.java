package kl;

import java.security.GeneralSecurityException;
import pl.b2;
import pl.f1;

/* loaded from: classes.dex */
public class q {

    /* renamed from: a, reason: collision with root package name */
    public final String f71626a;

    /* renamed from: b, reason: collision with root package name */
    public final Class f71627b;

    /* renamed from: c, reason: collision with root package name */
    public final f1 f71628c;

    public q(String str, Class cls, f1 f1Var) {
        this.f71626a = str;
        this.f71627b = cls;
        this.f71628c = f1Var;
    }

    public final Object a(com.google.crypto.tink.shaded.protobuf.i iVar) throws GeneralSecurityException {
        return ((n0) a0.f71564b.f71565a.get()).a(b0.f71569b.a(p0.a(this.f71626a, iVar, this.f71628c, b2.RAW, null)), this.f71627b);
    }
}
