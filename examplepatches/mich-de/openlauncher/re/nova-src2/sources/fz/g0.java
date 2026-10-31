package fz;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Process;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.Log;
import java.io.IOException;
import java.util.Map;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.internal.EnumDescriptor;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.dex */
public final /* synthetic */ class g0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56247a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f56248b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f56249c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f56250d;

    public /* synthetic */ g0(int i5, String str, EnumDescriptor enumDescriptor) {
        this.f56248b = i5;
        this.f56249c = str;
        this.f56250d = enumDescriptor;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x00f9 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:114:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0086 A[Catch: NameNotFoundException -> 0x008b, TRY_ENTER, TRY_LEAVE, TryCatch #3 {NameNotFoundException -> 0x008b, blocks: (B:11:0x0047, B:19:0x0086, B:14:0x0059, B:17:0x0075), top: B:100:0x0047 }] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0147  */
    /* JADX WARN: Type inference failed for: r16v10 */
    /* JADX WARN: Type inference failed for: r16v8, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r16v9 */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() throws XmlPullParserException, Resources.NotFoundException, PackageManager.NameNotFoundException, IOException {
        Drawable drawableR;
        char c11;
        String str;
        String str2;
        int next;
        int next2;
        String str3;
        ?? r16;
        aa.n0 n0Var;
        Bundle bundle;
        Resources resourcesForApplication;
        int resourceId;
        switch (this.f56247a) {
            case 0:
                h0 h0Var = (h0) this.f56249c;
                LauncherActivityInfo launcherActivityInfo = (LauncherActivityInfo) this.f56250d;
                ComponentName componentName = h0Var.f582d;
                String str4 = launcherActivityInfo.getApplicationInfo().packageName;
                UserHandle user = launcherActivityInfo.getUser();
                Context context = h0Var.f580b;
                ComponentName componentName2 = h0Var.f581c;
                int i5 = this.f56248b;
                String str5 = null;
                if (componentName2 != null && componentName2.getPackageName().equals(str4)) {
                    PackageManager packageManager = context.getPackageManager();
                    try {
                        bundle = packageManager.getActivityInfo(componentName2, 8320).metaData;
                        resourcesForApplication = packageManager.getResourcesForApplication(componentName2.getPackageName());
                    } catch (PackageManager.NameNotFoundException unused) {
                    }
                    if (bundle == null) {
                        resourceId = 0;
                        drawableR = resourceId == 0 ? resourcesForApplication.getDrawableForDensity(resourceId, i5, null) : null;
                        c11 = 1;
                    } else {
                        int i11 = bundle.getInt(componentName2.getPackageName() + ".dynamic_icons", 0);
                        if (i11 != 0) {
                            try {
                                TypedArray typedArrayObtainTypedArray = resourcesForApplication.obtainTypedArray(i11);
                                resourceId = typedArrayObtainTypedArray.getResourceId(aa.f0.a(), 0);
                                typedArrayObtainTypedArray.recycle();
                            } catch (Resources.NotFoundException unused2) {
                            }
                            if (resourceId == 0) {
                            }
                            c11 = 1;
                        }
                    }
                } else if (componentName != null && componentName.getPackageName().equals(str4) && Process.myUserHandle().equals(user)) {
                    drawableR = com.teslacoilsw.launcher.icon.d.r(h0Var.f56252g, i5, componentName.getPackageName());
                    c11 = 2;
                } else {
                    drawableR = null;
                    c11 = 0;
                }
                if (drawableR == null) {
                    drawableR = launcherActivityInfo.getIcon(i5);
                    c11 = 0;
                }
                Map map = h0Var.f579a;
                if (map != null) {
                    r16 = 0;
                } else {
                    ArrayMap arrayMap = new ArrayMap();
                    try {
                        Resources resources = context.getResources();
                        int identifier = resources.getIdentifier("grayscale_icon_map", "xml", context.getPackageName());
                        if (identifier != 0) {
                            XmlResourceParser xml = resources.getXml(identifier);
                            int depth = xml.getDepth();
                            do {
                                next = xml.next();
                                if (next != 2) {
                                }
                                while (true) {
                                    next2 = xml.next();
                                    if (next2 == 3 || xml.getDepth() > depth) {
                                        if (next2 == 1) {
                                            if (next2 == 2 && "icon".equals(xml.getName())) {
                                                String attributeValue = xml.getAttributeValue(str5, "package");
                                                int attributeResourceValue = xml.getAttributeResourceValue(str5, "drawable", 0);
                                                if (attributeResourceValue == 0 || TextUtils.isEmpty(attributeValue)) {
                                                    str3 = str5;
                                                } else {
                                                    str = str5;
                                                    try {
                                                        arrayMap.put(attributeValue, new aa.n0(resources, attributeResourceValue));
                                                        str3 = str;
                                                    } catch (Exception e3) {
                                                        e = e3;
                                                        Log.e("IconProvider", "Unable to parse icon map", e);
                                                        str2 = str;
                                                        h0Var.f579a = arrayMap;
                                                        map = arrayMap;
                                                        r16 = str2;
                                                        n0Var = (aa.n0) map.get(str4);
                                                        if (n0Var != null) {
                                                        }
                                                    }
                                                }
                                                str5 = str3;
                                            }
                                        }
                                    }
                                }
                            } while (next != 1);
                            while (true) {
                                next2 = xml.next();
                                if (next2 == 3) {
                                    if (next2 == 1) {
                                    }
                                }
                            }
                        }
                        str2 = str5;
                    } catch (Exception e11) {
                        e = e11;
                        str = str5;
                    }
                    h0Var.f579a = arrayMap;
                    map = arrayMap;
                    r16 = str2;
                }
                n0Var = (aa.n0) map.get(str4);
                if (n0Var != null) {
                    return drawableR;
                }
                int i12 = n0Var.f637b;
                Resources resources2 = n0Var.f636a;
                if (!(drawableR instanceof AdaptiveIconDrawable)) {
                    return drawableR;
                }
                AdaptiveIconDrawable adaptiveIconDrawable = (AdaptiveIconDrawable) drawableR;
                String resourceTypeName = resources2.getResourceTypeName(i12);
                if (c11 == 1 && "array".equals(resourceTypeName)) {
                    TypedArray typedArrayObtainTypedArray2 = resources2.obtainTypedArray(i12);
                    int resourceId2 = typedArrayObtainTypedArray2.getResourceId(aa.f0.a(), 0);
                    typedArrayObtainTypedArray2.recycle();
                    return resourceId2 == 0 ? drawableR : new aa.o0(adaptiveIconDrawable, new aa.n0(resources2, resourceId2));
                }
                if (c11 != 2 || !"array".equals(resourceTypeName)) {
                    return "drawable".equals(resourceTypeName) ? new aa.o0(adaptiveIconDrawable, n0Var) : drawableR;
                }
                a80.m.p(adaptiveIconDrawable);
                throw r16;
            default:
                return EnumDescriptor.elementDescriptors_delegate$lambda$0(this.f56248b, (String) this.f56249c, (EnumDescriptor) this.f56250d);
        }
    }

    public /* synthetic */ g0(h0 h0Var, LauncherActivityInfo launcherActivityInfo, int i5) {
        this.f56249c = h0Var;
        this.f56250d = launcherActivityInfo;
        this.f56248b = i5;
    }
}
