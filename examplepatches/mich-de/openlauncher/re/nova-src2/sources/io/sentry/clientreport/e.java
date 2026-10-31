package io.sentry.clientreport;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class e implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f67174a;

    /* renamed from: b, reason: collision with root package name */
    public final String f67175b;

    /* renamed from: c, reason: collision with root package name */
    public final Long f67176c;

    /* renamed from: d, reason: collision with root package name */
    public HashMap f67177d;

    public e(String str, String str2, Long l9) {
        this.f67174a = str;
        this.f67175b = str2;
        this.f67176c = l9;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("reason");
        e3Var.A(this.f67174a);
        e3Var.o("category");
        e3Var.A(this.f67175b);
        e3Var.o("quantity");
        e3Var.z(this.f67176c);
        HashMap map = this.f67177d;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67177d.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }

    public final String toString() {
        return "DiscardedEvent{reason='" + this.f67174a + "', category='" + this.f67175b + "', quantity=" + this.f67176c + AbstractJsonLexerKt.END_OBJ;
    }
}
