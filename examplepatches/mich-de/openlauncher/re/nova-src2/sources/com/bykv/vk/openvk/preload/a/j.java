package com.bykv.vk.openvk.preload.a;

import com.bykv.vk.openvk.preload.a.i;
import com.bykv.vk.openvk.preload.a.l;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class j<IN, OUT> extends l<IN, OUT> {

    /* renamed from: d, reason: collision with root package name */
    private String f21963d;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bykv.vk.openvk.preload.a.d
    public final Object a(b<OUT> bVar, IN in2) throws Throwable {
        new m(bVar);
        this.f21963d = a((j<IN, OUT>) in2);
        l.a aVar = a().get(this.f21963d);
        while (aVar != null) {
            List<h> list = aVar.f21966a;
            try {
                Object objA = c.a(list, bVar.f21959a, this).a((b) in2);
                return !l.a(list) ? objA : bVar.a((b<OUT>) objA);
            } catch (i.a e3) {
                Throwable cause = e3.getCause();
                new m(bVar);
                this.f21963d = a(in2, cause, this.f21963d);
                aVar = a().get(this.f21963d);
            } catch (Throwable th2) {
                new m(bVar);
                this.f21963d = a(in2, th2, this.f21963d);
                aVar = a().get(this.f21963d);
            }
        }
        throw new IllegalArgumentException("can not found branch，branch name is：" + this.f21963d);
    }

    public abstract String a(IN in2);

    public abstract String a(IN in2, Throwable th2, String str);
}
