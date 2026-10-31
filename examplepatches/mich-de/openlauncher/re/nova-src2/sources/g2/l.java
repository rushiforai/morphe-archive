package g2;

import android.os.Trace;
import android.view.KeyEvent;
import android.view.autofill.AutofillManager;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.focus.FocusOwnerImpl$modifier$1;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.platform.AndroidComposeView;
import b3.j1;
import c3.q2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import z.g0;
import z.j0;

/* loaded from: classes.dex */
public final class l implements j {

    /* renamed from: a, reason: collision with root package name */
    public final AndroidComposeView f56874a;

    /* renamed from: b, reason: collision with root package name */
    public final AndroidComposeView f56875b;

    /* renamed from: d, reason: collision with root package name */
    public final h f56877d;

    /* renamed from: f, reason: collision with root package name */
    public g0 f56879f;

    /* renamed from: h, reason: collision with root package name */
    public z f56881h;

    /* renamed from: c, reason: collision with root package name */
    public final z f56876c = new z(2, 6, null);

    /* renamed from: e, reason: collision with root package name */
    public final FocusOwnerImpl$modifier$1 f56878e = new j1() { // from class: androidx.compose.ui.focus.FocusOwnerImpl$modifier$1
        @Override // b3.j1
        public final Modifier$Node create() {
            return this.f14131b.f56876c;
        }

        public final boolean equals(Object obj) {
            return obj == this;
        }

        public final int hashCode() {
            return this.f14131b.f56876c.hashCode();
        }

        @Override // b3.j1
        public final void inspectableProperties(q2 q2Var) {
            q2Var.d("RootFocusTarget");
        }

        @Override // b3.j1
        public final /* bridge */ /* synthetic */ void update(Modifier$Node modifier$Node) {
        }
    };

    /* renamed from: g, reason: collision with root package name */
    public final j0 f56880g = new j0(1);

    /* JADX WARN: Type inference failed for: r4v3, types: [androidx.compose.ui.focus.FocusOwnerImpl$modifier$1] */
    public l(AndroidComposeView androidComposeView, AndroidComposeView androidComposeView2) {
        this.f56874a = androidComposeView;
        this.f56875b = androidComposeView2;
        this.f56877d = new h(this, androidComposeView2);
    }

    public final void b(boolean z11) {
        d(8, z11, true);
    }

    public final boolean c(boolean z11) {
        NodeChain nodes;
        z zVar = this.f56881h;
        if (zVar != null) {
            j(null);
            zVar.B(w.f56904a, w.f56907d);
            if (!zVar.getNode().getIsAttached()) {
                y2.a.b("visitAncestors called on an unattached node");
            }
            Modifier$Node parent = zVar.getNode().getParent();
            LayoutNode layoutNodeF = b3.o.f(zVar);
            while (layoutNodeF != null) {
                if ((a2.c.c(layoutNodeF) & 1024) != 0) {
                    while (parent != null) {
                        if ((parent.getKindSet() & 1024) != 0) {
                            r1.e eVar = null;
                            Modifier$Node modifier$NodeB = parent;
                            while (modifier$NodeB != null) {
                                if (modifier$NodeB instanceof z) {
                                    ((z) modifier$NodeB).B(w.f56905b, w.f56907d);
                                } else if ((modifier$NodeB.getKindSet() & 1024) != 0 && (modifier$NodeB instanceof DelegatingNode)) {
                                    int i5 = 0;
                                    for (Modifier$Node delegate$ui_release = ((DelegatingNode) modifier$NodeB).getDelegate(); delegate$ui_release != null; delegate$ui_release = delegate$ui_release.getChild()) {
                                        if ((delegate$ui_release.getKindSet() & 1024) != 0) {
                                            i5++;
                                            if (i5 == 1) {
                                                modifier$NodeB = delegate$ui_release;
                                            } else {
                                                if (eVar == null) {
                                                    eVar = new r1.e(new Modifier$Node[16]);
                                                }
                                                if (modifier$NodeB != null) {
                                                    eVar.b(modifier$NodeB);
                                                    modifier$NodeB = null;
                                                }
                                                eVar.b(delegate$ui_release);
                                            }
                                        }
                                    }
                                    if (i5 == 1) {
                                    }
                                }
                                modifier$NodeB = b3.o.b(eVar);
                            }
                        }
                        parent = parent.getParent();
                    }
                }
                layoutNodeF = layoutNodeF.getParent$ui_release();
                parent = (layoutNodeF == null || (nodes = layoutNodeF.getNodes()) == null) ? null : nodes.getTail();
            }
        }
        return true;
    }

    public final boolean d(int i5, boolean z11, boolean z12) {
        int iOrdinal;
        boolean z13 = true;
        if (z11 || (iOrdinal = a0.c(this.f56876c, i5).ordinal()) == 0) {
            c(z11);
        } else {
            if (iOrdinal != 1 && iOrdinal != 2 && iOrdinal != 3) {
                throw new NoWhenBranchMatchedException();
            }
            z13 = false;
        }
        if (z13 && z12) {
            this.f56874a.clearOwnerFocus();
        }
        return z13;
    }

