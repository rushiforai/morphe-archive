package rx.exceptions;

import java.io.Serializable;
import java.util.HashSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import ub0.d;

/* loaded from: classes5.dex */
public final class OnErrorThrowable extends RuntimeException {

    public static class OnNextValue extends RuntimeException {

        /* renamed from: a, reason: collision with root package name */
        public final Serializable f86466a;

        public OnNextValue(Object obj) {
            String strConcat;
            StringBuilder sb2 = new StringBuilder("OnError while emitting onNext value: ");
            if (obj == null) {
                strConcat = AbstractJsonLexerKt.NULL;
            } else if (a.f86467a.contains(obj.getClass())) {
                strConcat = obj.toString();
            } else if (obj instanceof String) {
                strConcat = (String) obj;
            } else if (obj instanceof Enum) {
                strConcat = ((Enum) obj).name();
            } else {
                d.f90783d.a().getClass();
                strConcat = obj.getClass().getName().concat(".class");
            }
            sb2.append(strConcat);
            super(sb2.toString());
            if (!(obj instanceof Serializable)) {
                try {
                    obj = String.valueOf(obj);
                } catch (Throwable th2) {
                    obj = th2.getMessage();
                }
            }
            this.f86466a = (Serializable) obj;
        }
    }

    public static Throwable a(Object obj, Throwable th2) {
        int i5 = 0;
        Throwable runtimeException = th2;
        int i11 = 0;
        while (true) {
            if (runtimeException.getCause() == null) {
                break;
            }
            int i12 = i11 + 1;
            if (i11 >= 25) {
                runtimeException = new RuntimeException("Stack too deep to get final cause");
                break;
            }
            runtimeException = runtimeException.getCause();
            i11 = i12;
        }
        if (!(runtimeException instanceof OnNextValue) || ((OnNextValue) runtimeException).f86466a != obj) {
            OnNextValue onNextValue = new OnNextValue(obj);
            HashSet hashSet = new HashSet();
            Throwable cause = th2;
            while (cause.getCause() != null) {
                int i13 = i5 + 1;
                if (i5 < 25) {
                    cause = cause.getCause();
                    if (!hashSet.contains(cause.getCause())) {
                        hashSet.add(cause.getCause());
                        i5 = i13;
                    }
                }
            }
            try {
                cause.initCause(onNextValue);
            } catch (Throwable unused) {
            }
            return th2;
        }
        return th2;
    }
}
