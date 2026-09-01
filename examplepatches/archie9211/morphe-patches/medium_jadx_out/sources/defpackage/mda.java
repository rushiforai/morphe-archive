package defpackage;

import com.medium.android.postpublishing.ui.PublicationFlowFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mda {
    public final /* synthetic */ PublicationFlowFragment a;

    public mda(PublicationFlowFragment publicationFlowFragment) {
        this.a = publicationFlowFragment;
    }

    public final void a() {
        PublicationFlowFragment publicationFlowFragment = this.a;
        m15 m15VarG = publicationFlowFragment.g();
        if (m15VarG != null) {
            m15VarG.setResult(-1);
        }
        m15 m15VarG2 = publicationFlowFragment.g();
        if (m15VarG2 != null) {
            m15VarG2.finish();
        }
    }
}
