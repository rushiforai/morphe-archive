package defpackage;

import android.content.ContentUris;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Trace;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kz4 {
    public static final bd7 a = new bd7(2);
    public static final g b = new g(7);

    public static f05 a(Context context, List list) {
        String str;
        Typeface typefaceC;
        Trace.beginSection(gq7.X("FontProvider.getFontFamilyResult"));
        try {
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < list.size(); i++) {
                lz4 lz4Var = (lz4) list.get(i);
                if (Build.VERSION.SDK_INT < 31 || (typefaceC = txd.c((str = lz4Var.e))) == null || txd.d(typefaceC) == null) {
                    ProviderInfo providerInfoB = b(context.getPackageManager(), lz4Var, context.getResources());
                    if (providerInfoB == null) {
                        return new f05();
                    }
                    arrayList.add(c(context, lz4Var, providerInfoB.authority));
                } else {
                    arrayList.add(new g05[]{new g05(str, lz4Var.f)});
                }
            }
            return new f05(arrayList);
        } finally {
            Trace.endSection();
        }
    }

    public static ProviderInfo b(PackageManager packageManager, lz4 lz4Var, Resources resources) {
        g gVar = b;
        bd7 bd7Var = a;
        Trace.beginSection(gq7.X("FontProvider.getProvider"));
        try {
            List listG = lz4Var.d;
            String str = lz4Var.a;
            String str2 = lz4Var.b;
            if (listG == null) {
                listG = bgf.G(resources, 0);
            }
            jz4 jz4Var = new jz4();
            jz4Var.a = str;
            jz4Var.b = str2;
            jz4Var.c = listG;
            ProviderInfo providerInfo = (ProviderInfo) bd7Var.h(jz4Var);
            if (providerInfo != null) {
                return providerInfo;
            }
            ProviderInfo providerInfoResolveContentProvider = packageManager.resolveContentProvider(str, 0);
            if (providerInfoResolveContentProvider == null) {
                throw new PackageManager.NameNotFoundException("No package found for authority: " + str);
            }
            if (!providerInfoResolveContentProvider.packageName.equals(str2)) {
                throw new PackageManager.NameNotFoundException("Found content provider " + str + ", but package was not " + str2);
            }
            Signature[] signatureArr = packageManager.getPackageInfo(providerInfoResolveContentProvider.packageName, 64).signatures;
            ArrayList arrayList = new ArrayList();
            for (Signature signature : signatureArr) {
                arrayList.add(signature.toByteArray());
            }
            Collections.sort(arrayList, gVar);
            for (int i = 0; i < listG.size(); i++) {
                ArrayList arrayList2 = new ArrayList((Collection) listG.get(i));
                Collections.sort(arrayList2, gVar);
                if (arrayList.size() == arrayList2.size()) {
                    for (int i2 = 0; i2 < arrayList.size(); i2++) {
                        if (!Arrays.equals((byte[]) arrayList.get(i2), (byte[]) arrayList2.get(i2))) {
                            break;
                        }
                    }
                    bd7Var.l(jz4Var, providerInfoResolveContentProvider);
                    return providerInfoResolveContentProvider;
                }
            }
            Trace.endSection();
            return null;
        } finally {
            Trace.endSection();
        }
    }

    public static g05[] c(Context context, lz4 lz4Var, String str) {
        Trace.beginSection(gq7.X("FontProvider.query"));
        try {
            ArrayList arrayList = new ArrayList();
            Uri uriBuild = new Uri.Builder().scheme("content").authority(str).build();
            Uri uriBuild2 = new Uri.Builder().scheme("content").authority(str).appendPath("file").build();
            iz4 md5Var = Build.VERSION.SDK_INT < 24 ? new md5(context, uriBuild) : new rz2(context, uriBuild);
            Cursor cursorV = null;
            try {
                String[] strArr = {"_id", "file_id", "font_ttc_index", "font_variation_settings", "font_weight", "font_italic", "result_code"};
                Trace.beginSection(gq7.X("ContentQueryWrapper.query"));
                try {
                    cursorV = md5Var.v(uriBuild, strArr, new String[]{lz4Var.c});
                    Trace.endSection();
                    if (cursorV != null && cursorV.getCount() > 0) {
                        int columnIndex = cursorV.getColumnIndex("result_code");
                        ArrayList arrayList2 = new ArrayList();
                        int columnIndex2 = cursorV.getColumnIndex("_id");
                        int columnIndex3 = cursorV.getColumnIndex("file_id");
                        int columnIndex4 = cursorV.getColumnIndex("font_ttc_index");
                        int columnIndex5 = cursorV.getColumnIndex("font_weight");
                        int columnIndex6 = cursorV.getColumnIndex("font_italic");
                        while (cursorV.moveToNext()) {
                            int i = columnIndex != -1 ? cursorV.getInt(columnIndex) : 0;
                            arrayList2.add(new g05(columnIndex3 == -1 ? ContentUris.withAppendedId(uriBuild, cursorV.getLong(columnIndex2)) : ContentUris.withAppendedId(uriBuild2, cursorV.getLong(columnIndex3)), columnIndex4 != -1 ? cursorV.getInt(columnIndex4) : 0, columnIndex5 != -1 ? cursorV.getInt(columnIndex5) : 400, columnIndex6 != -1 && cursorV.getInt(columnIndex6) == 1, lz4Var.f, i));
                        }
                        arrayList = arrayList2;
                    }
                    if (cursorV != null) {
                        cursorV.close();
                    }
                    md5Var.close();
                    return (g05[]) arrayList.toArray(new g05[0]);
                } finally {
                }
            } catch (Throwable th) {
                if (cursorV != null) {
                    cursorV.close();
                }
                md5Var.close();
                throw th;
            }
        } finally {
        }
    }
}
