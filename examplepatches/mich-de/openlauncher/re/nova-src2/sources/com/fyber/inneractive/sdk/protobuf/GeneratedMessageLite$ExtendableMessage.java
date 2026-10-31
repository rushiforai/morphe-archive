package com.fyber.inneractive.sdk.protobuf;

import com.fyber.inneractive.sdk.protobuf.GeneratedMessageLite$ExtendableMessage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class GeneratedMessageLite$ExtendableMessage<MessageType extends GeneratedMessageLite$ExtendableMessage<MessageType, BuilderType>, BuilderType> extends z0 implements e2 {
    protected n0 extensions = n0.f30855d;

    private void eagerlyMergeMessageSetExtension(w wVar, x0 x0Var, h0 h0Var, int i5) throws IOException {
        parseExtension(wVar, h0Var, x0Var, (i5 << 3) | 2, i5);
    }

    private void mergeMessageSetExtensionFromBytes(s sVar, h0 h0Var, x0 x0Var) throws IOException {
        d2 d2Var = (d2) this.extensions.f30856a.get(x0Var.f30949d);
        c2 builder = d2Var != null ? d2Var.toBuilder() : null;
        if (builder == null) {
            builder = x0Var.f30948c.newBuilderForType();
        }
        t0 t0Var = (t0) builder;
        t0Var.getClass();
        try {
            w wVarD = sVar.d();
            t0Var.a(wVarD, h0Var);
            wVarD.a(0);
            Object objA = t0Var.a();
            n0 n0VarEnsureExtensionsAreMutable = ensureExtensionsAreMutable();
            w0 w0Var = x0Var.f30949d;
            if (w0Var.f30934c.a() == k4.ENUM) {
                objA = Integer.valueOf(((d1) objA).a());
            }
            n0VarEnsureExtensionsAreMutable.c(w0Var, objA);
        } catch (n1 e3) {
            throw e3;
        } catch (IOException e11) {
            throw new RuntimeException("Reading " + t0Var.getClass().getName() + " from a ByteString threw an IOException (should never happen).", e11);
        }
    }

    private <MessageType extends d2> void mergeMessageSetExtensionFromCodedStream(MessageType messagetype, w wVar, h0 h0Var) throws IOException {
        int iU = 0;
        q qVarE = null;
        x0 x0VarA = null;
        while (true) {
            int iT = wVar.t();
            if (iT == 0) {
                break;
            }
            if (iT == 16) {
                iU = wVar.u();
                if (iU != 0) {
                    x0VarA = h0Var.a(iU, messagetype);
                }
            } else if (iT == 26) {
                if (iU == 0 || x0VarA == null) {
                    qVarE = wVar.e();
                } else {
                    eagerlyMergeMessageSetExtension(wVar, x0VarA, h0Var, iU);
                    qVarE = null;
                }
            } else if (!wVar.e(iT)) {
                break;
            }
        }
        wVar.a(12);
        if (qVarE == null || iU == 0) {
            return;
        }
        if (x0VarA != null) {
            mergeMessageSetExtensionFromBytes(qVarE, h0Var, x0VarA);
        } else {
            mergeLengthDelimitedField(iU, qVarE);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:15:0x002c  */
    /* JADX WARN: Type inference failed for: r10v27, types: [com.fyber.inneractive.sdk.protobuf.d1] */
    /* JADX WARN: Type inference failed for: r10v30, types: [java.lang.Integer] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean parseExtension(w wVar, h0 h0Var, x0 x0Var, int i5, int i11) throws IOException {
        boolean z11;
        Object objA;
        d2 d2Var;
        int i12 = i5 & 7;
        boolean z12 = false;
        if (x0Var == null) {
            z11 = false;
            z12 = true;
        } else {
            j4 j4Var = x0Var.f30949d.f30934c;
            n0 n0Var = n0.f30855d;
            if (i12 == j4Var.b()) {
                z11 = false;
            } else {
                w0 w0Var = x0Var.f30949d;
                if (w0Var.f30935d && w0Var.f30934c.c()) {
                    j4 j4Var2 = x0Var.f30949d.f30934c;
                    if (i12 == 2) {
                        z11 = true;
                    }
                }
            }
        }
        if (z12) {
            return parseUnknownField(i5, wVar);
        }
        ensureExtensionsAreMutable();
        if (z11) {
            int iD = wVar.d(wVar.m());
            if (x0Var.f30949d.f30934c == j4.ENUM) {
                while (wVar.a() > 0) {
                    Object objA2 = x0Var.f30949d.f30932a.a(wVar.g());
                    if (objA2 == 0) {
                        return true;
                    }
                    n0 n0Var2 = this.extensions;
                    w0 w0Var2 = x0Var.f30949d;
                    if (w0Var2.f30934c.a() == k4.ENUM) {
                        objA2 = Integer.valueOf(objA2.a());
                    }
                    n0Var2.a(w0Var2, objA2);
                }
            } else {
                while (wVar.a() > 0) {
                    j4 j4Var3 = x0Var.f30949d.f30934c;
                    n0 n0Var3 = n0.f30855d;
                    this.extensions.a(x0Var.f30949d, p4.a(wVar, j4Var3, o4.LOOSE));
                }
            }
            wVar.c(iD);
        } else {
            int i13 = s0.f30892a[x0Var.f30949d.f30934c.a().ordinal()];
            if (i13 == 1) {
                w0 w0Var3 = x0Var.f30949d;
                c2 builder = (w0Var3.f30935d || (d2Var = (d2) this.extensions.f30856a.get(w0Var3)) == null) ? null : d2Var.toBuilder();
                if (builder == null) {
                    builder = x0Var.f30948c.newBuilderForType();
                }
                w0 w0Var4 = x0Var.f30949d;
                if (w0Var4.f30934c == j4.GROUP) {
                    wVar.a(w0Var4.f30933b, builder, h0Var);
                } else {
                    wVar.a(builder, h0Var);
                }
                objA = ((t0) builder).a();
            } else if (i13 != 2) {
                j4 j4Var4 = x0Var.f30949d.f30934c;
                n0 n0Var4 = n0.f30855d;
                objA = p4.a(wVar, j4Var4, o4.LOOSE);
            } else {
                int iG = wVar.g();
                d1 d1VarA = x0Var.f30949d.f30932a.a(iG);
                if (d1VarA == null) {
                    mergeVarintField(i11, iG);
                    return true;
                }
                objA = d1VarA;
            }
            w0 w0Var5 = x0Var.f30949d;
            if (w0Var5.f30935d) {
                n0 n0Var5 = this.extensions;
                if (w0Var5.f30934c.a() == k4.ENUM) {
                    objA = Integer.valueOf(((d1) objA).a());
                }
                n0Var5.a(w0Var5, objA);
            } else {
                n0 n0Var6 = this.extensions;
                if (w0Var5.f30934c.a() == k4.ENUM) {
                    objA = Integer.valueOf(((d1) objA).a());
                }
                n0Var6.c(w0Var5, objA);
            }
        }
        return true;
    }

    private void verifyExtensionContainingType(x0 x0Var) {
        if (x0Var.f30946a != getDefaultInstanceForType()) {
            throw new IllegalArgumentException("This extension is for a different message type.  Please make sure that you are not suppressing any generics type warnings.");
        }
    }

    public n0 ensureExtensionsAreMutable() {
        n0 n0Var = this.extensions;
        if (n0Var.f30857b) {
            this.extensions = n0Var.m149clone();
        }
        return this.extensions;
    }

    public boolean extensionsAreInitialized() {
        return this.extensions.c();
    }

    public int extensionsSerializedSize() {
        return this.extensions.b();
    }

    public int extensionsSerializedSizeAsMessageSet() {
        return this.extensions.a();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0, com.fyber.inneractive.sdk.protobuf.e2
    public /* bridge */ /* synthetic */ d2 getDefaultInstanceForType() {
        return getDefaultInstanceForType();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v6, types: [Type, java.util.ArrayList] */
    public final <Type> Type getExtension(e0 e0Var) {
        x0 x0VarAccess$000 = z0.access$000(e0Var);
        verifyExtensionContainingType(x0VarAccess$000);
        n0 n0Var = this.extensions;
        Type type = (Type) n0Var.f30856a.get(x0VarAccess$000.f30949d);
        if (type == 0) {
            return (Type) x0VarAccess$000.f30947b;
        }
        w0 w0Var = x0VarAccess$000.f30949d;
        if (w0Var.f30935d) {
            if (w0Var.f30934c.a() == k4.ENUM) {
                ?? r12 = (Type) new ArrayList();
                for (Object objA : (List) type) {
                    if (x0VarAccess$000.f30949d.f30934c.a() == k4.ENUM) {
                        objA = x0VarAccess$000.f30949d.f30932a.a(((Integer) objA).intValue());
                    }
                    r12.add(objA);
                }
                return r12;
            }
        } else if (w0Var.f30934c.a() == k4.ENUM) {
            return (Type) x0VarAccess$000.f30949d.f30932a.a(((Integer) type).intValue());
        }
        return type;
    }

    public final <Type> int getExtensionCount(e0 e0Var) {
        x0 x0VarAccess$000 = z0.access$000(e0Var);
        verifyExtensionContainingType(x0VarAccess$000);
        n0 n0Var = this.extensions;
        w0 w0Var = x0VarAccess$000.f30949d;
        n0Var.getClass();
        if (!w0Var.f30935d) {
            throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
        }
        Object obj = n0Var.f30856a.get(w0Var);
        if (obj == null) {
            return 0;
        }
        return ((List) obj).size();
    }

    public final <Type> boolean hasExtension(e0 e0Var) {
        x0 x0VarAccess$000 = z0.access$000(e0Var);
        verifyExtensionContainingType(x0VarAccess$000);
        n0 n0Var = this.extensions;
        w0 w0Var = x0VarAccess$000.f30949d;
        n0Var.getClass();
        if (w0Var.f30935d) {
            throw new IllegalArgumentException("hasField() can only be called on non-repeated fields.");
        }
        return n0Var.f30856a.get(w0Var) != null;
    }

    public final void mergeExtensionFields(MessageType messagetype) {
        n0 n0Var = this.extensions;
        if (n0Var.f30857b) {
            this.extensions = n0Var.m149clone();
        }
        this.extensions.a(messagetype.extensions);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0, com.fyber.inneractive.sdk.protobuf.d2
    public /* bridge */ /* synthetic */ c2 newBuilderForType() {
        return newBuilderForType();
    }

    public v0 newExtensionWriter() {
        return new v0(this);
    }

    public v0 newMessageSetExtensionWriter() {
        return new v0(this);
    }

    public <MessageType extends d2> boolean parseUnknownField(MessageType messagetype, w wVar, h0 h0Var, int i5) throws IOException {
        int i11 = i5 >>> 3;
        return parseExtension(wVar, h0Var, h0Var.a(i11, messagetype), i5, i11);
    }

    public <MessageType extends d2> boolean parseUnknownFieldAsMessageSet(MessageType messagetype, w wVar, h0 h0Var, int i5) throws IOException {
        if (i5 != 11) {
            return (i5 & 7) == 2 ? parseUnknownField(messagetype, wVar, h0Var, i5) : wVar.e(i5);
        }
        mergeMessageSetExtensionFromCodedStream(messagetype, wVar, h0Var);
        return true;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0, com.fyber.inneractive.sdk.protobuf.d2
    public /* bridge */ /* synthetic */ c2 toBuilder() {
        return toBuilder();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final <Type> Type getExtension(e0 e0Var, int i5) {
        x0 x0VarAccess$000 = z0.access$000(e0Var);
        verifyExtensionContainingType(x0VarAccess$000);
        n0 n0Var = this.extensions;
        w0 w0Var = x0VarAccess$000.f30949d;
        n0Var.getClass();
        if (w0Var.f30935d) {
            Object obj = n0Var.f30856a.get(w0Var);
            if (obj != null) {
                Type type = (Type) ((List) obj).get(i5);
                return x0VarAccess$000.f30949d.f30934c.a() == k4.ENUM ? (Type) x0VarAccess$000.f30949d.f30932a.a(((Integer) type).intValue()) : type;
            }
            throw new IndexOutOfBoundsException();
        }
        throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
    }
}
