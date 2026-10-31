package jv;

import b.c9;
import b.u4;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f70096a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f70097b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f70098c;

    /* renamed from: d, reason: collision with root package name */
    public final zu.m f70099d;

    /* renamed from: e, reason: collision with root package name */
    public final yu.a f70100e;

    /* renamed from: f, reason: collision with root package name */
    public final List f70101f;

    /* renamed from: g, reason: collision with root package name */
    public final at.a f70102g;

    /* renamed from: h, reason: collision with root package name */
    public final List f70103h;

    public l1(String selectedPaymentMethodCode, boolean z11, boolean z12, zu.m mVar, yu.a aVar, List formElements, at.a aVar2) {
        Intrinsics.g(selectedPaymentMethodCode, "selectedPaymentMethodCode");
        Intrinsics.g(formElements, "formElements");
        this.f70096a = selectedPaymentMethodCode;
        this.f70097b = z11;
        this.f70098c = z12;
        this.f70099d = mVar;
        this.f70100e = aVar;
        this.f70101f = formElements;
        this.f70102g = aVar2;
        List list = formElements;
        Iterator it = list.iterator();
        while (it.hasNext()) {
            ((kw.x0) it.next()).a(this.f70098c);
        }
        this.f70103h = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l1)) {
            return false;
        }
        l1 l1Var = (l1) obj;
        return Intrinsics.b(this.f70096a, l1Var.f70096a) && this.f70097b == l1Var.f70097b && this.f70098c == l1Var.f70098c && Intrinsics.b(this.f70099d, l1Var.f70099d) && Intrinsics.b(this.f70100e, l1Var.f70100e) && Intrinsics.b(this.f70101f, l1Var.f70101f) && Intrinsics.b(this.f70102g, l1Var.f70102g);
    }

    public final int hashCode() {
        int iC = u4.c((this.f70100e.hashCode() + ((this.f70099d.hashCode() + c9.f(c9.f(this.f70096a.hashCode() * 31, 31, this.f70097b), 31, this.f70098c)) * 31)) * 31, 31, this.f70101f);
        at.a aVar = this.f70102g;
        return iC + (aVar == null ? 0 : aVar.hashCode());
    }

    public final String toString() {
        return "State(selectedPaymentMethodCode=" + this.f70096a + ", isProcessing=" + this.f70097b + ", isValidating=" + this.f70098c + ", usBankAccountFormArguments=" + this.f70099d + ", formArguments=" + this.f70100e + ", formElements=" + this.f70101f + ", headerInformation=" + this.f70102g + ")";
    }
}
