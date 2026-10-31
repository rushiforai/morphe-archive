package io.branch.search.internal;

import android.content.SharedPreferences;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class N5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f62970a;

    public N5(@NotNull SharedPreferences sharedPrefs) {
        Intrinsics.g(sharedPrefs, "sharedPrefs");
        this.f62970a = sharedPrefs;
    }

    @NotNull
    public final String a() {
        String string = this.f62970a.getString("hashing_device_id", null);
        if (string != null) {
            return string;
        }
        String string2 = UUID.randomUUID().toString();
        SharedPreferences.Editor editorEdit = this.f62970a.edit();
        editorEdit.putString("hashing_device_id", string2);
        editorEdit.apply();
        return string2;
    }
}
