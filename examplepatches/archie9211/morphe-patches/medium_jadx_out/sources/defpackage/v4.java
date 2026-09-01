package defpackage;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.text.LineBreakConfig;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.os.ext.SdkExtensions;
import android.provider.MediaStore;
import android.text.BoringLayout;
import android.text.StaticLayout;
import android.text.TextDirectionHeuristic;
import android.text.TextPaint;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.CursorAnchorInfo;
import android.view.inputmethod.InputMethodManager;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.android.libraries.identity.googleid.GoogleIdTokenParsingException;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.donkey.read.web.ExternalWebViewActivity;
import com.medium.android.donkey.read.web.ExternalWebViewBottomSheetDialogFragment;
import com.medium.android.donkey.read.web.ExternalWebViewFragment;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.reader.R;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class v4 {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r6v6 */
    public static final void b(String str, String str2, String str3, nhc nhcVar, c84 c84Var, boolean z, boolean z2, x12 x12Var, int i) {
        p65 p65Var;
        ?? r6;
        sb2 sb2Var;
        y3f y3fVarB;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1011885082);
        int i2 = i | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.f(str3) ? 256 : 128) | (p65Var2.f(c84Var) ? 16384 : 8192) | (p65Var2.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var2.g(z2) ? 1048576 : 524288);
        if (p65Var2.P(i2 & 1, (599187 & i2) != 599186)) {
            Object objM = p65Var2.M();
            Object obj = w12.a;
            if (objM == obj) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == obj) {
                objM2 = kyd.M(p65Var2);
                p65Var2.j0(objM2);
            }
            sb2 sb2Var2 = (sb2) objM2;
            boolean z3 = (i2 & 57344) == 16384;
            Object objM3 = p65Var2.M();
            if (z3 || objM3 == obj) {
                r6 = 0;
                sb2Var = sb2Var2;
                objM3 = new hq3(0, c84Var, c84.class, "close", "close()V", 0, 18);
                p65Var2.j0(objM3);
            } else {
                r6 = 0;
                sb2Var = sb2Var2;
            }
            qh6 qh6Var = (qh6) objM3;
            c09 c09VarJ = vn7.J(z ? R.drawable.ic_close_24 : R.drawable.ic_arrow_left_24, r6, p65Var2);
            String strR = vo7.R(p65Var2, z ? R.string.common_close : R.string.common_back);
            if (z2) {
                p65Var2.Y(-1758754062);
                y3fVarB = rod.b(p65Var2);
                p65Var2.p(r6);
            } else {
                p65Var2.Y(-1758753488);
                p65Var2.p(r6);
                y3fVarB = qb8.p;
            }
            p65 p65Var3 = p65Var2;
            qk7.f(pxf.E(1273681688, new q60(str, str2, 1), p65Var2), null, (m45) qh6Var, pxf.E(-2014637107, new ov2(l78Var, str3, sb2Var, nhcVar), p65Var2), c09VarJ, strR, 0L, 0L, y3fVarB, p65Var3, 35846, 194);
            p65Var = p65Var3;
        } else {
            p65 p65Var4 = p65Var2;
            p65Var4.S();
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ip3(str, str2, str3, nhcVar, c84Var, z, z2, i);
        }
    }

    public static final void c(Context context, Resources resources, String str, sb2 sb2Var, nhc nhcVar, l78 l78Var, xv1 xv1Var, x12 x12Var, int i) {
        xv1 xv1Var2;
        int i2;
        nhc nhcVar2;
        o28 o28Var;
        uob uobVar;
        Object k84Var;
        uob uobVar2;
        o28 o28Var2;
        Context context2 = context;
        Resources resources2 = resources;
        String str2 = str;
        sb2 sb2Var2 = sb2Var;
        xv1Var.getClass();
        if ((i & 6) == 0) {
            xv1Var2 = xv1Var;
            i2 = i | (((p65) x12Var).f(xv1Var2) ? 4 : 2);
        } else {
            xv1Var2 = xv1Var;
            i2 = i;
        }
        p65 p65Var = (p65) x12Var;
        if (!p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.S();
            return;
        }
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("https://google.com"));
        intent.addCategory("android.intent.category.BROWSABLE");
        ResolveInfo resolveInfoResolveActivity = Build.VERSION.SDK_INT >= 33 ? context2.getPackageManager().resolveActivity(intent, PackageManager.ResolveInfoFlags.of(65536L)) : context2.getPackageManager().resolveActivity(intent, ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        o28 o28Var3 = o28.b;
        uob uobVar3 = w12.a;
        if (resolveInfoResolveActivity == null) {
            p65Var.Y(1076171631);
            p65Var.p(false);
            nhcVar2 = nhcVar;
            o28Var = o28Var3;
            uobVar = uobVar3;
        } else {
            p65Var.Y(1076171632);
            mz1 mz1VarE = pxf.E(-692731539, new ag1(resolveInfoResolveActivity, 24, context2), p65Var);
            boolean zF = p65Var.f(str2) | p65Var.h(resolveInfoResolveActivity) | p65Var.h(context2) | p65Var.h(sb2Var2) | p65Var.f(nhcVar) | p65Var.h(resources2);
            Object objM = p65Var.M();
            if (zF || objM == uobVar3) {
                ll2 ll2Var = new ll2(str2, context2, sb2Var2, l78Var, resolveInfoResolveActivity, nhcVar, resources2);
                str2 = str2;
                context2 = context2;
                nhcVar2 = nhcVar;
                sb2Var2 = sb2Var2;
                p65Var.j0(ll2Var);
                objM = ll2Var;
            } else {
                nhcVar2 = nhcVar;
            }
            o28Var = o28Var3;
            uobVar = uobVar3;
            oq.b(mz1VarE, (m45) objM, bgf.N(o28Var3, "open_in_browser"), null, null, false, null, null, p65Var, 390, 504);
            p65Var = p65Var;
            p65Var.p(false);
        }
        mz1 mz1Var = gsa.b;
        boolean zH = p65Var.h(context2) | p65Var.h(resources2) | p65Var.f(str2) | ((i2 & 14) == 4) | p65Var.h(sb2Var2) | p65Var.f(nhcVar2);
        Object objM2 = p65Var.M();
        if (zH || objM2 == uobVar) {
            xv1 xv1Var3 = xv1Var2;
            uobVar2 = uobVar;
            o28Var2 = o28Var;
            k84Var = new k84(context2, resources2, str2, xv1Var3, l78Var, sb2Var2, nhcVar2);
            resources2 = resources2;
            p65Var.j0(k84Var);
        } else {
            o28Var2 = o28Var;
            k84Var = objM2;
            uobVar2 = uobVar;
        }
        p65 p65Var2 = p65Var;
        oq.b(mz1Var, (m45) k84Var, bgf.N(o28Var2, "copy_link"), null, null, false, null, null, p65Var2, 390, 504);
        mz1 mz1Var2 = gsa.c;
        boolean zF2 = p65Var2.f(str2) | p65Var2.h(context2) | p65Var2.h(resources2);
        Object objM3 = p65Var2.M();
        if (zF2 || objM3 == uobVar2) {
            objM3 = new hu0(context2, resources2, l78Var, str2);
            p65Var2.j0(objM3);
        }
        oq.b(mz1Var2, (m45) objM3, bgf.N(o28Var2, "share"), null, null, false, null, null, p65Var2, 390, 504);
    }

    public static ge5 d(Bundle bundle) throws GoogleIdTokenParsingException {
        bundle.getClass();
        try {
            String string = bundle.getString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID");
            String string2 = bundle.getString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID_TOKEN");
            String string3 = bundle.getString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_DISPLAY_NAME");
            String string4 = bundle.getString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_FAMILY_NAME");
            String string5 = bundle.getString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_GIVEN_NAME");
            Uri uri = Build.VERSION.SDK_INT >= 33 ? (Uri) bundle.getParcelable("com.google.android.libraries.identity.googleid.BUNDLE_KEY_PROFILE_PICTURE_URI", Uri.class) : (Uri) bundle.getParcelable("com.google.android.libraries.identity.googleid.BUNDLE_KEY_PROFILE_PICTURE_URI");
            String string6 = bundle.getString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_PHONE_NUMBER");
            string.getClass();
            string2.getClass();
            return new ge5(string, string2, string3, string4, string5, uri, string6);
        } catch (Exception e) {
            throw new GoogleIdTokenParsingException(e);
        }
    }

    public static ArrayList e(Context context) {
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
        context.getClass();
        int i = context.getApplicationInfo().uid;
        String str = context.getApplicationInfo().processName;
        Object systemService = context.getSystemService("activity");
        ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
        if (activityManager == null || (runningAppProcesses = activityManager.getRunningAppProcesses()) == null) {
            runningAppProcesses = ey3.a;
        }
        ArrayList arrayListV0 = bu1.v0(runningAppProcesses);
        ArrayList<ActivityManager.RunningAppProcessInfo> arrayList = new ArrayList();
        for (Object obj : arrayListV0) {
            if (((ActivityManager.RunningAppProcessInfo) obj).uid == i) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : arrayList) {
            String str2 = runningAppProcessInfo.processName;
            str2.getClass();
            arrayList2.add(new w1a(str2, runningAppProcessInfo.pid, runningAppProcessInfo.importance, g76.L(runningAppProcessInfo.processName, str)));
        }
        return arrayList2;
    }

    public static int f() {
        int i = Build.VERSION.SDK_INT;
        if (i < 33 && (i < 30 || SdkExtensions.getExtensionVersion(30) < 2)) {
            return Integer.MAX_VALUE;
        }
        return MediaStore.getPickImagesMaxLimit();
    }

    public static w1a g(Context context) {
        Object next;
        String strM;
        context.getClass();
        int iMyPid = Process.myPid();
        Iterator it2 = e(context).iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((w1a) next).b == iMyPid) {
                break;
            }
        }
        w1a w1aVar = (w1a) next;
        if (w1aVar != null) {
            return w1aVar;
        }
        int i = Build.VERSION.SDK_INT;
        if (i > 33) {
            strM = Process.myProcessName();
            strM.getClass();
        } else if ((i < 28 || (strM = Application.getProcessName()) == null) && (strM = uy.m()) == null) {
            strM = "";
        }
        return new w1a(strM, iMyPid, 0, false);
    }

    public static PackageInfo h(PackageManager packageManager, Context context) {
        return packageManager.getPackageInfo(context.getPackageName(), PackageManager.PackageInfoFlags.of(0L));
    }

    public static Object i(Bundle bundle, String str, Class cls) {
        return bundle.getParcelable(str, cls);
    }

    public static ArrayList j(Bundle bundle, String str, Class cls) {
        return bundle.getParcelableArrayList(str, cls);
    }

    public static Object k(Intent intent, String str, Class cls) {
        return intent.getParcelableExtra(str, cls);
    }

    public static Serializable l(Bundle bundle) {
        return bundle.getSerializable("catalog_item_type", CatalogItemType.class);
    }

    public static Serializable m(Intent intent) {
        return intent.getSerializableExtra("susi_operation", SusiOperation.class);
    }

    public static String n(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getUniqueId();
    }

    public static final BoringLayout.Metrics o(CharSequence charSequence, TextPaint textPaint, TextDirectionHeuristic textDirectionHeuristic) {
        return BoringLayout.isBoring(charSequence, textPaint, textDirectionHeuristic, true, null);
    }

    public static final boolean p(BoringLayout boringLayout) {
        return boringLayout.isFallbackLineSpacingEnabled();
    }

    public static final boolean q(StaticLayout staticLayout) {
        return staticLayout.isFallbackLineSpacingEnabled();
    }

    public static boolean r(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.isTextSelectable();
    }

    public static final void s(dd9 dd9Var, Object obj) {
        OnBackInvokedDispatcher onBackInvokedDispatcherFindOnBackInvokedDispatcher;
        if (!(obj instanceof OnBackInvokedCallback) || (onBackInvokedDispatcherFindOnBackInvokedDispatcher = dd9Var.findOnBackInvokedDispatcher()) == null) {
            return;
        }
        onBackInvokedDispatcherFindOnBackInvokedDispatcher.registerOnBackInvokedCallback(1000000, (OnBackInvokedCallback) obj);
    }

    public static final void t(dd9 dd9Var, xy xyVar) {
        OnBackInvokedDispatcher onBackInvokedDispatcherFindOnBackInvokedDispatcher;
        if (!y30.C(xyVar) || (onBackInvokedDispatcherFindOnBackInvokedDispatcher = dd9Var.findOnBackInvokedDispatcher()) == null) {
            return;
        }
        onBackInvokedDispatcherFindOnBackInvokedDispatcher.unregisterOnBackInvokedCallback(xyVar);
    }

    public static final void u(CursorAnchorInfo.Builder builder, zwa zwaVar) {
        builder.setEditorBoundsInfo(du0.b().setEditorBounds(kk7.F(zwaVar)).setHandwritingBounds(kk7.F(zwaVar)).build());
    }

    public static final void v(CursorAnchorInfo.Builder builder, zwa zwaVar) {
        builder.setEditorBoundsInfo(du0.b().setEditorBounds(kk7.F(zwaVar)).setHandwritingBounds(kk7.F(zwaVar)).build());
    }

    public static final void w(StaticLayout.Builder builder, int i, int i2) {
        builder.setLineBreakConfig(new LineBreakConfig.Builder().setLineBreakStyle(i).setLineBreakWordStyle(i2).build());
    }

    public static final boolean x(Context context, String str, c84 c84Var, nw2 nw2Var, String str2, boolean z) {
        boolean zT;
        nw2Var.getClass();
        str2.getClass();
        if (context != null && str != null) {
            String strM = c84Var.a.m();
            if ((muc.b0(strM) || tj2.b(strM)) ? false : true) {
                switch (c84Var.c) {
                    case 0:
                        zT = ((ExternalWebViewActivity) c84Var.d).m().C(R.id.nav_host_fragment) != null;
                        break;
                    case 1:
                        zT = ((ExternalWebViewBottomSheetDialogFragment) c84Var.d).t();
                        break;
                    default:
                        zT = ((ExternalWebViewFragment) c84Var.d).t();
                        break;
                }
                if (zT) {
                    str.getClass();
                    if (!c84Var.b.contains(str)) {
                        nya nyaVar = new nya();
                        nyaVar.a = true;
                        nw2Var.a(context, Uri.parse(str), str2, new so1(10, nyaVar));
                        if (nyaVar.a && !z) {
                            c84Var.a();
                        }
                        return nyaVar.a;
                    }
                }
            }
        }
        return false;
    }

    public static void y(InputMethodManager inputMethodManager, View view) {
        inputMethodManager.startStylusHandwriting(view);
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x0232  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x023e  */
    /* JADX WARN: Removed duplicated region for block: B:121:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final java.lang.String r26, final java.lang.String r27, final java.lang.String r28, final defpackage.nw2 r29, final defpackage.c84 r30, final boolean r31, defpackage.r28 r32, boolean r33, defpackage.x12 r34, final int r35, final int r36) {
        /*
            Method dump skipped, instruction units count: 594
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v4.a(java.lang.String, java.lang.String, java.lang.String, nw2, c84, boolean, r28, boolean, x12, int, int):void");
    }
}
