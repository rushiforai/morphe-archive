package g2;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: b, reason: collision with root package name */
    public static final s f56899b = new s();

    /* renamed from: c, reason: collision with root package name */
    public static final s f56900c = new s();

    /* renamed from: d, reason: collision with root package name */
    public static final s f56901d = new s();

    /* renamed from: a, reason: collision with root package name */
    public final r1.e f56902a = new r1.e(new t[16]);

    public static void c(s sVar) {
        sVar.getClass();
        sVar.a(new n());
    }

    /* JADX WARN: Code restructure failed: missing block: B:78:0x0050, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(Function1 function1) {
        if (this == f56899b) {
            throw new IllegalStateException("\n    Please check whether the focusRequester is FocusRequester.Cancel or FocusRequester.Default\n    before invoking any functions on the focusRequester.\n");
        }
        if (this == f56900c) {
            throw new IllegalStateException("\n    Please check whether the focusRequester is FocusRequester.Cancel or FocusRequester.Default\n    before invoking any functions on the focusRequester.\n");
        }
        r1.e eVar = this.f56902a;
        int i5 = eVar.f85079c;
        if (i5 == 0) {
            System.out.println((Object) "FocusRelatedWarning: \n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n");
            return false;
        }
        Object[] objArr = eVar.f85077a;
        boolean z11 = false;
        for (int i11 = 0; i11 < i5; i11++) {
            t tVar = (t) objArr[i11];
            if (!tVar.getNode().getIsAttached()) {
                y2.a.b("visitChildren called on an unattached node");
            }
            r1.e eVar2 = new r1.e(new Modifier$Node[16]);
            Modifier$Node child = tVar.getNode().getChild();
            if (child == null) {
                b3.o.a(eVar2, tVar.getNode());
            } else {
                eVar2.b(child);
            }
            while (true) {
                int i12 = eVar2.f85079c;
                if (i12 != 0) {
                    Modifier$Node modifier$NodeB = (Modifier$Node) eVar2.k(i12 - 1);
                    if ((modifier$NodeB.getAggregateChildKindSet() & 1024) == 0) {
                        b3.o.a(eVar2, modifier$NodeB);
                    } else {
                        while (true) {
                            if (modifier$NodeB == null) {
                                break;
                            }
                            if ((modifier$NodeB.getKindSet() & 1024) != 0) {
                                r1.e eVar3 = null;
                                while (modifier$NodeB != null) {
                                    if (modifier$NodeB instanceof z) {
                                        z zVar = (z) modifier$NodeB;
                                        if (zVar.D().c() ? ((Boolean) function1.invoke(zVar)).booleanValue() : e0.e(zVar, 7, function1)) {
                                            z11 = true;
                                            break;
                                        }
                                    } else if (((modifier$NodeB.getKindSet() & 1024) != 0) && (modifier$NodeB instanceof DelegatingNode)) {
                                        int i13 = 0;
                                        for (Modifier$Node delegate = ((DelegatingNode) modifier$NodeB).getDelegate(); delegate != null; delegate = delegate.getChild()) {
                                            if ((delegate.getKindSet() & 1024) != 0) {
                                                i13++;
                                                if (i13 == 1) {
                                                    modifier$NodeB = delegate;
                                                } else {
                                                    if (eVar3 == null) {
                                                        eVar3 = new r1.e(new Modifier$Node[16]);
                                                    }
                                                    if (modifier$NodeB != null) {
                                                        eVar3.b(modifier$NodeB);
                                                        modifier$NodeB = null;
                                                    }
                                                    eVar3.b(delegate);
                                                }
                                            }
                                        }
                                        if (i13 == 1) {
                                        }
                                    }
                                    modifier$NodeB = b3.o.b(eVar3);
                                }
                            } else {
                                modifier$NodeB = modifier$NodeB.getChild();
                            }
                        }
                    }
                }
            }
        }
        return z11;
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x007c, code lost:
    
        if (r4.getNode().getIsAttached() != false) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x007e, code lost:
    
        y2.a.b("visitChildren called on an unattached node");
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0083, code lost:
    
        r5 = new r1.e(new androidx.compose.ui.Modifier$Node[16]);
        r7 = r4.getNode().getChild();
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0092, code lost:
    
        if (r7 != null) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0094, code lost:
    
        b3.o.a(r5, r4.getNode());
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x009c, code lost:
    
        r5.b(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x009f, code lost:
    
        r4 = r5.f85079c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00a1, code lost:
    
        if (r4 == 0) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00a3, code lost:
    
        r4 = (androidx.compose.ui.Modifier$Node) r5.k(r4 - 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00b1, code lost:
    
        if ((r4.getAggregateChildKindSet() & 1024) != 0) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00b3, code lost:
    
        b3.o.a(r5, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00b7, code lost:
    
        if (r4 == null) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00bf, code lost:
    
        if ((r4.getKindSet() & 1024) == 0) goto L78;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00c1, code lost:
    
        r7 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00c2, code lost:
    
        if (r4 == null) goto L102;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00c6, code lost:
    
        if ((r4 instanceof g2.z) == false) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00ce, code lost:
    
        if (g2.a0.b((g2.z) r4) == false) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00d7, code lost:
    
        if ((r4.getKindSet() & 1024) == 0) goto L107;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00db, code lost:
    
        if ((r4 instanceof androidx.compose.ui.node.DelegatingNode) == false) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x00dd, code lost:
    
        r10 = ((androidx.compose.ui.node.DelegatingNode) r4).getDelegate();
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x00e5, code lost:
    
        if (r10 == null) goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00ed, code lost:
    
        if ((r10.getKindSet() & 1024) == 0) goto L114;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x00ef, code lost:
    
        r11 = r11 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x00f1, code lost:
    
        if (r11 != 1) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x00f3, code lost:
    
        r4 = r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x00f5, code lost:
    
        if (r7 != null) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x00f7, code lost:
    
        r7 = new r1.e(new androidx.compose.ui.Modifier$Node[16]);
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x00fe, code lost:
    
        if (r4 == null) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0100, code lost:
    
        r7.b(r4);
        r4 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0104, code lost:
    
        r7.b(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0107, code lost:
    
        r10 = r10.getChild();
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x010c, code lost:
    
        if (r11 != 1) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x010f, code lost:
    
        r4 = b3.o.b(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0114, code lost:
    
        r4 = r4.getChild();
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0119, code lost:
    
        r3 = r3 + 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b() {
        r1.e eVar = this.f56902a;
        int i5 = eVar.f85079c;
        if (i5 == 0) {
            System.out.println((Object) "FocusRelatedWarning: \n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n");
            return false;
        }
        Object[] objArr = eVar.f85077a;
        int i11 = 0;
        loop0: while (i11 < i5) {
            t tVar = (t) objArr[i11];
            Modifier$Node node = tVar.getNode();
            r1.e eVar2 = null;
            while (true) {
                if (node == null) {
                    break;
                }
                if (node instanceof z) {
                    if (a0.b((z) node)) {
                        break loop0;
                    }
                } else if ((node.getKindSet() & 1024) != 0 && (node instanceof DelegatingNode)) {
                    int i12 = 0;
                    for (Modifier$Node delegate = ((DelegatingNode) node).getDelegate(); delegate != null; delegate = delegate.getChild()) {
                        if ((delegate.getKindSet() & 1024) != 0) {
                            i12++;
                            if (i12 == 1) {
                                node = delegate;
                            } else {
                                if (eVar2 == null) {
                                    eVar2 = new r1.e(new Modifier$Node[16]);
                                }
                                if (node != null) {
                                    eVar2.b(node);
                                    node = null;
                                }
                                eVar2.b(delegate);
                            }
                        }
                    }
                    if (i12 == 1) {
                    }
                }
                node = b3.o.b(eVar2);
            }
            return true;
        }
        return false;
    }
}
