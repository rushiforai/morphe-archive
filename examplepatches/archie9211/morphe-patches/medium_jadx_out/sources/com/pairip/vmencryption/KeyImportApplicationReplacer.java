package com.pairip.vmencryption;

import android.app.Application;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public final class KeyImportApplicationReplacer {
    private static final String TAG = "KeyImport.Replacer";
    private Class<?> activityThreadClass;
    private Object currentActivityThread;
    private final Application currentApplication;
    private final Application realApplication;

    private KeyImportApplicationReplacer(Application currentApplication, Application realApplication) {
        this.currentApplication = currentApplication;
        this.realApplication = realApplication;
    }

    public static void replaceApplicationReferences(Application currentApplication, Application realApplication) {
        new KeyImportApplicationReplacer(currentApplication, realApplication).run();
    }

    private void run() {
        try {
            Class<?> cls = Class.forName("android.app.ActivityThread");
            this.activityThreadClass = cls;
            Class[] clsArr = new Class[0];
            Method method = cls.getMethod("currentActivityThread", null);
            method.setAccessible(true);
            Object objInvoke = method.invoke(null, null);
            this.currentActivityThread = objInvoke;
            if (objInvoke == null) {
                Log.w(TAG, "ActivityThread is null, skipping application replacement.");
                return;
            }
            replaceInitialApplication();
            replaceInAllApplicationsList();
            replaceInPackagesMaps();
        } catch (Exception e) {
            Log.e(TAG, "Failed to replace application in Android internals", e);
        }
    }

    private void replaceInitialApplication() throws Exception {
        Field declaredField = this.activityThreadClass.getDeclaredField("mInitialApplication");
        declaredField.setAccessible(true);
        if (((Application) declaredField.get(this.currentActivityThread)) == this.currentApplication) {
            declaredField.set(this.currentActivityThread, this.realApplication);
        }
    }

    private void replaceInAllApplicationsList() throws Exception {
        Field declaredField = this.activityThreadClass.getDeclaredField("mAllApplications");
        declaredField.setAccessible(true);
        Collections.replaceAll((List) declaredField.get(this.currentActivityThread), this.currentApplication, this.realApplication);
    }

    private void replaceInPackagesMaps() throws Exception {
        Field declaredField = Class.forName("android.app.LoadedApk").getDeclaredField("mApplication");
        declaredField.setAccessible(true);
        Field declaredField2 = Application.class.getDeclaredField("mLoadedApk");
        declaredField2.setAccessible(true);
        replaceInPackagesMap("mPackages", declaredField, declaredField2);
        replaceInPackagesMap("mResourcePackages", declaredField, declaredField2);
    }

    private void replaceInPackagesMap(String fieldName, Field mApplicationField, Field mLoadedApkField) throws Exception {
        Field declaredField = this.activityThreadClass.getDeclaredField(fieldName);
        declaredField.setAccessible(true);
        Map map = (Map) declaredField.get(this.currentActivityThread);
        if (map == null) {
            return;
        }
        Iterator it2 = map.values().iterator();
        while (it2.hasNext()) {
            Object obj = ((WeakReference) it2.next()).get();
            if (obj != null) {
                replaceInLoadedApk(obj, mApplicationField, mLoadedApkField);
            }
        }
    }

    private void replaceInLoadedApk(Object loadedApk, Field mApplicationField, Field mLoadedApkField) throws Exception {
        if (mApplicationField.get(loadedApk) == this.currentApplication) {
            mApplicationField.set(loadedApk, this.realApplication);
            mLoadedApkField.set(this.realApplication, loadedApk);
        }
    }
}
