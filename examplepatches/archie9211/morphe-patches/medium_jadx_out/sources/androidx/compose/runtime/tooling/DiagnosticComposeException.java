package androidx.compose.runtime.tooling;

import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import defpackage.bu1;
import defpackage.d46;
import defpackage.f17;
import defpackage.gj7;
import defpackage.k80;
import defpackage.n12;
import defpackage.p12;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Landroidx/compose/runtime/tooling/DiagnosticComposeException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class DiagnosticComposeException extends RuntimeException {
    public final n12 a;

    public DiagnosticComposeException(n12 n12Var) {
        this.a = n12Var;
        if (n12Var.b) {
            return;
        }
        int[] iArr = {Mp4VideoDirectory.TAG_VENDOR, Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, Mp4VideoDirectory.TAG_WIDTH, Mp4VideoDirectory.TAG_HORIZONTAL_RESOLUTION, Mp4VideoDirectory.TAG_VERTICAL_RESOLUTION, 125, -127, 126665345, 200};
        List list = n12Var.a;
        int size = list.size();
        ArrayList arrayList = new ArrayList();
        int i = 0;
        while (i < size) {
            int i2 = i + 1;
            p12 p12Var = (p12) list.get(i);
            if (!k80.c0(p12Var.a, iArr)) {
                if (p12Var.a == 100) {
                    int i3 = i + 2;
                    if (i3 < size && ((p12) list.get(i3)).a == 1000) {
                        break;
                    } else {
                        bu1.V0(arrayList);
                    }
                } else {
                    arrayList.add(p12Var);
                }
            }
            i = i2;
        }
        int size2 = arrayList.size();
        StackTraceElement[] stackTraceElementArr = new StackTraceElement[size2];
        for (int i4 = 0; i4 < size2; i4++) {
            stackTraceElementArr[i4] = new StackTraceElement("$$compose", "m$" + ((p12) arrayList.get(i4)).a, "SourceFile", 1);
        }
        setStackTrace(stackTraceElementArr);
    }

    @Override // java.lang.Throwable
    public final Throwable fillInStackTrace() {
        setStackTrace(new StackTraceElement[0]);
        return this;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        n12 n12Var = this.a;
        if (!n12Var.b) {
            return "Composition stack when thrown:";
        }
        StringBuilder sb = new StringBuilder("Composition stack when thrown:\n");
        f17 f17VarB = d46.B();
        List list = n12Var.a;
        list.getClass();
        gj7 gj7Var = new gj7(list);
        int size = gj7Var.getSize();
        for (int i = 0; i < size; i++) {
            ((p12) gj7Var.get(i)).getClass();
        }
        f17 f17VarW = d46.w(f17VarB);
        f17VarW.getClass();
        gj7 gj7Var2 = new gj7(f17VarW);
        int size2 = gj7Var2.getSize();
        for (int i2 = 0; i2 < size2; i2++) {
            String str = (String) gj7Var2.get(i2);
            sb.append("\tat ");
            sb.append(str);
            sb.append('\n');
        }
        return sb.toString();
    }
}
