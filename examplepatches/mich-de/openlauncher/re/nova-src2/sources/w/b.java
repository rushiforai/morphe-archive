package w;

import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.util.Log;
import android.util.Size;
import android.util.SizeF;
import java.io.Serializable;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import x7.q;
import xk.b1;
import xk.e2;
import xk.f2;
import xk.g2;
import xk.j2;
import xk.k2;
import xk.n0;
import xk.y2;

/* loaded from: classes.dex */
public abstract class b {
    public static final Bundle a(Pair... pairArr) {
        Bundle bundle = new Bundle(pairArr.length);
        for (Pair pair : pairArr) {
            String str = (String) pair.f71683a;
            Object obj = pair.f71684b;
            if (obj == null) {
                bundle.putString(str, null);
            } else if (obj instanceof Boolean) {
                bundle.putBoolean(str, ((Boolean) obj).booleanValue());
            } else if (obj instanceof Byte) {
                bundle.putByte(str, ((Number) obj).byteValue());
            } else if (obj instanceof Character) {
                bundle.putChar(str, ((Character) obj).charValue());
            } else if (obj instanceof Double) {
                bundle.putDouble(str, ((Number) obj).doubleValue());
            } else if (obj instanceof Float) {
                bundle.putFloat(str, ((Number) obj).floatValue());
            } else if (obj instanceof Integer) {
                bundle.putInt(str, ((Number) obj).intValue());
            } else if (obj instanceof Long) {
                bundle.putLong(str, ((Number) obj).longValue());
            } else if (obj instanceof Short) {
                bundle.putShort(str, ((Number) obj).shortValue());
            } else if (obj instanceof Bundle) {
                bundle.putBundle(str, (Bundle) obj);
            } else if (obj instanceof CharSequence) {
                bundle.putCharSequence(str, (CharSequence) obj);
            } else if (obj instanceof Parcelable) {
                bundle.putParcelable(str, (Parcelable) obj);
            } else if (obj instanceof boolean[]) {
                bundle.putBooleanArray(str, (boolean[]) obj);
            } else if (obj instanceof byte[]) {
                bundle.putByteArray(str, (byte[]) obj);
            } else if (obj instanceof char[]) {
                bundle.putCharArray(str, (char[]) obj);
            } else if (obj instanceof double[]) {
                bundle.putDoubleArray(str, (double[]) obj);
            } else if (obj instanceof float[]) {
                bundle.putFloatArray(str, (float[]) obj);
            } else if (obj instanceof int[]) {
                bundle.putIntArray(str, (int[]) obj);
            } else if (obj instanceof long[]) {
                bundle.putLongArray(str, (long[]) obj);
            } else if (obj instanceof short[]) {
                bundle.putShortArray(str, (short[]) obj);
            } else if (obj instanceof Object[]) {
                Class<?> componentType = obj.getClass().getComponentType();
                Intrinsics.d(componentType);
                if (Parcelable.class.isAssignableFrom(componentType)) {
                    bundle.putParcelableArray(str, (Parcelable[]) obj);
                } else if (String.class.isAssignableFrom(componentType)) {
                    bundle.putStringArray(str, (String[]) obj);
                } else if (CharSequence.class.isAssignableFrom(componentType)) {
                    bundle.putCharSequenceArray(str, (CharSequence[]) obj);
                } else {
                    if (!Serializable.class.isAssignableFrom(componentType)) {
                        throw new IllegalArgumentException("Illegal value array type " + componentType.getCanonicalName() + " for key \"" + str + AbstractJsonLexerKt.STRING);
                    }
                    bundle.putSerializable(str, (Serializable) obj);
                }
            } else if (obj instanceof Serializable) {
                bundle.putSerializable(str, (Serializable) obj);
            } else if (obj instanceof IBinder) {
                bundle.putBinder(str, (IBinder) obj);
            } else if (obj instanceof Size) {
                ps.c.q(bundle, str, (Size) obj);
            } else {
                if (!(obj instanceof SizeF)) {
                    throw new IllegalArgumentException("Illegal value type " + obj.getClass().getCanonicalName() + " for key \"" + str + AbstractJsonLexerKt.STRING);
                }
                ps.c.r(bundle, str, (SizeF) obj);
            }
        }
        return bundle;
    }

