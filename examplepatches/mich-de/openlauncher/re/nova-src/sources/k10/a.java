package k10;

import android.content.SharedPreferences;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements SharedPreferences.Editor {

    /* renamed from: a, reason: collision with root package name */
    public final b f70851a;

    /* renamed from: b, reason: collision with root package name */
    public final z.e f70852b;

    public a(b bVar) {
        this.f70851a = bVar;
        z.e eVar = bVar.f70853a;
        z.e eVar2 = new z.e(0);
        eVar2.g(eVar);
        this.f70852b = eVar2;
    }

    @Override // android.content.SharedPreferences.Editor
    public final void apply() {
        commit();
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor clear() {
        this.f70852b.clear();
        return this;
    }

    @Override // android.content.SharedPreferences.Editor
    public final boolean commit() {
        b bVar = this.f70851a;
        bVar.f70853a.clear();
        z.e eVar = bVar.f70853a;
        z.e eVar2 = this.f70852b;
        Intrinsics.e(eVar2, "null cannot be cast to non-null type androidx.collection.SimpleArrayMap<out kotlin.String, out kotlin.Any>");
        eVar.g(eVar2);
        return true;
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor putBoolean(String str, boolean z11) {
        this.f70852b.put(str, Boolean.valueOf(z11));
        return this;
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor putFloat(String str, float f11) {
        this.f70852b.put(str, Float.valueOf(f11));
        return this;
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor putInt(String str, int i5) {
        this.f70852b.put(str, Integer.valueOf(i5));
        return this;
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor putLong(String str, long j11) {
        this.f70852b.put(str, Long.valueOf(j11));
        return this;
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor putString(String str, String str2) {
        this.f70852b.put(str, str2);
        return this;
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor putStringSet(String str, Set set) {
        this.f70852b.put(str, set);
        return this;
    }

    @Override // android.content.SharedPreferences.Editor
    public final SharedPreferences.Editor remove(String str) {
        this.f70852b.remove(str);
        return this;
    }
}
