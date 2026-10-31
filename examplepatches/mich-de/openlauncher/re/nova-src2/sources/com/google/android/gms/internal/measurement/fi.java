package com.google.android.gms.internal.measurement;

import java.util.Arrays;
import java.util.HashSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class fi {

    /* renamed from: c, reason: collision with root package name */
    public static final HashSet f32544c = new HashSet(Arrays.asList(Boolean.class, Byte.class, Short.class, Integer.class, Long.class, Float.class, Double.class));

    /* renamed from: a, reason: collision with root package name */
    public final StringBuilder f32545a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f32546b = false;

    public fi(StringBuilder sb2) {
        this.f32545a = sb2;
    }

    public static int b(int i5, String str) {
        while (i5 < str.length()) {
            char cCharAt = str.charAt(i5);
            if (cCharAt < ' ' || cCharAt == '\"' || cCharAt == '\\') {
                return i5;
            }
            i5++;
        }
        return -1;
    }

    public final void a(Object obj, String str) {
        boolean z11 = this.f32546b;
        StringBuilder sb2 = this.f32545a;
        if (z11) {
            sb2.append(' ');
        } else {
            if (sb2.length() > 0) {
                sb2.append((sb2.length() > 1000 || sb2.indexOf("\n") != -1) ? '\n' : ' ');
            }
            sb2.append("[CONTEXT ");
            this.f32546b = true;
        }
        sb2.append(str);
        sb2.append('=');
        if (obj == null) {
            sb2.append(true);
            return;
        }
        if (f32544c.contains(obj.getClass())) {
            sb2.append(obj);
            return;
        }
        sb2.append(AbstractJsonLexerKt.STRING);
        String string = obj.toString();
        int i5 = 0;
        while (true) {
            int iB = b(i5, string);
            if (iB == -1) {
                sb2.append((CharSequence) string, i5, string.length());
                sb2.append(AbstractJsonLexerKt.STRING);
                return;
            }
            sb2.append((CharSequence) string, i5, iB);
            i5 = iB + 1;
            char cCharAt = string.charAt(iB);
            if (cCharAt == '\t') {
                cCharAt = 't';
            } else if (cCharAt == '\n') {
                cCharAt = 'n';
            } else if (cCharAt == '\r') {
                cCharAt = 'r';
            } else if (cCharAt != '\"' && cCharAt != '\\') {
                sb2.append((char) 65533);
            }
            sb2.append("\\");
            sb2.append(cCharAt);
        }
    }
}
