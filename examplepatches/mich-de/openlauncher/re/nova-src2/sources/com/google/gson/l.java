package com.google.gson;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;

/* loaded from: classes.dex */
public final class l extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34791a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h0 f34792b;

    public /* synthetic */ l(h0 h0Var, int i5) {
        this.f34791a = i5;
        this.f34792b = h0Var;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        switch (this.f34791a) {
            case 0:
                return new AtomicLong(((Number) this.f34792b.b(jsonReader)).longValue());
            default:
                ArrayList arrayList = new ArrayList();
                jsonReader.beginArray();
                while (jsonReader.hasNext()) {
                    arrayList.add(Long.valueOf(((Number) this.f34792b.b(jsonReader)).longValue()));
                }
                jsonReader.endArray();
                int size = arrayList.size();
                AtomicLongArray atomicLongArray = new AtomicLongArray(size);
                for (int i5 = 0; i5 < size; i5++) {
                    atomicLongArray.set(i5, ((Long) arrayList.get(i5)).longValue());
                }
                return atomicLongArray;
        }
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        switch (this.f34791a) {
            case 0:
                this.f34792b.c(jsonWriter, Long.valueOf(((AtomicLong) obj).get()));
                break;
            default:
                AtomicLongArray atomicLongArray = (AtomicLongArray) obj;
                jsonWriter.beginArray();
                int length = atomicLongArray.length();
                for (int i5 = 0; i5 < length; i5++) {
                    this.f34792b.c(jsonWriter, Long.valueOf(atomicLongArray.get(i5)));
                }
                jsonWriter.endArray();
                break;
        }
    }
}
