package com.apm.insight.l;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    private Writer f21758a;

    /* renamed from: b, reason: collision with root package name */
    private final List<a> f21759b = new ArrayList();

    /* JADX WARN: $VALUES field not found */
    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final a f21760a = new a("EMPTY_ARRAY", 0);

        /* renamed from: b, reason: collision with root package name */
        public static final a f21761b = new a("NONEMPTY_ARRAY", 1);

        /* renamed from: c, reason: collision with root package name */
        public static final a f21762c = new a("EMPTY_OBJECT", 2);

        /* renamed from: d, reason: collision with root package name */
        public static final a f21763d = new a("DANGLING_KEY", 3);

        /* renamed from: e, reason: collision with root package name */
        public static final a f21764e = new a("NONEMPTY_OBJECT", 4);

        /* renamed from: f, reason: collision with root package name */
        public static final a f21765f = new a("NULL", 5);

        private a(String str, int i5) {
        }
    }

    private h(Writer writer) {
        this.f21758a = writer;
    }

    private h a() throws JSONException, IOException {
        return a(a.f21760a, "[");
    }

    private h b() throws JSONException, IOException {
        a aVar = a.f21760a;
        return a("]");
    }

    private h c() throws JSONException, IOException {
        return a(a.f21762c, "{");
    }

    private h d() throws JSONException, IOException {
        a aVar = a.f21760a;
        return a("}");
    }

    private a e() throws JSONException {
        return (a) a2.c.e(1, this.f21759b);
    }

    private void f() throws JSONException, IOException {
        if (this.f21759b.isEmpty()) {
            return;
        }
        a aVarE = e();
        if (aVarE == a.f21760a) {
            a(a.f21761b);
            return;
        }
        if (aVarE == a.f21761b) {
            this.f21758a.write(44);
        } else if (aVarE == a.f21763d) {
            this.f21758a.write(":");
            a(a.f21764e);
        } else if (aVarE != a.f21765f) {
            throw new JSONException("Nesting problem");
        }
    }

    public final String toString() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    private h a(a aVar, String str) throws JSONException, IOException {
        f();
        this.f21759b.add(aVar);
        this.f21758a.write(str);
        return this;
    }

    private void b(String str) throws IOException {
        this.f21758a.write("\"");
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = str.charAt(i5);
            if (cCharAt == '\f') {
                this.f21758a.write("\\f");
            } else if (cCharAt != '\r') {
                if (cCharAt != '\"' && cCharAt != '/' && cCharAt != '\\') {
                    switch (cCharAt) {
                        case '\b':
                            this.f21758a.write("\\b");
                            continue;
                        case '\t':
                            this.f21758a.write("\\t");
                            continue;
                        case '\n':
                            this.f21758a.write("\\n");
                            continue;
                        default:
                            if (cCharAt <= 31) {
                                this.f21758a.write(String.format("\\u%04x", Integer.valueOf(cCharAt)));
                                break;
                            }
                            break;
                    }
                } else {
                    this.f21758a.write(92);
                }
                this.f21758a.write(cCharAt);
            } else {
                this.f21758a.write("\\r");
            }
        }
        this.f21758a.write("\"");
    }

    private h c(String str) throws JSONException, IOException {
        a aVarE = e();
        if (aVarE == a.f21764e) {
            this.f21758a.write(44);
        } else if (aVarE != a.f21762c) {
            throw new JSONException("Nesting problem");
        }
        a(a.f21763d);
        b(str);
        return this;
    }

    private h a(String str) throws JSONException, IOException {
        e();
        this.f21759b.remove(r0.size() - 1);
        this.f21758a.write(str);
        return this;
    }

    private void a(a aVar) {
        this.f21759b.set(r0.size() - 1, aVar);
    }

    private h a(Object obj) throws JSONException, IOException {
        if (obj instanceof JSONArray) {
            a((JSONArray) obj);
            return this;
        }
        if (obj instanceof JSONObject) {
            a((JSONObject) obj);
            return this;
        }
        f();
        if (obj != null && obj != JSONObject.NULL) {
            if (obj instanceof Boolean) {
                this.f21758a.write(String.valueOf(obj));
                return this;
            }
            if (obj instanceof Number) {
                this.f21758a.write(JSONObject.numberToString((Number) obj));
                return this;
            }
            b(obj.toString());
            return this;
        }
        this.f21758a.write(AbstractJsonLexerKt.NULL);
        return this;
    }

    public static void a(JSONObject jSONObject, Writer writer) throws Throwable {
        new h(writer).a(jSONObject);
        writer.flush();
    }

    public static void a(JSONArray jSONArray, Writer writer) throws Throwable {
        new h(writer).a(jSONArray);
        writer.flush();
    }

    private void a(JSONObject jSONObject) throws JSONException, IOException {
        c();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            c(next).a(jSONObject.get(next));
        }
        d();
    }

    private void a(JSONArray jSONArray) throws JSONException, IOException {
        a();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            a(jSONArray.get(i5));
        }
        b();
    }
}
