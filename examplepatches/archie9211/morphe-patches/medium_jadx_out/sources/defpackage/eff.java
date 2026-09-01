package defpackage;

import com.medium.android.yourlibrary.YourLibraryTab;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Leff;", "Lque;", "cp2", "cff", "yourlibrary_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class eff extends que {
    public static final x1 d = bo.Z(YourLibraryTab.YOUR_LISTS, YourLibraryTab.SAVED_LISTS, YourLibraryTab.DIGEST, YourLibraryTab.HIGHLIGHTS, YourLibraryTab.READING_HISTORY, YourLibraryTab.RESPONSES);
    public final vob b;
    public final wua c;

    public eff(YourLibraryTab yourLibraryTab, vob vobVar) {
        yourLibraryTab.getClass();
        vobVar.getClass();
        this.b = vobVar;
        x1 x1Var = d;
        wua wuaVarC = vobVar.c("selected_tab", x1Var.contains(yourLibraryTab) ? yourLibraryTab : YourLibraryTab.YOUR_LISTS);
        this.c = bo.e0(new w23(wuaVarC, 2), f76.F(this), new ync(5000L, Long.MAX_VALUE), new cff(x1Var, (YourLibraryTab) wuaVarC.a.getValue()));
    }
}
