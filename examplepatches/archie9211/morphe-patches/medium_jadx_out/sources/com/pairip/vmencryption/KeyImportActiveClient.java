package com.pairip.vmencryption;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.pairip.vmencryption.IAntiTamperKeyTransferResultListener;
import java.util.Objects;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportActiveClient {
    public static final int FLAG_RPC_CALL = 0;
    public static final String PLAY_STORE_INTENT_PROPERTY_NAME = "PLAY_STORE_INTENT";
    public static final String SERVICE_INTERFACE_CLASS_NAME = "com.android.vending.securedatatransfer.IAntiTamperKeyTransferService";
    private static final String TAG = "KeyImport.ActiveClient";
    public static final int TRANSACTION_GET_UNWRAPPED_ENCRYPTION_KEY = 2;
    public static final int TRANSACTION_GET_WRAPPED_ENCRYPTION_KEY = 1;
    public static final String UNWRAPPED_KEY_PROPERTY_NAME = "UNWRAPPED_KEY";
    public static final String WRAPPED_KEY_PROPERTY_NAME = "WRAPPED_KEY";
    private final KeyStoreManager keyStoreManager;
    private final String packageName;
    private final int packageVersionCode;

    public enum KeyImportRequestType {
        GET_WRAPPED_KEY,
        GET_UNWRAPPED_KEY
    }

    public KeyImportActiveClient(KeyStoreManager keyStoreManager, String packageName, int packageVersionCode) {
        this.keyStoreManager = keyStoreManager;
        this.packageName = packageName;
        this.packageVersionCode = packageVersionCode;
    }

    public void importEncryptionKey(Context context, KeyImportResultListener resultListener) {
        byte[] wrappingKey;
        KeyImportRequestType keyImportRequestTypeResolveRequestType = resolveRequestType(context);
        if (keyImportRequestTypeResolveRequestType == KeyImportRequestType.GET_WRAPPED_KEY) {
            try {
                wrappingKey = this.keyStoreManager.getWrappingKey();
            } catch (KeyImportException e) {
                resultListener.onFailure(e);
                return;
            }
        } else {
            wrappingKey = null;
        }
        if (context.bindService(new Intent().setPackage(KeyImportConstants.playStorePackageName).setAction(SERVICE_INTERFACE_CLASS_NAME), new KeyImportPlayStoreServiceConnection(this, keyImportRequestTypeResolveRequestType, wrappingKey, resultListener), 1)) {
            return;
        }
        resultListener.onFailure(new KeyImportException("Failed to bind to encryption key transfer service."));
    }

    protected KeyImportRequestType resolveRequestType(Context context) {
        if (Build.VERSION.SDK_INT < 24) {
            return KeyImportRequestType.GET_UNWRAPPED_KEY;
        }
        if (context.getPackageManager().hasSystemFeature("android.hardware.hardware_keystore", 40)) {
            return KeyImportRequestType.GET_WRAPPED_KEY;
        }
        return KeyImportRequestType.GET_UNWRAPPED_KEY;
    }

    class KeyImportPlayStoreServiceConnection implements ServiceConnection {
        private final KeyImportRequestType requestType;
        private final KeyImportResultListener resultListener;
        final /* synthetic */ KeyImportActiveClient this$0;
        private final byte[] wrappingKey;

        public KeyImportPlayStoreServiceConnection(final KeyImportActiveClient this$0, KeyImportRequestType requestType, byte[] wrappingKey, KeyImportResultListener resultListener) {
            Objects.requireNonNull(this$0);
            this.this$0 = this$0;
            this.requestType = requestType;
            this.wrappingKey = wrappingKey;
            this.resultListener = resultListener;
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName componentName, IBinder serviceBinder) {
            Parcel parcelObtain = Parcel.obtain();
            Parcel parcelObtain2 = Parcel.obtain();
            try {
                try {
                    populateInputData(serviceBinder, parcelObtain, this.requestType);
                    if (!serviceBinder.transact(getTransactionCode(this.requestType), parcelObtain, parcelObtain2, 0)) {
                        throw new KeyImportException("Encryption key transfer service could not process request.");
                    }
                } finally {
                    parcelObtain.recycle();
                    parcelObtain2.recycle();
                }
            } catch (RemoteException | KeyImportException e) {
                this.resultListener.onFailure(e);
            }
        }

        private int getTransactionCode(KeyImportRequestType requestType) {
            int iOrdinal = requestType.ordinal();
            if (iOrdinal == 0) {
                return 1;
            }
            if (iOrdinal == 1) {
                return 2;
            }
            throw new IllegalArgumentException("Unsupported request type: " + String.valueOf(requestType));
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName componentName) {
            this.resultListener.onFailure(new KeyImportException("Encryption key transfer service disconnected."));
        }

        private void populateInputData(IBinder serviceBinder, Parcel inputData, KeyImportRequestType requestType) throws RemoteException {
            int iOrdinal = requestType.ordinal();
            if (iOrdinal == 0) {
                inputData.writeInterfaceToken(serviceBinder.getInterfaceDescriptor());
                inputData.writeString(this.this$0.packageName);
                inputData.writeInt(this.this$0.packageVersionCode);
                inputData.writeByteArray(this.wrappingKey);
                inputData.writeStrongBinder(createResultListener().asBinder());
                inputData.writeInt(0);
                return;
            }
            if (iOrdinal != 1) {
                return;
            }
            inputData.writeInterfaceToken(serviceBinder.getInterfaceDescriptor());
            inputData.writeString(this.this$0.packageName);
            inputData.writeInt(this.this$0.packageVersionCode);
            inputData.writeStrongBinder(createResultListener().asBinder());
            inputData.writeInt(1);
        }

        private IAntiTamperKeyTransferResultListener createResultListener() {
            return new IAntiTamperKeyTransferResultListener.Stub(this) { // from class: com.pairip.vmencryption.KeyImportActiveClient.KeyImportPlayStoreServiceConnection.1
                final /* synthetic */ KeyImportPlayStoreServiceConnection this$1;

                {
                    Objects.requireNonNull(this);
                    this.this$1 = this;
                }

                @Override // com.pairip.vmencryption.IAntiTamperKeyTransferResultListener
                public void onCompleted(Bundle response) {
                    try {
                        this.this$1.processResponse(response);
                    } catch (KeyImportException e) {
                        this.this$1.resultListener.onFailure(e);
                    }
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void processResponse(Bundle response) throws KeyImportException {
            byte[] byteArray = response.getByteArray(KeyImportActiveClient.WRAPPED_KEY_PROPERTY_NAME);
            byte[] byteArray2 = response.getByteArray(KeyImportActiveClient.UNWRAPPED_KEY_PROPERTY_NAME);
            PendingIntent pendingIntent = (PendingIntent) response.getParcelable(KeyImportActiveClient.PLAY_STORE_INTENT_PROPERTY_NAME);
            if (byteArray != null) {
                this.this$0.keyStoreManager.saveWrappedEncryptionKey(this.this$0.packageVersionCode, byteArray);
                this.resultListener.onSuccess();
            } else if (byteArray2 != null) {
                this.this$0.keyStoreManager.saveUnwrappedEncryptionKey(this.this$0.packageVersionCode, byteArray2);
                this.resultListener.onSuccess();
            } else {
                if (pendingIntent != null) {
                    this.resultListener.onActionRequired(pendingIntent);
                    return;
                }
                throw new KeyImportException("Encryption key transfer service returned empty response.");
            }
        }
    }
}
