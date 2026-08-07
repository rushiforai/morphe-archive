.class public Ll/vao0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:J

.field public j:Z

.field public k:Ll/z9o0;

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/oln0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vao0;->l:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ll/z9o0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/z9o0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/vao0;->k:Ll/z9o0;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/z9o0;->c(Ll/vao0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic J3(Ll/vao0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vao0;->h4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic K3(Ll/vao0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vao0;->l4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic L3(Ll/vao0;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vao0;->g4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    return-void
.end method

.method public static synthetic M3(Ll/gvn0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/guk0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic N3(Ll/vao0;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vao0;->e4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    return-void
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/vao0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vao0;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    return-void
.end method

.method public static synthetic R3(Ll/vao0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vao0;->c4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic S3(Ll/vao0;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vao0;->i4(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T3(Ll/vao0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vao0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;)V

    return-void
.end method

.method public static synthetic U3(Ll/vao0;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vao0;->j4(ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic V3(Ll/vao0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vao0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    return-void
.end method

.method private c4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/vao0;->k:Ll/z9o0;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/z9o0;->d()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private synthetic l4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vao0;->b4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n4(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vao0;->W3()Z

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
    iput-boolean p2, p0, Ll/vao0;->j:Z

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Ll/vao0;->i:J

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
    new-instance v0, Ll/kao0;

    .line 50
    .line 51
    invoke-direct {v0, p0, p2}, Ll/kao0;-><init>(Ll/vao0;Z)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ll/lao0;

    .line 55
    .line 56
    invoke-direct {v1, p0, p2}, Ll/lao0;-><init>(Ll/vao0;Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private o4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vao0;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/rao0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/rao0;-><init>(Ll/vao0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/vao0;->k:Ll/z9o0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/vao0;->l:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/z9o0;->i(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final W3()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/vao0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/vao0;->i:J

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
    if-gez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public final X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)Ll/bao0;
    .locals 1

    .line 1
    new-instance v0, Ll/bao0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/bao0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/jao0;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/jao0;-><init>(Ll/vao0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/w9o0;->K(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final Y3(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;",
            ">;)",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    new-instance v1, Ll/sao0;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0}, Ll/sao0;-><init>(Ll/vao0;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)Ll/hao0;
    .locals 1

    .line 1
    new-instance v0, Ll/hao0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/hao0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/uao0;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/uao0;-><init>(Ll/vao0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/w9o0;->K(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final a4(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;",
            ">;)",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    new-instance v1, Ll/tao0;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0}, Ll/tao0;-><init>(Ll/vao0;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public b4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/u9o0;->b()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/qao0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/qao0;-><init>(Ll/vao0;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/r5k;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    const-string p0, "e_intl_emoticon_panel_enter_click"

    .line 27
    .line 28
    const-string v0, "p_intl_emoticon_panel_show"

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->type:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Ll/vao0;->n4(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic e4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/vao0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)Ll/bao0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->type:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p0, p1, v0}, Ll/vao0;->n4(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic g4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/vao0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)Ll/hao0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h4(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vao0;->o4(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/vao0;->k:Ll/z9o0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/z9o0;->j()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic i4(ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/vao0;->k:Ll/z9o0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/z9o0;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic j4(ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    const-string p2, "e_intl_emoticon_click"

    .line 2
    .line 3
    const-string v0, "p_intl_emoticon_panel_show"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/vao0;->k:Ll/z9o0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/z9o0;->d()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;)V
    .locals 3

    .line 1
    const-string v0, "dynamic"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->categoryType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/vao0;->l:Ljava/util/List;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/oln0;

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->buttons:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Ll/vao0;->Y3(Ljava/util/List;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->categoryTitle:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->categoryType:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v0, p0, v2, p1}, Ll/oln0;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v0, Ll/oln0;

    .line 33
    .line 34
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->buttons:Ljava/util/List;

    .line 35
    .line 36
    invoke-virtual {p0, v2}, Ll/vao0;->a4(Ljava/util/List;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->categoryTitle:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->categoryType:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {v0, p0, v2, p1}, Ll/oln0;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public m4(Ll/gvn0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->j()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x4

    .line 6
    if-eq p1, v0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0x9

    .line 9
    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/16 v0, 0xc

    .line 13
    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    const/16 v0, 0xd

    .line 17
    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p0, p0, Ll/vao0;->k:Ll/z9o0;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/z9o0;->d()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/iao0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/iao0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/mao0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/mao0;-><init>(Ll/vao0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMicEmojiEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;->showMicEmojiDialog()Ll/v3f$c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lrx/c;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/nao0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/nao0;-><init>(Ll/vao0;)V

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/oao0;

    .line 69
    .line 70
    invoke-direct {v2}, Ll/oao0;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Ll/rwn0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/pao0;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/pao0;-><init>(Ll/vao0;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method
