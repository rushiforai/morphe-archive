package com.amplitude.android.utilities;

import android.content.SharedPreferences;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.id.utilities.KeyValueStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0016J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\nH\u0016J\u0018\u0010\f\u001a\u00020\r2\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\u000e\u001a\u00020\nH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/amplitude/android/utilities/AndroidKVS;", "Lcom/amplitude/id/utilities/KeyValueStore;", "sharedPreferences", "Landroid/content/SharedPreferences;", "(Landroid/content/SharedPreferences;)V", "deleteKey", b.f42142b, DatabaseConstants.KEY_FIELD, b.f42142b, "getLong", b.f42142b, "defaultVal", "putLong", b.f42142b, "value", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AndroidKVS implements KeyValueStore {

    @NotNull
    private final SharedPreferences sharedPreferences;

    public AndroidKVS(@NotNull SharedPreferences sharedPreferences) {
        Intrinsics.g(sharedPreferences, "sharedPreferences");
        this.sharedPreferences = sharedPreferences;
    }

    @Override // com.amplitude.id.utilities.KeyValueStore
    public void deleteKey(@NotNull String key) {
        Intrinsics.g(key, "key");
        this.sharedPreferences.edit().remove(key).commit();
    }

    @Override // com.amplitude.id.utilities.KeyValueStore
    public long getLong(@NotNull String key, long defaultVal) {
        Intrinsics.g(key, "key");
        return this.sharedPreferences.getLong(key, defaultVal);
    }

    @Override // com.amplitude.id.utilities.KeyValueStore
    public boolean putLong(@NotNull String key, long value) {
        Intrinsics.g(key, "key");
        return this.sharedPreferences.edit().putLong(key, value).commit();
    }
}
