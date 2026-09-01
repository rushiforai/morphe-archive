package defpackage;

import pushnotifications.SY.eoLmc;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class l3d {
    public static final l3d APPLE;
    public static final l3d FACEBOOK;
    public static final l3d GOOGLE;
    public static final l3d MEDIUM;
    public static final l3d X;
    public static final /* synthetic */ l3d[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    public l3d(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static l3d valueOf(String str) {
        return (l3d) Enum.valueOf(l3d.class, str);
    }

    public static l3d[] values() {
        return (l3d[]) b.clone();
    }

    public final String getValue() {
        return this.a;
    }

    static {
        l3d l3dVar = new l3d("GOOGLE", 0, "google");
        GOOGLE = l3dVar;
        l3d l3dVar2 = new l3d("MEDIUM", 1, eoLmc.IiotIoCYtFh);
        MEDIUM = l3dVar2;
        l3d l3dVar3 = new l3d("FACEBOOK", 2, "facebook");
        FACEBOOK = l3dVar3;
        l3d l3dVar4 = new l3d("X", 3, "twitter");
        X = l3dVar4;
        l3d l3dVar5 = new l3d("APPLE", 4, "apple");
        APPLE = l3dVar5;
        l3d[] l3dVarArr = {l3dVar, l3dVar2, l3dVar3, l3dVar4, l3dVar5};
        b = l3dVarArr;
        c = new i04(l3dVarArr);
    }
}
