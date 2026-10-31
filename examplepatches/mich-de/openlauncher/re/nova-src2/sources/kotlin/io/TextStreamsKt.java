package kotlin.io;

import a5.d1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmName;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.sequences.ConstrainedOnceSequence;
import q70.d;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@JvmName
@SourceDebugExtension
/* loaded from: classes.dex */
public final class TextStreamsKt {
    public static final void a(BufferedReader bufferedReader, Function1 function1) throws IOException {
        try {
            Iterator it = ((ConstrainedOnceSequence) d.n0(new d1(bufferedReader, 2))).iterator();
            while (it.hasNext()) {
                function1.invoke(it.next());
            }
            Unit unit = Unit.f71706a;
            bufferedReader.close();
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                CloseableKt.a(bufferedReader, th2);
                throw th3;
            }
        }
    }

    public static final String b(Reader reader) throws IOException {
        Intrinsics.g(reader, "<this>");
        StringWriter stringWriter = new StringWriter();
        char[] cArr = new char[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        int i5 = reader.read(cArr);
        while (i5 >= 0) {
            stringWriter.write(cArr, 0, i5);
            i5 = reader.read(cArr);
        }
        String string = stringWriter.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
