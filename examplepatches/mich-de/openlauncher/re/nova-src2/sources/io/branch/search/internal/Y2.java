package io.branch.search.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.StrictMode;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.UUID;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Y2 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final LinkedHashMap f63704a = new LinkedHashMap();

    public enum b {
        Analytics("analytics"),
        RemoteConfig("remote_config"),
        RawDb("raw_db"),
        /* JADX INFO: Fake field, exist only in values array */
        RoomDb("room_db"),
        ImageDownloader("image_downloader"),
        BundleUpdateLock("bundle_update_lock"),
        UserAgent("user_agent"),
        /* JADX INFO: Fake field, exist only in values array */
        Groups("groups"),
        /* JADX INFO: Fake field, exist only in values array */
        AsyncUpdateLock("async_update_lock"),
        PackageSourceLoader("package_source_loader"),
        PackageSyncManager("package_sync_manager"),
        VersionAnalytics("version_analytics"),
        BranchConfigurationCache("branch_configuration_cache"),
        BundleJobSchedule("bundle_job_schedule");


        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f63717a;

        b(String str) {
            this.f63717a = str;
        }
    }

    public static final class a {
        @JvmStatic
        @NotNull
        public static SharedPreferences a(@NotNull Context context, @NotNull b f11) {
            Intrinsics.g(context, "context");
            Intrinsics.g(f11, "f");
            LinkedHashMap linkedHashMap = Y2.f63704a;
            if (linkedHashMap.containsKey(f11)) {
                Object obj = linkedHashMap.get(f11);
                Intrinsics.d(obj);
                return (SharedPreferences) obj;
            }
            StrictMode.ThreadPolicy threadPolicyAllowThreadDiskReads = StrictMode.allowThreadDiskReads();
            try {
                SharedPreferences sharedPreferences = context.getSharedPreferences("BNC_" + f11.f63717a, 0);
                Intrinsics.f(sharedPreferences, "context.getSharedPrefere…(), Context.MODE_PRIVATE)");
                linkedHashMap.put(f11, sharedPreferences);
                return sharedPreferences;
            } finally {
                StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
            }
        }

        @JvmStatic
        @Nullable
        public static Vd a(@NotNull Context context, @NotNull H analyticalBufferRepository) {
            File[] fileArrListFiles;
            Intrinsics.g(context, "context");
            Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
            File file = new File(context.getApplicationInfo().dataDir, "shared_prefs");
            if (!file.exists() || !file.isDirectory() || (fileArrListFiles = file.listFiles()) == null) {
                return null;
            }
            ArrayList arrayList = new ArrayList();
            for (File file2 : fileArrListFiles) {
                String name = file2.getName();
                Intrinsics.f(name, "f.name");
                if (r70.j.I0(name, "BNC_", false)) {
                    try {
                        String name2 = file2.getName();
                        Intrinsics.f(name2, "f.name");
                        String absolutePath = file2.getAbsolutePath();
                        Intrinsics.f(absolutePath, "f.absolutePath");
                        arrayList.add(new Xd(file2.length(), name2, absolutePath));
                    } catch (SecurityException e3) {
                        String string = UUID.randomUUID().toString();
                        Intrinsics.f(string, "randomUUID().toString()");
                        analyticalBufferRepository.a(string, e3, "BranchSharedPrefs.loadSharedPrefsDiagnostics");
                    }
                }
            }
            return new Vd(arrayList);
        }
    }
}
