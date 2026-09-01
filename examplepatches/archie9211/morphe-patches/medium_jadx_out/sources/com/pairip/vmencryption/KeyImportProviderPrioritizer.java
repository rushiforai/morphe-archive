package com.pairip.vmencryption;

import android.content.pm.ProviderInfo;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportProviderPrioritizer {
    private static final String TAG = "KeyImport.Prioritizer";

    public void ensureProviderRunsFirst(Class<?> targetProviderClass) {
        Object boundApplication;
        try {
            Object currentActivityThread = getCurrentActivityThread();
            if (currentActivityThread == null || (boundApplication = getBoundApplication(currentActivityThread)) == null) {
                return;
            }
            moveTargetProviderOnTop(boundApplication, targetProviderClass);
        } catch (Exception e) {
            Log.e(TAG, "Failed to ensure " + targetProviderClass.getName() + " runs first", e);
        }
    }

    private static Object getCurrentActivityThread() throws Exception {
        Class[] clsArr = new Class[0];
        Method method = Class.forName("android.app.ActivityThread").getMethod("currentActivityThread", null);
        method.setAccessible(true);
        return method.invoke(null, null);
    }

    private static Object getBoundApplication(Object currentActivityThread) throws Exception {
        Field declaredField = currentActivityThread.getClass().getDeclaredField("mBoundApplication");
        declaredField.setAccessible(true);
        return declaredField.get(currentActivityThread);
    }

    private static void moveTargetProviderOnTop(Object mBoundApplication, Class<?> targetProviderClass) throws Exception {
        ProviderInfo providerInfo;
        Field declaredField = mBoundApplication.getClass().getDeclaredField("providers");
        declaredField.setAccessible(true);
        List list = (List) declaredField.get(mBoundApplication);
        if (list == null || list.isEmpty()) {
            return;
        }
        if (((ProviderInfo) list.get(0)).name == null || !((ProviderInfo) list.get(0)).name.startsWith(targetProviderClass.getName())) {
            ArrayList arrayList = new ArrayList(list);
            Iterator it2 = arrayList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    providerInfo = null;
                    break;
                }
                providerInfo = (ProviderInfo) it2.next();
                if (providerInfo.name != null && providerInfo.name.startsWith(targetProviderClass.getName())) {
                    break;
                }
            }
            if (providerInfo != null) {
                arrayList.remove(providerInfo);
                arrayList.add(0, providerInfo);
                declaredField.set(mBoundApplication, arrayList);
                Log.d(TAG, "Moved " + targetProviderClass.getName() + " to index 0");
            }
        }
    }
}
