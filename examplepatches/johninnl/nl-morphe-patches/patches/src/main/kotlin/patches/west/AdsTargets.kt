package patches.west

import com.android.tools.smali.dexlib2.Opcode

// Original West 20.1 boundaries. Keep native content and completion graphs.
internal val adsTargets = listOf(
    OwnedMethod("Lnl/stichtingrpo/news/base/BaseController;", "buildComponent(Lh01;Let5;)Z", 0x11, 32, 1823, listOf(
        OwnedEdit(21, listOf(Opcode.IGET_OBJECT), listOf("Lpo5;->B:Lz9;"), listOf("const/4 v4, 0x0", "nop"), target = 1822, branch = 1),
        // The absent-component result omits the newsletter and its feed space.
        OwnedEdit(1463, listOf(Opcode.IGET_OBJECT), listOf("Lpo5;->A0:Lhx;"), listOf("const/4 v4, 0x0", "nop"), target = 1822, branch = 1),
    )),
    OwnedMethod("Lhx;", "L(Lmb5;Let5;)V", 0x1, 6, 22, listOf(
        // Direct builder entry must omit both its heading and signup form.
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Ly43;", "T(Lt43;Ly43;Let5;Lxp5;Lki6;)V", 0x19, 12, 69, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Ly43;", "W(Lia5;Ly43;Lxp5;Lka5;Let5;Z)V", 0x19, 13, 95, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Ly43;", "U(Ly43;Lt9;)Z", 0x19, 4, 25, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x0", "return p0")),
    )),
    OwnedMethod("Ly43;", "X(Ly43;Lt9;)Z", 0x19, 4, 25, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x0", "return p0")),
    )),
    OwnedMethod("Lvb3;", "L(Lub3;Let5;)Z", 0x11, 26, 233, listOf(
        OwnedEdit(3, listOf(Opcode.IGET_OBJECT), listOf("Lub3;->i:Lt9;"), listOf("const/4 v2, 0x0")),
    )),
    OwnedMethod("Lot9;", "e(Lqm5;Let5;Lxp5;)Z", 0x1, 14, 197, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return v0")),
    )),
    OwnedMethod("Lnl/stichtingrpo/news/views/epoxy/models/OutbrainModel;", "bind(Lnl/stichtingrpo/news/databinding/ListComponentOutbrainBinding;)V", 0x1, 9, 61, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("invoke-virtual {p1}, Lnl/stichtingrpo/news/databinding/ListComponentOutbrainBinding;->getRoot()Lnl/stichtingrpo/news/views/SmartFeedWidget;", "move-result-object v0", "const/16 v1, 0x8", "invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V", "return-void")),
    )),
    OwnedMethod("Lcom/startapp/sdk/adsbase/StartAppInitProvider;", "attachInfo(Landroid/content/Context;Landroid/content/pm/ProviderInfo;)V", 0x11, 3, 3, listOf(
        OwnedEdit(1, listOf(Opcode.INVOKE_STATIC), listOf("Lcom/startapp/sdk/internal/xh;->c(Landroid/content/Context;)V"), listOf("nop")),
    )),
    OwnedMethod("Lnl/pinch/optoutadvertising/sdk/ui/OptOutAdView;", "e(Lz7;)V", 0x11, 5, 16, listOf(
        OwnedEdit(9, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Advertising disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "invoke-interface {p1, v0}, Lz7;->onFailure(Ljava/lang/Throwable;)V", "return-void")),
    )),
    OwnedMethod("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;", "getAdSchedulingData()Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;", 0x11, 1, 2, listOf(
        OwnedEdit(0, listOf(Opcode.IGET_OBJECT), listOf("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;->adSchedulingData:Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;"), listOf("const/4 p0, 0x0")),
    )),
    OwnedMethod("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;", "getAdServicesData()Ljava/util/List;", 0x11, 1, 2, listOf(
        OwnedEdit(0, listOf(Opcode.IGET_OBJECT), listOf("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;->adServicesData:Ljava/util/List;"), listOf("const/4 p0, 0x0")),
    )),
    OwnedMethod("Lv70;", "l(Ljava/lang/String;Ljava/util/Map;)V", 0x11, 23, 368, listOf(
        OwnedEdit(11, listOf(Opcode.IGET_BOOLEAN), listOf("Lv70;->C1:Z"), listOf("const/4 v2, 0x0")),
    )),
    OwnedMethod("Lv70;", "H(Lpn;Ljava/util/Map;)V", 0x11, 33, 850, listOf(
        OwnedEdit(656, listOf(Opcode.INSTANCE_OF), listOf("Ljava/util/List;"), listOf("const/4 v11, 0x0")),
    )),
    OwnedMethod("Lv70;", "i(Lse2;Ljava/util/Map;)V", 0x11, 23, 2215, listOf(
        OwnedEdit(1247, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v4, 0x0")),
        OwnedEdit(1259, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v4, 0x0")),
    )),
    OwnedMethod("Lr96;", "i(Lse2;Ljava/util/Map;)V", 0x11, 19, 934, listOf(
        OwnedEdit(657, listOf(Opcode.NEW_INSTANCE, Opcode.IGET_OBJECT, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.IGET_OBJECT, Opcode.IPUT_OBJECT), listOf("Lx25;", "Lr96;->a:Lwd2;", "Lx25;-><init>(Lwd2;Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V", "Lr96;->q0:Lx25;", "Lr96;->O0:Lp7;", "Lx25;->b:Lp7;"), listOf("nop", "nop", "nop", "nop", "nop", "nop")),
        OwnedEdit(723, listOf(Opcode.NEW_INSTANCE, Opcode.IGET_OBJECT, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.IGET_OBJECT, Opcode.IPUT_OBJECT), listOf("Lx25;", "Lr96;->a:Lwd2;", "Lx25;-><init>(Lwd2;Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V", "Lr96;->q0:Lx25;", "Lr96;->O0:Lp7;", "Lx25;->b:Lp7;"), listOf("nop", "nop", "nop", "nop", "nop", "nop")),
        OwnedEdit(793, listOf(Opcode.NEW_INSTANCE, Opcode.IGET_OBJECT, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.IGET_OBJECT, Opcode.IPUT_OBJECT), listOf("Lx25;", "Lr96;->a:Lwd2;", "Lx25;-><init>(Lwd2;Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V", "Lr96;->q0:Lx25;", "Lr96;->O0:Lp7;", "Lx25;->b:Lp7;"), listOf("nop", "nop", "nop", "nop", "nop", "nop")),
    )),
    OwnedMethod("Lgp2;", "<clinit>()V", 0x10008, 2, 10, listOf(
        OwnedEdit(7, listOf(Opcode.SPUT_BOOLEAN), listOf("Lgp2;->b:Z"), listOf("const/4 v1, 0x0", "sput-boolean v1, Lgp2;->b:Z")),
    )),
)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun applyAdEdits() = applyOwnedEdits(adsTargets)
