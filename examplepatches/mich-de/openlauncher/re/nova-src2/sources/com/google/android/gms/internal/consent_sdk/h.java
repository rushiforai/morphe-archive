package com.google.android.gms.internal.consent_sdk;

import android.app.Application;
import android.content.SharedPreferences;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: d, reason: collision with root package name */
    public static final r0 f32080d = r0.g(4, "IABTCF_TCString", "IABGPP_HDR_GppString", "IABGPP_GppSID", "IABUSPrivacy_String");

    /* renamed from: a, reason: collision with root package name */
    public final Application f32081a;

    /* renamed from: b, reason: collision with root package name */
    public final SharedPreferences f32082b;

    /* renamed from: c, reason: collision with root package name */
    public final HashSet f32083c;

    public h(Application application) {
        this.f32081a = application;
        SharedPreferences sharedPreferences = application.getSharedPreferences("__GOOGLE_FUNDING_CHOICE_SDK_INTERNAL__", 0);
        this.f32082b = sharedPreferences;
        this.f32083c = new HashSet(sharedPreferences.getStringSet("written_values", Collections.EMPTY_SET));
    }

    public final HashMap a() {
        Object obj;
        String string;
        Set<String> stringSet = this.f32082b.getStringSet("stored_info", u0.f32252i);
        if (stringSet.isEmpty()) {
            stringSet = f32080d;
        }
        HashMap map = new HashMap();
        for (String str : stringSet) {
            Application application = this.f32081a;
            e eVarU = i30.j.U(application, str);
            if (eVarU != null && (obj = application.getSharedPreferences((String) eVarU.f32051a, 0).getAll().get((String) eVarU.f32052b)) != null) {
                if (obj instanceof Boolean) {
                    string = true != ((Boolean) obj).booleanValue() ? "0" : "1";
                } else if (obj instanceof Number) {
                    string = obj.toString();
                } else if (obj instanceof String) {
                    string = (String) obj;
                }
                map.put(str, string);
            }
        }
        return map;
    }
}
