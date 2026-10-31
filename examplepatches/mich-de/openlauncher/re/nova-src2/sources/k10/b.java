package k10;

import android.content.SharedPreferences;
import java.util.Map;
import java.util.Set;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class b implements SharedPreferences {

    /* renamed from: a, reason: collision with root package name */
    public final z.e f70853a;

    public b(SharedPreferences sharedPreferences) {
        z.e eVar = new z.e(0);
        this.f70853a = eVar;
        eVar.putAll(sharedPreferences.getAll());
    }

    @Override // android.content.SharedPreferences
    public final boolean contains(String str) {
        return this.f70853a.containsKey(str);
    }

    @Override // android.content.SharedPreferences
    public final SharedPreferences.Editor edit() {
        return new a(this);
    }

    @Override // android.content.SharedPreferences
    public final Map getAll() {
        return this.f70853a;
    }

    @Override // android.content.SharedPreferences
    public final boolean getBoolean(String str, boolean z11) {
        Object obj = this.f70853a.get(str);
        Boolean bool = obj instanceof Boolean ? (Boolean) obj : null;
        return bool != null ? bool.booleanValue() : z11;
    }

    @Override // android.content.SharedPreferences
    public final float getFloat(String str, float f11) {
        Object obj = this.f70853a.get(str);
        Float f12 = obj instanceof Float ? (Float) obj : null;
        return f12 != null ? f12.floatValue() : f11;
    }

    @Override // android.content.SharedPreferences
    public final int getInt(String str, int i5) {
        Object obj = this.f70853a.get(str);
        Integer num = obj instanceof Integer ? (Integer) obj : null;
        return num != null ? num.intValue() : i5;
    }

    @Override // android.content.SharedPreferences
    public final long getLong(String str, long j11) {
        Object obj = this.f70853a.get(str);
        Long l9 = obj instanceof Long ? (Long) obj : null;
        return l9 != null ? l9.longValue() : j11;
    }

    @Override // android.content.SharedPreferences
    public final String getString(String str, String str2) {
        Object obj = this.f70853a.get(str);
        String str3 = obj instanceof String ? (String) obj : null;
        return str3 == null ? str2 : str3;
    }

    @Override // android.content.SharedPreferences
    public final Set getStringSet(String str, Set set) {
        Object obj = this.f70853a.get(str);
        Set set2 = obj instanceof Set ? (Set) obj : null;
        return set2 == null ? set : set2;
    }

    @Override // android.content.SharedPreferences
    public final void registerOnSharedPreferenceChangeListener(SharedPreferences.OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    @Override // android.content.SharedPreferences
    public final void unregisterOnSharedPreferenceChangeListener(SharedPreferences.OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }
}
