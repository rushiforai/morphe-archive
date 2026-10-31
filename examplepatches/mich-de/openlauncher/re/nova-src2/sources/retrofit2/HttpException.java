package retrofit2;

import eb0.p0;
import x80.m0;

/* loaded from: classes5.dex */
public class HttpException extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final int f85843a;

    /* renamed from: b, reason: collision with root package name */
    public final transient p0 f85844b;

    public HttpException(p0 p0Var) {
        StringBuilder sb2 = new StringBuilder("HTTP ");
        m0 m0Var = p0Var.f52631a;
        int i5 = m0Var.f95556d;
        sb2.append(i5);
        sb2.append(" ");
        sb2.append(m0Var.f95555c);
        super(sb2.toString());
        this.f85843a = i5;
        this.f85844b = p0Var;
    }
}
