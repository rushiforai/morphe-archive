package we;

import wf.v;

/* loaded from: classes3.dex */
public final /* synthetic */ class o implements r {

    /* renamed from: b, reason: collision with root package name */
    public static final o f94296b = new o(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94297a;

    public /* synthetic */ o(int i5) {
        this.f94297a = i5;
    }

    @Override // we.r
    public int h(Object obj) {
        l lVar = (l) obj;
        switch (this.f94297a) {
            case 1:
                String str = lVar.f94250a;
                if (str.startsWith("OMX.google") || str.startsWith("c2.android")) {
                    return 1;
                }
                return (v.f94376a >= 26 || !str.equals("OMX.MTK.AUDIO.DECODER.RAW")) ? 0 : -1;
            default:
                return lVar.f94250a.startsWith("OMX.google") ? 1 : 0;
        }
    }
}
