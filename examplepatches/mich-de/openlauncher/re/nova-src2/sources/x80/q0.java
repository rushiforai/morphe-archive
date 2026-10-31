package x80;

import java.net.InetSocketAddress;
import java.net.Proxy;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final a f95594a;

    /* renamed from: b, reason: collision with root package name */
    public final Proxy f95595b;

    /* renamed from: c, reason: collision with root package name */
    public final InetSocketAddress f95596c;

    public q0(a aVar, Proxy proxy, InetSocketAddress socketAddress) {
        Intrinsics.g(socketAddress, "socketAddress");
        this.f95594a = aVar;
        this.f95595b = proxy;
        this.f95596c = socketAddress;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return Intrinsics.b(q0Var.f95594a, this.f95594a) && Intrinsics.b(q0Var.f95595b, this.f95595b) && Intrinsics.b(q0Var.f95596c, this.f95596c);
    }

    public final int hashCode() {
        return this.f95596c.hashCode() + ((this.f95595b.hashCode() + ((this.f95594a.hashCode() + 527) * 31)) * 31);
    }

    public final String toString() {
        return "Route{" + this.f95596c + AbstractJsonLexerKt.END_OBJ;
    }
}
