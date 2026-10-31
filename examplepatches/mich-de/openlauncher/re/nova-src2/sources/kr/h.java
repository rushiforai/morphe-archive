package kr;

import b.c0;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public final class h extends gs.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72139a;

    /* renamed from: b, reason: collision with root package name */
    public final String f72140b;

    public h(j jVar, int i5) {
        String str;
        this.f72139a = i5;
        switch (i5) {
            case 1:
                int iOrdinal = jVar.ordinal();
                if (iOrdinal == 0) {
                    str = "cs_add_payment_method_screen_presented";
                } else if (iOrdinal == 1) {
                    str = "cs_select_payment_method_screen_presented";
                } else {
                    if (iOrdinal != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    str = "cs_open_edit_screen";
                }
                this.f72140b = str;
                return;
            default:
                if (g.f72138a[jVar.ordinal()] != 1) {
                    throw new IllegalArgumentException(c0.E(jVar.name(), " has no supported event for hiding screen!"));
                }
                this.f72140b = "cs_cancel_edit_screen";
                return;
        }
    }

    @Override // gs.g
    public final Map a() {
        switch (this.f72139a) {
        }
        return b70.h.f17594a;
    }

    @Override // fr.a
    public final String c() {
        switch (this.f72139a) {
        }
        return this.f72140b;
    }
}
