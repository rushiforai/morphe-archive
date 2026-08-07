.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;Ll/ohg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->V(Ll/ohg;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Ll/acg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->hideFansRecallSelectPanel()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic R(Ll/ohg;Ll/acg;Landroid/view/View;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ohg;->h0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-nez p2, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ohg;->h0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const-string v0, "[]"

    .line 21
    .line 22
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->showEditDialog()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/kig;

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    invoke-virtual {p0}, Ll/ohg;->h0()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-direct {p2, v0, p0}, Ll/kig;-><init>(ZLjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    :goto_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->u4:I

    .line 54
    .line 55
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 56
    .line 57
    .line 58
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;Ll/ohg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->W(Ll/ohg;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h6g;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Ll/ohg;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->c:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->c:Lv/VImage;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Ll/ohg;->g0(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic W(Ll/ohg;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->c:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->c:Lv/VImage;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Ll/ohg;->g0(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public X(Ll/ohg;Ll/acg;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->c:Lv/VImage;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->c:Lv/VImage;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/ohg;->i0(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->c:Lv/VImage;

    .line 17
    .line 18
    new-instance v1, Ll/d6g;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/d6g;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;Ll/ohg;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->d:Lv/VText;

    .line 27
    .line 28
    new-instance v1, Ll/e6g;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/e6g;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;Ll/ohg;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->f:Lv/VText;

    .line 37
    .line 38
    new-instance v1, Ll/f6g;

    .line 39
    .line 40
    invoke-direct {v1, p2}, Ll/f6g;-><init>(Ll/acg;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->e:Lv/VText;

    .line 47
    .line 48
    new-instance v0, Ll/g6g;

    .line 49
    .line 50
    invoke-direct {v0, p1, p2}, Ll/g6g;-><init>(Ll/ohg;Ll/acg;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->T(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
