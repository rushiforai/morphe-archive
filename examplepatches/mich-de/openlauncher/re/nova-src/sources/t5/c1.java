package t5;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public interface c1 {
    Object getDefaultValue();

    Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl);

    Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl);
}