    public final void e() {
        NodeChain nodes;
        if (this.f56877d.f56870e) {
            System.out.println((Object) "FocusRelatedWarning: Dispatching indirect touch event while the focus system is invalidated.");
            return;
        }
        z zVarC = g.c(this.f56876c);
        if (zVarC != null) {
            if (!zVarC.getNode().getIsAttached()) {
                y2.a.b("visitAncestors called on an unattached node");
            }
            Modifier$Node node = zVarC.getNode();
            LayoutNode layoutNodeF = b3.o.f(zVarC);
            while (layoutNodeF != null) {
                if ((a2.c.c(layoutNodeF) & 2097152) != 0) {
                    while (node != null) {
                        if ((node.getKindSet() & 2097152) != 0) {
                            Modifier$Node modifier$NodeB = node;
                            r1.e eVar = null;
                            while (modifier$NodeB != null) {
                                if ((modifier$NodeB.getKindSet() & 2097152) != 0 && (modifier$NodeB instanceof DelegatingNode)) {
                                    int i5 = 0;
                                    for (Modifier$Node delegate$ui_release = ((DelegatingNode) modifier$NodeB).getDelegate(); delegate$ui_release != null; delegate$ui_release = delegate$ui_release.getChild()) {
                                        if ((delegate$ui_release.getKindSet() & 2097152) != 0) {
                                            i5++;
                                            if (i5 == 1) {
                                                modifier$NodeB = delegate$ui_release;
                                            } else {
                                                if (eVar == null) {
                                                    eVar = new r1.e(new Modifier$Node[16]);
                                                }
                                                if (modifier$NodeB != null) {
                                                    eVar.b(modifier$NodeB);
                                                    modifier$NodeB = null;
                                                }
                                                eVar.b(delegate$ui_release);
                                            }
                                        }
                                    }
                                    if (i5 == 1) {
                                    }
                                }
                                modifier$NodeB = b3.o.b(eVar);
                            }
                        }
                        node = node.getParent();
                    }
                }
                layoutNodeF = layoutNodeF.getParent$ui_release();
                node = (layoutNodeF == null || (nodes = layoutNodeF.getNodes()) == null) ? null : nodes.getTail();
            }
        }
    }

