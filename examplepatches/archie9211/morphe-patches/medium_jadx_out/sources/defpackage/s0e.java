package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class s0e {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[EntityType.values().length];
        try {
            iArr[EntityType.AUTHOR.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[EntityType.COLLECTION.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
    }
}
