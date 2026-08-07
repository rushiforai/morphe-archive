.class public abstract Ll/rs2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sam;
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/tcn0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/sam<",
        "Ll/ixm0;",
        ">;",
        "Landroid/view/Choreographer$FrameCallback;"
    }
.end annotation


# instance fields
.field public a:Ll/ixm0;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation
.end field

.field public c:Landroid/view/View;

.field public final d:Landroid/view/Choreographer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rs2;->d:Landroid/view/Choreographer;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/rs2;Ll/rwn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rs2;->j(Ll/rwn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/rs2;->b:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/rs2;->f(I)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method private i()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/rs2;->d()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/rs2;->b:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public D(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/rs2;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 14
    .line 15
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/tcn0;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/tcn0;->D(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/rs2;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 14
    .line 15
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/tcn0;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/tcn0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public Q3(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/tcn0;

    .line 16
    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    iget-object p0, p0, Ll/rs2;->a:Ll/ixm0;

    .line 20
    .line 21
    invoke-interface {v0, p1, p2, p0}, Ll/tcn0;->h(IZLl/ixm0;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public W1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/tcn0;

    .line 10
    .line 11
    invoke-interface {p0, p2, p3, p4}, Ll/tcn0;->d(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(Ll/ixm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rs2;->a:Ll/ixm0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/rs2;->d:Landroid/view/Choreographer;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b1(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/tcn0;

    .line 16
    .line 17
    invoke-interface {p0, p2}, Ll/tcn0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;)Ll/wao0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rs2;->a:Ll/ixm0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ixm0;->k4()Ljava/util/HashMap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of p1, p0, Ll/wao0;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    check-cast p0, Ll/wao0;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public c1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/tcn0;

    .line 10
    .line 11
    invoke-interface {p0, p2, p3}, Ll/tcn0;->b(Ljava/util/List;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public abstract d()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/rs2;->e()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/rs2;->setVisible(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rs2;->d:Landroid/view/Choreographer;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public doFrame(J)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/rs2;->a:Ll/ixm0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ll/hrk0;->p()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance v0, Ll/qs2;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/qs2;-><init>(Ll/rs2;Ll/rwn0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/rs2;->d:Landroid/view/Choreographer;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public f(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/tcn0;

    .line 16
    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    iget-object p0, p0, Ll/rs2;->a:Ll/ixm0;

    .line 20
    .line 21
    invoke-interface {v0, p1, p0}, Ll/tcn0;->f(ILl/ixm0;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public g(Landroid/content/Context;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rs2;->c:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, p1, v0}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/rs2;->c:Landroid/view/View;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/rs2;->i()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ll/rs2;->c:Landroid/view/View;

    .line 20
    .line 21
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ixm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rs2;->b(Ll/ixm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j(Ll/rwn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 20
    .line 21
    iget-object v3, p0, Ll/rs2;->b:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-ge v2, v3, :cond_0

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 38
    .line 39
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 40
    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->totalSec:I

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->endMill:J

    .line 48
    .line 49
    cmp-long p1, v3, v0

    .line 50
    .line 51
    if-lez p1, :cond_0

    .line 52
    .line 53
    mul-int/lit16 v2, v2, 0x3e8

    .line 54
    .line 55
    int-to-float p1, v2

    .line 56
    const-wide/16 v5, 0x3e8

    .line 57
    .line 58
    sub-long/2addr v3, v5

    .line 59
    sub-long/2addr v3, v0

    .line 60
    long-to-float v0, v3

    .line 61
    div-float/2addr v0, p1

    .line 62
    const/high16 p1, 0x42c80000    # 100.0f

    .line 63
    .line 64
    mul-float/2addr v0, p1

    .line 65
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 66
    .line 67
    iget p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 68
    .line 69
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ll/tcn0;

    .line 74
    .line 75
    invoke-interface {p0, v0}, Ll/tcn0;->i(F)V

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public j2(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/tcn0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/tcn0;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/rs2;->b:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/rs2;->f(I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/rs2;->b:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/tcn0;

    .line 20
    .line 21
    iget-object v2, p0, Ll/rs2;->a:Ll/ixm0;

    .line 22
    .line 23
    invoke-interface {v1, v0, v2}, Ll/tcn0;->c(ILl/ixm0;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public setData(Ll/hrk0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/hrk0;->p()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Ll/rs2;->e()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v2}, Ll/rs2;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public setVisible(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rs2;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/rs2;->setVisible(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rs2;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 7

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    invoke-virtual {p1}, Ll/hrk0;->r()Ll/ado0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 18
    .line 19
    if-ltz p1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/rs2;->b:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-lt p1, v0, :cond_1

    .line 28
    .line 29
    :cond_0
    move-object v2, p2

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    if-eqz v4, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Ll/rs2;->b:Ljava/util/List;

    .line 34
    .line 35
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    move-object v1, p1

    .line 42
    check-cast v1, Ll/tcn0;

    .line 43
    .line 44
    iget-object v5, p0, Ll/rs2;->a:Ll/ixm0;

    .line 45
    .line 46
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/rs2;->c(Ljava/lang/String;)Ll/wao0;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    move-object v2, p2

    .line 53
    invoke-interface/range {v1 .. v6}, Ll/tcn0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ll/nsv;Ll/ixm0;Ll/wao0;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void

    .line 57
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string p1, "illegal call,id="

    .line 60
    .line 61
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p1, ",position:"

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget p1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "[voice][call]"

    .line 84
    .line 85
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
