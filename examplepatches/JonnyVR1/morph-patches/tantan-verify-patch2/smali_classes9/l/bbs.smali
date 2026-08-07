.class public Ll/bbs;
.super Ll/p4;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;


# direct methods
.method public constructor <init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ll/oo2;",
            ">(",
            "Ll/las;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/p4;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/bbs;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bbs;->f()V

    return-void
.end method

.method private e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 6
    .line 7
    iget-object v1, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/bnl0;->y0()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    mul-int/lit16 v0, v0, 0xc8

    .line 35
    .line 36
    div-int/lit16 v0, v0, 0x177

    .line 37
    .line 38
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    sget v2, Ll/bnl0;->e:I

    .line 41
    .line 42
    invoke-direct {v1, v2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 43
    .line 44
    .line 45
    neg-int v0, v0

    .line 46
    div-int/lit8 v0, v0, 0x2

    .line 47
    .line 48
    const/high16 v2, 0x41f00000    # 30.0f

    .line 49
    .line 50
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v0, v2

    .line 55
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 56
    .line 57
    iget-object v0, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 58
    .line 59
    iget-object p0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 60
    .line 61
    invoke-virtual {v0, p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->f()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/p4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/bbs;->e()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/hre;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/hre;->j(Ljava/util/List;)Ll/hre;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/hre;->k(Ljava/util/List;)Ll/hre;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/abs;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/abs;-><init>(Ll/bbs;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/hre;->i(Ll/x20;)Ll/hre;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 38
    .line 39
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/p4;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->f()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->j()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/ynp0;->E(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/bbs;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {p0, v0}, Ll/ynp0;->v(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/las;->R3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
