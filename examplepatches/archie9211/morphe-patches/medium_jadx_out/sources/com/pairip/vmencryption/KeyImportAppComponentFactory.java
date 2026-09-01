package com.pairip.vmencryption;

import android.app.Activity;
import android.app.AppComponentFactory;
import android.app.Application;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ContentProvider;
import android.content.Intent;
import android.util.Log;
import java.util.Objects;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportAppComponentFactory extends AppComponentFactory {
    private static final String KEY_IMPORT_APPLICATION_CLASS_NAME = "com.pairip.vmencryption.KeyImportApplication";
    private static final String KEY_IMPORT_REPLACEMENT_PROVIDER_CLASS_NAME = "com.pairip.vmencryption.KeyImportReplacementProvider";
    private static final String TAG = "KeyImport.Factory";
    private AppComponentFactory cachedOriginalAppComponentFactory;
    private final KeyStoreManager keyStoreManager;

    public KeyImportAppComponentFactory() {
        this.keyStoreManager = new KeyStoreManager();
    }

    protected KeyImportAppComponentFactory(KeyStoreManager keyStoreManager) {
        this.keyStoreManager = keyStoreManager;
    }

    public Application instantiateApplication(ClassLoader cl, String className) throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        if (!isEncryptionKeyPresent()) {
            Log.d(TAG, "Instantiating key import application.");
            return new KeyImportPlaceholderApplication();
        }
        if (Objects.equals(className, KEY_IMPORT_APPLICATION_CLASS_NAME)) {
            className = KeyImportConstants.originalApplicationClassName;
        }
        Log.d(TAG, "Instantiating original application " + className);
        return getOriginalAppComponentFactory().instantiateApplication(cl, className);
    }

    public Activity instantiateActivity(ClassLoader cl, String className, Intent intent) throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        if (!isEncryptionKeyPresent()) {
            Log.d(TAG, "Instantiating key import activity.");
            return new KeyImportActivity();
        }
        Log.d(TAG, "Instantiating original activity.");
        return getOriginalAppComponentFactory().instantiateActivity(cl, className, intent);
    }

    public BroadcastReceiver instantiateReceiver(ClassLoader cl, String className, Intent intent) throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        if (!isEncryptionKeyPresent()) {
            Log.d(TAG, "instantiateReceiver: key not present, returning placeholder receiver.");
            return new KeyImportPlaceholderReceiver();
        }
        Log.d(TAG, "Instantiating original receiver.");
        return getOriginalAppComponentFactory().instantiateReceiver(cl, className, intent);
    }

    public Service instantiateService(ClassLoader cl, String className, Intent intent) throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        if (className != null && className.equals(KeyImportService.class.getName())) {
            Log.d(TAG, "instantiateService: instantiating key import service.");
            return new KeyImportService();
        }
        if (!isEncryptionKeyPresent()) {
            Log.d(TAG, "instantiateService: key not present, returning placeholder service.");
            return new KeyImportPlaceholderService();
        }
        Log.d(TAG, "Instantiating original service.");
        return getOriginalAppComponentFactory().instantiateService(cl, className, intent);
    }

    public ContentProvider instantiateProvider(ClassLoader cl, String className) throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        if (className != null && className.startsWith(KEY_IMPORT_REPLACEMENT_PROVIDER_CLASS_NAME)) {
            Log.d(TAG, "Replacing KeyImportReplacementProvider with placeholder provider.");
            return new KeyImportPlaceholderContentProvider();
        }
        if (!isEncryptionKeyPresent()) {
            Log.d(TAG, "Instantiating key import content provider.");
            return new KeyImportPlaceholderContentProvider();
        }
        Log.d(TAG, "Instantiating original provider.");
        return getOriginalAppComponentFactory().instantiateProvider(cl, className);
    }

    private AppComponentFactory getOriginalAppComponentFactory() {
        AppComponentFactory appComponentFactory = this.cachedOriginalAppComponentFactory;
        if (appComponentFactory != null) {
            return appComponentFactory;
        }
        Log.d(TAG, "Creating original app component factory: " + KeyImportConstants.originalAppComponentFactoryClassName);
        try {
            Class[] clsArr = new Class[0];
            AppComponentFactory appComponentFactory2 = (AppComponentFactory) Class.forName(KeyImportConstants.originalAppComponentFactoryClassName).getConstructor(null).newInstance(null);
            this.cachedOriginalAppComponentFactory = appComponentFactory2;
            return appComponentFactory2;
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Failed to instantiate original app component factory.", e);
        }
    }

    private boolean isEncryptionKeyPresent() {
        try {
            return this.keyStoreManager.isEncryptionKeyPresent(KeyImportConstants.packageVersionCode);
        } catch (KeyImportException e) {
            Log.e(TAG, "Failed to check if encryption key is present.", e);
            return false;
        }
    }
}
