package com.pairip.vmencryption;

import android.app.Application;
import android.os.Build;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProtection;
import android.security.keystore.WrappedKeyEntry;
import android.util.Log;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.cert.CertificateException;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes2.dex */
public class KeyStoreManager {
    public static final String KEY_ALIAS_PREFIX = "pairip_encryption_wrapping_key_";
    private static final String TAG = "KeyStoreManager";
    public static final String WRAPPING_KEY_ALIAS = "pairip_encryption_wrapping_key";
    protected KeyStore keyStore = null;
    protected KeyPairGenerator rsaKeyPairGenerator = null;

    public boolean isEncryptionKeyPresent(int versionCode) throws KeyImportException {
        try {
            return getKeyStore().containsAlias(getEncryptionKeyAlias(versionCode));
        } catch (KeyStoreException e) {
            throw new KeyImportException("Failed to check if encryption key is present.", e);
        }
    }

    public byte[] getWrappingKey() throws KeyImportException {
        try {
            if (getKeyStore().containsAlias(WRAPPING_KEY_ALIAS)) {
                return getKeyStore().getCertificate(WRAPPING_KEY_ALIAS).getPublicKey().getEncoded();
            }
            try {
                KeyPairGenerator rsaKeyPairGenerator = getRsaKeyPairGenerator();
                rsaKeyPairGenerator.initialize(getWrappingKeyGenParameterSpec());
                return rsaKeyPairGenerator.generateKeyPair().getPublic().getEncoded();
            } catch (InvalidAlgorithmParameterException e) {
                throw new KeyImportException("Failed to generate wrapping key.", e);
            }
        } catch (KeyStoreException e2) {
            throw new KeyImportException("Failed to check if encryption key is present.", e2);
        }
    }

    public void saveWrappedEncryptionKey(int versionCode, byte[] wrappedKey) throws KeyImportException {
        String encryptionKeyAlias = getEncryptionKeyAlias(versionCode);
        try {
            getKeyStore().setEntry(encryptionKeyAlias, new WrappedKeyEntry(wrappedKey, WRAPPING_KEY_ALIAS, "RSA/ECB/OAEPPadding", getWrappingKeyGenParameterSpec()), null);
        } catch (KeyStoreException e) {
            throw new KeyImportException("Failed to import wrapped encryption key.", e);
        }
    }

    public void saveUnwrappedEncryptionKey(int versionCode, byte[] unwrappedKey) throws KeyImportException {
        try {
            getKeyStore().setEntry(getEncryptionKeyAlias(versionCode), new KeyStore.SecretKeyEntry(new SecretKeySpec(unwrappedKey, "AES")), new KeyProtection.Builder(2).setBlockModes("GCM").setEncryptionPaddings("NoPadding").setDigests("SHA-256").build());
        } catch (KeyStoreException e) {
            throw new KeyImportException("Failed to import wrapped encryption key.", e);
        }
    }

    private KeyStore getKeyStore() throws KeyImportException {
        if (this.keyStore == null) {
            try {
                PlaceholderContextSetter placeholderContextSetter = new PlaceholderContextSetter();
                try {
                    KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
                    keyStore.load(null);
                    this.keyStore = keyStore;
                    placeholderContextSetter.close();
                } catch (Throwable th) {
                    try {
                        placeholderContextSetter.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                    throw th;
                }
            } catch (IOException | KeyStoreException | NoSuchAlgorithmException | CertificateException e) {
                throw new KeyImportException("Failed to load Android Keystore.", e);
            }
        }
        return this.keyStore;
    }

    private KeyPairGenerator getRsaKeyPairGenerator() throws KeyImportException {
        KeyPairGenerator keyPairGenerator = this.rsaKeyPairGenerator;
        if (keyPairGenerator != null) {
            return keyPairGenerator;
        }
        try {
            KeyPairGenerator keyPairGenerator2 = KeyPairGenerator.getInstance("RSA", "AndroidKeyStore");
            this.rsaKeyPairGenerator = keyPairGenerator2;
            return keyPairGenerator2;
        } catch (NoSuchAlgorithmException | NoSuchProviderException e) {
            throw new KeyImportException("Failed to create key generator.", e);
        }
    }

    private static class PlaceholderContextSetter implements AutoCloseable {
        private Object activityThread;
        private Field currentActivityThreadField;
        private Object initialApplication;
        private Field initialApplicationField;
        private boolean resetActivityThread;
        private boolean resetInitialApplication;

        PlaceholderContextSetter() {
            this.resetActivityThread = false;
            this.resetInitialApplication = false;
            if (Build.VERSION.SDK_INT <= 30) {
                try {
                    Class<?> cls = Class.forName("android.app.ActivityThread");
                    Field declaredField = cls.getDeclaredField("sCurrentActivityThread");
                    this.currentActivityThreadField = declaredField;
                    declaredField.setAccessible(true);
                    Object obj = this.currentActivityThreadField.get(null);
                    this.activityThread = obj;
                    if (obj == null) {
                        Class[] clsArr = new Class[0];
                        Constructor<?> declaredConstructor = cls.getDeclaredConstructor(null);
                        declaredConstructor.setAccessible(true);
                        Object objNewInstance = declaredConstructor.newInstance(null);
                        this.activityThread = objNewInstance;
                        this.currentActivityThreadField.set(null, objNewInstance);
                        this.resetActivityThread = true;
                    }
                    Field declaredField2 = cls.getDeclaredField("mInitialApplication");
                    this.initialApplicationField = declaredField2;
                    declaredField2.setAccessible(true);
                    Object obj2 = this.initialApplicationField.get(this.activityThread);
                    this.initialApplication = obj2;
                    if (obj2 == null) {
                        this.initialApplicationField.set(this.activityThread, new Application());
                        this.resetInitialApplication = true;
                    }
                } catch (ReflectiveOperationException e) {
                    Log.e(KeyStoreManager.TAG, "Failed to set context.", e);
                }
            }
        }

        @Override // java.lang.AutoCloseable
        public void close() {
            try {
                if (this.resetActivityThread) {
                    this.currentActivityThreadField.set(null, null);
                }
                if (this.resetInitialApplication) {
                    this.initialApplicationField.set(this.activityThread, null);
                }
            } catch (ReflectiveOperationException e) {
                Log.e(KeyStoreManager.TAG, "Failed to reset context.", e);
            }
        }
    }

    private static String getEncryptionKeyAlias(int packageVersionCode) {
        return String.format(null, "%s%d", KEY_ALIAS_PREFIX, Integer.valueOf(packageVersionCode));
    }

    private static KeyGenParameterSpec getWrappingKeyGenParameterSpec() {
        return new KeyGenParameterSpec.Builder(WRAPPING_KEY_ALIAS, 32).setDigests("SHA-256").setEncryptionPaddings("OAEPPadding").setBlockModes("ECB").build();
    }
}