    public final void f() {
        NodeChain nodes;
        if (this.f56877d.f56870e) {
            System.out.println((Object) "FocusRelatedWarning: Dispatching intercepted soft keyboard event while the focus system is invalidated.");
            return;
        }
        z zVarC = g.c(this.f56876c);
        if (zVarC != null) {
            if (!zVarC.getNode().getIsAttached()) {
                y2.a.b("visitAncestors called on an unattached node");
            }
            Modifier$Node node = zVarC.getNode();
            LayoutNode layoutNodeF = b3.o.f(zVarC);
            while (layoutNodeF != null) {
                if ((a2.c.c(layoutNodeF) & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
                    while (node != null) {
                        if ((node.getKindSet() & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
                            Modifier$Node modifier$NodeB = node;
                            r1.e eVar = null;
                            while (modifier$NodeB != null) {
                                if ((modifier$NodeB.getKindSet() & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 && (modifier$NodeB instanceof DelegatingNode)) {
                                    int i5 = 0;
                                    for (Modifier$Node delegate$ui_release = ((DelegatingNode) modifier$NodeB).getDelegate(); delegate$ui_release != null; delegate$ui_release = delegate$ui_release.getChild()) {
                                        if ((delegate$ui_release.getKindSet() & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
                                            i5++;
                                            if (i5 == 1) {
                                                modifier$NodeB = delegate$ui_release;
                                            } else {
                                                if (eVar == null) {
                                                    eVar = new r1.e(new Modifier$Node[16]);
                                                }
                                                if (modifier$NodeB != null) {
                                                    eVar.b(modifier$NodeB);
                                                    modifier$NodeB = null;
                                                }
                                                eVar.b(delegate$ui_release);
                                            }
                                        }
                                    }
                                    if (i5 == 1) {
                                    }
                                }
                                modifier$NodeB = b3.o.b(eVar);
                            }
                        }
                        node = node.getParent();
                    }
                }
                layoutNodeF = layoutNodeF.getParent$ui_release();
                node = (layoutNodeF == null || (nodes = layoutNodeF.getNodes()) == null) ? null : nodes.getTail();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0115 A[Catch: all -> 0x0019, TryCatch #0 {all -> 0x0019, blocks: (B:3:0x0007, B:5:0x000e, B:10:0x001c, B:14:0x0026, B:17:0x0032, B:19:0x003c, B:20:0x0041, B:22:0x004d, B:24:0x0054, B:26:0x005c, B:30:0x0066, B:128:0x01c0, B:130:0x01ca, B:131:0x01cd, B:133:0x01dc, B:136:0x01ee, B:140:0x01fa, B:143:0x0200, B:144:0x0205, B:164:0x0249, B:145:0x0209, B:147:0x0211, B:149:0x0215, B:151:0x021f, B:153:0x0227, B:155:0x022b, B:157:0x0231, B:159:0x023a, B:160:0x023e, B:161:0x0241, B:165:0x024e, B:166:0x0253, B:168:0x0259, B:170:0x025f, B:173:0x026a, B:175:0x0272, B:182:0x0289, B:183:0x028b, B:184:0x029b, B:186:0x029f, B:188:0x02a3, B:215:0x0304, B:192:0x02af, B:194:0x02b9, B:196:0x02bf, B:198:0x02c8, B:200:0x02d0, B:202:0x02d4, B:203:0x02d9, B:205:0x02df, B:206:0x02e6, B:208:0x02ee, B:209:0x02f3, B:211:0x02f9, B:212:0x02fc, B:216:0x030f, B:220:0x031f, B:221:0x032f, B:223:0x0333, B:225:0x0337, B:252:0x0398, B:229:0x0343, B:231:0x034d, B:233:0x0353, B:235:0x035c, B:237:0x0364, B:239:0x0368, B:240:0x036d, B:242:0x0373, B:243:0x037a, B:245:0x0382, B:246:0x0387, B:248:0x038d, B:249:0x0390, B:254:0x03a5, B:256:0x03ac, B:261:0x03bf, B:262:0x03c1, B:34:0x0070, B:36:0x007a, B:37:0x007d, B:39:0x0087, B:42:0x0099, B:46:0x00a5, B:77:0x010b, B:79:0x010f, B:49:0x00ab, B:51:0x00b3, B:53:0x00b7, B:55:0x00c1, B:57:0x00c9, B:59:0x00cd, B:61:0x00d3, B:63:0x00dc, B:64:0x00e0, B:65:0x00e3, B:68:0x00eb, B:69:0x00f0, B:70:0x00f5, B:72:0x00fb, B:74:0x0101, B:80:0x0115, B:82:0x011f, B:83:0x0122, B:85:0x0130, B:88:0x0142, B:92:0x014e, B:123:0x01b4, B:125:0x01b8, B:95:0x0154, B:97:0x015c, B:99:0x0160, B:101:0x016a, B:103:0x0172, B:105:0x0176, B:107:0x017c, B:109:0x0185, B:110:0x0189, B:111:0x018c, B:114:0x0194, B:115:0x0199, B:116:0x019e, B:118:0x01a4, B:120:0x01aa), top: B:267:0x0007 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean g(KeyEvent keyEvent, Function0 function0) {
        Object obj;
        Modifier$Node node;
        NodeChain nodes;
        Object obj2;
        NodeChain nodes2;
        NodeChain nodes3;
        z zVar = this.f56876c;
        Trace.beginSection("FocusOwnerImpl:dispatchKeyEvent");
        try {
            if (this.f56877d.f56870e) {
                System.out.println((Object) "FocusRelatedWarning: Dispatching key event while focus system is invalidated.");
                return false;
            }
            if (!k(keyEvent)) {
                return false;
            }
            z zVarC = g.c(zVar);
            if (zVarC != null) {
                if (!zVarC.getNode().getIsAttached()) {
                    y2.a.b("visitLocalDescendants called on an unattached node");
                }
                Modifier$Node node2 = zVarC.getNode();
                if ((node2.getAggregateChildKindSet() & 9216) != 0) {
                    node = null;
                    for (Modifier$Node child = node2.getChild(); child != null; child = child.getChild()) {
                        if ((child.getKindSet() & 9216) != 0) {
                            if ((child.getKindSet() & 1024) != 0) {
                                break;
                            }
                            node = child;
                        }
                    }
                } else {
                    node = null;
                }
                if (node == null) {
                }
            } else if (zVarC == null) {
                if (!zVar.getNode().getIsAttached()) {
                    y2.a.b("visitAncestors called on an unattached node");
                }
                Modifier$Node parent = zVar.getNode().getParent();
                LayoutNode layoutNodeF = b3.o.f(zVar);
                loop15: while (true) {
                    if (layoutNodeF == null) {
                        obj = null;
                        break;
                    }
                    if ((layoutNodeF.getNodes().getHead().getAggregateChildKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                        while (parent != null) {
                            if ((parent.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                Modifier$Node modifier$NodeB = parent;
                                r1.e eVar = null;
                                while (modifier$NodeB != null) {
                                    if (modifier$NodeB instanceof t2.d) {
                                        obj = modifier$NodeB;
                                        break loop15;
                                    }
                                    if ((modifier$NodeB.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 && (modifier$NodeB instanceof DelegatingNode)) {
                                        Modifier$Node delegate$ui_release = ((DelegatingNode) modifier$NodeB).getDelegate();
                                        int i5 = 0;
                                        modifier$NodeB = modifier$NodeB;
                                        eVar = eVar;
                                        while (delegate$ui_release != null) {
                                            if ((delegate$ui_release.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                                i5++;
                                                eVar = eVar;
                                                if (i5 == 1) {
                                                    Unit unit = Unit.f71706a;
                                                    modifier$NodeB = delegate$ui_release;
                                                } else {
                                                    if (eVar == null) {
                                                        eVar = new r1.e(new Modifier$Node[16]);
                                                    }
                                                    if (modifier$NodeB != null) {
                                                        eVar.b(modifier$NodeB);
                                                        modifier$NodeB = null;
                                                    }
                                                    eVar.b(delegate$ui_release);
                                                }
                                            }
                                            delegate$ui_release = delegate$ui_release.getChild();
                                            modifier$NodeB = modifier$NodeB;
                                            eVar = eVar;
                                        }
                                        if (i5 == 1) {
                                        }
                                    }
                                    modifier$NodeB = b3.o.b(eVar);
                                }
                            }
                            parent = parent.getParent();
                        }
                    }
                    layoutNodeF = layoutNodeF.getParent$ui_release();
                    parent = (layoutNodeF == null || (nodes = layoutNodeF.getNodes()) == null) ? null : nodes.getTail();
                }
                t2.d dVar = (t2.d) obj;
                node = dVar != null ? dVar.getNode() : null;
            } else {
                if (!zVarC.getNode().getIsAttached()) {
                    y2.a.b("visitAncestors called on an unattached node");
                }
                Modifier$Node node3 = zVarC.getNode();
                LayoutNode layoutNodeF2 = b3.o.f(zVarC);
                loop11: while (true) {
                    if (layoutNodeF2 == null) {
                        obj2 = null;
                        break;
                    }
                    if ((layoutNodeF2.getNodes().getHead().getAggregateChildKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                        while (node3 != null) {
                            if ((node3.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                r1.e eVar2 = null;
                                Modifier$Node modifier$NodeB2 = node3;
                                while (modifier$NodeB2 != null) {
                                    if (modifier$NodeB2 instanceof t2.d) {
                                        obj2 = modifier$NodeB2;
                                        break loop11;
                                    }
                                    if ((modifier$NodeB2.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 && (modifier$NodeB2 instanceof DelegatingNode)) {
                                        Modifier$Node delegate$ui_release2 = ((DelegatingNode) modifier$NodeB2).getDelegate();
                                        int i11 = 0;
                                        modifier$NodeB2 = modifier$NodeB2;
                                        eVar2 = eVar2;
                                        while (delegate$ui_release2 != null) {
                                            if ((delegate$ui_release2.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                                i11++;
                                                eVar2 = eVar2;
                                                if (i11 == 1) {
                                                    Unit unit2 = Unit.f71706a;
                                                    modifier$NodeB2 = delegate$ui_release2;
                                                } else {
                                                    if (eVar2 == null) {
                                                        eVar2 = new r1.e(new Modifier$Node[16]);
                                                    }
                                                    if (modifier$NodeB2 != null) {
                                                        eVar2.b(modifier$NodeB2);
                                                        modifier$NodeB2 = null;
                                                    }
                                                    eVar2.b(delegate$ui_release2);
                                                }
                                            }
                                            delegate$ui_release2 = delegate$ui_release2.getChild();
                                            modifier$NodeB2 = modifier$NodeB2;
                                            eVar2 = eVar2;
                                        }
                                        if (i11 == 1) {
                                        }
                                    }
                                    modifier$NodeB2 = b3.o.b(eVar2);
                                }
                            }
                            node3 = node3.getParent();
                        }
                    }
                    layoutNodeF2 = layoutNodeF2.getParent$ui_release();
                    node3 = (layoutNodeF2 == null || (nodes2 = layoutNodeF2.getNodes()) == null) ? null : nodes2.getTail();
                }
                t2.d dVar2 = (t2.d) obj2;
                if (dVar2 != null) {
                    node = dVar2.getNode();
                }
            }
            if (node != null) {
                if (!node.getNode().getIsAttached()) {
                    y2.a.b("visitAncestors called on an unattached node");
                }
                Modifier$Node parent2 = node.getNode().getParent();
                LayoutNode layoutNodeF3 = b3.o.f(node);
                ArrayList arrayList = null;
                while (layoutNodeF3 != null) {
                    if ((layoutNodeF3.getNodes().getHead().getAggregateChildKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                        while (parent2 != null) {
                            if ((parent2.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                Modifier$Node modifier$NodeB3 = parent2;
                                r1.e eVar3 = null;
                                while (modifier$NodeB3 != null) {
                                    if (modifier$NodeB3 instanceof t2.d) {
                                        if (arrayList == null) {
                                            arrayList = new ArrayList();
                                        }
                                        arrayList.add(modifier$NodeB3);
                                    } else if ((modifier$NodeB3.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 && (modifier$NodeB3 instanceof DelegatingNode)) {
                                        int i12 = 0;
                                        for (Modifier$Node delegate$ui_release3 = ((DelegatingNode) modifier$NodeB3).getDelegate(); delegate$ui_release3 != null; delegate$ui_release3 = delegate$ui_release3.getChild()) {
                                            if ((delegate$ui_release3.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                                i12++;
                                                if (i12 == 1) {
                                                    Unit unit3 = Unit.f71706a;
                                                    modifier$NodeB3 = delegate$ui_release3;
                                                } else {
                                                    if (eVar3 == null) {
                                                        eVar3 = new r1.e(new Modifier$Node[16]);
                                                    }
                                                    if (modifier$NodeB3 != null) {
                                                        eVar3.b(modifier$NodeB3);
                                                        modifier$NodeB3 = null;
                                                    }
                                                    eVar3.b(delegate$ui_release3);
                                                }
                                            }
                                        }
                                        if (i12 == 1) {
                                        }
                                    }
                                    modifier$NodeB3 = b3.o.b(eVar3);
                                }
                            }
                            parent2 = parent2.getParent();
                        }
                    }
                    layoutNodeF3 = layoutNodeF3.getParent$ui_release();
                    parent2 = (layoutNodeF3 == null || (nodes3 = layoutNodeF3.getNodes()) == null) ? null : nodes3.getTail();
                }
                if (arrayList != null) {
                    int size = arrayList.size() - 1;
                    if (size >= 0) {
                        while (true) {
                            int i13 = size - 1;
                            if (((t2.d) arrayList.get(size)).n(keyEvent)) {
                                return true;
                            }
                            if (i13 < 0) {
                                break;
                            }
                            size = i13;
                        }
                    }
                    Unit unit4 = Unit.f71706a;
                }
                Modifier$Node node4 = node.getNode();
                Ref.ObjectRef objectRef = new Ref.ObjectRef();
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                objectRef2.f71863a = node4;
                while (true) {
                    Object obj3 = objectRef2.f71863a;
                    if (obj3 != null) {
                        if (obj3 instanceof t2.d) {
                            if (((t2.d) obj3).n(keyEvent)) {
                                return true;
                            }
                        } else if ((((Modifier$Node) obj3).getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                            Object obj4 = objectRef2.f71863a;
                            if (obj4 instanceof DelegatingNode) {
                                int i14 = 0;
                                for (Modifier$Node delegate$ui_release4 = ((DelegatingNode) obj4).getDelegate(); delegate$ui_release4 != null; delegate$ui_release4 = delegate$ui_release4.getChild()) {
                                    if ((delegate$ui_release4.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                        i14++;
                                        if (i14 == 1) {
                                            objectRef2.f71863a = delegate$ui_release4;
                                            Unit unit5 = Unit.f71706a;
                                        } else {
                                            r1.e eVar4 = (r1.e) objectRef.f71863a;
                                            if (eVar4 == null) {
                                                eVar4 = new r1.e(new Modifier$Node[16]);
                                            }
                                            objectRef.f71863a = eVar4;
                                            Modifier$Node modifier$Node = (Modifier$Node) objectRef2.f71863a;
                                            if (modifier$Node != null) {
                                                eVar4.b(modifier$Node);
                                                objectRef2.f71863a = null;
                                            }
                                            r1.e eVar5 = (r1.e) objectRef.f71863a;
                                            if (eVar5 != null) {
                                                eVar5.b(delegate$ui_release4);
                                            }
                                        }
                                    }
                                }
                                if (i14 == 1) {
                                }
                            }
                        }
                        objectRef2.f71863a = b3.o.b((r1.e) objectRef.f71863a);
                    } else {
                        if (((Boolean) function0.invoke()).booleanValue()) {
                            return true;
                        }
                        Modifier$Node node5 = node.getNode();
                        Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
                        Ref.ObjectRef objectRef4 = new Ref.ObjectRef();
                        objectRef4.f71863a = node5;
                        while (true) {
                            Object obj5 = objectRef4.f71863a;
                            if (obj5 != null) {
                                if (obj5 instanceof t2.d) {
                                    if (((t2.d) obj5).o(keyEvent)) {
                                        return true;
                                    }
                                } else if ((((Modifier$Node) obj5).getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                    Object obj6 = objectRef4.f71863a;
                                    if (obj6 instanceof DelegatingNode) {
                                        int i15 = 0;
                                        for (Modifier$Node delegate$ui_release5 = ((DelegatingNode) obj6).getDelegate(); delegate$ui_release5 != null; delegate$ui_release5 = delegate$ui_release5.getChild()) {
                                            if ((delegate$ui_release5.getKindSet() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0) {
                                                i15++;
                                                if (i15 == 1) {
                                                    objectRef4.f71863a = delegate$ui_release5;
                                                    Unit unit6 = Unit.f71706a;
                                                } else {
                                                    r1.e eVar6 = (r1.e) objectRef3.f71863a;
                                                    if (eVar6 == null) {
                                                        eVar6 = new r1.e(new Modifier$Node[16]);
                                                    }
                                                    objectRef3.f71863a = eVar6;
                                                    Modifier$Node modifier$Node2 = (Modifier$Node) objectRef4.f71863a;
                                                    if (modifier$Node2 != null) {
                                                        eVar6.b(modifier$Node2);
                                                        objectRef4.f71863a = null;
                                                    }
                                                    r1.e eVar7 = (r1.e) objectRef3.f71863a;
                                                    if (eVar7 != null) {
                                                        eVar7.b(delegate$ui_release5);
                                                    }
                                                }
                                            }
                                        }
                                        if (i15 == 1) {
                                        }
                                    }
                                }
                                objectRef4.f71863a = b3.o.b((r1.e) objectRef3.f71863a);
                            } else {
                                if (arrayList != null) {
                                    int size2 = arrayList.size();
                                    for (int i16 = 0; i16 < size2; i16++) {
                                        if (((t2.d) arrayList.get(i16)).o(keyEvent)) {
                                            return true;
                                        }
                                    }
                                    Unit unit7 = Unit.f71706a;
                                }
                                Unit unit8 = Unit.f71706a;
                            }
                        }
                    }
                }
            }
            return false;
        } finally {
            Trace.endSection();
        }
    }

    public final Boolean h(int i5, h2.c cVar, Function1 function1) {
        z zVar = this.f56876c;
        z zVarC = g.c(zVar);
        AndroidComposeView androidComposeView = this.f56875b;
        if (zVarC != null) {
            s sVarB = g.b(zVarC, i5, androidComposeView.getLayoutDirection());
            if (!Intrinsics.b(sVarB, s.f56900c)) {
                if (Intrinsics.b(sVarB, s.f56901d)) {
                    z zVarC2 = g.c(zVar);
                    if (zVarC2 != null) {
                        return (Boolean) function1.invoke(zVarC2);
                    }
                } else if (!Intrinsics.b(sVarB, s.f56899b)) {
                    return Boolean.valueOf(sVarB.a(function1));
                }
            }
            return null;
        }
        zVarC = null;
        return g.e(zVar, i5, androidComposeView.getLayoutDirection(), cVar, new b0.i(zVarC, this, function1));
    }

    public final boolean i(int i5) {
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        objectRef.f71863a = Boolean.FALSE;
        z zVar = this.f56881h;
        AndroidComposeView androidComposeView = this.f56874a;
        Boolean boolH = h(i5, androidComposeView.getEmbeddedViewFocusRect(), new k(objectRef, i5));
        if (Intrinsics.b(boolH, Boolean.TRUE) && zVar != this.f56881h) {
            return true;
        }
        if (boolH != null && objectRef.f71863a != null) {
            if (boolH.booleanValue() && ((Boolean) objectRef.f71863a).booleanValue()) {
                return true;
            }
            if (g.j(i5)) {
                if (d(i5, false, false)) {
                    Boolean boolH2 = h(i5, null, new c3.y(i5, 2));
                    if (boolH2 != null ? boolH2.booleanValue() : false) {
                        return true;
                    }
                }
            } else if (androidComposeView.mo64moveFocusInChildren3ESFkO8(i5)) {
                return true;
            }
        }
        return false;
    }

    public final void j(z zVar) {
        LayoutNode layoutNodeF;
        j3.k semanticsConfiguration;
        LayoutNode layoutNodeF2;
        j3.k semanticsConfiguration2;
        z zVar2 = this.f56881h;
        this.f56881h = zVar;
        j0 j0Var = this.f56880g;
        Object[] objArr = j0Var.f97840a;
        int i5 = j0Var.f97841b;
        for (int i11 = 0; i11 < i5; i11++) {
            c2.d dVar = (c2.d) objArr[i11];
            dVar.getClass();
            if (zVar2 != null && (layoutNodeF2 = b3.o.f(zVar2)) != null && (semanticsConfiguration2 = layoutNodeF2.getSemanticsConfiguration()) != null && semanticsConfiguration2.f68812a.a(j3.j.f68794g)) {
                ((AutofillManager) dVar.f19158a.f33136b).notifyViewExited(dVar.f19160c, layoutNodeF2.getSemanticsId());
            }
            if (zVar != null && (layoutNodeF = b3.o.f(zVar)) != null && (semanticsConfiguration = layoutNodeF.getSemanticsConfiguration()) != null && semanticsConfiguration.f68812a.a(j3.j.f68794g)) {
                int semanticsId = layoutNodeF.getSemanticsId();
                dVar.f19161d.f70888a.u(semanticsId, new c2.b(dVar, semanticsId));
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x009f, code lost:
    
        r36 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x00a9, code lost:
    
        if (((r9 & ((~r9) << 6)) & (-9187201950435737472L)) == r36) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x00ab, code lost:
    
        r3 = r4.b(r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00b1, code lost:
    
        if (r4.f97772e != 0) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00c2, code lost:
    
        if (((r4.f97834a[r3 >> 3] >> ((r3 & 7) << 3)) & 255) != 254) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00c4, code lost:
    
        r33 = true;
        r17 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00ca, code lost:
    
        r3 = r4.f97836c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00cc, code lost:
    
        if (r3 <= r5) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00ce, code lost:
    
        r13 = r4.f97837d;
        r8 = kotlin.ULong.f71699b;
        r15 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00e1, code lost:
    
        if (java.lang.Long.compareUnsigned(r13 * 32, r3 * 25) > 0) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00e3, code lost:
    
        r3 = r4.f97834a;
        r8 = r4.f97836c;
        r9 = r4.f97835b;
        r10 = (r8 + 7) >> 3;
        r13 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00ef, code lost:
    
        if (r13 >= r10) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00f1, code lost:
    
        r14 = r5;
        r5 = r3[r13] & (-9187201950435737472L);
        r3[r13] = (-72340172838076674L) & ((~r5) + (r5 >>> 7));
        r13 = r13 + 1;
        r5 = r14;
        r15 = r15;
        r6 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0111, code lost:
    
        r32 = r6;
        r17 = r15;
        r5 = kotlin.collections.c.B0(r3);
        r6 = r5 - 1;
        r3[r6] = (r3[r6] & 72057594037927935L) | (-72057594037927936L);
        r3[r5] = r3[0];
        r5 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0132, code lost:
    
        if (r5 == r8) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0134, code lost:
    
        r6 = r5 >> 3;
        r10 = (r5 & 7) << 3;
        r13 = (r3[r6] >> r10) & 255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0141, code lost:
    
        if (r13 != r17) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0143, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0148, code lost:
    
        if (r13 == 254) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x014b, code lost:
    
        r13 = java.lang.Long.hashCode(r9[r5]) * r31;
        r14 = (r13 ^ (r13 << 16)) >>> 7;
        r15 = r4.b(r14);
        r14 = r14 & r8;
        r33 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x016c, code lost:
    
        if ((((r15 - r14) & r8) / 8) != (((r5 - r14) & r8) / 8)) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x016e, code lost:
    
        r3[r6] = (r3[r6] & (~(255 << r10))) | ((r13 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << r10);
        r3[r3.length - 1] = (r3[0] & 72057594037927935L) | Long.MIN_VALUE;
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x018c, code lost:
    
        r7 = r33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x018f, code lost:
    
        r7 = r5;
        r5 = r15 >> 3;
        r34 = r3[r5];
        r6 = (r15 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x01a0, code lost:
    
        if (((r34 >> r6) & 255) != r17) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x01a2, code lost:
    
        r3[r5] = (r34 & (~(255 << r6))) | ((r13 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << r6);
        r3[r6] = (r3[r6] & (~(255 << r10))) | (r17 << r10);
        r9[r15] = r9[r7];
        r9[r7] = r36;
        r5 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x01c6, code lost:
    
        r3[r5] = ((r13 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << r6) | (r34 & (~(255 << r6)));
        r5 = r9[r15];
        r9[r15] = r9[r7];
        r9[r7] = r5;
        r5 = r7 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x01e1, code lost:
    
        r3[r3.length - 1] = (r3[0] & 72057594037927935L) | Long.MIN_VALUE;
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x01ef, code lost:
    
        r33 = r7;
        r4.f97772e = z.z0.a(r4.f97836c) - r4.f97837d;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0200, code lost:
    
        r17 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0202, code lost:
    
        r32 = r6;
        r33 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0207, code lost:
    
        r17 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x020a, code lost:
    
        r3 = z.z0.b(r4.f97836c);
        r5 = r4.f97834a;
        r6 = r4.f97835b;
        r7 = r4.f97836c;
        r4.c(r3);
        r3 = r4.f97834a;
        r8 = r4.f97835b;
        r9 = r4.f97836c;
        r10 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0221, code lost:
    
        if (r10 >= r7) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0230, code lost:
    
        if (((r5[r10 >> 3] >> ((r10 & 7) << 3)) & 255) >= r17) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0232, code lost:
    
        r13 = r6[r10];
        r15 = java.lang.Long.hashCode(r13) * r31;
        r15 = r15 ^ (r15 << 16);
        r16 = r3;
        r3 = r4.b(r15 >>> 7);
        r19 = r5;
        r20 = r6;
        r5 = r15 & com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        r15 = r3 >> 3;
        r22 = (r3 & 7) << 3;
        r5 = (r16[r15] & (~(255 << r22))) | (r5 << r22);
        r16[r15] = r5;
        r16[(((r3 - 7) & r9) + (r9 & 7)) >> 3] = r5;
        r8[r3] = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0270, code lost:
    
        r16 = r3;
        r19 = r5;
        r20 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0276, code lost:
    
        r10 = r10 + 1;
        r3 = r16;
        r5 = r19;
        r6 = r20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x027f, code lost:
    
        r3 = r4.b(r32);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0283, code lost:
    
        r32 = r3;
        r4.f97837d++;
        r3 = r4.f97772e;
        r5 = r4.f97834a;
        r6 = r32 >> 3;
        r7 = r5[r6];
        r9 = (r32 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x029d, code lost:
    
        if (((r7 >> r9) & 255) != r17) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x029f, code lost:
    
        r21 = r33 ? 1 : 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x02a1, code lost:
    
        r4.f97772e = r3 - r21;
        r3 = r4.f97836c;
        r7 = (r7 & (~(255 << r9))) | (r11 << r9);
        r5[r6] = r7;
        r5[(((r32 - 7) & r3) + (r3 & 7)) >> 3] = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x034f, code lost:
    
        if (((r7 & ((~r7) << 6)) & (-9187201950435737472L)) == 0) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x0351, code lost:
    
        r11 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean k(KeyEvent keyEvent) {
        int iNumberOfTrailingZeros;
        long j11;
        boolean z11;
        int iNumberOfTrailingZeros2;
        long jV = t2.c.v(keyEvent);
        int iX = t2.c.x(keyEvent);
        int i5 = -862048943;
        long j12 = 0;
        int i11 = 8;
        int i12 = 0;
        boolean z12 = true;
        if (p3.i.t(iX, 2)) {
            g0 g0Var = this.f56879f;
            if (g0Var == null) {
                g0Var = new g0(3);
                this.f56879f = g0Var;
            }
            g0 g0Var2 = g0Var;
            int iHashCode = Long.hashCode(jV) * (-862048943);
            int i13 = iHashCode ^ (iHashCode << 16);
            int i14 = i13 >>> 7;
            int i15 = i13 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
            int i16 = g0Var2.f97836c;
            int i17 = i14 & i16;
            int i18 = 0;
            loop0: while (true) {
                long[] jArr = g0Var2.f97834a;
                int i19 = i17 >> 3;
                int i21 = i5;
                int i22 = (i17 & 7) << 3;
                long j13 = (jArr[i19] >>> i22) | ((jArr[i19 + 1] << (64 - i22)) & ((-i22) >> 63));
                long j14 = i15;
                long j15 = j13 ^ (j14 * 72340172838076673L);
                long j16 = (j15 - 72340172838076673L) & (~j15) & (-9187201950435737472L);
                while (true) {
                    if (j16 == j12) {
                        break;
                    }
                    iNumberOfTrailingZeros2 = (i17 + (Long.numberOfTrailingZeros(j16) >> 3)) & i16;
                    long j17 = j12;
                    if (g0Var2.f97835b[iNumberOfTrailingZeros2] == jV) {
                        z11 = true;
                        break loop0;
                    }
                    j16 &= j16 - 1;
                    j12 = j17;
                }
                i18 += 8;
                i17 = (i17 + i18) & i16;
                i11 = i11;
                i5 = i21;
                j12 = j11;
            }
            g0Var2.f97835b[iNumberOfTrailingZeros2] = jV;
            return z11;
        }
        if (!p3.i.t(iX, 1)) {
            return true;
        }
        g0 g0Var3 = this.f56879f;
        if (g0Var3 == null || !g0Var3.a(jV)) {
            return false;
        }
        g0 g0Var4 = this.f56879f;
        if (g0Var4 != null) {
            int iHashCode2 = Long.hashCode(jV) * (-862048943);
            int i23 = iHashCode2 ^ (iHashCode2 << 16);
            int i24 = i23 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
            int i25 = g0Var4.f97836c;
            int i26 = i23 >>> 7;
            loop5: while (true) {
                int i27 = i26 & i25;
                long[] jArr2 = g0Var4.f97834a;
                int i28 = i27 >> 3;
                int i29 = (i27 & 7) << 3;
                long j18 = ((jArr2[i28 + 1] << (64 - i29)) & ((-i29) >> 63)) | (jArr2[i28] >>> i29);
                long j19 = (i24 * 72340172838076673L) ^ j18;
                long j21 = (~j19) & (j19 - 72340172838076673L) & (-9187201950435737472L);
                while (true) {
                    if (j21 == 0) {
                        break;
                    }
                    iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j21) >> 3) + i27) & i25;
                    if (g0Var4.f97835b[iNumberOfTrailingZeros] == jV) {
                        break loop5;
                    }
                    j21 &= j21 - 1;
                }
                i12 += 8;
                i26 = i27 + i12;
            }
            if (iNumberOfTrailingZeros >= 0) {
                g0Var4.f97837d--;
                long[] jArr3 = g0Var4.f97834a;
                int i31 = g0Var4.f97836c;
                int i32 = iNumberOfTrailingZeros >> 3;
                int i33 = (iNumberOfTrailingZeros & 7) << 3;
                long j22 = (jArr3[i32] & (~(255 << i33))) | (254 << i33);
                jArr3[i32] = j22;
                jArr3[(((iNumberOfTrailingZeros - 7) & i31) + (i31 & 7)) >> 3] = j22;
                return true;
            }
        }
        return true;
    }
}
