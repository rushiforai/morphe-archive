package defpackage;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.d;
import com.google.protobuf.e;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f75 extends p1 {
    private final e defaultInstance;
    protected e instance;

    public f75(e eVar) {
        this.defaultInstance = eVar;
        if (eVar.isMutable()) {
            ay0.e("Default instance must be immutable.");
            throw null;
        }
        this.instance = eVar.newMutableInstance();
    }

    /* JADX INFO: renamed from: build, reason: merged with bridge method [inline-methods] */
    public final e m106build() {
        e eVarBuildPartial = buildPartial();
        if (eVarBuildPartial.isInitialized()) {
            return eVarBuildPartial;
        }
        throw p1.newUninitializedMessageException(eVarBuildPartial);
    }

    @Override // defpackage.bz7
    public e buildPartial() {
        boolean zIsMutable = this.instance.isMutable();
        e eVar = this.instance;
        if (!zIsMutable) {
            return eVar;
        }
        eVar.makeImmutable();
        return this.instance;
    }

    public final f75 clear() {
        if (this.defaultInstance.isMutable()) {
            ay0.e("Default instance must be immutable.");
            return null;
        }
        this.instance = this.defaultInstance.newMutableInstance();
        return this;
    }

    /* JADX INFO: renamed from: clone, reason: collision with other method in class and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public f75 m110clone() {
        f75 f75VarNewBuilderForType = getDefaultInstanceForType().newBuilderForType();
        f75VarNewBuilderForType.instance = buildPartial();
        return f75VarNewBuilderForType;
    }

    public final void copyOnWrite() {
        if (this.instance.isMutable()) {
            return;
        }
        copyOnWriteInternal();
    }

    public void copyOnWriteInternal() {
        e eVarNewMutableInstance = this.defaultInstance.newMutableInstance();
        e eVar = this.instance;
        t7a t7aVar = t7a.c;
        t7aVar.getClass();
        t7aVar.a(eVarNewMutableInstance.getClass()).a(eVarNewMutableInstance, eVar);
        this.instance = eVarNewMutableInstance;
    }

    public final boolean isInitialized() {
        return e.isInitialized(this.instance, false);
    }

    @Override // defpackage.p1
    public f75 mergeFrom(sp1 sp1Var, p74 p74Var) throws IOException {
        copyOnWrite();
        try {
            t7a t7aVar = t7a.c;
            e eVar = this.instance;
            t7aVar.getClass();
            brb brbVarA = t7aVar.a(eVar.getClass());
            e eVar2 = this.instance;
            d dVar = sp1Var.b;
            if (dVar == null) {
                dVar = new d(sp1Var);
            }
            brbVarA.e(eVar2, dVar, p74Var);
            return this;
        } catch (RuntimeException e) {
            if (e.getCause() instanceof IOException) {
                throw ((IOException) e.getCause());
            }
            throw e;
        }
    }

    @Override // defpackage.ez7
    public e getDefaultInstanceForType() {
        return this.defaultInstance;
    }

    @Override // defpackage.p1
    public f75 internalMergeFrom(e eVar) {
        return mergeFrom(eVar);
    }

    public f75 mergeFrom(e eVar) {
        if (getDefaultInstanceForType().equals(eVar)) {
            return this;
        }
        copyOnWrite();
        e eVar2 = this.instance;
        t7a t7aVar = t7a.c;
        t7aVar.getClass();
        t7aVar.a(eVar2.getClass()).a(eVar2, eVar);
        return this;
    }

    @Override // defpackage.p1
    public f75 mergeFrom(byte[] bArr, int i, int i2, p74 p74Var) throws InvalidProtocolBufferException {
        copyOnWrite();
        try {
            t7a t7aVar = t7a.c;
            e eVar = this.instance;
            t7aVar.getClass();
            t7aVar.a(eVar.getClass()).j(this.instance, bArr, i, i + i2, new l70(p74Var));
            return this;
        } catch (InvalidProtocolBufferException e) {
            throw e;
        } catch (IOException e2) {
            lg8.p("Reading from byte array should not throw IOException.", e2);
            return null;
        } catch (IndexOutOfBoundsException unused) {
            throw InvalidProtocolBufferException.g();
        }
    }

    @Override // defpackage.p1
    public f75 mergeFrom(byte[] bArr, int i, int i2) {
        return mergeFrom(bArr, i, i2, p74.a());
    }
}
