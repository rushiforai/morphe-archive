package defpackage;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.UninitializedMessageException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class p1 implements bz7 {
    public static <T> void addAll(Iterable<T> iterable, List<? super T> list) {
        Charset charset = v56.a;
        iterable.getClass();
        if (iterable instanceof uw6) {
            List listA = ((uw6) iterable).a();
            uw6 uw6Var = (uw6) list;
            int size = list.size();
            for (Object obj : listA) {
                if (obj == null) {
                    String str = "Element at index " + (uw6Var.size() - size) + " is null.";
                    for (int size2 = uw6Var.size() - 1; size2 >= size; size2--) {
                        uw6Var.remove(size2);
                    }
                    z72.c(str);
                    return;
                }
                if (obj instanceof f21) {
                    uw6Var.j((f21) obj);
                } else {
                    uw6Var.add((String) obj);
                }
            }
            return;
        }
        if (iterable instanceof s0a) {
            list.addAll((Collection) iterable);
            return;
        }
        if ((list instanceof ArrayList) && (iterable instanceof Collection)) {
            ((ArrayList) list).ensureCapacity(((Collection) iterable).size() + list.size());
        }
        int size3 = list.size();
        for (T t : iterable) {
            if (t == null) {
                String str2 = "Element at index " + (list.size() - size3) + " is null.";
                for (int size4 = list.size() - 1; size4 >= size3; size4--) {
                    list.remove(size4);
                }
                z72.c(str2);
                return;
            }
            list.add(t);
        }
    }

    public static UninitializedMessageException newUninitializedMessageException(cz7 cz7Var) {
        return new UninitializedMessageException();
    }

    public final String a() {
        return "Reading " + getClass().getName() + " from a ByteString threw an IOException (should never happen).";
    }

    public abstract p1 internalMergeFrom(r1 r1Var);

    public boolean mergeDelimitedFrom(InputStream inputStream, p74 p74Var) throws IOException {
        int i = inputStream.read();
        if (i == -1) {
            return false;
        }
        mergeFrom((InputStream) new o1(inputStream, sp1.s(inputStream, i), 1), p74Var);
        return true;
    }

    public p1 mergeFrom(cz7 cz7Var) {
        if (getDefaultInstanceForType().getClass().isInstance(cz7Var)) {
            return internalMergeFrom((r1) cz7Var);
        }
        ay0.e("mergeFrom(MessageLite) can only merge messages of the same type.");
        return null;
    }

    public abstract p1 mergeFrom(sp1 sp1Var, p74 p74Var);

    public abstract p1 mergeFrom(byte[] bArr, int i, int i2);

    public abstract p1 mergeFrom(byte[] bArr, int i, int i2, p74 p74Var);

    public boolean mergeDelimitedFrom(InputStream inputStream) {
        return mergeDelimitedFrom(inputStream, p74.a());
    }

    public p1 mergeFrom(sp1 sp1Var) {
        return mergeFrom(sp1Var, p74.a());
    }

    public p1 mergeFrom(f21 f21Var) throws InvalidProtocolBufferException {
        try {
            sp1 sp1VarQ = f21Var.q();
            mergeFrom(sp1VarQ);
            sp1VarQ.a(0);
            return this;
        } catch (InvalidProtocolBufferException e) {
            throw e;
        } catch (IOException e2) {
            lg8.p(a(), e2);
            return null;
        }
    }

    public p1 mergeFrom(f21 f21Var, p74 p74Var) throws InvalidProtocolBufferException {
        try {
            sp1 sp1VarQ = f21Var.q();
            mergeFrom(sp1VarQ, p74Var);
            sp1VarQ.a(0);
            return this;
        } catch (InvalidProtocolBufferException e) {
            throw e;
        } catch (IOException e2) {
            lg8.p(a(), e2);
            return null;
        }
    }

    public p1 mergeFrom(byte[] bArr) {
        return mergeFrom(bArr, 0, bArr.length);
    }

    public p1 mergeFrom(byte[] bArr, p74 p74Var) {
        return mergeFrom(bArr, 0, bArr.length, p74Var);
    }

    public p1 mergeFrom(InputStream inputStream) {
        sp1 sp1VarF = sp1.f(inputStream);
        mergeFrom(sp1VarF);
        sp1VarF.a(0);
        return this;
    }

    public p1 mergeFrom(InputStream inputStream, p74 p74Var) {
        sp1 sp1VarF = sp1.f(inputStream);
        mergeFrom(sp1VarF, p74Var);
        sp1VarF.a(0);
        return this;
    }

    @Deprecated
    public static <T> void addAll(Iterable<T> iterable, Collection<? super T> collection) {
        addAll((Iterable) iterable, (List) collection);
    }
}
