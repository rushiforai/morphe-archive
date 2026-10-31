package com.amplitude.android.storage;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006j\u0002\b\u0007¨\u0006\b"}, d2 = {"Lcom/amplitude/android/storage/StorageVersion;", b.f42142b, "rawValue", b.f42142b, "(Ljava/lang/String;II)V", "getRawValue", "()I", "V3", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class StorageVersion {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ StorageVersion[] $VALUES;
    public static final StorageVersion V3 = new StorageVersion("V3", 0, 3);
    private final int rawValue;

    private static final /* synthetic */ StorageVersion[] $values() {
        return new StorageVersion[]{V3};
    }

    static {
        StorageVersion[] storageVersionArr$values = $values();
        $VALUES = storageVersionArr$values;
        $ENTRIES = EnumEntriesKt.a(storageVersionArr$values);
    }

    private StorageVersion(String str, int i5, int i11) {
        this.rawValue = i11;
    }

    @NotNull
    public static EnumEntries<StorageVersion> getEntries() {
        return $ENTRIES;
    }

    public static StorageVersion valueOf(String str) {
        return (StorageVersion) Enum.valueOf(StorageVersion.class, str);
    }

    public static StorageVersion[] values() {
        return (StorageVersion[]) $VALUES.clone();
    }

    public final int getRawValue() {
        return this.rawValue;
    }
}
