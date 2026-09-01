package com.medium.android.core.models;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/medium/android/core/models/EntityType;", "", "<init>", "(Ljava/lang/String;I)V", "AUTHOR", "COLLECTION", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class EntityType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ EntityType[] $VALUES;
    public static final EntityType AUTHOR = new EntityType("AUTHOR", 0);
    public static final EntityType COLLECTION = new EntityType("COLLECTION", 1);

    private static final /* synthetic */ EntityType[] $values() {
        return new EntityType[]{AUTHOR, COLLECTION};
    }

    static {
        EntityType[] entityTypeArr$values = $values();
        $VALUES = entityTypeArr$values;
        $ENTRIES = rv8.x(entityTypeArr$values);
    }

    private EntityType(String str, int i) {
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static EntityType valueOf(String str) {
        return (EntityType) Enum.valueOf(EntityType.class, str);
    }

    public static EntityType[] values() {
        return (EntityType[]) $VALUES.clone();
    }
}