    public static y2 f(n0 n0Var) {
        e2[] e2VarArr = (e2[]) ((AbstractCollection) n0Var.entrySet()).toArray(new e2[0]);
        Arrays.sort(e2VarArr, g2.f95920a);
        List listAsList = Arrays.asList(e2VarArr);
        int i5 = b1.f95867d;
        k2 k2Var = new k2(listAsList.size());
        Iterator it = listAsList.iterator();
        while (it.hasNext()) {
            j2 j2Var = (j2) ((e2) it.next());
            Object objB = j2Var.b();
            int iA = j2Var.a();
            if (iA != 0) {
                objB.getClass();
                k2Var.e(k2Var.a(objB) + iA, objB);
            }
        }
        return k2Var.f95954c == 0 ? y2.f96063h : new y2(k2Var);
    }

    public static void g(String str, String str2, Exception exc) {
        String strConcat = "TRuntime.".concat(str);
        if (Log.isLoggable(strConcat, 6)) {
            Log.e(strConcat, str2, exc);
        }
    }

    public static final byte[] h(CharsetEncoder charsetEncoder, CharSequence input, int i5, int i11) throws CharacterCodingException {
        Intrinsics.g(charsetEncoder, "<this>");
        Intrinsics.g(input, "input");
        if (input instanceof String) {
            if (i5 == 0) {
                String str = (String) input;
                if (i11 == str.length()) {
                    byte[] bytes = str.getBytes(charsetEncoder.charset());
                    Intrinsics.f(bytes, "getBytes(...)");
                    return bytes;
                }
            }
            String strSubstring = ((String) input).substring(i5, i11);
            Intrinsics.f(strSubstring, "substring(...)");
            byte[] bytes2 = strSubstring.getBytes(charsetEncoder.charset());
            Intrinsics.f(bytes2, "getBytes(...)");
            return bytes2;
        }
        ByteBuffer byteBufferEncode = charsetEncoder.encode(CharBuffer.wrap(input, i5, i11));
        byte[] bArr = null;
        if (byteBufferEncode.hasArray() && byteBufferEncode.arrayOffset() == 0) {
            byte[] bArrArray = byteBufferEncode.array();
            if (bArrArray.length == byteBufferEncode.remaining()) {
                bArr = bArrArray;
            }
        }
        if (bArr != null) {
            return bArr;
        }
        byte[] bArr2 = new byte[byteBufferEncode.remaining()];
        byteBufferEncode.get(bArr2);
        return bArr2;
    }

    public static boolean i(f2 f2Var, Object obj) {
        if (obj == f2Var) {
            return true;
        }
        if (!(obj instanceof f2)) {
            return false;
        }
        f2 f2Var2 = (f2) obj;
        if (f2Var.size() != f2Var2.size() || f2Var.entrySet().size() != f2Var2.entrySet().size()) {
            return false;
        }
        Iterator it = f2Var2.entrySet().iterator();
        while (it.hasNext()) {
            j2 j2Var = (j2) ((e2) it.next());
            if (f2Var.r0(j2Var.b()) != j2Var.a()) {
                return false;
            }
        }
        return true;
    }

    public static final x7.i j(q qVar) {
        Intrinsics.g(qVar, "<this>");
        return new x7.i(qVar.f95171a, qVar.f95188t);
    }

    public static final String k(Charset charset) {
        Intrinsics.g(charset, "<this>");
        String strName = charset.name();
        Intrinsics.f(strName, "name(...)");
        return strName;
    }

    public static final long n(long j11) {
        return (Math.round(Float.intBitsToFloat((int) (j11 & 4294967295L))) & 4294967295L) | (Math.round(Float.intBitsToFloat((int) (j11 >> 32))) << 32);
    }

    public abstract boolean b(z7.h hVar, z7.c cVar, z7.c cVar2);

    public abstract boolean c(z7.h hVar, Object obj, Object obj2);

    public abstract boolean d(z7.h hVar, z7.g gVar, z7.g gVar2);

    public abstract void e();

    public void extraCallback(String str) {
    }

    public void extraCallbackWithResult(String str) {
    }

    public abstract void l(z7.g gVar, z7.g gVar2);

    public abstract void m(z7.g gVar, Thread thread);

    public void onActivityResized(Bundle bundle) {
    }

    public void onMessageChannelReady() {
    }

    public abstract void onNavigationEvent(int i5);

    public void onPostMessage(String str) {
    }

    public void onRelationshipValidationResult(Uri uri) {
    }
}
