package com.google.protobuf;

import java.io.IOException;

/* loaded from: classes.dex */
public abstract class j0 extends n0 implements p1 {
    protected b0 extensions = b0.f();

    /* JADX WARN: Removed duplicated region for block: B:4:0x0006  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean e(p pVar, y yVar, l0 l0Var, int i5, int i11) {
        boolean z11;
        Object objBuild;
        o1 o1Var;
        int i12 = i5 & 7;
        boolean z12 = false;
        if (l0Var == null) {
            z11 = false;
            z12 = true;
        } else {
            k0 k0Var = l0Var.f34890d;
            if (i12 == b0.m(k0Var.c(), false)) {
                z11 = false;
            } else if (k0Var.f34882d && k0Var.f34881c.c() && i12 == b0.m(k0Var.c(), true)) {
                z11 = true;
            }
        }
        if (z12) {
            return parseUnknownField(i5, pVar);
        }
        ensureExtensionsAreMutable();
        if (z11) {
            int iK = pVar.k(pVar.w());
            k0 k0Var2 = l0Var.f34890d;
            if (k0Var2.c() == t2.f34976f) {
                while (pVar.e() > 0) {
                    r0 r0VarFindValueByNumber = k0Var2.a().findValueByNumber(pVar.o());
                    if (r0VarFindValueByNumber == null) {
                        return true;
                    }
                    this.extensions.a(k0Var2, l0Var.h(r0VarFindValueByNumber));
                }
            } else {
                while (pVar.e() > 0) {
                    this.extensions.a(k0Var2, b0.w(pVar, k0Var2.c()));
                }
            }
            pVar.j(iK);
            return true;
        }
        k0 k0Var3 = l0Var.f34890d;
        int iOrdinal = k0Var3.b().ordinal();
        if (iOrdinal == 7) {
            int iO = pVar.o();
            r0 r0VarFindValueByNumber2 = k0Var3.a().findValueByNumber(iO);
            if (r0VarFindValueByNumber2 == null) {
                mergeVarintField(i11, iO);
                return true;
            }
            objBuild = r0VarFindValueByNumber2;
        } else if (iOrdinal != 8) {
            objBuild = b0.w(pVar, k0Var3.c());
        } else {
            n1 builder = (k0Var3.isRepeated() || (o1Var = (o1) this.extensions.g(k0Var3)) == null) ? null : o1Var.toBuilder();
            if (builder == null) {
                builder = l0Var.d().newBuilderForType();
            }
            if (k0Var3.c() == t2.f34974d) {
                pVar.s(l0Var.e(), builder, yVar);
            } else {
                pVar.v(builder, yVar);
            }
            objBuild = builder.build();
        }
        if (k0Var3.isRepeated()) {
            this.extensions.a(k0Var3, l0Var.h(objBuild));
            return true;
        }
        this.extensions.x(k0Var3, l0Var.h(objBuild));
        return true;
    }

    public b0 ensureExtensionsAreMutable() {
        if (this.extensions.p()) {
            this.extensions = this.extensions.clone();
        }
        return this.extensions;
    }

    public boolean extensionsAreInitialized() {
        return this.extensions.q();
    }

    public int extensionsSerializedSize() {
        return this.extensions.l();
    }

    public int extensionsSerializedSizeAsMessageSet() {
        return this.extensions.h();
    }

    public final void f(l0 l0Var) {
        if (l0Var.b() != getDefaultInstanceForType()) {
            throw new IllegalArgumentException("This extension is for a different message type.  Please make sure that you are not suppressing any generics type warnings.");
        }
    }

    @Override // com.google.protobuf.n0, com.google.protobuf.p1
    public /* bridge */ /* synthetic */ o1 getDefaultInstanceForType() {
        return getDefaultInstanceForType();
    }

