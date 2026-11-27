package app.johninnl.modelhost.api;
import android.os.ParcelFileDescriptor;
import app.johninnl.modelhost.api.ITextResultCallback;
interface ISpeechSession {
    long feed(String requestJson, in ParcelFileDescriptor pcm, ITextResultCallback callback);
    void cancel(long requestId);
    void close();
    float voiceProbability(in float[] window);
}
