package com.iab.omid.library.vungle.attestation;

import android.content.Context;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    private static final d f35166a = new d();

    public static void a(Context context, String str, a aVar) {
        String strConcat;
        String str2;
        if (context == null) {
            str2 = "Attestation failed: Application Context cannot be null";
        } else if (str != null) {
            try {
                if (str.trim().isEmpty()) {
                    str2 = "Attestation failed: Mechanism name cannot be null or empty";
                } else {
                    if (aVar != null) {
                        if (c.a(context).a(str)) {
                            b bVarA = f35166a.a(str, context);
                            if (bVarA != null) {
                                bVarA.a(aVar);
                                return;
                            }
                            strConcat = "Failed to create mechanism: ".concat(str);
                        } else {
                            strConcat = "Mechanism not supported on this device: ".concat(str);
                        }
                        com.iab.omid.library.vungle.utils.d.d(strConcat);
                        return;
                    }
                    str2 = "Attestation failed: Attestation arguments cannot be null";
                }
            } catch (Exception e3) {
                com.iab.omid.library.vungle.utils.d.a("Error during attestation with mechanism: " + str, e3);
                return;
            }
        } else {
            str2 = "Attestation failed: Mechanism name cannot be null or empty";
        }
        com.iab.omid.library.vungle.utils.d.b(str2);
    }
}
