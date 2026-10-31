package com.vungle.ads.internal.task;

import android.content.Context;
import android.os.Bundle;
import com.vungle.ads.BuildConfig;
import com.vungle.ads.internal.ServiceLocator;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.s1;
import com.vungle.ads.internal.util.PathProvider;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements c {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47529a;

    /* renamed from: b, reason: collision with root package name */
    public final PathProvider f47530b;

    static {
        new a();
    }

    public b(Context context, PathProvider pathProvider) {
        Intrinsics.g(context, "context");
        Intrinsics.g(pathProvider, "pathProvider");
        this.f47529a = context;
        this.f47530b = pathProvider;
    }

    @Override // com.vungle.ads.internal.task.c
    public final int a(Bundle bundle, g jobRunner) {
        File fileB;
        Intrinsics.g(bundle, "bundle");
        Intrinsics.g(jobRunner, "jobRunner");
        File vmDir = this.f47530b.getVmDir();
        String string = bundle.getString("AD_ID_KEY");
        if (string == null || (fileB = this.f47530b.b(string)) == null) {
            fileB = vmDir;
        }
        boolean z11 = u.f47714a;
        t.a("CleanupJob", "CleanupJob: Current directory snapshot");
        try {
            if (Intrinsics.b(fileB, vmDir)) {
                ServiceLocator serviceLocatorA = s1.a();
                if (serviceLocatorA == null) {
                    return 0;
                }
                a(serviceLocatorA);
                if (s1.a() == null) {
                    return 0;
                }
                if (bundle.containsKey("STALE_DIRS_KEY")) {
                    ArrayList<String> stringArrayList = bundle.getStringArrayList("STALE_DIRS_KEY");
                    if (stringArrayList != null) {
                        Iterator<T> it = stringArrayList.iterator();
                        while (it.hasNext()) {
                            com.vungle.ads.internal.util.n.a(new File(vmDir, (String) it.next()));
                        }
                    }
                } else {
                    File[] fileArrListFiles = vmDir.listFiles();
                    if (fileArrListFiles == null) {
                        return 0;
                    }
                    for (File file : fileArrListFiles) {
                        if (file.isDirectory()) {
                            com.vungle.ads.internal.util.n.a(file);
                        }
                    }
                }
            } else {
                com.vungle.ads.internal.util.n.a(fileB);
            }
            return 0;
        } catch (IOException unused) {
            return 1;
        }
    }

    public final void a(ServiceLocator serviceLocator) {
        FilePreferences filePreferences = (FilePreferences) serviceLocator.getService(FilePreferences.class);
        int iA = filePreferences.a("VERSION_CODE", -1);
        if (iA < 70707) {
            if (iA < 70000) {
                boolean z11 = u.f47714a;
                t.a("CleanupJob", "CleanupJob: drop old files data");
                File file = new File(this.f47529a.getNoBackupFilesDir(), "vungle_db");
                if (file.exists()) {
                    com.vungle.ads.internal.util.n.a(file);
                    com.vungle.ads.internal.util.n.a(new File(file.getPath() + "-journal"));
                } else {
                    this.f47529a.deleteDatabase("vungle_db");
                }
                String string = this.f47529a.getSharedPreferences("com.vungle.sdk", 0).getString("cache_path", null);
                this.f47529a.deleteSharedPreferences("com.vungle.sdk");
                File noBackupFilesDir = this.f47529a.getNoBackupFilesDir();
                Intrinsics.f(noBackupFilesDir, "context.noBackupFilesDir");
                com.vungle.ads.internal.util.n.a(new File(noBackupFilesDir, "vungle_settings"));
                if (string != null) {
                    com.vungle.ads.internal.util.n.a(new File(string));
                }
            }
            if (iA < 70100) {
                com.vungle.ads.internal.util.n.a(new File(this.f47529a.getApplicationInfo().dataDir, "vungle"));
            }
            if (iA < 70301) {
                try {
                    com.vungle.ads.internal.util.n.a(new File(this.f47530b.a(), "vungleSettings"));
                    com.vungle.ads.internal.util.n.a(new File(this.f47530b.a(), "failedTpatSet"));
                } catch (Exception e3) {
                    boolean z12 = u.f47714a;
                    t.a("CleanupJob", "Failed to delete temp data", e3);
                }
            }
            if (iA < 70500) {
                File noBackupFilesDir2 = this.f47529a.getNoBackupFilesDir();
                try {
                    com.vungle.ads.internal.util.n.a(new File(noBackupFilesDir2, "failedTpats"));
                    com.vungle.ads.internal.util.n.a(new File(noBackupFilesDir2, "failedGenericTpats"));
                } catch (Exception e11) {
                    boolean z13 = u.f47714a;
                    t.a("CleanupJob", "Failed to delete 742 tpat data", e11);
                }
            }
            if (iA < 70600) {
                File noBackupFilesDir3 = this.f47529a.getNoBackupFilesDir();
                try {
                    com.vungle.ads.internal.util.n.a(new File(noBackupFilesDir3, "vungle_cache/downloads"));
                    com.vungle.ads.internal.util.n.a(new File(noBackupFilesDir3, "vungle_cache/js"));
                } catch (Exception e12) {
                    boolean z14 = u.f47714a;
                    t.a("CleanupJob", "Failed to delete 750 data", e12);
                }
            }
            filePreferences.b("VERSION_CODE", BuildConfig.VERSION_CODE).b();
        }
    }
}
