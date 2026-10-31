package f60;

import c60.e;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final Logger f54339a = Logger.getLogger(b.class.getName());

    /* JADX WARN: Removed duplicated region for block: B:39:0x0050 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x005b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static List a(InputStream inputStream) throws Throwable {
        Throwable th2;
        IOException e3;
        Logger logger = f54339a;
        if (inputStream == null) {
            return Collections.EMPTY_LIST;
        }
        InputStream inputStream2 = null;
        try {
            try {
                ObjectInputStream objectInputStream = new ObjectInputStream(inputStream);
                try {
                    e eVar = new e();
                    ArrayList arrayList = new ArrayList();
                    eVar.f19798a = arrayList;
                    eVar.readExternal(objectInputStream);
                    if (arrayList.isEmpty()) {
                        throw new IllegalStateException("Empty metadata");
                    }
                    try {
                        objectInputStream.close();
                        return arrayList;
                    } catch (IOException e11) {
                        logger.log(Level.WARNING, "Error closing input stream (ignored)", (Throwable) e11);
                        return arrayList;
                    }
                } catch (IOException e12) {
                    e3 = e12;
                    throw new IllegalStateException("Unable to parse metadata file", e3);
                }
            } catch (Throwable th3) {
                th2 = th3;
                if (0 == 0) {
                    try {
                        inputStream2.close();
                    } catch (IOException e13) {
                        logger.log(Level.WARNING, "Error closing input stream (ignored)", (Throwable) e13);
                    }
                } else {
                    try {
                        inputStream.close();
                    } catch (IOException e14) {
                        logger.log(Level.WARNING, "Error closing input stream (ignored)", (Throwable) e14);
                    }
                }
                throw th2;
            }
        } catch (IOException e15) {
            e3 = e15;
        } catch (Throwable th4) {
            th2 = th4;
            if (0 == 0) {
            }
            throw th2;
        }
    }
}
