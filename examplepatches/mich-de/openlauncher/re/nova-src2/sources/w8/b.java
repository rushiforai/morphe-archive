package w8;

import android.graphics.Bitmap;
import c9.g;
import java.io.EOFException;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m90.c0;
import m90.d0;
import o2.h;
import r70.k;
import x80.m0;
import x80.u;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final Object f94097a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f94098b;

    /* renamed from: c, reason: collision with root package name */
    public final long f94099c;

    /* renamed from: d, reason: collision with root package name */
    public final long f94100d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f94101e;

    /* renamed from: f, reason: collision with root package name */
    public final u f94102f;

    public b(d0 d0Var) throws NumberFormatException, EOFException {
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71681c;
        this.f94097a = LazyKt.b(lazyThreadSafetyMode, new a(this, 0));
        this.f94098b = LazyKt.b(lazyThreadSafetyMode, new a(this, 1));
        this.f94099c = Long.parseLong(d0Var.r(Long.MAX_VALUE));
        this.f94100d = Long.parseLong(d0Var.r(Long.MAX_VALUE));
        this.f94101e = Integer.parseInt(d0Var.r(Long.MAX_VALUE)) > 0;
        int i5 = Integer.parseInt(d0Var.r(Long.MAX_VALUE));
        h hVar = new h(1);
        for (int i11 = 0; i11 < i5; i11++) {
            String strR = d0Var.r(Long.MAX_VALUE);
            Bitmap.Config[] configArr = g.f19862a;
            int iR0 = k.R0(AbstractJsonLexerKt.COLON, 0, 6, strR);
            if (iR0 == -1) {
                throw new IllegalArgumentException("Unexpected header: ".concat(strR).toString());
            }
            String strSubstring = strR.substring(0, iR0);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
            String string = k.u1(strSubstring).toString();
            String strSubstring2 = strR.substring(iR0 + 1);
            Intrinsics.f(strSubstring2, "this as java.lang.String).substring(startIndex)");
            hVar.d(string, strSubstring2);
        }
        this.f94102f = hVar.f();
    }

    public final void a(c0 c0Var) {
        c0Var.E(this.f94099c);
        c0Var.writeByte(10);
        c0Var.E(this.f94100d);
        c0Var.writeByte(10);
        c0Var.E(this.f94101e ? 1L : 0L);
        c0Var.writeByte(10);
        u uVar = this.f94102f;
        c0Var.E(uVar.size());
        c0Var.writeByte(10);
        int size = uVar.size();
        for (int i5 = 0; i5 < size; i5++) {
            c0Var.u(uVar.c(i5));
            c0Var.u(": ");
            c0Var.u(uVar.e(i5));
            c0Var.writeByte(10);
        }
    }

    public b(m0 m0Var) {
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71681c;
        this.f94097a = LazyKt.b(lazyThreadSafetyMode, new a(this, 0));
        this.f94098b = LazyKt.b(lazyThreadSafetyMode, new a(this, 1));
        this.f94099c = m0Var.f95563k;
        this.f94100d = m0Var.f95564l;
        this.f94101e = m0Var.f95557e != null;
        this.f94102f = m0Var.f95558f;
    }
}
