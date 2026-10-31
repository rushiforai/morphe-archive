package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import androidx.activity.result.ActivityResult;
import com.teslacoilsw.launcher.search.hero.AppWidgetContent;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kw.z2;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class a0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39724a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f39725b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f39726c;

    public /* synthetic */ a0(Function1 function1, e1 e1Var, int i5) {
        this.f39724a = i5;
        this.f39725b = function1;
        this.f39726c = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        ArrayList arrayList;
        Object next;
        switch (this.f39724a) {
            case 0:
                break;
            case 1:
                this.f39726c.setValue((fz.i) obj);
                this.f39725b.invoke(Boolean.TRUE);
                break;
            case 2:
                this.f39726c.setValue((fz.i) obj);
                this.f39725b.invoke(Boolean.TRUE);
                break;
            case 3:
                this.f39726c.setValue((fz.i) obj);
                this.f39725b.invoke(Boolean.TRUE);
                break;
            case 4:
                this.f39726c.setValue((fz.i) obj);
                this.f39725b.invoke(Boolean.TRUE);
                break;
            case 5:
                r3.z zVar = (r3.z) obj;
                this.f39726c.setValue(zVar);
                this.f39725b.invoke(zVar.f85471a.f75880b);
                break;
            case 6:
                hv.p item = (hv.p) obj;
                Intrinsics.g(item, "item");
                this.f39726c.setValue(Boolean.FALSE);
                this.f39725b.invoke(item);
                break;
            case 7:
                z2 item2 = (z2) obj;
                Intrinsics.g(item2, "item");
                this.f39725b.invoke(item2);
                this.f39726c.setValue(Boolean.FALSE);
                break;
            case 8:
                e1 e1Var = this.f39726c;
                AppWidgetContent appWidgetContent = (AppWidgetContent) e1Var.getValue();
                e1Var.setValue(null);
                if (((ActivityResult) obj).f13597a == -1 && appWidgetContent != null) {
                    this.f39725b.invoke(ul.b.P(appWidgetContent));
                }
                break;
            case 9:
                m3.l0 it = (m3.l0) obj;
                Intrinsics.g(it, "it");
                this.f39726c.setValue(it);
                this.f39725b.invoke(it);
                break;
            case 10:
                long jA = ((h2.b) obj).f59016a;
                e1 e1Var2 = this.f39726c;
                m3.l0 l0Var = (m3.l0) e1Var2.getValue();
                if (l0Var != null && (arrayList = l0Var.f75932f) != null) {
                    Iterator it2 = b70.g.U0(arrayList).iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            next = it2.next();
                            h2.c cVar = (h2.c) next;
                            int i5 = (int) (jA >> 32);
                            if (Float.intBitsToFloat(i5) <= Float.intBitsToFloat((int) (cVar.d() >> 32)) || Float.intBitsToFloat(i5) >= Float.intBitsToFloat((int) (cVar.e() >> 32))) {
                            }
                        } else {
                            next = null;
                        }
                    }
                    h2.c cVar2 = (h2.c) next;
                    if (cVar2 != null) {
                        jA = h2.b.a(cVar2.e(), Float.intBitsToFloat((int) (cVar2.e() >> 32)) + 0.1f, 0.0f, 2);
                    }
                }
                if (((m3.l0) e1Var2.getValue()) != null) {
                    this.f39725b.invoke(Integer.valueOf(r11.f75928b.g(jA) - 1));
                }
                break;
            default:
                this.f39725b.invoke((fz.d) obj);
                this.f39726c.setValue(Boolean.FALSE);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ a0(e1 e1Var, Function1 function1, int i5) {
        this.f39724a = i5;
        this.f39726c = e1Var;
        this.f39725b = function1;
    }
}
