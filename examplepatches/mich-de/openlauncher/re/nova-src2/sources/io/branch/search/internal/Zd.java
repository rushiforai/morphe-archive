package io.branch.search.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import io.branch.engage.sesame_lite.internal.Utils;
import io.branch.search.internal.C7;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import io.branch.search.ui.ContactAction;
import io.branch.search.ui.Image;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonPrimitive;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Zd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final KSerializer<List<JsonElement>> f63839a = BuiltinSerializersKt.ListSerializer(JsonElement.INSTANCE.serializer());

    public static final H2 a(String str) {
        Object objA;
        if (Intrinsics.b(str, "local_search")) {
            return H2.LOCAL_SEARCH_LINK;
        }
        try {
            int i5 = Result.f71687b;
            objA = H2.valueOf(str);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        H2 h22 = (H2) objA;
        if (h22 != null) {
            return h22;
        }
        C3309p1.b(EnumC3131e9.InternalDebug, "Unknown alternative resultType: " + str);
        return H2.LOCAL_SEARCH_LINK;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0085  */
    /* JADX WARN: Type inference failed for: r2v23, types: [io.branch.search.ui.Image] */
    /* JADX WARN: Type inference failed for: r2v37, types: [io.branch.search.ui.Image] */
    /* JADX WARN: Type inference failed for: r2v46, types: [io.branch.search.ui.Image] */
    /* JADX WARN: Type inference failed for: r5v12, types: [io.branch.search.ui.Image] */
    /* JADX WARN: Type inference failed for: r6v15, types: [io.branch.search.ui.Image] */
    /* JADX WARN: Type inference failed for: r8v30, types: [io.branch.search.ui.Image] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final BranchEntity a(@NotNull Yd yd, @NotNull String sessionId, @NotNull AbstractC3466y6<?> entityVirtualRequest, @NotNull F4 contextDelegate, boolean z11) {
        ComponentName componentNameA;
        Image url;
        Image.Url url2;
        ?? A;
        io.branch.search.ui.l lVar;
        InterfaceC3331q6.b bVar;
        Image url3;
        String str;
        String str2;
        Image url4;
        Image.Url url5;
        ?? A2;
        Image.Url url6;
        ?? A3;
        Image url7;
        Image.Url url8;
        ?? A4;
        Image.Url url9;
        ?? A5;
        Image.Url url10;
        ?? A6;
        Yd yd2 = yd;
        boolean z12 = z11;
        Intrinsics.g(yd2, "<this>");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(entityVirtualRequest, "entityVirtualRequest");
        Intrinsics.g(contextDelegate, "contextDelegate");
        String strQ = yd2.q();
        if (strQ == null) {
            return null;
        }
        C3356rf c3356rf = (C3356rf) contextDelegate.f62440c.getValue();
        Long lR = yd2.r();
        UserHandle userHandle = c3356rf.f65680a.getUserHandle(lR != null ? lR.longValue() : 0L);
        if (userHandle == null) {
            userHandle = Process.myUserHandle();
        }
        int i5 = 1;
        if (!r70.j.B0(yd2.h(), EsimInstallStore.KEY_INSTALLED, true)) {
            i5 = r70.j.B0(yd2.h(), "not_installed", true) ? 2 : 0;
        }
        if (yd2.i() != null) {
            String strI = yd2.i();
            componentNameA = strI != null ? new ComponentName(strQ, strI) : null;
        } else if (i5 != 2) {
            Intrinsics.f(userHandle, "userHandle");
            componentNameA = contextDelegate.a(strQ, userHandle);
        }
        int iOrdinal = yd2.o().ordinal();
        String str3 = "android.resource://";
        String str4 = "context.resources";
        String str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        switch (iOrdinal) {
            case 0:
                io.branch.search.ui.a aVar = BranchEntity.App.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA == null) {
                    return null;
                }
                String strL = yd2.l();
                String str6 = strL == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strL;
                C7 c7P = yd2.p();
                if (c7P == null || (url = a(c7P, contextDelegate, z12)) == null) {
                    Resources resources = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources, "context.resources");
                    String string = Uri.parse("android.resource://" + resources.getResourcePackageName(17301583) + '/' + resources.getResourceTypeName(17301583) + '/' + resources.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string, "parse(\n                C…\n            ).toString()");
                    H2 resultType = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType, "resultType");
                    url = new Image.Url(string, resultType, null);
                }
                aVar.getClass();
                return io.branch.search.ui.a.a(bVarA, str6, url, strQ, componentNameA, userHandle, i5);
            case 1:
                io.branch.search.ui.d dVar = BranchEntity.AppStore.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA2 = a(yd, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA2 == null) {
                    return null;
                }
                String strL2 = yd.l();
                String str7 = strL2 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strL2;
                String strB = yd.b();
                C7 c7P2 = yd.p();
                if (c7P2 == null || (A = a(c7P2, contextDelegate, z11)) == 0) {
                    Resources resources2 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources2, "context.resources");
                    String string2 = Uri.parse("android.resource://" + resources2.getResourcePackageName(17301583) + '/' + resources2.getResourceTypeName(17301583) + '/' + resources2.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string2, "parse(\n                C…\n            ).toString()");
                    H2 resultType2 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType2, "resultType");
                    url2 = new Image.Url(string2, resultType2, null);
                } else {
                    url2 = A;
                }
                EmptyList screenshots = EmptyList.f71733a;
                Float fN = yd.n();
                float fFloatValue = fN != null ? fN.floatValue() : 0.0f;
                Long lE = yd.e();
                long jLongValue = lE != null ? lE.longValue() : 0L;
                String strC = yd.c();
                String str8 = strC == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strC;
                String strW = yd.w();
                String str9 = strW == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strW;
                String strV = yd.v();
                dVar.getClass();
                Intrinsics.g(screenshots, "screenshots");
                return new BranchEntity.AppStore(bVarA2, str7, strB, url2, screenshots, fFloatValue, jLongValue, str8, str9, strQ, i5, strV);
            case 2:
                io.branch.search.ui.l lVar2 = BranchEntity.Contact.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA3 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA3 == null) {
                    return null;
                }
                String strL3 = yd2.l();
                if (strL3 == null) {
                    strL3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                C7 c7P3 = yd2.p();
                if (c7P3 == null || (url3 = a(c7P3, contextDelegate, z12)) == null) {
                    Resources resources3 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources3, "context.resources");
                    StringBuilder sb2 = new StringBuilder("android.resource://");
                    lVar = lVar2;
                    sb2.append(resources3.getResourcePackageName(17301583));
                    sb2.append('/');
                    bVar = bVarA3;
                    sb2.append(resources3.getResourceTypeName(17301583));
                    sb2.append('/');
                    sb2.append(resources3.getResourceEntryName(17301583));
                    String string3 = Uri.parse(sb2.toString()).toString();
                    Intrinsics.f(string3, "parse(\n                C…\n            ).toString()");
                    H2 resultType3 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType3, "resultType");
                    url3 = new Image.Url(string3, resultType3, null);
                } else {
                    lVar = lVar2;
                    bVar = bVarA3;
                }
                List<C3155g> listX = yd2.x();
                ArrayList arrayList = new ArrayList(b70.c.u0(listX, 10));
                Iterator it = listX.iterator();
                while (it.hasNext()) {
                    C3155g c3155g = (C3155g) it.next();
                    b50.c cVar = ContactAction.Companion;
                    Iterator it2 = it;
                    InterfaceC3331q6.b bVarA4 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                    if (bVarA4 == null) {
                        return null;
                    }
                    C7 c72 = c3155g.f64535g;
                    if (c72 == null || (url4 = a(c72, contextDelegate, z12)) == null) {
                        Resources resources4 = contextDelegate.f62438a.getResources();
                        Intrinsics.f(resources4, str4);
                        str = str4;
                        StringBuilder sb3 = new StringBuilder(str3);
                        str2 = str3;
                        sb3.append(resources4.getResourcePackageName(17301583));
                        sb3.append('/');
                        sb3.append(resources4.getResourceTypeName(17301583));
                        sb3.append('/');
                        sb3.append(resources4.getResourceEntryName(17301583));
                        String string4 = Uri.parse(sb3.toString()).toString();
                        Intrinsics.f(string4, "parse(\n                C…\n            ).toString()");
                        H2 resultType4 = H2.REMOTE_SEARCH;
                        Intrinsics.g(resultType4, "resultType");
                        url4 = new Image.Url(string4, resultType4, null);
                    } else {
                        str2 = str3;
                        str = str4;
                    }
                    String actionName = c3155g.f64532d;
                    cVar.getClass();
                    Intrinsics.g(actionName, "actionName");
                    arrayList.add(new ContactAction(bVarA4, url4, actionName));
                    yd2 = yd;
                    z12 = z11;
                    it = it2;
                    str4 = str;
                    str3 = str2;
                }
                lVar.getClass();
                return new BranchEntity.Contact(bVar, strL3, url3, arrayList);
            case 3:
                io.branch.search.ui.o oVar = BranchEntity.HeroAd.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA5 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA5 == null) {
                    return null;
                }
                String strL4 = yd2.l();
                if (strL4 == null) {
                    strL4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                C7 c7P4 = yd2.p();
                if (c7P4 == null || (A2 = a(c7P4, contextDelegate, z12)) == 0) {
                    Resources resources5 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources5, "context.resources");
                    String string5 = Uri.parse("android.resource://" + resources5.getResourcePackageName(17301583) + '/' + resources5.getResourceTypeName(17301583) + '/' + resources5.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string5, "parse(\n                C…\n            ).toString()");
                    H2 resultType5 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType5, "resultType");
                    url5 = new Image.Url(string5, resultType5, null);
                } else {
                    url5 = A2;
                }
                C7 c7F = yd2.f();
                Image imageA = c7F != null ? a(c7F, contextDelegate, z12) : null;
                String strB2 = yd2.b();
                String strA = yd2.a();
                if (strA != null) {
                    str5 = strA;
                }
                oVar.getClass();
                return new BranchEntity.HeroAd(bVarA5, strL4, strB2, url5, imageA, str5, i5);
            case 4:
                io.branch.search.ui.z zVar = BranchEntity.Shortcut.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA6 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA6 == null) {
                    return null;
                }
                String strL5 = yd2.l();
                if (strL5 != null) {
                    str5 = strL5;
                }
                String strB3 = yd2.b();
                C7 c7P5 = yd2.p();
                if (c7P5 == null || (A3 = a(c7P5, contextDelegate, z12)) == 0) {
                    Resources resources6 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources6, "context.resources");
                    String string6 = Uri.parse("android.resource://" + resources6.getResourcePackageName(17301583) + '/' + resources6.getResourceTypeName(17301583) + '/' + resources6.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string6, "parse(\n                C…\n            ).toString()");
                    H2 resultType6 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType6, "resultType");
                    url6 = new Image.Url(string6, resultType6, null);
                } else {
                    url6 = A3;
                }
                C7 c7F2 = yd2.f();
                Image imageA2 = c7F2 != null ? a(c7F2, contextDelegate, z12) : null;
                zVar.getClass();
                return new BranchEntity.Shortcut(bVarA6, str5, strB3, url6, imageA2, i5);
            case 5:
                io.branch.search.ui.x xVar = BranchEntity.SearchMore.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA7 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA7 == null) {
                    return null;
                }
                String strL6 = yd2.l();
                if (strL6 == null) {
                    strL6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                C7 c7P6 = yd2.p();
                if (c7P6 == null || (url7 = a(c7P6, contextDelegate, z12)) == null) {
                    Resources resources7 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources7, "context.resources");
                    String string7 = Uri.parse("android.resource://" + resources7.getResourcePackageName(17301583) + '/' + resources7.getResourceTypeName(17301583) + '/' + resources7.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string7, "parse(\n                C…\n            ).toString()");
                    H2 resultType7 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType7, "resultType");
                    url7 = new Image.Url(string7, resultType7, null);
                }
                xVar.getClass();
                return new BranchEntity.SearchMore(bVarA7, url7, strL6);
            case 6:
                io.branch.search.ui.q qVar = BranchEntity.HeroV2.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA8 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA8 == null) {
                    return null;
                }
                String strL7 = yd2.l();
                if (strL7 != null) {
                    str5 = strL7;
                }
                C7 c7P7 = yd2.p();
                if (c7P7 == null || (A4 = a(c7P7, contextDelegate, z12)) == 0) {
                    Resources resources8 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources8, "context.resources");
                    String string8 = Uri.parse("android.resource://" + resources8.getResourcePackageName(17301583) + '/' + resources8.getResourceTypeName(17301583) + '/' + resources8.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string8, "parse(\n                C…\n            ).toString()");
                    H2 resultType8 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType8, "resultType");
                    url8 = new Image.Url(string8, resultType8, null);
                } else {
                    url8 = A4;
                }
                String strB4 = yd2.b();
                List<Yd> listT = yd2.t();
                ArrayList arrayList2 = new ArrayList();
                Iterator it3 = listT.iterator();
                while (it3.hasNext()) {
                    BranchEntity branchEntityA = a((Yd) it3.next(), sessionId, entityVirtualRequest, contextDelegate, z12);
                    if (branchEntityA != null) {
                        arrayList2.add(branchEntityA);
                    }
                }
                ArrayList arrayList3 = new ArrayList();
                Iterator it4 = arrayList2.iterator();
                while (it4.hasNext()) {
                    Object next = it4.next();
                    if (next instanceof BranchEntity.Shortcut) {
                        arrayList3.add(next);
                    }
                }
                qVar.getClass();
                return new BranchEntity.HeroV2(bVarA8, str5, strB4, url8, i5, arrayList3);
            case 7:
                io.branch.search.ui.t tVar = BranchEntity.RelatedApp.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA9 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA9 == null) {
                    return null;
                }
                String strL8 = yd2.l();
                if (strL8 != null) {
                    str5 = strL8;
                }
                C7 c7P8 = yd2.p();
                if (c7P8 == null || (A5 = a(c7P8, contextDelegate, z12)) == 0) {
                    Resources resources9 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources9, "context.resources");
                    String string9 = Uri.parse("android.resource://" + resources9.getResourcePackageName(17301583) + '/' + resources9.getResourceTypeName(17301583) + '/' + resources9.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string9, "parse(\n                C…\n            ).toString()");
                    H2 resultType9 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType9, "resultType");
                    url9 = new Image.Url(string9, resultType9, null);
                } else {
                    url9 = A5;
                }
                String strB5 = yd2.b();
                tVar.getClass();
                return new BranchEntity.RelatedApp(bVarA9, str5, strB5, url9, i5);
            case 8:
                io.branch.search.ui.f0 f0Var = BranchEntity.SuggestedInstalls.Companion;
                Intrinsics.f(userHandle, "userHandle");
                InterfaceC3331q6.b bVarA10 = a(yd2, sessionId, entityVirtualRequest, contextDelegate, userHandle);
                if (bVarA10 == null) {
                    return null;
                }
                String strL9 = yd2.l();
                if (strL9 != null) {
                    str5 = strL9;
                }
                C7 c7P9 = yd2.p();
                if (c7P9 == null || (A6 = a(c7P9, contextDelegate, z12)) == 0) {
                    Resources resources10 = contextDelegate.f62438a.getResources();
                    Intrinsics.f(resources10, "context.resources");
                    String string10 = Uri.parse("android.resource://" + resources10.getResourcePackageName(17301583) + '/' + resources10.getResourceTypeName(17301583) + '/' + resources10.getResourceEntryName(17301583)).toString();
                    Intrinsics.f(string10, "parse(\n                C…\n            ).toString()");
                    H2 resultType10 = H2.REMOTE_SEARCH;
                    Intrinsics.g(resultType10, "resultType");
                    url10 = new Image.Url(string10, resultType10, null);
                } else {
                    url10 = A6;
                }
                String strB6 = yd2.b();
                f0Var.getClass();
                return new BranchEntity.SuggestedInstalls(bVarA10, str5, strB6, url10, i5);
            default:
                return null;
        }
    }

    @Nullable
    public static final InterfaceC3331q6.b a(@NotNull Yd yd, @NotNull String sessionId, @NotNull AbstractC3466y6 entityVirtualRequest, @NotNull F4 contextDelegate, @NotNull UserHandle userHandle) {
        Intrinsics.g(yd, "<this>");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(entityVirtualRequest, "entityVirtualRequest");
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(userHandle, "userHandle");
        String strQ = yd.q();
        if (strQ == null) {
            return null;
        }
        String strK = yd.k();
        int iHashCode = strK != null ? strK.hashCode() : 0;
        List<String> listA = a(yd.g());
        Map<String, String> mapU = yd.u();
        ArrayList arrayListA = K8.a(sessionId, contextDelegate, G8.a(yd.s()));
        List<String> listA2 = a(yd.d());
        Long lR = yd.r();
        long jLongValue = lR != null ? lR.longValue() : ((C3356rf) contextDelegate.f62440c.getValue()).f65680a.getCurrentUserId();
        String str = entityVirtualRequest.f66312c;
        String str2 = entityVirtualRequest.f66313d;
        Long lM = yd.m();
        int iLongValue = lM != null ? (int) lM.longValue() : entityVirtualRequest.f66315f.getAndIncrement();
        String strK2 = yd.k();
        String str3 = entityVirtualRequest.f66310a;
        String str4 = yd.getContainerType().f66001a;
        String str5 = yd.o().f66269a;
        String strH = yd.h();
        if (strH == null) {
            strH = "unspecified";
        }
        return new InterfaceC3331q6.b(iHashCode, listA, arrayListA, listA2, strQ, strQ, userHandle, jLongValue, str, str2, iLongValue, strK2, str3, str4, str5, null, strH, mapU, false);
    }

    @Nullable
    public static final List<String> a(@Nullable Object obj) {
        if (obj != null) {
            if (obj instanceof String) {
                try {
                    Iterable<JsonElement> iterable = (Iterable) Json.INSTANCE.decodeFromString(f63839a, (String) obj);
                    ArrayList arrayList = new ArrayList();
                    for (JsonElement jsonElement : iterable) {
                        String contentOrNull = jsonElement instanceof JsonPrimitive ? JsonElementKt.getContentOrNull((JsonPrimitive) jsonElement) : null;
                        if (contentOrNull != null) {
                            arrayList.add(contentOrNull);
                        }
                    }
                    if (!arrayList.isEmpty()) {
                        return arrayList;
                    }
                } catch (Exception unused) {
                    return ul.b.P(obj);
                }
            } else {
                if (obj instanceof Collection) {
                    ArrayList arrayList2 = new ArrayList();
                    for (Object obj2 : (Iterable) obj) {
                        String str = obj2 instanceof String ? (String) obj2 : null;
                        if (str != null) {
                            arrayList2.add(str);
                        }
                    }
                    return arrayList2;
                }
                throw new IllegalStateException("Unknown type for entity tracking url " + Reflection.f71864a.getOrCreateKotlinClass(obj.getClass()).getSimpleName());
            }
        }
        return null;
    }

    @NotNull
    public static final Image a(@NotNull C7 c72, @NotNull F4 contextDelegate, boolean z11) throws PackageManager.NameNotFoundException, NumberFormatException {
        String authority;
        List<String> pathSegments;
        ComponentName componentNameA;
        Intrinsics.g(c72, "<this>");
        Intrinsics.g(contextDelegate, "contextDelegate");
        Resources resourcesForApplication = null;
        if (c72 instanceof C7.a) {
            C7.a aVar = (C7.a) c72;
            UserHandle userHandle = ((C3356rf) contextDelegate.f62440c.getValue()).f65680a.getUserHandle(aVar.f62292b);
            if (userHandle == null) {
                userHandle = Process.myUserHandle();
            }
            String str = aVar.f62293c;
            if (str != null) {
                componentNameA = new ComponentName(aVar.f62291a, str);
            } else {
                String str2 = aVar.f62291a;
                Intrinsics.f(userHandle, "userHandle");
                componentNameA = contextDelegate.a(str2, userHandle);
            }
            if (componentNameA != null) {
                Intrinsics.f(userHandle, "userHandle");
                return new Image.AppIcon(componentNameA, userHandle);
            }
            return new Image.Stub(null);
        }
        if (c72 instanceof C7.c) {
            C7.c cVar = (C7.c) c72;
            String packageId = cVar.f62298a;
            UserHandle userHandle2 = ((C3356rf) contextDelegate.f62440c.getValue()).f65680a.getUserHandle(cVar.f62299b);
            if (userHandle2 == null) {
                userHandle2 = Process.myUserHandle();
            }
            Intrinsics.f(userHandle2, "contextDelegate.userHand…?: Process.myUserHandle()");
            String shortcutId = cVar.f62300c;
            Intrinsics.g(packageId, "packageId");
            Intrinsics.g(shortcutId, "shortcutId");
            return new Image.Shortcut(userHandle2, packageId, shortcutId);
        }
        if (c72 instanceof C7.d) {
            C7.d dVar = (C7.d) c72;
            int identifier = 0;
            if (!r70.j.I0(dVar.f62301a, "http", false)) {
                String url = dVar.f62301a;
                H2 resultType = a(dVar.f62302b);
                Intrinsics.g(url, "url");
                Intrinsics.g(resultType, "resultType");
                Image.Url url2 = new Image.Url(url, resultType, null);
                if (!r70.j.I0(dVar.f62301a, "android.resource", false)) {
                    return url2;
                }
                Context context = contextDelegate.f62438a;
                Intrinsics.g(context, "context");
                Uri uri = Utils.INSTANCE.toUri(url);
                String authority2 = uri.getAuthority();
                Intrinsics.d(authority2);
                String authority3 = uri.getAuthority();
                if (authority3 != null) {
                    try {
                        resourcesForApplication = context.getPackageManager().getResourcesForApplication(authority3);
                    } catch (PackageManager.NameNotFoundException unused) {
                    }
                }
                if (resourcesForApplication != null && (authority = uri.getAuthority()) != null && (pathSegments = uri.getPathSegments()) != null && !pathSegments.isEmpty()) {
                    if (pathSegments.size() == 1) {
                        try {
                            String str3 = pathSegments.get(0);
                            Intrinsics.f(str3, "segments[0]");
                            identifier = Integer.parseInt(str3);
                        } catch (NumberFormatException unused2) {
                        }
                    } else if (pathSegments.size() == 2) {
                        identifier = resourcesForApplication.getIdentifier(pathSegments.get(1), pathSegments.get(0), authority);
                    }
                }
                return new Image.AndroidResource(url2, authority2, identifier);
            }
            Image.Url urlA = H7.a(Image.Companion, contextDelegate, z11, dVar.f62301a, a(dVar.f62302b), b70.h.f17594a);
            if (urlA != null) {
                return urlA;
            }
            C3309p1.b(EnumC3131e9.InternalDebug, "Failed to create image with PseudoImage: " + dVar);
            return new Image.Stub(null);
        }
        if (c72 instanceof C7.b) {
            C7.b bVar = (C7.b) c72;
            Image.Url urlA2 = H7.a(Image.Companion, contextDelegate, z11, bVar.f62294a, a(bVar.f62295b), bVar.f62297d);
            if (urlA2 != null) {
                return new Image.LargeImage((float) bVar.f62296c, urlA2);
            }
            return new Image.Stub(null);
        }
        throw new NoWhenBranchMatchedException();
    }
}