    public final <Type> Type getExtension(v vVar) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        f(l0VarAccess$000);
        Object objG = this.extensions.g(l0VarAccess$000.f34890d);
        return objG == null ? (Type) l0VarAccess$000.f34888b : (Type) l0VarAccess$000.a(objG);
    }

    public final <Type> int getExtensionCount(v vVar) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        f(l0VarAccess$000);
        return this.extensions.k(l0VarAccess$000.f34890d);
    }

    public final <Type> boolean hasExtension(v vVar) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        f(l0VarAccess$000);
        return this.extensions.n(l0VarAccess$000.f34890d);
    }

    public final void mergeExtensionFields(j0 j0Var) {
        if (this.extensions.p()) {
            this.extensions = this.extensions.clone();
        }
        this.extensions.u(j0Var.extensions);
    }

    @Override // com.google.protobuf.n0, com.google.protobuf.o1
    public /* bridge */ /* synthetic */ n1 newBuilderForType() {
        return newBuilderForType();
    }

    public i0 newExtensionWriter() {
        return new i0(this);
    }

    public i0 newMessageSetExtensionWriter() {
        return new i0(this);
    }

    public <MessageType extends o1> boolean parseUnknownField(MessageType messagetype, p pVar, y yVar, int i5) throws IOException {
        int i11 = i5 >>> 3;
        return e(pVar, yVar, yVar.a(i11, messagetype), i5, i11);
    }

    public <MessageType extends o1> boolean parseUnknownFieldAsMessageSet(MessageType messagetype, p pVar, y yVar, int i5) throws IOException {
        p pVar2;
        y yVar2;
        j0 j0Var;
        if (i5 != 11) {
            return (i5 & 7) == 2 ? parseUnknownField(messagetype, pVar, yVar, i5) : pVar.H(i5);
        }
        int i11 = 0;
        j jVarM = null;
        l0 l0VarA = null;
        while (true) {
            int iE = pVar.E();
            if (iE == 0) {
                pVar2 = pVar;
                yVar2 = yVar;
                j0Var = this;
                break;
            }
            if (iE != 16) {
                if (iE != 26) {
                    pVar2 = pVar;
                    yVar2 = yVar;
                    j0Var = this;
                    if (!pVar2.H(iE)) {
                        break;
                    }
                } else if (i11 == 0 || l0VarA == null) {
                    pVar2 = pVar;
                    yVar2 = yVar;
                    jVarM = pVar2.m();
                } else {
                    p pVar3 = pVar;
                    e(pVar3, yVar, l0VarA, (i11 << 3) | 2, i11);
                    jVarM = null;
                    pVar = pVar3;
                }
            } else {
                int iF = pVar.F();
                if (iF != 0) {
                    yVar2 = yVar;
                    i11 = iF;
                    l0VarA = yVar.a(iF, messagetype);
                    pVar2 = pVar;
                } else {
                    pVar2 = pVar;
                    yVar2 = yVar;
                    i11 = iF;
                }
            }
            pVar = pVar2;
            yVar = yVar2;
        }
        pVar2.a(12);
        if (jVarM == null || i11 == 0) {
            return true;
        }
        if (l0VarA == null) {
            mergeLengthDelimitedField(i11, jVarM);
            return true;
        }
        k0 k0Var = l0VarA.f34890d;
        o1 o1Var = (o1) j0Var.extensions.g(k0Var);
        n1 builder = o1Var != null ? o1Var.toBuilder() : null;
        if (builder == null) {
            builder = l0VarA.d().newBuilderForType();
        }
        builder.mergeFrom(jVarM, yVar2);
        ensureExtensionsAreMutable().x(k0Var, l0VarA.h(builder.build()));
        return true;
    }

    @Override // com.google.protobuf.n0, com.google.protobuf.o1
    public /* bridge */ /* synthetic */ n1 toBuilder() {
        return toBuilder();
    }

    public final <Type> Type getExtension(v vVar, int i5) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        f(l0VarAccess$000);
        return (Type) l0VarAccess$000.g(this.extensions.j(l0VarAccess$000.f34890d, i5));
    }
}
