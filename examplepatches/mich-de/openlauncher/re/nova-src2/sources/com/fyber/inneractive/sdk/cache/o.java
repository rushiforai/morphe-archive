package com.fyber.inneractive.sdk.cache;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: classes3.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final SharedPreferences f27677a;

    public o(Context context) {
        this.f27677a = context.getSharedPreferences("DtResponseHeaders", 0);
    }

    public final void a(HashMap map) {
        SharedPreferences.Editor editorEdit = this.f27677a.edit();
        for (Map.Entry entry : map.entrySet()) {
            Object value = entry.getValue();
            String str = (String) entry.getKey();
            if (value == null) {
                editorEdit.remove(str);
            } else if (value instanceof Boolean) {
                editorEdit.putBoolean(str, ((Boolean) value).booleanValue());
            } else if (value instanceof Integer) {
                editorEdit.putInt(str, ((Integer) value).intValue());
            } else if (value instanceof Float) {
                editorEdit.putFloat(str, ((Float) value).floatValue());
            } else if (value instanceof Long) {
                editorEdit.putLong(str, ((Long) value).longValue());
            } else if (value instanceof String) {
                editorEdit.putString(str, (String) value);
            } else if (value instanceof Set) {
                HashSet hashSet = new HashSet();
                for (Object obj : (Set) value) {
                    if (obj instanceof String) {
                        hashSet.add((String) obj);
                    }
                }
                editorEdit.putStringSet(str, hashSet);
            } else {
                editorEdit.putString(str, value.toString());
            }
        }
        editorEdit.apply();
    }
}
