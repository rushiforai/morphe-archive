.class public Ll/x3l;
.super Ll/yw80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/yw80<",
        "Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/kv80;)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-direct {p0, v0, p1}, Ll/yw80;-><init>(ILl/kv80;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic N(Ll/x3l;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x3l;->T(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O(Ll/x3l;Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x3l;->V(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;Ll/vxj0;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;->setCheckBoxIsOpen(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHiddenConsumeRecordButton;->hiddenAnchorHierarchyOn:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;->setCheckBoxIsOpen(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private T(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const p1, 0xa947

    .line 10
    .line 11
    .line 12
    if-ne p0, p1, :cond_0

    .line 13
    .line 14
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 15
    .line 16
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->Y:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 27
    .line 28
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->l0:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public bridge synthetic J(Ll/vx80;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/x3l;->X(Ll/vx80;Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic L(Ll/vx80;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/x3l;->Y(Ll/vx80;Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->V:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public S(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->W:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final U(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;->getCheckBoxIsOpen()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;->setCheckBoxIsOpen(Z)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 11
    .line 12
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->X:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x3l;->U(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;->k0(Ll/x3l;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yw80;->H()Ll/kv80;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0, p0, p1}, Ll/kv80;->b(Ll/yw80;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public X(Ll/vx80;Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/module/api/LivePrivacyApiProvider;->getHideConsumeRecordEnable(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/t3l;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/t3l;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/u3l;

    .line 19
    .line 20
    invoke-direct {v0, p2}, Ll/u3l;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public Y(Ll/vx80;Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;->getCheckBoxIsOpen()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LivePrivacyApiProvider;->setHideLiveAnchorLevelEnable(Ljava/lang/String;Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/v3l;

    .line 18
    .line 19
    invoke-direct {v0, p0, p2}, Ll/v3l;-><init>(Ll/x3l;Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V

    .line 20
    .line 21
    .line 22
    new-instance p2, Ll/w3l;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/w3l;-><init>(Ll/x3l;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->y0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x3l;->W(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideLiveAnchorLevelView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
