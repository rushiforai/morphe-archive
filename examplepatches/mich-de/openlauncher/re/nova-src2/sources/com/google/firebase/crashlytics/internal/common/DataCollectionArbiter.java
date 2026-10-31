package com.google.firebase.crashlytics.internal.common;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import b.c0;
import com.google.android.gms.tasks.Task;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsTasks;
import fi.t;

/* loaded from: classes.dex */
public class DataCollectionArbiter {
    private static final String FIREBASE_CRASHLYTICS_COLLECTION_ENABLED = "firebase_crashlytics_collection_enabled";
    private Boolean crashlyticsDataCollectionEnabled;
    fi.j dataCollectionEnabledTask;
    private final fi.j dataCollectionExplicitlyApproved;
    private final ul.g firebaseApp;
    private boolean setInManifest;
    private final SharedPreferences sharedPreferences;
    private final Object taskLock;
    boolean taskResolved;

    public DataCollectionArbiter(ul.g gVar) {
        Object obj = new Object();
        this.taskLock = obj;
        this.dataCollectionEnabledTask = new fi.j();
        this.taskResolved = false;
        this.setInManifest = false;
        this.dataCollectionExplicitlyApproved = new fi.j();
        gVar.a();
        Context context = gVar.f91320a;
        this.firebaseApp = gVar;
        this.sharedPreferences = CommonUtils.getSharedPrefs(context);
        Boolean dataCollectionValueFromSharedPreferences = getDataCollectionValueFromSharedPreferences();
        this.crashlyticsDataCollectionEnabled = dataCollectionValueFromSharedPreferences == null ? getDataCollectionValueFromManifest(context) : dataCollectionValueFromSharedPreferences;
        synchronized (obj) {
            try {
                if (isAutomaticDataCollectionEnabled()) {
                    this.dataCollectionEnabledTask.c(null);
                    this.taskResolved = true;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private Boolean getDataCollectionValueFromManifest(Context context) {
        Boolean crashlyticsDataCollectionEnabledFromManifest = readCrashlyticsDataCollectionEnabledFromManifest(context);
        if (crashlyticsDataCollectionEnabledFromManifest == null) {
            this.setInManifest = false;
            return null;
        }
        this.setInManifest = true;
        return Boolean.valueOf(Boolean.TRUE.equals(crashlyticsDataCollectionEnabledFromManifest));
    }

    private Boolean getDataCollectionValueFromSharedPreferences() {
        if (!this.sharedPreferences.contains(FIREBASE_CRASHLYTICS_COLLECTION_ENABLED)) {
            return null;
        }
        this.setInManifest = false;
        return Boolean.valueOf(this.sharedPreferences.getBoolean(FIREBASE_CRASHLYTICS_COLLECTION_ENABLED, true));
    }

    private boolean isFirebaseDataCollectionDefaultEnabled() {
        try {
            return this.firebaseApp.h();
        } catch (IllegalStateException unused) {
            return false;
        }
    }

    private void logDataCollectionState(boolean z11) {
        Logger.getLogger().d(c0.n("Crashlytics automatic data collection ", z11 ? "ENABLED" : "DISABLED", " by ", this.crashlyticsDataCollectionEnabled == null ? "global Firebase setting" : this.setInManifest ? "firebase_crashlytics_collection_enabled manifest flag" : "API", "."));
    }

    private static Boolean readCrashlyticsDataCollectionEnabledFromManifest(Context context) {
        ApplicationInfo applicationInfo;
        Bundle bundle;
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null || (applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 128)) == null || (bundle = applicationInfo.metaData) == null || !bundle.containsKey(FIREBASE_CRASHLYTICS_COLLECTION_ENABLED)) {
                return null;
            }
            return Boolean.valueOf(applicationInfo.metaData.getBoolean(FIREBASE_CRASHLYTICS_COLLECTION_ENABLED));
        } catch (PackageManager.NameNotFoundException e3) {
            Logger.getLogger().e("Could not read data collection permission from manifest", e3);
            return null;
        }
    }

    @SuppressLint({"ApplySharedPref"})
    private static void storeDataCollectionValueInSharedPreferences(SharedPreferences sharedPreferences, Boolean bool) {
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        if (bool != null) {
            editorEdit.putBoolean(FIREBASE_CRASHLYTICS_COLLECTION_ENABLED, bool.booleanValue());
        } else {
            editorEdit.remove(FIREBASE_CRASHLYTICS_COLLECTION_ENABLED);
        }
        editorEdit.apply();
    }

    public void grantDataCollectionPermission(boolean z11) {
        if (!z11) {
            throw new IllegalStateException("An invalid data collection token was used.");
        }
        this.dataCollectionExplicitlyApproved.c(null);
    }

    public synchronized boolean isAutomaticDataCollectionEnabled() {
        boolean zBooleanValue;
        try {
            Boolean bool = this.crashlyticsDataCollectionEnabled;
            zBooleanValue = bool != null ? bool.booleanValue() : isFirebaseDataCollectionDefaultEnabled();
            logDataCollectionState(zBooleanValue);
        } catch (Throwable th2) {
            throw th2;
        }
        return zBooleanValue;
    }

    public synchronized void setCrashlyticsDataCollectionEnabled(Boolean bool) {
        Boolean dataCollectionValueFromManifest;
        if (bool != null) {
            try {
                this.setInManifest = false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (bool != null) {
            dataCollectionValueFromManifest = bool;
        } else {
            ul.g gVar = this.firebaseApp;
            gVar.a();
            dataCollectionValueFromManifest = getDataCollectionValueFromManifest(gVar.f91320a);
        }
        this.crashlyticsDataCollectionEnabled = dataCollectionValueFromManifest;
        storeDataCollectionValueInSharedPreferences(this.sharedPreferences, bool);
        synchronized (this.taskLock) {
            try {
                if (isAutomaticDataCollectionEnabled()) {
                    if (!this.taskResolved) {
                        this.dataCollectionEnabledTask.c(null);
                        this.taskResolved = true;
                    }
                } else if (this.taskResolved) {
                    this.dataCollectionEnabledTask = new fi.j();
                    this.taskResolved = false;
                }
            } finally {
            }
        }
    }

    public Task<Void> waitForAutomaticDataCollectionEnabled() {
        t tVar;
        synchronized (this.taskLock) {
            tVar = this.dataCollectionEnabledTask.f55135a;
        }
        return tVar;
    }

    public Task<Void> waitForDataCollectionPermission() {
        return CrashlyticsTasks.race(this.dataCollectionExplicitlyApproved.f55135a, waitForAutomaticDataCollectionEnabled());
    }
}
