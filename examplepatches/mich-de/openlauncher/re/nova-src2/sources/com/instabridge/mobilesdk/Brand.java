package com.instabridge.mobilesdk;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B)\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000bj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0013"}, d2 = {"Lcom/instabridge/mobilesdk/Brand;", b.f42142b, "serverPackage", b.f42142b, "displayName", "provider", b.f42142b, "operatorName", "<init>", "(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V", "getServerPackage", "()Ljava/lang/String;", "getDisplayName", "getProvider", "()I", "getOperatorName", "NOVA", "EYECON", "INSTABRIDGE", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class Brand {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ Brand[] $VALUES;

    @NotNull
    private final String displayName;

    @NotNull
    private final String operatorName;
    private final int provider;

    @NotNull
    private final String serverPackage;
    public static final Brand NOVA = new Brand("NOVA", 0, "com.teslacoilsw.launcher", "Nova Mobile", 1, "Nova");
    public static final Brand EYECON = new Brand("EYECON", 1, "com.eyecon.global", "Eyecon Mobile", 2, "Eyecon");
    public static final Brand INSTABRIDGE = new Brand("INSTABRIDGE", 2, "com.instabridge.android", "Instabridge Mobile", 0, "Instabridge");

    private static final /* synthetic */ Brand[] $values() {
        return new Brand[]{NOVA, EYECON, INSTABRIDGE};
    }

    static {
        Brand[] brandArr$values = $values();
        $VALUES = brandArr$values;
        $ENTRIES = EnumEntriesKt.a(brandArr$values);
    }

    private Brand(String str, int i5, String str2, String str3, int i11, String str4) {
        this.serverPackage = str2;
        this.displayName = str3;
        this.provider = i11;
        this.operatorName = str4;
    }

    @NotNull
    public static EnumEntries<Brand> getEntries() {
        return $ENTRIES;
    }

    public static Brand valueOf(String str) {
        return (Brand) Enum.valueOf(Brand.class, str);
    }

    public static Brand[] values() {
        return (Brand[]) $VALUES.clone();
    }

    @NotNull
    public final String getDisplayName() {
        return this.displayName;
    }

    @NotNull
    public final String getOperatorName() {
        return this.operatorName;
    }

    public final int getProvider() {
        return this.provider;
    }

    @NotNull
    public final String getServerPackage() {
        return this.serverPackage;
    }
}
