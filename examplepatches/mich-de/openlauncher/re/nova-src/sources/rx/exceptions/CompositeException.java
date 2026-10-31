package rx.exceptions;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

/* loaded from: classes5.dex */
public final class CompositeException extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final List f86463a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86464b;

    /* renamed from: c, reason: collision with root package name */
    public lb0.a f86465c;

    public CompositeException(List list) {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        ArrayList arrayList = new ArrayList();
        if (list != null) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Throwable th2 = (Throwable) it.next();
                if (th2 instanceof CompositeException) {
                    linkedHashSet.addAll(((CompositeException) th2).f86463a);
                } else if (th2 != null) {
                    linkedHashSet.add(th2);
                } else {
                    linkedHashSet.add(new NullPointerException());
                }
            }
        } else {
            linkedHashSet.add(new NullPointerException());
        }
        arrayList.addAll(linkedHashSet);
        List listUnmodifiableList = Collections.unmodifiableList(arrayList);
        this.f86463a = listUnmodifiableList;
        this.f86464b = listUnmodifiableList.size() + " exceptions occurred. ";
    }

    public static void a(StringBuilder sb2, Throwable th2, String str) {
        sb2.append(str);
        sb2.append(th2);
        sb2.append('\n');
        for (StackTraceElement stackTraceElement : th2.getStackTrace()) {
            sb2.append("\t\tat ");
            sb2.append(stackTraceElement);
            sb2.append('\n');
        }
        if (th2.getCause() != null) {
            sb2.append("\tCaused by: ");
            a(sb2, th2.getCause(), b.f42142b);
        }
    }

    public final void b(lb0.b bVar) {
        Appendable appendable;
        StringBuilder sb2 = new StringBuilder(128);
        sb2.append(this);
        sb2.append('\n');
        for (StackTraceElement stackTraceElement : getStackTrace()) {
            sb2.append("\tat ");
            sb2.append(stackTraceElement);
            sb2.append('\n');
        }
        int i5 = 1;
        for (Throwable th2 : this.f86463a) {
            sb2.append("  ComposedException ");
            sb2.append(i5);
            sb2.append(" :\n");
            a(sb2, th2, "\t");
            i5++;
        }
        switch (bVar.f74827a) {
            case 0:
                appendable = (PrintStream) bVar.f74828b;
                break;
            default:
                appendable = (PrintWriter) bVar.f74828b;
                break;
        }
        synchronized (appendable) {
            String string = sb2.toString();
            switch (bVar.f74827a) {
                case 0:
                    ((PrintStream) bVar.f74828b).println((Object) string);
                    break;
                default:
                    ((PrintWriter) bVar.f74828b).println((Object) string);
                    break;
            }
        }
    }

    @Override // java.lang.Throwable
    public final synchronized Throwable getCause() {
        try {
            if (this.f86465c == null) {
                lb0.a aVar = new lb0.a();
                HashSet hashSet = new HashSet();
                lb0.a aVar2 = aVar;
                for (Throwable runtimeException : this.f86463a) {
                    if (!hashSet.contains(runtimeException)) {
                        hashSet.add(runtimeException);
                        ArrayList arrayList = new ArrayList();
                        Throwable cause = runtimeException.getCause();
                        if (cause != null && cause != runtimeException) {
                            while (true) {
                                arrayList.add(cause);
                                Throwable cause2 = cause.getCause();
                                if (cause2 == null || cause2 == cause) {
                                    break;
                                }
                                cause = cause.getCause();
                            }
                        }
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            Throwable th2 = (Throwable) it.next();
                            if (hashSet.contains(th2)) {
                                runtimeException = new RuntimeException("Duplicate found in causal chain so cropping to prevent loop ...");
                            } else {
                                hashSet.add(th2);
                            }
                        }
                        try {
                            aVar2.initCause(runtimeException);
                        } catch (Throwable unused) {
                        }
                        Throwable cause3 = aVar2.getCause();
                        if (cause3 != null && cause3 != aVar2) {
                            while (true) {
                                Throwable cause4 = cause3.getCause();
                                if (cause4 == null || cause4 == cause3) {
                                    break;
                                }
                                cause3 = cause3.getCause();
                            }
                            aVar2 = cause3;
                        }
                    }
                }
                this.f86465c = aVar;
            }
        } catch (Throwable th3) {
            throw th3;
        }
        return this.f86465c;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f86464b;
    }

    @Override // java.lang.Throwable
    public final void printStackTrace() {
        printStackTrace(System.err);
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintStream printStream) {
        b(new lb0.b(printStream, 0));
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintWriter printWriter) {
        b(new lb0.b(printWriter, 1));
    }

    public CompositeException(Throwable... thArr) {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        ArrayList arrayList = new ArrayList();
        for (Throwable th2 : thArr) {
            if (th2 instanceof CompositeException) {
                linkedHashSet.addAll(((CompositeException) th2).f86463a);
            } else if (th2 != null) {
                linkedHashSet.add(th2);
            } else {
                linkedHashSet.add(new NullPointerException());
            }
        }
        arrayList.addAll(linkedHashSet);
        List listUnmodifiableList = Collections.unmodifiableList(arrayList);
        this.f86463a = listUnmodifiableList;
        this.f86464b = listUnmodifiableList.size() + " exceptions occurred. ";
    }
}
