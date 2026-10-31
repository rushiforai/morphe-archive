package io.branch.search.internal;

import android.content.SharedPreferences;
import com.google.gson.Gson;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.j5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3211j5 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Gson f64885a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f64886b;

    /* renamed from: io.branch.search.internal.j5$a */
    public static final class a {
    }

    public C3211j5(@NotNull Gson gson, @NotNull SharedPreferences sharedPrefs) {
        Intrinsics.g(gson, "gson");
        Intrinsics.g(sharedPrefs, "sharedPrefs");
        this.f64885a = gson;
        this.f64886b = sharedPrefs;
    }

    @NotNull
    public final C3195i5 a() {
        C3195i5 c3195i5 = (C3195i5) this.f64885a.fromJson(this.f64886b.getString("branch_internal_database_raw", null), C3195i5.class);
        return c3195i5 == null ? new C3195i5(0) : c3195i5;
    }

    public final void a(@Nullable C3195i5 c3195i5) {
        SharedPreferences.Editor editorEdit = this.f64886b.edit();
        editorEdit.putString("branch_internal_database_raw", this.f64885a.toJson(c3195i5));
        editorEdit.apply();
    }
}
