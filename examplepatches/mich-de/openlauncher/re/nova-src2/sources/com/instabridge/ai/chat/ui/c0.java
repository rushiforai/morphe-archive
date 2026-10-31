package com.instabridge.ai.chat.ui;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.graphics.Bitmap;
import android.view.View;
import android.widget.TextView;
import com.android.launcher3.Workspace;
import com.android.launcher3.folder.FolderIcon;
import com.google.android.gms.internal.measurement.v6;
import com.instabridge.ai.chat.ui.ChatAdapter;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.CountDownLatch;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes3.dex */
public final /* synthetic */ class c0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35334a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f35335b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35336c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f35337d;

    public /* synthetic */ c0(Object obj, int i5, Object obj2, int i11) {
        this.f35334a = i11;
        this.f35336c = obj;
        this.f35335b = i5;
        this.f35337d = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f35334a;
        int i11 = this.f35335b;
        Object obj = this.f35337d;
        Object obj2 = this.f35336c;
        switch (i5) {
            case 0:
                ChatAdapter.AiMessageViewHolder.startSuggestionShimmer$lambda$37((TextView) obj2, (ChatAdapter.AiMessageViewHolder) obj, i11);
                break;
            case 1:
                CountDownLatch countDownLatch = (CountDownLatch) obj;
                ((sx.a) obj2).f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, b.c0.h((i11 % 3) + 1, "t"), i11 % 2 == 0, i11 % 10);
                countDownLatch.countDown();
                break;
            case 2:
                g.m mVar = (g.m) obj2;
                Object obj3 = ((k.a) obj).f70554a;
                String str = (String) mVar.f68431a.get(Integer.valueOf(i11));
                if (str != null) {
                    j.e eVar = (j.e) mVar.f68435e.get(str);
                    if ((eVar != null ? eVar.f68422a : null) == null) {
                        mVar.f68437g.remove(str);
                        mVar.f68436f.put(str, obj3);
                        break;
                    } else {
                        j.a aVar = eVar.f68422a;
                        Intrinsics.e(aVar, "null cannot be cast to non-null type androidx.activity.result.ActivityResultCallback<O of androidx.activity.result.ActivityResultRegistry.dispatchResult>");
                        if (mVar.f68434d.remove(str)) {
                            aVar.onActivityResult(obj3);
                            break;
                        }
                    }
                }
                break;
            case 3:
                g.m this$0 = (g.m) obj2;
                IntentSender.SendIntentException e3 = (IntentSender.SendIntentException) obj;
                Intrinsics.g(this$0, "this$0");
                Intrinsics.g(e3, "$e");
                this$0.a(i11, 0, new Intent().setAction("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST").putExtra("androidx.activity.result.contract.extra.SEND_INTENT_EXCEPTION", e3));
                break;
            case 4:
                Ref.ObjectRef objectRef = (Ref.ObjectRef) obj2;
                ComponentName componentName = NovaLauncher.f45646r1;
                ((iz.a) objectRef.f71863a).R0((ga.j) obj, i11, false);
                v70.o.l(((iz.a) objectRef.f71863a).H);
                break;
            case 5:
                com.vungle.ads.internal.util.i.a((com.vungle.ads.internal.util.j) obj2, (Bitmap) obj, i11);
                break;
            case 6:
                fa.p0 p0Var = (fa.p0) obj;
                NovaLauncher novaLauncher = ((Workspace) obj2).f21013s0;
                ya.r rVar = new ya.r();
                ya.p pVar = rVar.f97209a;
                pVar.g(1);
                System.arraycopy(new int[]{i11}, 0, pVar.f97193a, pVar.f97194b, 1);
                int i12 = pVar.f97194b + 1;
                pVar.f97194b = i12;
                Arrays.sort(pVar.f97193a, 0, i12);
                novaLauncher.f80007h0 = rVar;
                p0Var.f54463i = false;
                p0Var.f54462h.clear();
                p0Var.f54456b.d();
                break;
            case 7:
                ((v6) ((bt.e) obj2).f18451c).t(i11, obj);
                break;
            case 8:
                ((v6) obj2).t(i11, obj);
                break;
            case 9:
                wf.e eVar2 = (wf.e) obj;
                Iterator it = ((CopyOnWriteArraySet) obj2).iterator();
                while (it.hasNext()) {
                    wf.g gVar = (wf.g) it.next();
                    if (!gVar.f94326d) {
                        if (i11 != -1) {
                            gVar.f94324b.c(i11);
                        }
                        gVar.f94325c = true;
                        eVar2.invoke(gVar.f94323a);
                    }
                }
                break;
            case 10:
                FolderIcon folderIcon = (FolderIcon) obj2;
                folderIcon.O.h(i11, false);
                View viewE0 = folderIcon.H.f21117q.E0(new wm.b((ga.j) obj, 6));
                if (viewE0 != null) {
                    viewE0.setVisibility(0);
                    break;
                }
                break;
            default:
                ya.g gVar2 = (ya.g) obj2;
                Context context = (Context) obj;
                ArrayList arrayList = gVar2.f97135e;
                mx.y yVar = gVar2.f97134d;
                if (yVar != null) {
                    yVar.I(context, gVar2.f97136f, i11);
                }
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    ((ya.d) arrayList.get(size)).I(context, gVar2.f97136f, i11);
                }
                break;
        }
    }

    public /* synthetic */ c0(Object obj, Object obj2, int i5, int i11) {
        this.f35334a = i11;
        this.f35336c = obj;
        this.f35337d = obj2;
        this.f35335b = i5;
    }
}
