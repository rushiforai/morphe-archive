package y40;

import io.branch.search.internal.E2;
import io.branch.search.internal.RequestMetadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class w {

    @NotNull
    public static final v Companion = new v();

    /* renamed from: a, reason: collision with root package name */
    public final Object f96716a;

    /* renamed from: b, reason: collision with root package name */
    public final E2 f96717b;

    /* renamed from: c, reason: collision with root package name */
    public final RequestMetadata f96718c;

    public w(Object obj, E2 e22, RequestMetadata requestMetadata) {
        this.f96716a = obj;
        this.f96717b = e22;
        this.f96718c = requestMetadata;
    }

    public final String a() {
        E2 e22 = this.f96717b;
        if (e22 instanceof E2.c) {
            return "{requestId=" + this.f96718c.getRequestId() + AbstractJsonLexerKt.END_OBJ;
        }
        e22.getClass();
        if (e22 instanceof E2.d) {
            return ((E2.d) e22).f62391a.toString();
        }
        return null;
    }

    public final Object b() {
        return this.f96716a;
    }

    public final E2 c() {
        return this.f96717b;
    }

    public final boolean d() {
        E2 e22 = this.f96717b;
        e22.getClass();
        return ((e22 instanceof E2.c) || (e22 instanceof E2.a)) ? false : true;
    }

    public final RequestMetadata e() {
        return this.f96718c;
    }
}
