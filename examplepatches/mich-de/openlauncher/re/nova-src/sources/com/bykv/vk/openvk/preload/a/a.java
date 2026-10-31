package com.bykv.vk.openvk.preload.a;

import com.bykv.vk.openvk.preload.a.l;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class a<IN, OUT> extends l<IN, OUT> {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bykv.vk.openvk.preload.a.d
    public final Object a(b<OUT> bVar, IN in2) throws Exception {
        new m(bVar);
        String strA = a((a<IN, OUT>) in2);
        l.a aVar = a().get(strA);
        if (aVar == null) {
            throw new IllegalArgumentException("can not found branch, branch name is：".concat(String.valueOf(strA)));
        }
        List<h> list = aVar.f21966a;
        Object objA = c.a(list, ((i) bVar).f21959a, this).a((b) in2);
        return !l.a(list) ? objA : bVar.a((b<OUT>) objA);
    }

    public abstract String a(IN in2);
}
