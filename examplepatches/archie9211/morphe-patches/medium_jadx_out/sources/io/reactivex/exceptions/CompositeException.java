package io.reactivex.exceptions;

import defpackage.ay0;
import defpackage.dm2;
import defpackage.h22;
import defpackage.i22;
import j$.util.DesugarCollections;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class CompositeException extends RuntimeException {
    public final List a;
    public final String b;
    public h22 c;

    public CompositeException(List list) {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        ArrayList arrayList = new ArrayList();
        if (list != null) {
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                Throwable th = (Throwable) it2.next();
                if (th instanceof CompositeException) {
                    linkedHashSet.addAll(((CompositeException) th).a);
                } else if (th != null) {
                    linkedHashSet.add(th);
                } else {
                    linkedHashSet.add(new NullPointerException("Throwable was null!"));
                }
            }
        } else {
            linkedHashSet.add(new NullPointerException("errors was null"));
        }
        if (linkedHashSet.isEmpty()) {
            ay0.e("errors is empty");
            throw null;
        }
        arrayList.addAll(linkedHashSet);
        List listUnmodifiableList = DesugarCollections.unmodifiableList(arrayList);
        this.a = listUnmodifiableList;
        this.b = listUnmodifiableList.size() + " exceptions occurred. ";
    }

    public static void a(StringBuilder sb, Throwable th, String str) {
        sb.append(str);
        sb.append(th);
        sb.append('\n');
        for (StackTraceElement stackTraceElement : th.getStackTrace()) {
            sb.append("\t\tat ");
            sb.append(stackTraceElement);
            sb.append('\n');
        }
        if (th.getCause() != null) {
            sb.append("\tCaused by: ");
            a(sb, th.getCause(), "");
        }
    }

    public final void b(dm2 dm2Var) {
        StringBuilder sb = new StringBuilder(128);
        sb.append(this);
        sb.append('\n');
        for (StackTraceElement stackTraceElement : getStackTrace()) {
            sb.append("\tat ");
            sb.append(stackTraceElement);
            sb.append('\n');
        }
        int i = 1;
        for (Throwable th : this.a) {
            sb.append("  ComposedException ");
            sb.append(i);
            sb.append(" :\n");
            a(sb, th, "\t");
            i++;
        }
        dm2Var.R(sb.toString());
    }

    @Override // java.lang.Throwable
    public final synchronized Throwable getCause() {
        h22 h22Var;
        try {
            h22Var = this.c;
            if (h22Var == null) {
                h22Var = new h22();
                HashSet hashSet = new HashSet();
                h22 h22Var2 = h22Var;
                for (Throwable runtimeException : this.a) {
                    if (!hashSet.contains(runtimeException)) {
                        hashSet.add(runtimeException);
                        ArrayList<Throwable> arrayList = new ArrayList();
                        Throwable cause = runtimeException.getCause();
                        if (cause != null && cause != runtimeException) {
                            while (true) {
                                arrayList.add(cause);
                                Throwable cause2 = cause.getCause();
                                if (cause2 == null || cause2 == cause) {
                                    break;
                                }
                                cause = cause2;
                            }
                        }
                        for (Throwable th : arrayList) {
                            if (hashSet.contains(th)) {
                                runtimeException = new RuntimeException("Duplicate found in causal chain so cropping to prevent loop ...");
                            } else {
                                hashSet.add(th);
                            }
                        }
                        try {
                            h22Var2.initCause(runtimeException);
                        } catch (Throwable unused) {
                        }
                        Throwable cause3 = h22Var2.getCause();
                        if (cause3 != null && h22Var2 != cause3) {
                            while (true) {
                                Throwable cause4 = cause3.getCause();
                                if (cause4 == null || cause4 == cause3) {
                                    break;
                                }
                                cause3 = cause4;
                            }
                            h22Var2 = cause3;
                        }
                    }
                }
                this.c = h22Var;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return h22Var;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.b;
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintStream printStream) {
        b(new i22(0, printStream));
    }

    @Override // java.lang.Throwable
    public final void printStackTrace() {
        printStackTrace(System.err);
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintWriter printWriter) {
        b(new i22(1, printWriter));
    }

    public CompositeException(Throwable... thArr) {
        this(Arrays.asList(thArr));
    }
}
