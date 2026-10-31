package com.google.gson;

import com.google.gson.stream.JsonWriter;
import in.p1;
import java.io.IOException;

/* loaded from: classes.dex */
public abstract class p {
    public abstract p c();

    public boolean d() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public double e() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public float f() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public int g() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public final m h() {
        if (this instanceof m) {
            return (m) this;
        }
        throw new IllegalStateException("Not a JSON Array: " + this);
    }

    public final r j() {
        if (this instanceof r) {
            return (r) this;
        }
        throw new IllegalStateException("Not a JSON Object: " + this);
    }

    public final s k() {
        if (this instanceof s) {
            return (s) this;
        }
        throw new IllegalStateException("Not a JSON Primitive: " + this);
    }

    public long l() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public Number n() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public String o() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public final String toString() {
        try {
            StringBuilder sb2 = new StringBuilder();
            JsonWriter jsonWriter = new JsonWriter(new hn.r(sb2));
            jsonWriter.setStrictness(z.f34800a);
            in.n nVar = p1.B;
            nVar.getClass();
            nVar.c(this, jsonWriter);
            return sb2.toString();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }
}
