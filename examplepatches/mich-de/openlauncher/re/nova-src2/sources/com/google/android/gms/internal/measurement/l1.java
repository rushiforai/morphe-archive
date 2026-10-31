package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class l1 implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public final o1 f32761a;

    /* renamed from: b, reason: collision with root package name */
    public o1 f32762b;

    public l1(o1 o1Var) {
        this.f32761a = o1Var;
        if (o1Var.g()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.f32762b = o1Var.i();
    }

    public static void a(int i5, List list) {
        int size = list.size() - i5;
        StringBuilder sb2 = new StringBuilder(String.valueOf(size).length() + 26);
        sb2.append("Element at index ");
        sb2.append(size);
        sb2.append(" is null.");
        String string = sb2.toString();
        int size2 = list.size();
        while (true) {
            size2--;
            if (size2 < i5) {
                throw new NullPointerException(string);
            }
            list.remove(size2);
        }
    }

    public final void c() {
        if (this.f32762b.g()) {
            return;
        }
        o1 o1VarI = this.f32761a.i();
        q2.f32981c.a(o1VarI.getClass()).f(o1VarI, this.f32762b);
        this.f32762b = o1VarI;
    }

    /* renamed from: d, reason: merged with bridge method [inline-methods] */
    public final l1 clone() {
        l1 l1Var = (l1) this.f32761a.w(5);
        l1Var.f32762b = e();
        return l1Var;
    }

    public final o1 e() {
        if (!this.f32762b.g()) {
            return this.f32762b;
        }
        this.f32762b.j();
        return this.f32762b;
    }

    public final o1 f() {
        o1 o1VarE = e();
        o1VarE.getClass();
        if (o1.u(o1VarE, true)) {
            return o1VarE;
        }
        throw new zzafy();
    }

    public final void g(o1 o1Var) {
        o1 o1Var2 = this.f32761a;
        if (o1Var2.equals(o1Var)) {
            return;
        }
        if (!this.f32762b.g()) {
            o1 o1VarI = o1Var2.i();
            q2.f32981c.a(o1VarI.getClass()).f(o1VarI, this.f32762b);
            this.f32762b = o1VarI;
        }
        o1 o1Var3 = this.f32762b;
        q2.f32981c.a(o1Var3.getClass()).f(o1Var3, o1Var);
    }

    public final void h(byte[] bArr, int i5, e1 e1Var) throws zzaeh {
        if (!this.f32762b.g()) {
            o1 o1VarI = this.f32761a.i();
            q2.f32981c.a(o1VarI.getClass()).f(o1VarI, this.f32762b);
            this.f32762b = o1VarI;
        }
        try {
            q2.f32981c.a(this.f32762b.getClass()).c(this.f32762b, bArr, 0, i5, new q0(e1Var));
        } catch (zzaeh e3) {
            throw e3;
        } catch (IOException e11) {
            throw new RuntimeException("Reading from byte array should not throw IOException.", e11);
        } catch (IndexOutOfBoundsException unused) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }
}
