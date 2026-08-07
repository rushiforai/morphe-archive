.class public Ll/cv40;
.super Ll/nn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/nn2<",
        "TD;",
        "Ll/gv40;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ll/mw4;

.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public final o:Ll/pv40;


# direct methods
.method public constructor <init>(Ll/dum;Ll/mw4;Ll/pv40;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Ll/mw4;",
            "Ll/pv40;",
            "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;",
            "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/nn2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/cv40;->j:Ll/mw4;

    .line 5
    .line 6
    new-instance p2, Ll/gv40;

    .line 7
    .line 8
    invoke-direct {p2, p4}, Ll/gv40;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    iput-object p3, p0, Ll/cv40;->o:Ll/pv40;

    .line 15
    .line 16
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Ll/vwt;->O6()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    new-instance p2, Ll/a3c;

    .line 27
    .line 28
    invoke-direct {p2, p1, p5}, Ll/a3c;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static synthetic d4(Ll/cv40;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cv40;->m4(Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->isInUse:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic f4(Ll/cv40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cv40;->k4()V

    return-void
.end method

.method public static synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->status:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItemStatus;

    .line 2
    .line 3
    const-string v0, "locked"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic h4(Ll/cv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cv40;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cv40;->o:Ll/pv40;

    .line 5
    .line 6
    new-instance v1, Ll/zu40;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/zu40;-><init>(Ll/cv40;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/pv40;->O3(Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Y3(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/nn2;->Y3(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p1, Ll/gv40;

    .line 9
    .line 10
    iget-object p1, p1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setHeightProgress(F)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/gv40;

    .line 20
    .line 21
    iget-object p1, p1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 22
    .line 23
    const/16 v0, 0x1ea

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setJumpAnimProgressIndex(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p1, Ll/gv40;

    .line 31
    .line 32
    iget-object p1, p1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setAnimMode(Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/cv40;->j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSelectedItemChange()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public Z3(ZI)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/nn2;->Z3(ZI)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    int-to-float p1, p2

    .line 9
    const/high16 p2, 0x43700000    # 240.0f

    .line 10
    .line 11
    cmpg-float v1, p1, p2

    .line 12
    .line 13
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    if-gtz v1, :cond_0

    .line 16
    .line 17
    div-float p2, p1, p2

    .line 18
    .line 19
    check-cast v2, Ll/gv40;

    .line 20
    .line 21
    iget-object v0, v2, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setHeightProgress(F)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    check-cast v2, Ll/gv40;

    .line 28
    .line 29
    iget-object p2, v2, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setHeightProgress(F)V

    .line 32
    .line 33
    .line 34
    :goto_0
    const/high16 p2, 0x42480000    # 50.0f

    .line 35
    .line 36
    cmpl-float v0, p1, p2

    .line 37
    .line 38
    if-lez v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/gv40;

    .line 43
    .line 44
    iget-object p0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 45
    .line 46
    sub-float/2addr p1, p2

    .line 47
    float-to-int p1, p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setJumpAnimProgressIndex(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    int-to-float p1, p2

    .line 53
    const/high16 p2, 0x43340000    # 180.0f

    .line 54
    .line 55
    div-float p2, p1, p2

    .line 56
    .line 57
    sub-float p2, v0, p2

    .line 58
    .line 59
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 60
    .line 61
    check-cast v1, Ll/gv40;

    .line 62
    .line 63
    iget-object v1, v1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 64
    .line 65
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setHeightProgress(F)V

    .line 66
    .line 67
    .line 68
    const/high16 p2, 0x42a00000    # 80.0f

    .line 69
    .line 70
    cmpg-float v1, p1, p2

    .line 71
    .line 72
    if-gez v1, :cond_2

    .line 73
    .line 74
    div-float/2addr p1, p2

    .line 75
    sub-float/2addr v0, p1

    .line 76
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast p0, Ll/gv40;

    .line 79
    .line 80
    iget-object p0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setAlpProgress(F)V

    .line 83
    .line 84
    .line 85
    :cond_2
    return-void
.end method

.method public a4(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/nn2;->a4(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p1, Ll/gv40;

    .line 9
    .line 10
    iget-object p1, p1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/gv40;

    .line 20
    .line 21
    iget-object p1, p1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setHeightProgress(F)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Ll/gv40;

    .line 30
    .line 31
    iget-object p1, p1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setAnimMode(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/gv40;

    .line 40
    .line 41
    iget-object p1, p1, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setJumpAnimProgressIndex(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/cv40;->j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSelectedItemChange()Ll/v3f$d;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public i4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cv40;->m:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cv40;->n:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cv40;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object v0, p0, Ll/cv40;->l:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "restoreSelectedItemFromSavedValue"

    .line 12
    .line 13
    invoke-static {v0}, Ll/cej0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/cv40;->p4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/cv40;->l:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 21
    .line 22
    invoke-static {}, Ll/cej0;->b()V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p0, Ll/cv40;->l:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 26
    .line 27
    return-object p0
.end method

.method public final synthetic k4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cv40;->o:Ll/pv40;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pv40;->N3()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/cv40;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cv40;->m:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->subType:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll/cv40;->n:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic m4(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/bv40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bv40;-><init>(Ll/cv40;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Ll/cv40;->m:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Ll/cv40;->n:Ljava/lang/String;

    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    return-object p0
.end method

.method public n4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->status:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItemStatus;

    .line 2
    .line 3
    const-string v1, "locked"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->noPermissionWarnText:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "anchor_id"

    .line 31
    .line 32
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "bullet_type"

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string v2, "live_id"

    .line 53
    .line 54
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    filled-new-array {v1, p1, p0}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "e_live_bullet_icon_lock"

    .line 63
    .line 64
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-virtual {p0}, Ll/cv40;->j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    iput-object p1, p0, Ll/cv40;->l:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 82
    .line 83
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 84
    .line 85
    check-cast v0, Ll/gv40;

    .line 86
    .line 87
    invoke-virtual {v0, p1}, Ll/gv40;->j(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSelectedItemChange()Ll/v3f$d;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object p0, p0, Ll/cv40;->l:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 101
    .line 102
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final o4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/cv40;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cv40;->m:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cv40;->n:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->fixedTypes:Ljava/util/List;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->floatTypes:Ljava/util/List;

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    new-array v2, v2, [Ljava/util/List;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    aput-object v0, v2, v3

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    aput-object v1, v2, v0

    .line 31
    .line 32
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/av40;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/av40;-><init>(Ll/cv40;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Ll/cv40;->l:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 46
    .line 47
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v0, Ll/gv40;

    .line 50
    .line 51
    iget-object v1, p0, Ll/cv40;->j:Ll/mw4;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/mw4;->q4()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, p1, v1}, Ll/gv40;->k(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/cv40;->j:Ll/mw4;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/mw4;->q4()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/cv40;->j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSelectedItemChange()Ll/v3f$d;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public final p4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cv40;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    .line 2
    .line 3
    new-instance v1, Ll/xu40;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/xu40;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->find(Ll/qcj;)Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/cv40;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    .line 15
    .line 16
    new-instance v0, Ll/yu40;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/yu40;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->find(Ll/qcj;)Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    if-nez v0, :cond_1

    .line 26
    .line 27
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/NoneDefaultDanmakuError;

    .line 28
    .line 29
    const-string v1, "None item selected by default"

    .line 30
    .line 31
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/NoneDefaultDanmakuError;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-object v0
.end method

.method public q4(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gv40;

    .line 4
    .line 5
    iget-object p0, p0, Ll/gv40;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 6
    .line 7
    int-to-float p1, p1

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;->setEditHeight(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
