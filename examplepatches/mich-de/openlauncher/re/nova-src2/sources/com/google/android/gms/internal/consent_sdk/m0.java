package com.google.android.gms.internal.consent_sdk;

import java.io.IOException;
import java.util.Iterator;
import java.util.Objects;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class m0 implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f32146a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h6 f32147b;

    public m0(h6 h6Var, String str) {
        this.f32146a = str;
        this.f32147b = h6Var;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        Object obj = this.f32147b.f32089b;
        return new l0(this.f32146a);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
        try {
            l0 l0Var = (l0) iterator();
            if (l0Var.hasNext()) {
                Object next = l0Var.next();
                Objects.requireNonNull(next);
                sb2.append(next instanceof CharSequence ? (CharSequence) next : next.toString());
                while (l0Var.hasNext()) {
                    sb2.append((CharSequence) ", ");
                    Object next2 = l0Var.next();
                    Objects.requireNonNull(next2);
                    sb2.append(next2 instanceof CharSequence ? (CharSequence) next2 : next2.toString());
                }
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
            return sb2.toString();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }
}
