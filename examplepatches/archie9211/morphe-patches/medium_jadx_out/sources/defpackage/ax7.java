package defpackage;

import com.medium.android.core.models.MembershipTypeEntity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ax7 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[MembershipTypeEntity.values().length];
        try {
            iArr[MembershipTypeEntity.NOT_A_MEMBER.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[MembershipTypeEntity.REGULAR.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[MembershipTypeEntity.PREMIUM.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
