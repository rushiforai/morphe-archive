package com.medium.android.core.models;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/medium/android/core/models/MembershipTypeEntity;", "", "<init>", "(Ljava/lang/String;I)V", "NOT_A_MEMBER", "REGULAR", "PREMIUM", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MembershipTypeEntity {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ MembershipTypeEntity[] $VALUES;
    public static final MembershipTypeEntity NOT_A_MEMBER = new MembershipTypeEntity("NOT_A_MEMBER", 0);
    public static final MembershipTypeEntity REGULAR = new MembershipTypeEntity("REGULAR", 1);
    public static final MembershipTypeEntity PREMIUM = new MembershipTypeEntity("PREMIUM", 2);

    private static final /* synthetic */ MembershipTypeEntity[] $values() {
        return new MembershipTypeEntity[]{NOT_A_MEMBER, REGULAR, PREMIUM};
    }

    static {
        MembershipTypeEntity[] membershipTypeEntityArr$values = $values();
        $VALUES = membershipTypeEntityArr$values;
        $ENTRIES = rv8.x(membershipTypeEntityArr$values);
    }

    private MembershipTypeEntity(String str, int i) {
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static MembershipTypeEntity valueOf(String str) {
        return (MembershipTypeEntity) Enum.valueOf(MembershipTypeEntity.class, str);
    }

    public static MembershipTypeEntity[] values() {
        return (MembershipTypeEntity[]) $VALUES.clone();
    }
}
