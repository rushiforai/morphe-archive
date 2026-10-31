package kotlin.io;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Metadata;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@JvmName
/* loaded from: classes.dex */
public final class ByteStreamsKt {
    public static final long a(InputStream inputStream, OutputStream out, int i5) throws IOException {
        Intrinsics.g(inputStream, "<this>");
        Intrinsics.g(out, "out");
        byte[] bArr = new byte[i5];
        int i11 = inputStream.read(bArr);
        long j11 = 0;
        while (i11 >= 0) {
            out.write(bArr, 0, i11);
            j11 += i11;
            i11 = inputStream.read(bArr);
        }
        return j11;
    }

    public static final byte[] b(InputStream inputStream) throws IOException {
        Intrinsics.g(inputStream, "<this>");
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(Math.max(UserMetadata.MAX_INTERNAL_KEY_SIZE, inputStream.available()));
        a(inputStream, byteArrayOutputStream, UserMetadata.MAX_INTERNAL_KEY_SIZE);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        Intrinsics.f(byteArray, "toByteArray(...)");
        return byteArray;
    }
}
