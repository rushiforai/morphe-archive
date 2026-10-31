package com.google.firebase.crashlytics;

import com.amplitude.android.migration.DatabaseConstants;
import com.google.firebase.crashlytics.CustomKeysAndValues;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u0006\n\u0002\u0010\u0007\n\u0002\u0010\b\n\u0002\u0010\t\n\u0000\u0018\u00002\u00020\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005B\t\b\u0010¢\u0006\u0004\b\u0004\u0010\u0006J\r\u0010\u0007\u001a\u00020\bH\u0000¢\u0006\u0002\b\tJ\u0016\u0010\n\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\n\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010\n\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010\n\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010\n\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0012J\u0016\u0010\n\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0013"}, d2 = {"Lcom/google/firebase/crashlytics/KeyValueBuilder;", b.f42142b, "builder", "Lcom/google/firebase/crashlytics/CustomKeysAndValues$Builder;", "<init>", "(Lcom/google/firebase/crashlytics/CustomKeysAndValues$Builder;)V", "()V", "build", "Lcom/google/firebase/crashlytics/CustomKeysAndValues;", "build$com_google_firebase_firebase_crashlytics", DatabaseConstants.KEY_FIELD, b.f42142b, b.f42142b, "value", b.f42142b, b.f42142b, b.f42142b, b.f42142b, b.f42142b, "com.google.firebase-firebase-crashlytics"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class KeyValueBuilder {

    @NotNull
    private final CustomKeysAndValues.Builder builder;

    private KeyValueBuilder(CustomKeysAndValues.Builder builder) {
        this.builder = builder;
    }

    @NotNull
    public final CustomKeysAndValues build$com_google_firebase_firebase_crashlytics() {
        CustomKeysAndValues customKeysAndValuesBuild = this.builder.build();
        Intrinsics.f(customKeysAndValuesBuild, "build(...)");
        return customKeysAndValuesBuild;
    }

    public final void key(@NotNull String key, boolean value) {
        Intrinsics.g(key, "key");
        this.builder.putBoolean(key, value);
    }

    public final void key(@NotNull String key, double value) {
        Intrinsics.g(key, "key");
        this.builder.putDouble(key, value);
    }

    public KeyValueBuilder() {
        this(new CustomKeysAndValues.Builder());
    }

    public final void key(@NotNull String key, float value) {
        Intrinsics.g(key, "key");
        this.builder.putFloat(key, value);
    }

    public final void key(@NotNull String key, int value) {
        Intrinsics.g(key, "key");
        this.builder.putInt(key, value);
    }

    public final void key(@NotNull String key, long value) {
        Intrinsics.g(key, "key");
        this.builder.putLong(key, value);
    }

    public final void key(@NotNull String key, @NotNull String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        this.builder.putString(key, value);
    }
}
