package com.google.android.libraries.places.internal;

import b.c0;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.i;

/* loaded from: classes3.dex */
public final class zzij {
    private final Gson zza = new GsonBuilder().setFieldNamingPolicy(i.f34783b).create();

    public final Object zza(String str, Class cls) throws zzfk {
        try {
            return this.zza.fromJson(str, cls);
        } catch (JsonSyntaxException unused) {
            throw new zzfk(c0.l("Could not convert JSON string to ", cls.getName(), " due to syntax errors."));
        }
    }
}
