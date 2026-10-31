package com.amplitude;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.zip.Deflater;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.amplitude.p1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0496p1 {

    /* renamed from: a, reason: collision with root package name */
    public final Gson f20711a = new GsonBuilder().serializeNulls().create();

    public final String a(W1 event) throws JSONException {
        Intrinsics.g(event, "event");
        JSONObject jSONObject = new JSONObject(this.f20711a.toJson(event));
        jSONObject.put("v", com.moloco.sdk.internal.services.init.i.f38066a);
        String string = jSONObject.toString();
        Intrinsics.f(string, "toString(...)");
        Charset charsetForName = Charset.forName("UTF-8");
        Intrinsics.f(charsetForName, "forName(...)");
        byte[] bytes = string.getBytes(charsetForName);
        Intrinsics.f(bytes, "getBytes(...)");
        byte[] bArr = new byte[bytes.length * 4];
        Deflater deflater = new Deflater();
        deflater.setInput(bytes);
        deflater.finish();
        byte[] bArrX = u90.b.x(0, deflater.deflate(bArr), bArr);
        Charset charset = StandardCharsets.ISO_8859_1;
        Intrinsics.d(charset);
        String json = this.f20711a.toJson(new String(bArrX, charset));
        Intrinsics.f(json, "toJson(...)");
        return json;
    }
}
