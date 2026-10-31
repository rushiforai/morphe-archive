package io.branch.search.internal;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.os.UserHandle;
import io.branch.engage.sesame_lite.internal.data.UserCacheEntity;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.Result;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;

/* loaded from: classes4.dex */
public abstract class U9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f63450a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final H f63451b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3356rf f63452c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final ComponentName f63453d;

    public U9(@NotNull String tag, @NotNull F4 contextDelegate, @NotNull I analyticalBufferRepository, @NotNull C3356rf userHandleRepository, boolean z11) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        this.f63450a = contextDelegate;
        this.f63451b = analyticalBufferRepository;
        this.f63452c = userHandleRepository;
        this.f63453d = z11 ? a() : null;
    }

    public final ComponentName a() {
        ActivityInfo activityInfo;
        Intent intentAddCategory = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER");
        Intrinsics.f(intentAddCategory, "Intent(Intent.ACTION_MAI…Intent.CATEGORY_LAUNCHER)");
        intentAddCategory.setPackage("com.android.settings");
        ResolveInfo resolveInfoResolveActivity = this.f63450a.f62438a.getPackageManager().resolveActivity(intentAddCategory, SQLiteDatabase.OPEN_FULLMUTEX);
        if (resolveInfoResolveActivity == null || (activityInfo = resolveInfoResolveActivity.activityInfo) == null) {
            return null;
        }
        return new ComponentName(activityInfo.packageName, activityInfo.name);
    }

    @Nullable
    public final long[] a(long j11, @NotNull EnumSet<u40.a> ssmlTypes) {
        Intrinsics.g(ssmlTypes, "ssmlTypes");
        if (j11 == -1) {
            if (!ssmlTypes.contains(u40.a.f90554c)) {
                return null;
            }
            List<UserHandle> userHandles = this.f63452c.f65680a.getUserHandles();
            ArrayList arrayList = new ArrayList();
            for (UserHandle userHandle : userHandles) {
                C3356rf c3356rf = this.f63452c;
                c3356rf.getClass();
                Intrinsics.g(userHandle, "userHandle");
                UserCacheEntity cacheEntity = c3356rf.f65680a.getCacheEntity(userHandle);
                if (cacheEntity != null) {
                    arrayList.add(cacheEntity);
                }
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (!((UserCacheEntity) next).isQuietModeEnabled()) {
                    arrayList2.add(next);
                }
            }
            ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList2, 10));
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                arrayList3.add(Long.valueOf(((UserCacheEntity) it2.next()).getUserSerial()));
            }
            return b70.g.J1(arrayList3);
        }
        return new long[]{j11};
    }

    @NotNull
    public final <T extends Yd> List<T> a(@NotNull String sessionId, @NotNull String api, long j11, @Nullable String str, @NotNull Object obj) throws JSONException {
        Pair pair;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(api, "api");
        long jCurrentTimeMillis = System.currentTimeMillis();
        Object obj2 = EmptyList.f71733a;
        int i5 = Result.f71687b;
        boolean z11 = obj instanceof Result.Failure;
        if (!z11) {
            obj2 = obj;
        }
        List<T> list = (List) obj2;
        boolean z12 = !z11;
        if (!z11 && list.isEmpty() && ((int) j11) > 0) {
            pair = new Pair(Boolean.FALSE, "Requested entity count not filled");
        } else {
            Boolean boolValueOf = Boolean.valueOf(z12);
            Throwable thA = Result.a(obj);
            pair = new Pair(boolValueOf, thA != null ? thA.getClass().getSimpleName() : null);
        }
        P.a(this.f63451b, sessionId, jCurrentTimeMillis, System.currentTimeMillis(), ((Boolean) pair.f71683a).booleanValue(), "SSML", str == null ? "unspecified" : str, api, (String) pair.f71684b);
        return list;
    }
}
