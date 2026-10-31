package com.google.protobuf;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* loaded from: classes.dex */
public abstract class b implements n1 {
    @Deprecated
    public static <T> void addAll(Iterable<T> iterable, Collection<? super T> collection) {
        addAll((Iterable) iterable, (List) collection);
    }

    public static UninitializedMessageException newUninitializedMessageException(o1 o1Var) {
        return new UninitializedMessageException();
    }

    public final String a() {
        return "Reading " + getClass().getName() + " from a ByteString threw an IOException (should never happen).";
    }

    public abstract b internalMergeFrom(c cVar);

    public boolean mergeDelimitedFrom(InputStream inputStream, y yVar) throws IOException {
        int i5 = inputStream.read();
        if (i5 == -1) {
            return false;
        }
        m153mergeFrom((InputStream) new a(inputStream, p.x(i5, inputStream)), yVar);
        return true;
    }

    @Override // com.google.protobuf.n1
    public abstract b mergeFrom(p pVar, y yVar);

    /* renamed from: mergeFrom */
    public abstract b m160mergeFrom(byte[] bArr, int i5, int i11);

    /* renamed from: mergeFrom */
    public abstract b m161mergeFrom(byte[] bArr, int i5, int i11, y yVar);

    public static <T> void addAll(Iterable<T> iterable, List<? super T> list) {
        Charset charset = a1.f34808a;
        iterable.getClass();
        if (!(iterable instanceof c1)) {
            if (iterable instanceof w1) {
                list.addAll((Collection) iterable);
                return;
            }
            if ((list instanceof ArrayList) && (iterable instanceof Collection)) {
                ((ArrayList) list).ensureCapacity(((Collection) iterable).size() + list.size());
            }
            int size = list.size();
            for (T t6 : iterable) {
                if (t6 == null) {
                    String str = "Element at index " + (list.size() - size) + " is null.";
                    for (int size2 = list.size() - 1; size2 >= size; size2--) {
                        list.remove(size2);
                    }
                    throw new NullPointerException(str);
                }
                list.add(t6);
            }
            return;
        }
        List underlyingElements = ((c1) iterable).getUnderlyingElements();
        c1 c1Var = (c1) list;
        int size3 = list.size();
        for (Object obj : underlyingElements) {
            if (obj == null) {
                String str2 = "Element at index " + (c1Var.size() - size3) + " is null.";
                for (int size4 = c1Var.size() - 1; size4 >= size3; size4--) {
                    c1Var.remove(size4);
                }
                throw new NullPointerException(str2);
            }
            if (obj instanceof l) {
                c1Var.f0();
            } else if (obj instanceof byte[]) {
                byte[] bArr = (byte[]) obj;
                l.e(0, bArr.length, bArr);
                c1Var.f0();
            } else {
                c1Var.add((String) obj);
            }
        }
    }

    public boolean mergeDelimitedFrom(InputStream inputStream) throws IOException {
        return mergeDelimitedFrom(inputStream, y.b());
    }

    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public b m151mergeFrom(p pVar) throws IOException {
        return mergeFrom(pVar, y.b());
    }

    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public b m150mergeFrom(l lVar) throws InvalidProtocolBufferException {
        try {
            p pVarJ = lVar.j();
            m151mergeFrom(pVarJ);
            pVarJ.a(0);
            return this;
        } catch (InvalidProtocolBufferException e3) {
            throw e3;
        } catch (IOException e11) {
            throw new RuntimeException(a(), e11);
        }
    }

    @Override // com.google.protobuf.n1
    public b mergeFrom(l lVar, y yVar) throws InvalidProtocolBufferException {
        try {
            p pVarJ = lVar.j();
            mergeFrom(pVarJ, yVar);
            pVarJ.a(0);
            return this;
        } catch (InvalidProtocolBufferException e3) {
            throw e3;
        } catch (IOException e11) {
            throw new RuntimeException(a(), e11);
        }
    }

    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public b m154mergeFrom(byte[] bArr) throws InvalidProtocolBufferException {
        return m160mergeFrom(bArr, 0, bArr.length);
    }

    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public b m155mergeFrom(byte[] bArr, y yVar) throws InvalidProtocolBufferException {
        return m161mergeFrom(bArr, 0, bArr.length, yVar);
    }

    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public b m152mergeFrom(InputStream inputStream) throws IOException {
        p pVarI = p.i(inputStream);
        m151mergeFrom(pVarI);
        pVarI.a(0);
        return this;
    }

    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public b m153mergeFrom(InputStream inputStream, y yVar) throws IOException {
        p pVarI = p.i(inputStream);
        mergeFrom(pVarI, yVar);
        pVarI.a(0);
        return this;
    }

    @Override // com.google.protobuf.n1
    public b mergeFrom(o1 o1Var) {
        if (getDefaultInstanceForType().getClass().isInstance(o1Var)) {
            return internalMergeFrom((c) o1Var);
        }
        throw new IllegalArgumentException("mergeFrom(MessageLite) can only merge messages of the same type.");
    }
}
