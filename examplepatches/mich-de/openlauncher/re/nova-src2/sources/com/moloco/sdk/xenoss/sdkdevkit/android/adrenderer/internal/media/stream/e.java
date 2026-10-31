package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream;

import android.bluetooth.BluetoothDevice;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import v70.r;
import v70.w;
import v70.x;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39034a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x f39035b;

    public /* synthetic */ e(x xVar, int i5) {
        this.f39034a = i5;
        this.f39035b = xVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f39034a) {
            case 0:
                return b.a.a(this.f39035b, (File) obj);
            case 1:
                return b.a.a(this.f39035b, (c.a) obj);
            case 2:
                return b.a.a(this.f39035b, (c.b) obj);
            case 3:
                ((w) this.f39035b).j(obj);
                return Unit.f71706a;
            default:
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                for (Map.Entry entry : ((Map) obj).entrySet()) {
                    if (((Boolean) entry.getValue()).booleanValue()) {
                        linkedHashMap.put(entry.getKey(), entry.getValue());
                    }
                }
                Set setKeySet = linkedHashMap.keySet();
                ArrayList arrayList = new ArrayList(b70.c.u0(setKeySet, 10));
                Iterator it = setKeySet.iterator();
                while (it.hasNext()) {
                    arrayList.add(new SimpleBluetoothDevice((BluetoothDevice) it.next()));
                }
                return new r(((w) this.f39035b).f92201d.j(new jx.a(g.N1(arrayList))));
        }
    }
}
