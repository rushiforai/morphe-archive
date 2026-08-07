.class public Ll/vbn;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/acn;",
        ">;"
    }
.end annotation


# instance fields
.field public i:J

.field public j:Z


# direct methods
.method public constructor <init>(Ll/dum;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/acn;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/acn;-><init>(Landroid/widget/FrameLayout;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    const-string p0, "e_intl_emoticon_click"

    .line 2
    .line 3
    const-string v0, "p_intl_emoticon_panel_show"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic K3(Ll/vbn;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vbn;->P3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic L3(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;)V
    .locals 1

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->categoryTitle:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    const-string p0, "dynamic"

    .line 7
    .line 8
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->categoryType:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->buttons:Ljava/util/List;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private N3()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/vbn;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/vbn;->i:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0x1770

    .line 13
    .line 14
    cmp-long p0, v0, v2

    .line 15
    .line 16
    if-ltz p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method private P3(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Ll/sbn;

    .line 17
    .line 18
    invoke-direct {v3, v0, v1, v2}, Ll/sbn;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p0, Ll/acn;

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1, v2}, Ll/acn;->p(Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public O3(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/vbn;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yg:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput-boolean p2, p0, Ll/vbn;->j:Z

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Ll/vbn;->i:J

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1, p1}, Ll/u9o0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Ll/tbn;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/tbn;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ll/ubn;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/ubn;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    if-eqz p2, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->dismissDialog()Ll/v3f$c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/u9o0;->b()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/rbn;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/rbn;-><init>(Ll/vbn;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ll/r5k;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method
