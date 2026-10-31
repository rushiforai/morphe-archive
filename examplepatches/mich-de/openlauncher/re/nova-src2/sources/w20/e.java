package w20;

import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import androidx.compose.ui.node.LayoutNode;
import b.u4;
import h6.c1;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.reflect.InvocationTargetException;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.text.Charsets;
import kotlinx.coroutines.DispatchException;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static float f93671a;

    public static final int a(long[] jArr, long j11) {
        int length = jArr.length - 1;
        int i5 = 0;
        while (i5 <= length) {
            int i11 = (i5 + length) >>> 1;
            long j12 = jArr[i11];
            if (j11 > j12) {
                i5 = i11 + 1;
            } else {
                if (j11 >= j12) {
                    return i11;
                }
                length = i11 - 1;
            }
        }
        return -(i5 + 1);
    }

    public static final LinkedHashSet b(byte[] bytes) throws IOException {
        ObjectInputStream objectInputStream;
        Intrinsics.g(bytes, "bytes");
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        if (bytes.length == 0) {
            return linkedHashSet;
        }
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        try {
            try {
                objectInputStream = new ObjectInputStream(byteArrayInputStream);
            } catch (IOException e3) {
                e3.printStackTrace();
            }
            try {
                int i5 = objectInputStream.readInt();
                for (int i11 = 0; i11 < i5; i11++) {
                    Uri uri = Uri.parse(objectInputStream.readUTF());
                    boolean z11 = objectInputStream.readBoolean();
                    Intrinsics.f(uri, "uri");
                    linkedHashSet.add(new o7.e(z11, uri));
                }
                Unit unit = Unit.f71706a;
                objectInputStream.close();
                Unit unit2 = Unit.f71706a;
                byteArrayInputStream.close();
                return linkedHashSet;
            } finally {
            }
        } finally {
        }
    }

    public static void c(int i5, Object[] objArr) {
        for (int i11 = 0; i11 < i5; i11++) {
            if (objArr[i11] == null) {
                throw new NullPointerException(b.c0.h(i11, "at index "));
            }
        }
    }

    public static void d(Object obj, Object obj2) {
        if (obj == null) {
            throw new NullPointerException(u4.h(obj2, "null key in entry: null="));
        }
        if (obj2 != null) {
            return;
        }
        throw new NullPointerException("null value in entry: " + obj + "=null");
    }

    public static void e(int i5, String str) {
        if (i5 >= 0) {
            return;
        }
        throw new IllegalArgumentException(str + " cannot be negative but was: " + i5);
    }

    public static void f(boolean z11) {
        vk.b0.j("no calls to next() since the last call to remove()", z11);
    }

    public static Handler g(Looper looper) {
        if (Build.VERSION.SDK_INT >= 28) {
            return p4.a.b(looper);
        }
        try {
            return (Handler) Handler.class.getDeclaredConstructor(Looper.class, Handler.Callback.class, Boolean.TYPE).newInstance(looper, null, Boolean.TRUE);
        } catch (IllegalAccessException e3) {
            e = e3;
            Log.w("HandlerCompat", "Unable to invoke Handler(Looper, Callback, boolean) constructor", e);
            return new Handler(looper);
        } catch (InstantiationException e11) {
            e = e11;
            Log.w("HandlerCompat", "Unable to invoke Handler(Looper, Callback, boolean) constructor", e);
            return new Handler(looper);
        } catch (NoSuchMethodException e12) {
            e = e12;
            Log.w("HandlerCompat", "Unable to invoke Handler(Looper, Callback, boolean) constructor", e);
            return new Handler(looper);
        } catch (InvocationTargetException e13) {
            Throwable cause = e13.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            if (cause instanceof Error) {
                throw ((Error) cause);
            }
            throw new RuntimeException(cause);
        }
    }

    public static final String h(CharsetDecoder charsetDecoder, e80.k input) {
        Intrinsics.g(charsetDecoder, "<this>");
        Intrinsics.g(input, "input");
        StringBuilder sb2 = new StringBuilder((int) Math.min(LayoutNode.NotPlacedPlaceOrder, input.i().f52247c));
        Charset charset = charsetDecoder.charset();
        Intrinsics.d(charset);
        if (charset.equals(Charsets.f72000b)) {
            sb2.append((CharSequence) e80.m.c(input));
        } else {
            v4.a.k(input);
            f80.a aVarA = e80.b.a(input);
            Charset charset2 = charsetDecoder.charset();
            Intrinsics.d(charset2);
            sb2.append((CharSequence) f80.b.a(aVarA, charset2));
        }
        return sb2.toString();
    }

    public static final e80.a i(CharsetEncoder charsetEncoder, CharSequence input, int i5, int i11) throws CharacterCodingException {
        Intrinsics.g(input, "input");
        e80.a aVar = new e80.a();
        if (i5 < i11) {
            do {
                byte[] bArrH = w.b.h(charsetEncoder, input, i5, i11);
                aVar.l(bArrH.length, bArrH);
                int length = bArrH.length;
                if (length < 0) {
                    throw new IllegalStateException("Check failed.");
                }
                i5 += length;
            } while (i5 < i11);
        }
        return aVar;
    }

    public static final int j(float f11) {
        int i5 = (int) ((f93671a * f11) + 0.5f);
        if (i5 != 0) {
            return i5;
        }
        if (f11 == 0.0f) {
            return 0;
        }
        return f11 > 0.0f ? 1 : -1;
    }

    public static final int k(int i5) {
        int i11 = (int) ((i5 * f93671a) + 0.5f);
        if (i11 != 0) {
            return i11;
        }
        if (i5 == 0) {
            return 0;
        }
        return i5 > 0 ? 1 : -1;
    }

    public static final int l(int i5) {
        if (i5 == 0) {
            return 1;
        }
        if (i5 == 1) {
            return 2;
        }
        throw new IllegalArgumentException(b.c0.i(i5, "Could not convert ", " to BackoffPolicy"));
    }

    public static final int m(int i5) {
        if (i5 == 0) {
            return 1;
        }
        if (i5 == 1) {
            return 2;
        }
        if (i5 == 2) {
            return 3;
        }
        if (i5 == 3) {
            return 4;
        }
        if (i5 == 4) {
            return 5;
        }
        if (Build.VERSION.SDK_INT < 30 || i5 != 5) {
            throw new IllegalArgumentException(b.c0.i(i5, "Could not convert ", " to NetworkType"));
        }
        return 6;
    }

    public static final int n(int i5) {
        if (i5 == 0) {
            return 1;
        }
        if (i5 == 1) {
            return 2;
        }
        throw new IllegalArgumentException(b.c0.i(i5, "Could not convert ", " to OutOfQuotaPolicy"));
    }

    public static final int o(int i5) {
        if (i5 == 0) {
            return 1;
        }
        if (i5 == 1) {
            return 2;
        }
        if (i5 == 2) {
            return 3;
        }
        if (i5 == 3) {
            return 4;
        }
        if (i5 == 4) {
            return 5;
        }
        if (i5 == 5) {
            return 6;
        }
        throw new IllegalArgumentException(b.c0.i(i5, "Could not convert ", " to State"));
    }

    public static final int p(int i5) {
        fq.c.o(i5, "networkType");
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return 0;
        }
        int i11 = 1;
        if (iF != 1) {
            i11 = 2;
            if (iF != 2) {
                i11 = 3;
                if (iF != 3) {
                    i11 = 4;
                    if (iF != 4) {
                        if (Build.VERSION.SDK_INT >= 30 && i5 == 6) {
                            return 5;
                        }
                        throw new IllegalArgumentException("Could not convert " + c1.C(i5) + " to int");
                    }
                }
            }
        }
        return i11;
    }

    public static final byte[] q(Set triggers) throws IOException {
        Intrinsics.g(triggers, "triggers");
        if (triggers.isEmpty()) {
            return new byte[0];
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            try {
                objectOutputStream.writeInt(triggers.size());
                Iterator it = triggers.iterator();
                while (it.hasNext()) {
                    o7.e eVar = (o7.e) it.next();
                    objectOutputStream.writeUTF(eVar.a().toString());
                    objectOutputStream.writeBoolean(eVar.b());
                }
                Unit unit = Unit.f71706a;
                objectOutputStream.close();
                byteArrayOutputStream.close();
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                Intrinsics.f(byteArray, "outputStream.toByteArray()");
                return byteArray;
            } finally {
            }
        } finally {
        }
    }

    public static final Object r(y70.s sVar, boolean z11, y70.s sVar2, Function2 function2) {
        Object vVar;
        Object objY;
        try {
            if (function2 instanceof BaseContinuationImpl) {
                TypeIntrinsics.e(2, function2);
                vVar = function2.invoke(sVar2, sVar);
            } else {
                vVar = IntrinsicsKt.c(sVar2, sVar, function2);
            }
        } catch (DispatchException e3) {
            Throwable th2 = e3.f72059a;
            sVar.X(new t70.v(false, th2));
            throw th2;
        } catch (Throwable th3) {
            vVar = new t70.v(false, th3);
        }
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (vVar == coroutineSingletons || (objY = sVar.Y(vVar)) == m0.f88829e) {
            return coroutineSingletons;
        }
        sVar.m0();
        if (!(objY instanceof t70.v)) {
            return m0.x(objY);
        }
        if (!z11) {
            Throwable th4 = ((t70.v) objY).f88869a;
            if ((th4 instanceof TimeoutCancellationException) && ((TimeoutCancellationException) th4).f72061a == sVar) {
                if (vVar instanceof t70.v) {
                    throw ((t70.v) vVar).f88869a;
                }
                return vVar;
            }
        }
        throw ((t70.v) objY).f88869a;
    }

    public static final int s(int i5) {
        fq.c.o(i5, "state");
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return 0;
        }
        int i11 = 1;
        if (iF != 1) {
            i11 = 2;
            if (iF != 2) {
                i11 = 3;
                if (iF != 3) {
                    i11 = 4;
                    if (iF != 4) {
                        if (iF == 5) {
                            return 5;
                        }
                        throw new NoWhenBranchMatchedException();
                    }
                }
            }
        }
        return i11;
    }

    public static final long t(long j11) {
        return (Float.floatToRawIntBits((int) (j11 & 4294967295L)) & 4294967295L) | (Float.floatToRawIntBits((int) (j11 >> 32)) << 32);
    }
}
