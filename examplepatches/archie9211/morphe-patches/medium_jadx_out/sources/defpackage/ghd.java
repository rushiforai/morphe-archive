package defpackage;

import android.R;
import android.content.res.Resources;
import android.os.Build;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ghd {
    public static final ghd Autofill;
    public static final ghd Copy;
    public static final ghd Cut;
    public static final ghd Paste;
    public static final ghd SelectAll;
    public static final /* synthetic */ ghd[] d;
    public static final /* synthetic */ i04 e;
    public final Object a;
    public final int b;
    public final int c;

    static {
        ghd ghdVar = new ghd("Cut", 0, pxf.G, R.string.cut, R.attr.actionModeCutDrawable);
        Cut = ghdVar;
        ghd ghdVar2 = new ghd("Copy", 1, pxf.H, R.string.copy, R.attr.actionModeCopyDrawable);
        Copy = ghdVar2;
        ghd ghdVar3 = new ghd("Paste", 2, pxf.I, R.string.paste, R.attr.actionModePasteDrawable);
        Paste = ghdVar3;
        ghd ghdVar4 = new ghd("SelectAll", 3, pxf.J, R.string.selectAll, R.attr.actionModeSelectAllDrawable);
        SelectAll = ghdVar4;
        ghd ghdVar5 = new ghd("Autofill", 4, pxf.K, Build.VERSION.SDK_INT <= 26 ? com.medium.reader.R.string.androidx_compose_foundation_autofill : R.string.autofill, 0);
        Autofill = ghdVar5;
        ghd[] ghdVarArr = {ghdVar, ghdVar2, ghdVar3, ghdVar4, ghdVar5};
        d = ghdVarArr;
        e = new i04(ghdVarArr);
    }

    public ghd(String str, int i, Object obj, int i2, int i3) {
        this.a = obj;
        this.b = i2;
        this.c = i3;
    }

    public static g04 getEntries() {
        return e;
    }

    public static ghd valueOf(String str) {
        return (ghd) Enum.valueOf(ghd.class, str);
    }

    public static ghd[] values() {
        return (ghd[]) d.clone();
    }

    /* JADX INFO: renamed from: getDrawableId-3I4p1mQ, reason: not valid java name */
    public final int m111getDrawableId3I4p1mQ() {
        return this.c;
    }

    public final Object getKey() {
        return this.a;
    }

    /* JADX INFO: renamed from: getStringId-9Hzcbyc, reason: not valid java name */
    public final int m112getStringId9Hzcbyc() {
        return this.b;
    }

    public final String resolvedString(x12 x12Var, int i) {
        return ((Resources) ((p65) x12Var).j(eo.c)).getString(this.b);
    }
}
