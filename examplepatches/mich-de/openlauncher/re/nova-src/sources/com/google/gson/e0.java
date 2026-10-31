package com.google.gson;

import b.u4;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.MalformedJsonException;
import java.io.IOException;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public abstract class e0 implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final a0 f34778a;

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f34779b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ e0[] f34780c;

    static {
        a0 a0Var = new a0();
        f34778a = a0Var;
        b0 b0Var = new b0();
        f34779b = b0Var;
        f34780c = new e0[]{a0Var, b0Var, new e0() { // from class: com.google.gson.c0
            public static Double b(JsonReader jsonReader, String str) throws MalformedJsonException, NumberFormatException {
                try {
                    Double dValueOf = Double.valueOf(str);
                    if (dValueOf.isInfinite() || dValueOf.isNaN()) {
                        if (!jsonReader.isLenient()) {
                            throw new MalformedJsonException("JSON forbids NaN and infinities: " + dValueOf + "; at path " + jsonReader.getPreviousPath());
                        }
                    }
                    return dValueOf;
                } catch (NumberFormatException e3) {
                    StringBuilder sbK = u4.k("Cannot parse ", str, "; at path ");
                    sbK.append(jsonReader.getPreviousPath());
                    throw new JsonParseException(sbK.toString(), e3);
                }
            }

            @Override // com.google.gson.f0
            public final Number a(JsonReader jsonReader) throws IOException {
                String strNextString = jsonReader.nextString();
                if (strNextString.indexOf(46) >= 0) {
                    return b(jsonReader, strNextString);
                }
                try {
                    return Long.valueOf(Long.parseLong(strNextString));
                } catch (NumberFormatException unused) {
                    return b(jsonReader, strNextString);
                }
            }
        }, new e0() { // from class: com.google.gson.d0
            @Override // com.google.gson.f0
            public final Number a(JsonReader jsonReader) throws IOException {
                String strNextString = jsonReader.nextString();
                try {
                    return hn.h.j(strNextString);
                } catch (NumberFormatException e3) {
                    StringBuilder sbK = u4.k("Cannot parse ", strNextString, "; at path ");
                    sbK.append(jsonReader.getPreviousPath());
                    throw new JsonParseException(sbK.toString(), e3);
                }
            }
        }};
    }

    public static e0 valueOf(String str) {
        return (e0) Enum.valueOf(e0.class, str);
    }

    public static e0[] values() {
        return (e0[]) f34780c.clone();
    }
}
