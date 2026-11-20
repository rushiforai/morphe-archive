package app.aidan.extension.adobescan;

import android.os.ParcelFileDescriptor;
import app.aidan.extension.adobescan.IPdfTransformCallback;

interface IPdfTransformService {
    oneway void transform(long operationId, in ParcelFileDescriptor input, in ParcelFileDescriptor output, int operation, int compressionLevel, in byte[] passwordUtf8, IPdfTransformCallback callback);
    oneway void cancel(long operationId);
    oneway void createOutput(long operationId, in ParcelFileDescriptor[] inputs, in ParcelFileDescriptor output, int operation, in ParcelFileDescriptor ocrModel, in String[] passwords, IPdfTransformCallback callback);
}
