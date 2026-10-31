package io.branch.search.internal;

import android.content.Context;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedHashMap;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class C6 {
    @JvmStatic
    @Nullable
    public static final LinkedHashMap a(@NotNull Context context) throws IOException {
        String string;
        Intrinsics.g(context, "context");
        File file = new File(context.getExternalFilesDir(null), "bnc_debug_override.json");
        boolean zExists = file.exists();
        a50.b bVar = a50.b.f402c;
        if (zExists) {
            StringBuilder sb2 = new StringBuilder();
            try {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
                for (String line = bufferedReader.readLine(); line != null; line = bufferedReader.readLine()) {
                    sb2.append(line);
                }
                C3309p1.c(EnumC3131e9.InternalDebug, "read external file bnc_debug_override.json success content:" + ((Object) sb2));
            } catch (IOException e3) {
                EnumC3131e9 logTag = EnumC3131e9.InternalDebug;
                C3309p1 c3309p1 = C3309p1.f65465a;
                Intrinsics.g(logTag, "logTag");
                C3309p1.a(bVar, "Internal-DEBUG", "cannot read external file bnc_debug_override.json", e3);
            }
            string = sb2.toString();
            Intrinsics.f(string, "sb.toString()");
        } else {
            C3309p1.c(EnumC3131e9.InternalDebug, "bnc_debug_override.json does not exist.");
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (string.length() == 0) {
            return null;
        }
        try {
            return C3198i8.a(new JSONObject(string));
        } catch (JSONException e11) {
            EnumC3131e9 logTag2 = EnumC3131e9.InternalDebug;
            C3309p1 c3309p12 = C3309p1.f65465a;
            Intrinsics.g(logTag2, "logTag");
            C3309p1.a(bVar, "Internal-DEBUG", "reading external json bnc_debug_override.json failed", e11);
            return null;
        }
    }
}
