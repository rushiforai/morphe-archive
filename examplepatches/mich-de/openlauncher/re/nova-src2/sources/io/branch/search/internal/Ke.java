package io.branch.search.internal;

import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public interface Ke<T, R> {

    public static final class a {
        public static <T, R> void a(@NotNull Ke<T, R> ke2) {
            S sF;
            JSONObject jSONObjectB = ke2.b();
            if (jSONObjectB.length() <= 0 || (sF = ke2.f()) == null) {
                return;
            }
            String strA = ke2.a();
            String string = jSONObjectB.toString();
            Intrinsics.f(string, "jsonToPersist.toString()");
            sF.a(strA, string);
        }
    }

    @NotNull
    String a();

    @NotNull
    JSONObject b();

    @NotNull
    ConcurrentHashMap c();

    void clear();

    void d();

    void e();

    @Nullable
    S f();
}
