package org.ocpsoft.prettytime.i18n;

import java.util.ListResourceBundle;
import java.util.function.Function;
import org.ocpsoft.prettytime.i18n.Resources_fi;
import org.ocpsoft.prettytime.i18n.Resources_ja;
import ya0.c;

/* loaded from: classes5.dex */
public final /* synthetic */ class b implements Function {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80722a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ListResourceBundle f80723b;

    public /* synthetic */ b(ListResourceBundle listResourceBundle, int i5) {
        this.f80722a = i5;
        this.f80723b = listResourceBundle;
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        int i5 = this.f80722a;
        ListResourceBundle listResourceBundle = this.f80723b;
        switch (i5) {
            case 0:
                Resources_fi resources_fi = (Resources_fi) listResourceBundle;
                c cVar = (c) obj;
                Object[][] objArr = Resources_fi.f80653b;
                Resources_fi.FiTimeFormat fiTimeFormat = new Resources_fi.FiTimeFormat();
                fiTimeFormat.n = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                fiTimeFormat.o = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                fiTimeFormat.f80655p = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                fiTimeFormat.f80656q = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                fiTimeFormat.f80657r = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (resources_fi.containsKey(cVar.getClass().getSimpleName().concat("PastSingularName"))) {
                    fiTimeFormat.n = resources_fi.getString(cVar.getClass().getSimpleName().concat("PastSingularName"));
                    fiTimeFormat.o = resources_fi.getString(cVar.getClass().getSimpleName().concat("FutureSingularName"));
                    fiTimeFormat.f80655p = resources_fi.getString(cVar.getClass().getSimpleName().concat("PastSingularName"));
                    fiTimeFormat.f80656q = resources_fi.getString(cVar.getClass().getSimpleName().concat("FutureSingularName"));
                    fiTimeFormat.f80657r = resources_fi.getString(cVar.getClass().getSimpleName().concat("Pattern"));
                    if (resources_fi.containsKey(cVar.getClass().getSimpleName().concat("PastPluralName"))) {
                        fiTimeFormat.f80655p = resources_fi.getString(cVar.getClass().getSimpleName().concat("PastPluralName"));
                    }
                    if (resources_fi.containsKey(cVar.getClass().getSimpleName().concat("FuturePluralName"))) {
                        fiTimeFormat.f80656q = resources_fi.getString(cVar.getClass().getSimpleName().concat("FuturePluralName"));
                    }
                    if (resources_fi.containsKey(cVar.getClass().getSimpleName().concat("PluralPattern"))) {
                        fiTimeFormat.f80657r = resources_fi.getString(cVar.getClass().getSimpleName().concat("PluralPattern"));
                    }
                    fiTimeFormat.f95743h = resources_fi.getString(cVar.getClass().getSimpleName().concat("Pattern"));
                    fiTimeFormat.f95747l = resources_fi.getString(cVar.getClass().getSimpleName().concat("PastSuffix")).trim();
                    fiTimeFormat.f95745j = resources_fi.getString(cVar.getClass().getSimpleName().concat("FutureSuffix")).trim();
                    fiTimeFormat.f95744i = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    fiTimeFormat.f95746k = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    fiTimeFormat.f95737b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    fiTimeFormat.f95738c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                return fiTimeFormat;
            default:
                Resources_ja resources_ja = (Resources_ja) listResourceBundle;
                c cVar2 = (c) obj;
                Object[][] objArr2 = Resources_ja.f80672b;
                Resources_ja.JaTimeFormat jaTimeFormat = new Resources_ja.JaTimeFormat();
                jaTimeFormat.f80674a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80675b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80676c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80677d = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80678e = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80679f = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80680g = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80681h = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80682i = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80683j = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80684k = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                jaTimeFormat.f80680g = resources_ja.getString(cVar2.getClass().getSimpleName().concat("Pattern"));
                jaTimeFormat.f80681h = resources_ja.getString(cVar2.getClass().getSimpleName().concat("FuturePrefix")).trim();
                jaTimeFormat.f80682i = resources_ja.getString(cVar2.getClass().getSimpleName().concat("FutureSuffix")).trim();
                jaTimeFormat.f80683j = resources_ja.getString(cVar2.getClass().getSimpleName().concat("PastPrefix")).trim();
                jaTimeFormat.f80684k = resources_ja.getString(cVar2.getClass().getSimpleName().concat("PastSuffix")).trim();
                jaTimeFormat.f80674a = resources_ja.getString(cVar2.getClass().getSimpleName().concat("SingularName"));
                jaTimeFormat.f80675b = resources_ja.getString(cVar2.getClass().getSimpleName().concat("PluralName"));
                try {
                    jaTimeFormat.f80677d = resources_ja.getString(cVar2.getClass().getSimpleName().concat("FuturePluralName"));
                } catch (Exception unused) {
                }
                try {
                    jaTimeFormat.f80676c = resources_ja.getString(cVar2.getClass().getSimpleName().concat("FutureSingularName"));
                } catch (Exception unused2) {
                }
                try {
                    jaTimeFormat.f80679f = resources_ja.getString(cVar2.getClass().getSimpleName().concat("PastPluralName"));
                } catch (Exception unused3) {
                }
                try {
                    jaTimeFormat.f80678e = resources_ja.getString(cVar2.getClass().getSimpleName().concat("PastSingularName"));
                } catch (Exception unused4) {
                }
                return jaTimeFormat;
        }
    }
}
