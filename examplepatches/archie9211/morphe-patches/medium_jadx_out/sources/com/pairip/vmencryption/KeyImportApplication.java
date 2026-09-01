package com.pairip.vmencryption;

import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportApplication extends Application {
    private static final String TAG = "KeyImport.Application";
    private Boolean cachedIsEncryptionKeyPresent;
    private Application cachedOriginalApplication;
    protected boolean isApplicationReferencesReplaced;
    private final KeyStoreManager keyStoreManager;
    private Method originalAttachBaseContextMethod;
    private final KeyImportProviderPrioritizer providerPrioritizer;

    public KeyImportApplication() {
        this.isApplicationReferencesReplaced = false;
        this.keyStoreManager = new KeyStoreManager();
        this.providerPrioritizer = new KeyImportProviderPrioritizer();
    }

    protected KeyImportApplication(KeyStoreManager keyStoreManager, KeyImportProviderPrioritizer providerPrioritizer) {
        this.isApplicationReferencesReplaced = false;
        this.keyStoreManager = keyStoreManager;
        this.providerPrioritizer = providerPrioritizer;
    }

    @Override // android.content.ContextWrapper
    public void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        logOnMethodCalled("attachBaseContext");
        if (isEncryptionKeyPresent()) {
            this.providerPrioritizer.ensureProviderRunsFirst(KeyImportReplacementProvider.class);
            callOriginalOnAttachBaseContext(base);
        } else {
            attachKeyImportClassLoader(base);
        }
    }

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        logOnMethodCalled("onCreate");
        if (isEncryptionKeyPresent()) {
            replaceApplicationReferences();
            getOriginalApplication().onCreate();
        }
    }

    @Override // android.app.Application, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        logOnMethodCalled("onConfigurationChanged");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().onConfigurationChanged(newConfig);
        }
    }

    @Override // android.app.Application, android.content.ComponentCallbacks
    public void onLowMemory() {
        super.onLowMemory();
        logOnMethodCalled("onLowMemory");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().onLowMemory();
        }
    }

    @Override // android.app.Application
    public void onTerminate() {
        super.onTerminate();
        logOnMethodCalled("onTerminate");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().onTerminate();
        }
    }

    @Override // android.app.Application, android.content.ComponentCallbacks2
    public void onTrimMemory(int level) {
        super.onTrimMemory(level);
        logOnMethodCalled("onTrimMemory");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().onTrimMemory(level);
        }
    }

    @Override // android.app.Application
    public void registerActivityLifecycleCallbacks(Application.ActivityLifecycleCallbacks callback) {
        super.registerActivityLifecycleCallbacks(callback);
        logOnMethodCalled("registerActivityLifecycleCallbacks");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().registerActivityLifecycleCallbacks(callback);
        }
    }

    @Override // android.app.Application
    public void unregisterActivityLifecycleCallbacks(Application.ActivityLifecycleCallbacks callback) {
        super.unregisterActivityLifecycleCallbacks(callback);
        logOnMethodCalled("unregisterActivityLifecycleCallbacks");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().unregisterActivityLifecycleCallbacks(callback);
        }
    }

    @Override // android.app.Application
    public void registerOnProvideAssistDataListener(Application.OnProvideAssistDataListener listener) {
        super.registerOnProvideAssistDataListener(listener);
        logOnMethodCalled("registerOnProvideAssistDataListener");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().registerOnProvideAssistDataListener(listener);
        }
    }

    @Override // android.app.Application
    public void unregisterOnProvideAssistDataListener(Application.OnProvideAssistDataListener listener) {
        super.unregisterOnProvideAssistDataListener(listener);
        logOnMethodCalled("unregisterOnProvideAssistDataListener");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().unregisterOnProvideAssistDataListener(listener);
        }
    }

    @Override // android.app.Application, android.content.ContextWrapper, android.content.Context
    public void registerComponentCallbacks(ComponentCallbacks callback) {
        super.registerComponentCallbacks(callback);
        logOnMethodCalled("registerComponentCallbacks");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().registerComponentCallbacks(callback);
        }
    }

    @Override // android.app.Application, android.content.ContextWrapper, android.content.Context
    public void unregisterComponentCallbacks(ComponentCallbacks callback) {
        super.unregisterComponentCallbacks(callback);
        logOnMethodCalled("unregisterComponentCallbacks");
        if (isEncryptionKeyPresent()) {
            getOriginalApplication().unregisterComponentCallbacks(callback);
        }
    }

    protected void replaceApplicationReferences() {
        if (this.isApplicationReferencesReplaced) {
            return;
        }
        KeyImportApplicationReplacer.replaceApplicationReferences(this, getOriginalApplication());
        this.isApplicationReferencesReplaced = true;
    }

    private boolean isEncryptionKeyPresent() {
        Boolean bool = this.cachedIsEncryptionKeyPresent;
        if (bool != null) {
            return bool.booleanValue();
        }
        try {
            boolean zIsEncryptionKeyPresent = this.keyStoreManager.isEncryptionKeyPresent(KeyImportConstants.packageVersionCode);
            this.cachedIsEncryptionKeyPresent = Boolean.valueOf(zIsEncryptionKeyPresent);
            return zIsEncryptionKeyPresent;
        } catch (KeyImportException e) {
            Log.e(TAG, "Failed to check if encryption key is present.", e);
            return false;
        }
    }

    protected void attachKeyImportClassLoader(Context base) {
        while (base instanceof ContextWrapper) {
            base = ((ContextWrapper) base).getBaseContext();
        }
        try {
            ApplicationInfo applicationInfo = base.getApplicationInfo();
            KeyImportClassLoader keyImportClassLoader = new KeyImportClassLoader(applicationInfo.sourceDir, base.getClassLoader().getParent());
            Field field = getField(base.getClass(), "mPackageInfo");
            field.setAccessible(true);
            Object obj = field.get(base);
            Field field2 = getField(obj.getClass(), "mClassLoader");
            field2.setAccessible(true);
            field2.set(obj, keyImportClassLoader);
            try {
                Field field3 = getField(base.getClass(), "mClassLoader");
                field3.setAccessible(true);
                field3.set(base, keyImportClassLoader);
            } catch (NoSuchFieldException unused) {
            }
            Log.d(TAG, "Custom ClassLoader attached successfully.");
        } catch (ReflectiveOperationException e) {
            Log.e(TAG, "Failed to attach custom ClassLoader.", e);
            throw new IllegalStateException("Failed to attach custom ClassLoader.", e);
        }
    }

    private void callOriginalOnAttachBaseContext(Context context) {
        Method originalProtectedMethod = this.originalAttachBaseContextMethod;
        if (originalProtectedMethod == null) {
            originalProtectedMethod = getOriginalProtectedMethod("attachBaseContext");
            this.originalAttachBaseContextMethod = originalProtectedMethod;
        }
        try {
            originalProtectedMethod.invoke(getOriginalApplication(), context);
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Failed to call attachBaseContext on original application.", e);
        }
    }

    public Application getOriginalApplication() {
        Application application = this.cachedOriginalApplication;
        if (application != null) {
            return application;
        }
        Log.d(TAG, "Creating original application: " + KeyImportConstants.originalApplicationClassName);
        try {
            Class[] clsArr = new Class[0];
            Application application2 = (Application) Class.forName(KeyImportConstants.originalApplicationClassName).getConstructor(null).newInstance(null);
            this.cachedOriginalApplication = application2;
            return application2;
        } catch (ReflectiveOperationException e) {
            Log.e(TAG, "Failed to instantiate original application.", e);
            throw new IllegalStateException("Failed to instantiate original application.", e);
        }
    }

    private Method getOriginalProtectedMethod(String methodName) {
        Class<?> superclass = getOriginalApplication().getClass();
        while (true) {
            if (superclass != null) {
                for (Method method : superclass.getDeclaredMethods()) {
                    if (method.getName().equals(methodName)) {
                        method.setAccessible(true);
                        return method;
                    }
                }
                superclass = superclass.getSuperclass();
            } else {
                throw new IllegalStateException(String.format("Failed to find original method: %s in %s", methodName, getOriginalApplication().getClass().getName()));
            }
        }
    }

    private static Field getField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        while (clazz != null) {
            try {
                return clazz.getDeclaredField(fieldName);
            } catch (NoSuchFieldException unused) {
                clazz = clazz.getSuperclass();
            }
        }
        throw new NoSuchFieldException(fieldName);
    }

    private void logOnMethodCalled(String methodName) {
        Log.d(TAG, String.format("%s is called when encryption key is %s.", methodName, isEncryptionKeyPresent() ? "present" : "not present"));
    }
}
