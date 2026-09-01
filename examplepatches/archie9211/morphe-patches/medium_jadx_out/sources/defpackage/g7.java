package defpackage;

import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.util.Pair;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g7 extends f7 {
    public final /* synthetic */ int a;

    public /* synthetic */ g7(int i) {
        this.a = i;
    }

    @Override // defpackage.f7
    public final Intent a(Context context, Object obj) {
        Bundle bundleExtra;
        switch (this.a) {
            case 0:
                String str = (String) obj;
                str.getClass();
                Intent type = new Intent("android.intent.action.GET_CONTENT").addCategory("android.intent.category.OPENABLE").setType(str);
                type.getClass();
                return type;
            case 1:
                return d(context, (f99) obj);
            case 2:
                String[] strArr = (String[]) obj;
                strArr.getClass();
                Intent intentPutExtra = new Intent("androidx.activity.result.contract.action.REQUEST_PERMISSIONS").putExtra("androidx.activity.result.contract.extra.PERMISSIONS", strArr);
                intentPutExtra.getClass();
                return intentPutExtra;
            case 3:
                String str2 = (String) obj;
                str2.getClass();
                Intent intentPutExtra2 = new Intent("androidx.activity.result.contract.action.REQUEST_PERMISSIONS").putExtra("androidx.activity.result.contract.extra.PERMISSIONS", new String[]{str2});
                intentPutExtra2.getClass();
                return intentPutExtra2;
            case 4:
                Intent intent = (Intent) obj;
                intent.getClass();
                return intent;
            case 5:
                a56 a56Var = (a56) obj;
                a56Var.getClass();
                Intent intentPutExtra3 = new Intent("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST").putExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST", a56Var);
                intentPutExtra3.getClass();
                return intentPutExtra3;
            case 6:
                Uri uri = (Uri) obj;
                uri.getClass();
                Intent intentAddFlags = new Intent("android.media.action.IMAGE_CAPTURE").putExtra("output", uri).addFlags(1).addFlags(2);
                intentAddFlags.getClass();
                return intentAddFlags;
            case 7:
                a56 a56Var2 = (a56) obj;
                Intent intent2 = new Intent("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST");
                Intent intent3 = a56Var2.b;
                if (intent3 != null && (bundleExtra = intent3.getBundleExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE")) != null) {
                    intent2.putExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE", bundleExtra);
                    intent3.removeExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
                    if (intent3.getBooleanExtra("androidx.fragment.extra.ACTIVITY_OPTIONS_BUNDLE", false)) {
                        a56Var2 = new a56(a56Var2.a, null, a56Var2.c, a56Var2.d);
                    }
                }
                intent2.putExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST", a56Var2);
                if (f25.I(2)) {
                    Log.v("FragmentManager", "CreateIntent created the following intent: " + intent2);
                }
                return intent2;
            default:
                Intent intent4 = (Intent) obj;
                intent4.getClass();
                return intent4;
        }
    }

    @Override // defpackage.f7
    public e7 b(Context context, Object obj) {
        switch (this.a) {
            case 0:
                ((String) obj).getClass();
                return null;
            case 1:
                ((f99) obj).getClass();
                return null;
            case 2:
                String[] strArr = (String[]) obj;
                strArr.getClass();
                if (strArr.length == 0) {
                    return new e7(fy3.a);
                }
                for (String str : strArr) {
                    if (nm.a(context, str) != 0) {
                        return null;
                    }
                }
                int iP = ei7.P(strArr.length);
                if (iP < 16) {
                    iP = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                for (String str2 : strArr) {
                    linkedHashMap.put(str2, Boolean.TRUE);
                }
                return new e7(linkedHashMap);
            case 3:
                String str3 = (String) obj;
                str3.getClass();
                if (nm.a(context, str3) == 0) {
                    return new e7(Boolean.TRUE);
                }
                return null;
            case 4:
            case 5:
            default:
                return super.b(context, obj);
            case 6:
                ((Uri) obj).getClass();
                return null;
        }
    }

    @Override // defpackage.f7
    public final Object c(int i, Intent intent) {
        switch (this.a) {
            case 0:
                if (i != -1) {
                    intent = null;
                }
                if (intent != null) {
                    return intent.getData();
                }
                return null;
            case 1:
                return e(i, intent);
            case 2:
                if (i == -1 && intent != null) {
                    String[] stringArrayExtra = intent.getStringArrayExtra("androidx.activity.result.contract.extra.PERMISSIONS");
                    int[] intArrayExtra = intent.getIntArrayExtra("androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS");
                    if (intArrayExtra != null && stringArrayExtra != null) {
                        ArrayList arrayList = new ArrayList(intArrayExtra.length);
                        for (int i2 : intArrayExtra) {
                            arrayList.add(Boolean.valueOf(i2 == 0));
                        }
                        return ei7.V(bu1.t1(arrayList, k80.s0(stringArrayExtra)));
                    }
                }
                return fy3.a;
            case 3:
                if (intent == null || i != -1) {
                    return Boolean.FALSE;
                }
                int[] intArrayExtra2 = intent.getIntArrayExtra("androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS");
                if (intArrayExtra2 != null) {
                    int length = intArrayExtra2.length;
                    int i3 = 0;
                    while (true) {
                        if (i3 < length) {
                            if (intArrayExtra2[i3] == 0) {
                                z = true;
                            } else {
                                i3++;
                            }
                        }
                    }
                }
                return Boolean.valueOf(z);
            case 4:
                return new c7(i, intent);
            case 5:
                return new c7(i, intent);
            case 6:
                return Boolean.valueOf(i == -1);
            case 7:
                return new c7(i, intent);
            default:
                Pair pairCreate = Pair.create(Integer.valueOf(i), intent);
                pairCreate.getClass();
                return pairCreate;
        }
    }

    public Intent d(Context context, f99 f99Var) {
        f99Var.getClass();
        if (u4.h()) {
            Intent intent = new Intent("android.provider.action.PICK_IMAGES");
            intent.setType(u4.f(f99Var.a));
            intent.putExtra("android.provider.extra.PICK_IMAGES_LAUNCH_TAB", 1);
            return intent;
        }
        if (context.getPackageManager().resolveActivity(new Intent("androidx.activity.result.contract.action.PICK_IMAGES"), 1114112) == null) {
            Intent intent2 = new Intent("android.intent.action.OPEN_DOCUMENT");
            intent2.setType(u4.f(f99Var.a));
            if (intent2.getType() == null) {
                intent2.setType("*/*");
                intent2.putExtra("android.intent.extra.MIME_TYPES", new String[]{"image/*", "video/*"});
            }
            return intent2;
        }
        ResolveInfo resolveInfoResolveActivity = context.getPackageManager().resolveActivity(new Intent("androidx.activity.result.contract.action.PICK_IMAGES"), 1114112);
        if (resolveInfoResolveActivity == null) {
            ygf.f("Required value was null.");
            return null;
        }
        ActivityInfo activityInfo = resolveInfoResolveActivity.activityInfo;
        Intent intent3 = new Intent("androidx.activity.result.contract.action.PICK_IMAGES");
        intent3.setClassName(activityInfo.applicationInfo.packageName, activityInfo.name);
        intent3.setType(u4.f(f99Var.a));
        intent3.putExtra("androidx.activity.result.contract.extra.PICK_IMAGES_LAUNCH_TAB", 1);
        return intent3;
    }

    public Uri e(int i, Intent intent) {
        List arrayList;
        if (i != -1) {
            intent = null;
        }
        if (intent == null) {
            return null;
        }
        Uri data = intent.getData();
        if (data != null) {
            return data;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Uri data2 = intent.getData();
        if (data2 != null) {
            linkedHashSet.add(data2);
        }
        ClipData clipData = intent.getClipData();
        if (clipData == null && linkedHashSet.isEmpty()) {
            arrayList = ey3.a;
        } else {
            if (clipData != null) {
                int itemCount = clipData.getItemCount();
                for (int i2 = 0; i2 < itemCount; i2++) {
                    Uri uri = clipData.getItemAt(i2).getUri();
                    if (uri != null) {
                        linkedHashSet.add(uri);
                    }
                }
            }
            arrayList = new ArrayList(linkedHashSet);
        }
        return (Uri) bu1.z0(arrayList);
    }
}
