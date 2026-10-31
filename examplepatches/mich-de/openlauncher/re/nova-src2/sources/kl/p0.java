package kl;

import java.security.GeneralSecurityException;
import pl.b2;
import pl.f1;

/* loaded from: classes.dex */
public final class p0 implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f71620a;

    /* renamed from: b, reason: collision with root package name */
    public final tl.a f71621b;

    /* renamed from: c, reason: collision with root package name */
    public final com.google.crypto.tink.shaded.protobuf.i f71622c;

    /* renamed from: d, reason: collision with root package name */
    public final f1 f71623d;

    /* renamed from: e, reason: collision with root package name */
    public final b2 f71624e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f71625f;

    public p0(String str, tl.a aVar, com.google.crypto.tink.shaded.protobuf.i iVar, f1 f1Var, b2 b2Var, Integer num) {
        this.f71620a = str;
        this.f71621b = aVar;
        this.f71622c = iVar;
        this.f71623d = f1Var;
        this.f71624e = b2Var;
        this.f71625f = num;
    }

    public static p0 a(String str, com.google.crypto.tink.shaded.protobuf.i iVar, f1 f1Var, b2 b2Var, Integer num) throws GeneralSecurityException {
        if (b2Var == b2.RAW) {
            if (num != null) {
                throw new GeneralSecurityException("Keys with output prefix type raw should not have an id requirement.");
            }
        } else if (num == null) {
            throw new GeneralSecurityException("Keys with output prefix type different from raw should have an id requirement.");
        }
        return new p0(str, w0.a(str), iVar, f1Var, b2Var, num);
    }
}
