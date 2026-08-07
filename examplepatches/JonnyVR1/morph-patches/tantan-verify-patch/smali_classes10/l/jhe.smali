.class public Ll/jhe;
.super Ll/l4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/momo/xeengine/gift/GiftEntity;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->key:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->value:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/momo/xeengine/gift/GiftEntity;->setExtendValues(Ljava/lang/String;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Lcom/momo/xeengine/gift/GiftEntity;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->i(Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/hre;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hre;->a()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-interface {p1}, Ll/x20;->call()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ll/jhe;Ll/hre;Ll/x20;Ll/udl0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/jhe;->q(Ll/hre;Ll/x20;Ll/udl0;)V

    return-void
.end method

.method public static r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/hre;->g()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/che;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/che;-><init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/wqe;->b(Ljava/lang/String;Ll/y20;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const-string v1, "dynamicGift"

    .line 21
    .line 22
    invoke-static {v1}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/jhe;

    .line 27
    .line 28
    new-instance v2, Ll/dhe;

    .line 29
    .line 30
    invoke-direct {v2, p0, p1}, Ll/dhe;-><init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0, p1, v2}, Ll/jhe;->p(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Ll/hre;Ll/x20;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    :goto_0
    return-void

    .line 40
    :cond_2
    invoke-virtual {v1, v0}, Ll/jhe;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Lcom/momo/xeengine/gift/GiftEntity;

    .line 45
    .line 46
    invoke-direct {v1}, Lcom/momo/xeengine/gift/GiftEntity;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/momo/xeengine/gift/GiftEntity;->setPath(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/momo/xeengine/gift/SVGAPositionType;->BOTTOM:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Lcom/momo/xeengine/gift/GiftEntity;->setPositionType(Lcom/momo/xeengine/gift/SVGAPositionType;)V

    .line 55
    .line 56
    .line 57
    sget-object v0, Lcom/momo/xeengine/gift/SVGAScaleType;->ASPECT_FIT:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Lcom/momo/xeengine/gift/GiftEntity;->setScaleType(Lcom/momo/xeengine/gift/SVGAScaleType;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ll/hre;->g()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v1, v0}, Lcom/momo/xeengine/gift/GiftEntity;->setId(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ll/hre;->c()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/hre;->c()Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v2, Ll/ehe;

    .line 80
    .line 81
    invoke-direct {v2, v1}, Ll/ehe;-><init>(Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->j()V

    .line 88
    .line 89
    .line 90
    const/4 v0, 0x0

    .line 91
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/game/XEGameView;->setTouchEnable(Z)V

    .line 92
    .line 93
    .line 94
    new-instance v0, Ll/jhe$a;

    .line 95
    .line 96
    invoke-direct {v0, p0, p1}, Ll/jhe$a;-><init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->setListener(Lcom/momo/xeengine/gift/GiftPlayerListener;)V

    .line 100
    .line 101
    .line 102
    const/4 p1, 0x1

    .line 103
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_4

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->i(Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_4
    new-instance p1, Ll/fhe;

    .line 117
    .line 118
    invoke-direct {p1, p0, v1}, Ll/fhe;-><init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public static s(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/hre;->g()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/bhe;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/bhe;-><init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/wqe;->b(Ljava/lang/String;Ll/y20;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const-string v1, "dynamicGift"

    .line 21
    .line 22
    invoke-static {v1}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/jhe;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ll/jhe;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->g(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/hre;->c()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/hre;->c()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->k(Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void

    .line 52
    :cond_3
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, p1}, Ll/w5;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l4;->a:Ll/wpq0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Ll/w5;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/wpq0;->v(Ljava/io/File;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    new-instance p0, Ljava/io/File;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/udl0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v0, "effect no config"

    .line 57
    .line 58
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Ll/muj;->u(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return v1
.end method

.method public f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z
    .locals 10

    .line 1
    invoke-virtual {p0, p1}, Ll/l4;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v2, p0, Ll/l4;->a:Ll/wpq0;

    .line 10
    .line 11
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v2, v3, v4, v5}, Ll/w5;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Ll/l4;->a:Ll/wpq0;

    .line 22
    .line 23
    invoke-virtual {v3, v2, p1}, Ll/wpq0;->v(Ljava/io/File;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_1
    if-eqz p2, :cond_2

    .line 39
    .line 40
    iget-object v2, p0, Ll/l4;->a:Ll/wpq0;

    .line 41
    .line 42
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 47
    .line 48
    const-string p0, "IMMEDIATE"

    .line 49
    .line 50
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/Priority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    move-object v3, p1

    .line 55
    move-object v8, p3

    .line 56
    move-object v9, p4

    .line 57
    invoke-virtual/range {v2 .. v9}, Ll/w5;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/w8e;Ll/e4d0;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return v1
.end method

.method public final o(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;
    .locals 4
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_8

    .line 6
    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_5

    .line 66
    .line 67
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/immomo/velib/anim/model/Element;

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/Element;->getId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    if-nez v2, :cond_3

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 85
    .line 86
    invoke-interface {p0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_2

    .line 91
    .line 92
    if-eqz v3, :cond_2

    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->typeIsImageUrl()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    iget-object v2, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->value:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->typeIsText()Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_2

    .line 111
    .line 112
    iget-object v2, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->value:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-nez p0, :cond_6

    .line 123
    .line 124
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p2, "user_avatar"

    .line 129
    .line 130
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->key:Ljava/lang/String;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->value:Ljava/util/List;

    .line 133
    .line 134
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :cond_6
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-nez p0, :cond_7

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const-string p2, "user_name"

    .line 148
    .line 149
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->key:Ljava/lang/String;

    .line 150
    .line 151
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->value:Ljava/util/List;

    .line 152
    .line 153
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    :cond_7
    return-object p1

    .line 157
    :cond_8
    :goto_2
    const/4 p0, 0x0

    .line 158
    return-object p0
.end method

.method public p(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Ll/hre;Ll/x20;)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Ll/hre;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/hre;->a()V

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    invoke-virtual {p2}, Ll/hre;->d()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    iget-object v0, p0, Ll/l4;->a:Ll/wpq0;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, p1}, Ll/w5;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/ghe;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/ghe;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Ll/hhe;

    .line 61
    .line 62
    invoke-direct {v0, p0, p2, p3}, Ll/hhe;-><init>(Ll/jhe;Ll/hre;Ll/x20;)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Ll/ihe;

    .line 66
    .line 67
    invoke-direct {p0, p2, p3}, Ll/ihe;-><init>(Ll/hre;Ll/x20;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x1

    .line 78
    return p0
.end method

.method public final synthetic q(Ll/hre;Ll/x20;Ll/udl0;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ll/udl0;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/hre;->d()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p3}, Ll/udl0;->b()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p0, v0, p3}, Ll/jhe;->o(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Ll/hre;->j(Ljava/util/List;)Ll/hre;

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p1}, Ll/hre;->a()V

    .line 27
    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    invoke-interface {p2}, Ll/x20;->call()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method
