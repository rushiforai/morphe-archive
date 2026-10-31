package com.bykv.vk.openvk.preload.geckox.c;

import android.util.Pair;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;

/* loaded from: classes2.dex */
public class i extends com.bykv.vk.openvk.preload.a.d<Pair<String, Long>, Pair<String, Long>> {
    @Override // com.bykv.vk.openvk.preload.a.d
    public final /* synthetic */ Object a(com.bykv.vk.openvk.preload.a.b<Pair<String, Long>> bVar, Pair<String, Long> pair) throws Throwable {
        Pair<String, Long> pair2 = pair;
        GeckoLogger.d("gecko-debug-tag", "update success:", pair2);
        return bVar.a((com.bykv.vk.openvk.preload.a.b<Pair<String, Long>>) pair2);
    }
}
