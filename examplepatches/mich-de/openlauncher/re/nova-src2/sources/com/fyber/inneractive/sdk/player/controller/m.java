package com.fyber.inneractive.sdk.player.controller;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.player.enums.b f28919a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q f28920b;

    public m(q qVar, com.fyber.inneractive.sdk.player.enums.b bVar) {
        this.f28920b = qVar;
        this.f28919a = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        q qVar;
        com.fyber.inneractive.sdk.player.enums.b bVar;
        try {
            try {
                Iterator it = this.f28920b.f28923b.iterator();
                while (it.hasNext()) {
                    ((p) it.next()).a(this.f28919a);
                }
                bVar = this.f28919a;
            } catch (Exception e3) {
                if (IAlog.f31163a <= 3) {
                    q qVar2 = this.f28920b;
                    qVar2.getClass();
                    IAlog.a("%sonPlayerStateChanged callback threw an exception!", e3, IAlog.a(qVar2));
                }
                com.fyber.inneractive.sdk.player.enums.b bVar2 = this.f28919a;
                if (bVar2 != com.fyber.inneractive.sdk.player.enums.b.Idle && bVar2 != com.fyber.inneractive.sdk.player.enums.b.Error) {
                    return;
                }
                com.fyber.inneractive.sdk.util.v.a(this.f28920b.f28931j);
                qVar = this.f28920b;
                qVar.f28931j = null;
            }
            if (bVar == com.fyber.inneractive.sdk.player.enums.b.Idle || bVar == com.fyber.inneractive.sdk.player.enums.b.Error) {
                com.fyber.inneractive.sdk.util.v.a(this.f28920b.f28931j);
                qVar = this.f28920b;
                qVar.f28931j = null;
                qVar.f28932k = null;
            }
        } catch (Throwable th2) {
            com.fyber.inneractive.sdk.player.enums.b bVar3 = this.f28919a;
            if (bVar3 == com.fyber.inneractive.sdk.player.enums.b.Idle || bVar3 == com.fyber.inneractive.sdk.player.enums.b.Error) {
                com.fyber.inneractive.sdk.util.v.a(this.f28920b.f28931j);
                q qVar3 = this.f28920b;
                qVar3.f28931j = null;
                qVar3.f28932k = null;
            }
            throw th2;
        }
    }
}
