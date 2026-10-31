package w20;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;

/* loaded from: classes4.dex */
public final class w extends PrintWriter {
    public w(OutputStreamWriter outputStreamWriter) {
        super(outputStreamWriter);
    }

    @Override // java.io.PrintWriter, java.io.Writer
    public final void write(String str) {
        super.write(o.a(str));
    }
}
