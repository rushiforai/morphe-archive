package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ht4 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[bt4.values().length];
        try {
            iArr[bt4.FOLLOWING.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[bt4.NOT_FOLLOWING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[bt4.CANT_FOLLOW.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[bt4.ERROR.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
        int[] iArr2 = new int[EntityType.values().length];
        try {
            iArr2[EntityType.AUTHOR.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[EntityType.COLLECTION.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
    }
}
