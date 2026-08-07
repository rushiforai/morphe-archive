.class public Ll/was;
.super Ll/p4;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;


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

.method public static synthetic d(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/was;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic e(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/vap/mix/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/was;->i(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/vap/mix/c;)V

    return-void
.end method

.method public static synthetic f(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/was;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method

.method private g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

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
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

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
    iget-object v0, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 31
    .line 32
    iget-object p0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 33
    .line 34
    sget v1, Ll/bnl0;->e:I

    .line 35
    .line 36
    const/high16 v2, 0x42c80000    # 100.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;->o()Z

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
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/p4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/was;->g()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 8
    .line 9
    iget-object v1, p0, Ll/p4;->a:Ll/las;

    .line 10
    .line 11
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/qas;

    .line 15
    .line 16
    invoke-direct {v2, v1}, Ll/qas;-><init>(Ll/las;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;->u(Ll/x20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/was;->l(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/p4;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;->o()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;->r()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/ynp0;->E(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

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

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/was;->k(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/vap/mix/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/las;->Y3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/was;->k(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
            "Landroid/util/Pair<",
            "Landroid/graphics/Bitmap;",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/uas;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/uas;-><init>(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/wqe;->b(Ljava/lang/String;Ll/y20;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v1, p0, Ll/p4;->a:Ll/las;

    .line 18
    .line 19
    iget-object v2, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ll/las;->Z3(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 25
    .line 26
    new-instance v2, Ll/vas;

    .line 27
    .line 28
    invoke-direct {v2, p0, p1}, Ll/vas;-><init>(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->setOnResourceClickListener(Ll/ln50;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/was;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;

    .line 35
    .line 36
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/VapPlayerView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Landroid/util/Pair;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "context_livingAct"

    .line 6
    .line 7
    invoke-static {v2, v1}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v2, v3}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Ll/sas;

    .line 18
    .line 19
    invoke-direct {v3}, Ll/sas;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v2, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/tas;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Ll/tas;-><init>(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method
