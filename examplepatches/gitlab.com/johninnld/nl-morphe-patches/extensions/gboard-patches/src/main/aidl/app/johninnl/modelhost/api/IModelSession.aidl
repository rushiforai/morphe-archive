package app.johninnl.modelhost.api;
import android.os.ParcelFileDescriptor;
import app.johninnl.modelhost.api.ITextResultCallback;
interface IModelSession {
    long preparePrefix(String prefixJson, ITextResultCallback callback);
    long submitText(String requestJson, ITextResultCallback callback);
    long submitImage(String requestJson, in ParcelFileDescriptor image, ITextResultCallback callback);
    void cancel(long requestId);
    void close();
}
