package com.google.protobuf;

import java.io.IOException;

/* loaded from: classes.dex */
public abstract class f0 extends b {
    private final n0 defaultInstance;
    protected n0 instance;

    public f0(n0 n0Var) {
        this.defaultInstance = n0Var;
        if (n0Var.isMutable()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.instance = n0Var.newMutableInstance();
    }

    public final void copyOnWrite() {
        if (this.instance.isMutable()) {
            return;
        }
        copyOnWriteInternal();
    }

    public void copyOnWriteInternal() {
        n0 n0VarNewMutableInstance = this.defaultInstance.newMutableInstance();
        n0 n0Var = this.instance;
        x1 x1Var = x1.f35001c;
        x1Var.getClass();
        x1Var.a(n0VarNewMutableInstance.getClass()).a(n0VarNewMutableInstance, n0Var);
        this.instance = n0VarNewMutableInstance;
    }

    @Override // com.google.protobuf.p1
    public final boolean isInitialized() {
        return n0.isInitialized(this.instance, false);
    }

    @Override // com.google.protobuf.n1
    public final n0 build() {
        n0 n0VarBuildPartial = buildPartial();
        if (n0VarBuildPartial.isInitialized()) {
            return n0VarBuildPartial;
        }
        throw b.newUninitializedMessageException(n0VarBuildPartial);
    }

    @Override // com.google.protobuf.n1
    public n0 buildPartial() {
        if (!this.instance.isMutable()) {
            return this.instance;
        }
        this.instance.makeImmutable();
        return this.instance;
    }

    /* renamed from: clear, reason: merged with bridge method [inline-methods] */
    public final f0 m156clear() {
        if (this.defaultInstance.isMutable()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.instance = this.defaultInstance.newMutableInstance();
        return this;
    }

    @Override // com.google.protobuf.p1
    public n0 getDefaultInstanceForType() {
        return this.defaultInstance;
    }

    @Override // com.google.protobuf.b
    public f0 internalMergeFrom(n0 n0Var) {
        return mergeFrom(n0Var);
    }

    /* renamed from: clone, reason: collision with other method in class and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public f0 m159clone() {
        f0 f0VarNewBuilderForType = getDefaultInstanceForType().newBuilderForType();
        f0VarNewBuilderForType.instance = buildPartial();
        return f0VarNewBuilderForType;
    }

    public f0 mergeFrom(n0 n0Var) {
        if (getDefaultInstanceForType().equals(n0Var)) {
            return this;
        }
        copyOnWrite();
        n0 n0Var2 = this.instance;
        x1 x1Var = x1.f35001c;
        x1Var.getClass();
        x1Var.a(n0Var2.getClass()).a(n0Var2, n0Var);
        return this;
    }

    @Override // com.google.protobuf.b
    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public f0 m161mergeFrom(byte[] bArr, int i5, int i11, y yVar) throws InvalidProtocolBufferException {
        copyOnWrite();
        try {
            x1 x1Var = x1.f35001c;
            n0 n0Var = this.instance;
            x1Var.getClass();
            x1Var.a(n0Var.getClass()).g(this.instance, bArr, i5, i5 + i11, new f(yVar));
            return this;
        } catch (InvalidProtocolBufferException e3) {
            throw e3;
        } catch (IOException e11) {
            throw new RuntimeException("Reading from byte array should not throw IOException.", e11);
        } catch (IndexOutOfBoundsException unused) {
            throw InvalidProtocolBufferException.g();
        }
    }

    @Override // com.google.protobuf.b
    /* renamed from: mergeFrom, reason: merged with bridge method [inline-methods] */
    public f0 m160mergeFrom(byte[] bArr, int i5, int i11) throws InvalidProtocolBufferException {
        return m161mergeFrom(bArr, i5, i11, y.b());
    }

    @Override // com.google.protobuf.n1
    public f0 mergeFrom(p pVar, y yVar) throws IOException {
        copyOnWrite();
        try {
            x1 x1Var = x1.f35001c;
            n0 n0Var = this.instance;
            x1Var.getClass();
            x1Var.a(n0Var.getClass()).f(this.instance, q.a(pVar), yVar);
            return this;
        } catch (RuntimeException e3) {
            if (e3.getCause() instanceof IOException) {
                throw ((IOException) e3.getCause());
            }
            throw e3;
        }
    }
}
