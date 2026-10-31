package com.google.protobuf;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class h0 extends f0 implements p1 {
    public final <Type> h0 addExtension(v vVar, Type type) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        d(l0VarAccess$000);
        copyOnWrite();
        c().a(l0VarAccess$000.f34890d, l0VarAccess$000.h(type));
        return this;
    }

    public final b0 c() {
        b0 b0Var = ((j0) this.instance).extensions;
        if (!b0Var.f34812b) {
            return b0Var;
        }
        b0 b0VarClone = b0Var.clone();
        ((j0) this.instance).extensions = b0VarClone;
        return b0VarClone;
    }

    public final h0 clearExtension(v vVar) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        d(l0VarAccess$000);
        copyOnWrite();
        b0 b0VarC = c();
        k0 k0Var = l0VarAccess$000.f34890d;
        d2 d2Var = b0VarC.f34811a;
        d2Var.remove(k0Var);
        d2Var.isEmpty();
        return this;
    }

    @Override // com.google.protobuf.f0
    public void copyOnWriteInternal() {
        super.copyOnWriteInternal();
        n0 n0Var = this.instance;
        if (((j0) n0Var).extensions != b0.f34810c) {
            ((j0) n0Var).extensions = ((j0) n0Var).extensions.clone();
        }
    }

    public final void d(l0 l0Var) {
        if (l0Var.f34887a != getDefaultInstanceForType()) {
            throw new IllegalArgumentException("This extension is for a different message type.  Please make sure that you are not suppressing any generics type warnings.");
        }
    }

    public final <Type> Type getExtension(v vVar) {
        return (Type) ((j0) this.instance).getExtension(vVar);
    }

    public final <Type> int getExtensionCount(v vVar) {
        return ((j0) this.instance).getExtensionCount(vVar);
    }

    public final <Type> boolean hasExtension(v vVar) {
        return ((j0) this.instance).hasExtension(vVar);
    }

    public void internalSetExtensionSet(b0 b0Var) {
        copyOnWrite();
        ((j0) this.instance).extensions = b0Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final <Type> h0 setExtension(v vVar, Type type) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        d(l0VarAccess$000);
        copyOnWrite();
        b0 b0VarC = c();
        k0 k0Var = l0VarAccess$000.f34890d;
        if (!k0Var.f34882d) {
            type = (Type) l0VarAccess$000.h(type);
        } else if (k0Var.f34881c.f34978a == u2.ENUM) {
            ArrayList arrayList = new ArrayList();
            Iterator it = ((List) type).iterator();
            while (it.hasNext()) {
                arrayList.add(l0VarAccess$000.h(it.next()));
            }
            type = arrayList;
        }
        b0VarC.x(k0Var, type);
        return this;
    }

    public final <Type> Type getExtension(v vVar, int i5) {
        return (Type) ((j0) this.instance).getExtension(vVar, i5);
    }

    @Override // com.google.protobuf.f0, com.google.protobuf.n1
    public final j0 buildPartial() {
        if (!((j0) this.instance).isMutable()) {
            return (j0) this.instance;
        }
        ((j0) this.instance).extensions.t();
        return (j0) super.buildPartial();
    }

    public final <Type> h0 setExtension(v vVar, int i5, Type type) {
        l0 l0VarAccess$000 = n0.access$000(vVar);
        d(l0VarAccess$000);
        copyOnWrite();
        b0 b0VarC = c();
        k0 k0Var = l0VarAccess$000.f34890d;
        Object objH = l0VarAccess$000.h(type);
        if (k0Var.f34882d) {
            Object obj = b0VarC.f34811a.get(k0Var);
            if (obj != null) {
                b0.y(k0Var, objH);
                ((List) obj).set(i5, objH);
                return this;
            }
            throw new IndexOutOfBoundsException();
        }
        throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
    }
}
