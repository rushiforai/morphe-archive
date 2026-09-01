package com.pairip;

import android.app.Application;
import android.os.Build;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.security.Key;
import java.security.KeyStore;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;

/* JADX INFO: loaded from: classes2.dex */
public class VmDecryptor {
    private static final String ENCRYPTION_ALGORITHM = "AES/GCM/NoPadding";
    private static final int IV_LENGTH_BYTES = 12;
    private static final String KEY_ALIAS_PREFIX = "pairip_encryption_wrapping_key_";
    private static final String TAG = "VmDecryptor";
    private static final int TAG_LENGTH_BYTES = 16;

    public byte[] decrypt(byte[] encryptedBytecode, int versionCode, boolean isDebuggingEnabled) {
        int i;
        long jCurrentTimeMillis = System.currentTimeMillis();
        int i2 = ByteBuffer.wrap(encryptedBytecode, encryptedBytecode.length - 8, 4).getInt();
        int i3 = ByteBuffer.wrap(encryptedBytecode, encryptedBytecode.length - 4, 4).getInt();
        if (i2 < 0 || i2 >= encryptedBytecode.length || i3 < 0 || (i = i2 + i3) > encryptedBytecode.length) {
            throw new IllegalStateException("VM program is malformed.");
        }
        byte[] bArrCopyOfRange = Arrays.copyOfRange(encryptedBytecode, i2, i);
        byte[] bArrDecryptFragment = decryptFragment(bArrCopyOfRange, versionCode);
        byte[] bArr = new byte[((encryptedBytecode.length - i3) + bArrDecryptFragment.length) - 8];
        System.arraycopy(encryptedBytecode, 0, bArr, 0, i2);
        System.arraycopy(bArrDecryptFragment, 0, bArr, i2, bArrDecryptFragment.length);
        System.arraycopy(encryptedBytecode, i, bArr, bArrDecryptFragment.length + i2, ((encryptedBytecode.length - i2) - i3) - 8);
        if (isDebuggingEnabled) {
            Log.i(TAG, String.format("Finished decrypting %d kB after %d ms.", Integer.valueOf(bArrCopyOfRange.length / 1024), Long.valueOf(System.currentTimeMillis() - jCurrentTimeMillis)));
        }
        return bArr;
    }

    private byte[] decryptFragment(byte[] encryptedFragment, int versionCode) {
        if (encryptedFragment.length == 0) {
            return new byte[0];
        }
        String encryptionKeyAlias = getEncryptionKeyAlias(versionCode);
        try {
            PlaceholderContextSetter placeholderContextSetter = new PlaceholderContextSetter();
            try {
                KeyStore keyStore = getKeyStore();
                if (!keyStore.containsAlias(encryptionKeyAlias)) {
                    throw new IllegalStateException("Encryption key not found in keystore.");
                }
                Key key = keyStore.getKey(encryptionKeyAlias, null);
                GCMParameterSpec gCMParameterSpec = new GCMParameterSpec(128, encryptedFragment, 0, 12);
                Cipher cipher = Cipher.getInstance(ENCRYPTION_ALGORITHM);
                cipher.init(2, key, gCMParameterSpec);
                byte[] bArrDoFinal = cipher.doFinal(encryptedFragment, 12, encryptedFragment.length - 12);
                placeholderContextSetter.close();
                return bArrDoFinal;
            } finally {
            }
        } catch (Exception e) {
            throw new IllegalStateException("Failed to decrypt VM program.", e);
        }
    }

    protected KeyStore getKeyStore() {
        try {
            KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
            keyStore.load(null, null);
            return keyStore;
        } catch (Exception e) {
            throw new IllegalStateException("Failed to load keystore.", e);
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
                    Log.e(VmDecryptor.TAG, "Failed to set context.", e);
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
                Log.e(VmDecryptor.TAG, "Failed to reset context.", e);
            }
        }
    }

    private static String getEncryptionKeyAlias(int versionCode) {
        return String.format(null, "%s%d", "pairip_encryption_wrapping_key_", Integer.valueOf(versionCode));
    }
}
