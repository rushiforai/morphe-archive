package com.drew.lang;

import java.io.PrintStream;
import java.io.PrintWriter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CompoundException extends Exception {
    private static final long serialVersionUID = -9207883813472069925L;
    private final Throwable _innerException;

    public CompoundException(String str, Throwable th) {
        super(str);
        this._innerException = th;
    }

    public final Throwable getInnerException() {
        return this._innerException;
    }

    @Override // java.lang.Throwable
    public final void printStackTrace() {
        super.printStackTrace();
        if (this._innerException != null) {
            System.err.println("--- inner exception ---");
            this._innerException.printStackTrace();
        }
    }

    @Override // java.lang.Throwable
    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        if (this._innerException != null) {
            sb.append("\n--- inner exception ---\n");
            sb.append(this._innerException.toString());
        }
        return sb.toString();
    }

    public CompoundException(Throwable th) {
        this(null, th);
    }

    public CompoundException(String str) {
        this(str, null);
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintWriter printWriter) {
        super.printStackTrace(printWriter);
        if (this._innerException != null) {
            printWriter.println("--- inner exception ---");
            this._innerException.printStackTrace(printWriter);
        }
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintStream printStream) {
        super.printStackTrace(printStream);
        if (this._innerException != null) {
            printStream.println("--- inner exception ---");
            this._innerException.printStackTrace(printStream);
        }
    }
}
