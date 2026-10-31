package hn;

import com.google.gson.Gson;
import com.google.gson.h0;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class d extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public volatile h0 f59896a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f59897b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f59898c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Gson f59899d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ mn.a f59900e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ e f59901f;

    public d(e eVar, boolean z11, boolean z12, Gson gson, mn.a aVar) {
        this.f59901f = eVar;
        this.f59897b = z11;
        this.f59898c = z12;
        this.f59899d = gson;
        this.f59900e = aVar;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) throws IOException {
        if (this.f59897b) {
            jsonReader.skipValue();
            return null;
        }
        h0 delegateAdapter = this.f59896a;
        if (delegateAdapter == null) {
            delegateAdapter = this.f59899d.getDelegateAdapter(this.f59901f, this.f59900e);
            this.f59896a = delegateAdapter;
        }
        return delegateAdapter.b(jsonReader);
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
        if (this.f59898c) {
            jsonWriter.nullValue();
            return;
        }
        h0 delegateAdapter = this.f59896a;
        if (delegateAdapter == null) {
            delegateAdapter = this.f59899d.getDelegateAdapter(this.f59901f, this.f59900e);
            this.f59896a = delegateAdapter;
        }
        delegateAdapter.c(jsonWriter, obj);
    }
}
