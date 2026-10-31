package com.fyber.inneractive.sdk.model.vast;

import b.c0;
import com.fyber.inneractive.sdk.util.x1;
import java.util.ArrayList;
import java.util.Iterator;
import org.w3c.dom.Node;

/* loaded from: classes3.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public String f28638a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f28639b;

    public static u a(Node node) {
        f fVar;
        u uVar = new u();
        uVar.f28638a = x1.b(node, "version");
        ArrayList arrayListC = x1.c(node, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40332f);
        if (!arrayListC.isEmpty()) {
            uVar.f28639b = new ArrayList();
            Iterator it = arrayListC.iterator();
            while (it.hasNext()) {
                Node node2 = (Node) it.next();
                if (node2 == null) {
                    fVar = null;
                } else {
                    f fVar2 = new f();
                    fVar2.f28595a = x1.b(node2, "id");
                    Node nodeD = x1.d(node2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40334h);
                    if (nodeD != null) {
                        fVar2.f28596b = a0.c(nodeD);
                    }
                    Node nodeD2 = x1.d(node2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40333g);
                    if (nodeD2 != null) {
                        fVar2.f28597c = p.c(nodeD2);
                    }
                    fVar = fVar2;
                }
                uVar.f28639b.add(fVar);
            }
        }
        return uVar;
    }

    public final String toString() {
        return new StringBuilder(c0.q(new StringBuilder("Vast: version - "), this.f28638a, "\nAds: ")).toString();
    }
}
