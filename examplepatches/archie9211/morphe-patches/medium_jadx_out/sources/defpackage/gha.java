package defpackage;

import com.medium.android.graphql.type.PublicationStaffRole;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class gha {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[PublicationStaffRole.values().length];
        try {
            iArr[PublicationStaffRole.EDITOR.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[PublicationStaffRole.OWNER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[PublicationStaffRole.WRITER.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[PublicationStaffRole.UNKNOWN__.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
    }
}
