package io.branch.search.internal;

import android.content.Context;
import android.content.SharedPreferences;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.Y2;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Lazy;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class G2 implements F2 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f62505a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final AtomicReference<C3282n8> f62506b;

    public static final class a {
    }

    public G2(@NotNull SharedPreferences remoteConfigPref) {
        Intrinsics.g(remoteConfigPref, "remoteConfigPref");
        this.f62505a = remoteConfigPref;
        this.f62506b = new AtomicReference<>(null);
    }

    @Override // io.branch.search.internal.F2
    @NotNull
    public final C3282n8 a(@NotNull String remoteConfigJson) throws Exception {
        Intrinsics.g(remoteConfigJson, "remoteConfigJson");
        C3282n8.Companion.getClass();
        Lazy lazy = S4.f63334a;
        Object value = lazy.getValue();
        Intrinsics.f(value, "<get-gson>(...)");
        Object objFromJson = ((Gson) value).fromJson(remoteConfigJson, (Class<Object>) C3282n8.class);
        Intrinsics.f(objFromJson, "gson.fromJson(remoteConf…onfiguration::class.java)");
        C3282n8 c3282n8 = (C3282n8) objFromJson;
        SharedPreferences.Editor editorEdit = this.f62505a.edit();
        Object value2 = lazy.getValue();
        Intrinsics.f(value2, "<get-gson>(...)");
        String json = ((Gson) value2).toJson(c3282n8, InterfaceC3299o8.class);
        Intrinsics.f(json, "gson.toJson(\n           …\n            },\n        )");
        editorEdit.putString("key_historical_overrides", json).apply();
        this.f62506b.set(c3282n8);
        return c3282n8;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public G2(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Y2.a aVar = Y2.Companion;
        Y2.b bVar = Y2.b.RemoteConfig;
        aVar.getClass();
        this(Y2.a.a(context, bVar));
    }

    @Override // io.branch.search.internal.F2
    @NotNull
    public final C3282n8 a() throws JsonIOException {
        C3282n8 c3282n8;
        String string = this.f62505a.getString("key_historical_overrides", "{}");
        String str = string != null ? string : "{}";
        try {
            c3282n8 = this.f62506b.get();
            if (c3282n8 == null) {
                C3282n8.Companion.getClass();
                Object value = S4.f63334a.getValue();
                Intrinsics.f(value, "<get-gson>(...)");
                Object objFromJson = ((Gson) value).fromJson(str, (Class<Object>) C3282n8.class);
                Intrinsics.f(objFromJson, "gson.fromJson(remoteConf…onfiguration::class.java)");
                c3282n8 = (C3282n8) objFromJson;
                this.f62506b.set(c3282n8);
            }
        } catch (Exception e3) {
            String strConcat = "Invalid remote configuration: ".concat(str);
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6("BranchRemoteConfigManagerImpl", strConcat, null, e3, null));
            c3282n8 = null;
        }
        if (c3282n8 != null) {
            return c3282n8;
        }
        C3282n8 c3282n82 = C3282n8.f65347o0;
        SharedPreferences.Editor editorEdit = this.f62505a.edit();
        c3282n82.getClass();
        Object value2 = S4.f63334a.getValue();
        Intrinsics.f(value2, "<get-gson>(...)");
        String json = ((Gson) value2).toJson(c3282n82, InterfaceC3299o8.class);
        Intrinsics.f(json, "gson.toJson(\n           …\n            },\n        )");
        editorEdit.putString("key_historical_overrides", json).apply();
        this.f62506b.set(c3282n82);
        return c3282n82;
    }
}
