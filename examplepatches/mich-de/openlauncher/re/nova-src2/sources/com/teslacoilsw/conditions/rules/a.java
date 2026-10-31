package com.teslacoilsw.conditions.rules;

import ab.e0;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* loaded from: classes4.dex */
public final class a extends kx.c {

    /* renamed from: a, reason: collision with root package name */
    public final ConditionModel.BluetoothConnectedModel f45553a;

    public a(ConditionModel.BluetoothConnectedModel bluetoothConnectedModel) {
        this.f45553a = bluetoothConnectedModel;
    }

    @Override // kx.c
    public final jx.o a(jx.f fVar) {
        List list = this.f45553a.f45541b;
        boolean z11 = false;
        if (!(list instanceof Collection) || !list.isEmpty()) {
            Iterator it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                if (fVar.f70410e.f70395a.contains((SimpleBluetoothDevice) it.next())) {
                    z11 = true;
                    break;
                }
            }
        }
        return new jx.o(z11);
    }

    @Override // kx.c
    public final ConditionModel b() {
        return this.f45553a;
    }

    @Override // kx.c
    public final Set c() {
        return e0.U(kx.b.f72749d);
    }

    public final ConditionModel.BluetoothConnectedModel d() {
        return this.f45553a;
    }
}
