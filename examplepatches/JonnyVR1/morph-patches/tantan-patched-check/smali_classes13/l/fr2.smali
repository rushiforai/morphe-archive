.class public abstract Ll/fr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c4m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fr2$d;
    }
.end annotation


# instance fields
.field protected a:Ll/c410;

.field protected b:Ll/z5m;

.field protected c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field protected d:Ll/uow;

.field protected e:Lcom/momo/piplinemomoext/input/audio/a;

.field protected f:Lcom/momo/pipline/MomoInterface/MomoCodec;

.field protected g:Z

.field protected h:Ljava/lang/String;

.field protected i:I

.field private j:Z

.field k:I

.field l:I

.field private m:Ll/j410$b;

.field protected n:J

.field protected o:J

.field p:Lcom/momo/pipline/codec/a;

.field private q:Landroid/os/HandlerThread;

.field private r:Landroid/os/Handler;

.field private s:Ll/l6m$a;

.field private t:Landroid/graphics/Bitmap;

.field private u:Z

.field private v:Ll/brx;

.field protected w:Z

.field private x:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/c410;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/z5m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/uow;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/momo/piplinemomoext/input/audio/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/fr2;->i:I

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/fr2;->j:Z

    .line 8
    .line 9
    iput v0, p0, Ll/fr2;->k:I

    .line 10
    .line 11
    iput v0, p0, Ll/fr2;->l:I

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, p0, Ll/fr2;->n:J

    .line 16
    .line 17
    iput-wide v1, p0, Ll/fr2;->o:J

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/fr2;->q:Landroid/os/HandlerThread;

    .line 21
    .line 22
    iput-object v1, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/fr2;->w:Z

    .line 25
    .line 26
    const-string v1, ""

    .line 27
    .line 28
    iput-object v1, p0, Ll/fr2;->x:Ljava/lang/String;

    .line 29
    .line 30
    iput-object p2, p0, Ll/fr2;->a:Ll/c410;

    .line 31
    .line 32
    iput-object p3, p0, Ll/fr2;->b:Ll/z5m;

    .line 33
    .line 34
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Ll/fr2;->c:Ljava/lang/ref/WeakReference;

    .line 40
    .line 41
    iput-object p4, p0, Ll/fr2;->d:Ll/uow;

    .line 42
    .line 43
    iput-boolean v0, p0, Ll/fr2;->g:Z

    .line 44
    .line 45
    iput-object p5, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 46
    .line 47
    new-instance p1, Landroid/os/HandlerThread;

    .line 48
    .line 49
    const-string p2, "RecordHandlerThread"

    .line 50
    .line 51
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Ll/fr2;->q:Landroid/os/HandlerThread;

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 60
    .line 61
    if-nez p1, :cond_0

    .line 62
    .line 63
    new-instance p1, Ll/fr2$d;

    .line 64
    .line 65
    iget-object p2, p0, Ll/fr2;->q:Landroid/os/HandlerThread;

    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-direct {p1, p0, p2}, Ll/fr2$d;-><init>(Ll/fr2;Landroid/os/Looper;)V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 75
    .line 76
    const-string p0, "BasePusherPipline"

    .line 77
    .line 78
    const-string p1, "RecordHandler new"

    .line 79
    .line 80
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public static synthetic C(Ll/fr2;)Ll/l6m$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n2(Ll/fr2;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o2(Ll/fr2;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fr2;->t:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fr2;->g:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 6
    .line 7
    iput-object v0, p0, Ll/fr2;->b:Ll/z5m;

    .line 8
    .line 9
    iput-object v0, p0, Ll/fr2;->d:Ll/uow;

    .line 10
    .line 11
    iget-object v1, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v1}, Ll/l6m;->stopSurroundMusic()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public A2()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/pipline/codec/a;->f()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/fr2;->b:Ll/z5m;

    .line 13
    .line 14
    iget-object v2, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 15
    .line 16
    invoke-interface {v0, v1, v2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->X(Ll/z5m;Ll/dfj;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 20
    .line 21
    iget-object v1, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/g510;->m()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v0, v1, v2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->I(Ll/wej;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 36
    .line 37
    new-instance v0, Landroid/os/Bundle;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v1, "\u5f55\u5236\u7ed3\u675f"

    .line 43
    .line 44
    const-string v2, "RecordDesc"

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/fr2;->b2()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-interface {v0, v1}, Lcom/momo/piplinemomoext/input/audio/a;->x0(Z)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Landroid/os/Bundle;

    .line 59
    .line 60
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v3, "\u4f34\u594f\u64ad\u653e\u505c\u6b62"

    .line 64
    .line 65
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 69
    .line 70
    if-eqz v2, :cond_1

    .line 71
    .line 72
    const/16 v3, 0x2007

    .line 73
    .line 74
    invoke-interface {v2, v3, v0}, Ll/l6m$a;->a(ILandroid/os/Bundle;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object v2, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 78
    .line 79
    const-string v3, "BasePusherPipline_RecordFile"

    .line 80
    .line 81
    if-eqz v2, :cond_2

    .line 82
    .line 83
    const/16 v4, 0x2011

    .line 84
    .line 85
    invoke-interface {v2, v4, v0}, Ll/l6m$a;->a(ILandroid/os/Bundle;)V

    .line 86
    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    const-string v2, "stopRecordFileIml:"

    .line 91
    .line 92
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v2, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v2, "; this:"

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    const-string v0, "\u5f55\u5236\u7ed3\u675f:"

    .line 116
    .line 117
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iput-boolean v1, p0, Ll/fr2;->u:Z

    .line 121
    .line 122
    :cond_3
    return-void
.end method

.method public C1(Ll/l6m$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 2
    .line 3
    return-void
.end method

.method public F(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/fr2;->x:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 4
    .line 5
    instance-of v1, v0, Ll/tc0;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    instance-of v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x5

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v2

    .line 19
    :goto_0
    invoke-static {v0}, Ll/s5r;->Y(I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, p2}, Ll/s5r;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 26
    .line 27
    invoke-interface {p0, v2}, Lcom/momo/piplinemomoext/input/audio/a;->l(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public G1(Ll/gb1;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/l6m;->G1(Ll/gb1;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 13
    .line 14
    new-instance v0, Ll/fr2$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/fr2$a;-><init>(Ll/fr2;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->o2(Ll/q210$b;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public H(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fr2;->v:Ll/brx;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/brx;->r(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->H(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public I1(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "localMerge_sei "

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 26
    .line 27
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->C1(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public J(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "sei "

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 26
    .line 27
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/fr2;->h:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->J(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public J1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public O(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->O(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public O1(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "msec "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 25
    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_0
    invoke-interface {p0, p1}, Ll/l6m;->O1(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public R(Ll/fb1;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->R(Ll/fb1;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public S0(Ll/uow;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0, v0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->b0(Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public T0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->v:Ll/brx;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/brx;->p(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U0(JZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public V(Ll/hb1;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->V(Ll/hb1;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V1(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x2020

    .line 8
    .line 9
    iput v1, v0, Landroid/os/Message;->what:I

    .line 10
    .line 11
    new-instance v1, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "RecordDesc"

    .line 17
    .line 18
    const-string v3, "\u53d1\u9001\u547d\u4ee4\uff1a\u5f00\u59cb\u622a\u5c4f"

    .line 19
    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v2, "imagePath"

    .line 24
    .line 25
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public W1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/l6m;->W1(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public X(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public X0(I)D
    .locals 0

    .line 1
    const-wide/16 p0, 0x0

    .line 2
    .line 3
    return-wide p0
.end method

.method public Y()V
    .locals 0

    .line 1
    return-void
.end method

.method public Y0(JZ)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/fr2;->x:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p3}, Ll/fr2;->O1(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long p3, p1, v0

    .line 9
    .line 10
    if-lez p3, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/fr2;->w0(J)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "is true"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 27
    .line 28
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 32
    .line 33
    invoke-interface {v0, p1}, Ll/c410;->d(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 34
    .line 35
    .line 36
    instance-of p1, p0, Ll/t410;

    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Ll/fr2;->a:Ll/c410;

    .line 41
    .line 42
    invoke-interface {p1, p2, p3}, Ll/c410;->y(II)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iput p2, p0, Ll/fr2;->k:I

    .line 46
    .line 47
    iput p3, p0, Ll/fr2;->l:I

    .line 48
    .line 49
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-interface {p0, p2, p3}, Lcom/momo/pipline/MomoInterface/MomoCodec;->y(II)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public a(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/momo/piplinemomoext/input/audio/a;->a(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/c410;->a(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public b2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->b2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    invoke-interface {p0}, Ll/l6m;->c()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public c2(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;III)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "is true"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 27
    .line 28
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 32
    .line 33
    invoke-interface {v0, p1}, Ll/c410;->d(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 34
    .line 35
    .line 36
    instance-of p1, p0, Ll/t410;

    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Ll/fr2;->a:Ll/c410;

    .line 41
    .line 42
    invoke-interface {p1, p2, p3}, Ll/c410;->y(II)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iput p2, p0, Ll/fr2;->k:I

    .line 46
    .line 47
    iput p3, p0, Ll/fr2;->l:I

    .line 48
    .line 49
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-interface {p0, p2, p3, p4}, Lcom/momo/pipline/MomoInterface/MomoCodec;->y0(III)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public e2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x2011

    .line 8
    .line 9
    iput v1, v0, Landroid/os/Message;->what:I

    .line 10
    .line 11
    new-instance v1, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "RecordDesc"

    .line 17
    .line 18
    const-string v3, "\u53d1\u9001\u547d\u4ee4\uff1a\u5f55\u5236\u7ed3\u675f"

    .line 19
    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fr2;->g:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 6
    .line 7
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, "mPipeline == null:"

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "BasePusherPipline stopRecord"

    .line 30
    .line 31
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/fr2;->b:Ll/z5m;

    .line 39
    .line 40
    iput-object v0, p0, Ll/fr2;->d:Ll/uow;

    .line 41
    .line 42
    iget-object v1, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-interface {v1}, Ll/l6m;->stopSurroundMusic()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 50
    .line 51
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v1, "stopRecord:"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "BasePusherPipline_RecordFile"

    .line 66
    .line 67
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ljava/lang/Throwable;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/fr2;->A2()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public f2(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public g()Ll/mob0;
    .locals 3

    .line 1
    new-instance v0, Ll/mob0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mob0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 7
    .line 8
    check-cast p0, Ll/wyl;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    :try_start_0
    invoke-interface {p0}, Ll/wyl;->s0()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Ll/mob0;->h(I)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0}, Ll/wyl;->getVideoWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Ll/mob0;->n(I)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0}, Ll/wyl;->k0()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Ll/mob0;->m(I)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0}, Ll/wyl;->L1()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    long-to-int v1, v1

    .line 38
    invoke-virtual {v0, v1}, Ll/mob0;->j(I)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p0}, Ll/wyl;->h1()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    int-to-long v1, v1

    .line 46
    invoke-virtual {v0, v1, v2}, Ll/mob0;->i(J)V

    .line 47
    .line 48
    .line 49
    invoke-interface {p0}, Ll/wyl;->Y0()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    int-to-long v1, v1

    .line 54
    invoke-virtual {v0, v1, v2}, Ll/mob0;->k(J)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p0}, Ll/wyl;->T0()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    int-to-long v1, p0

    .line 62
    invoke-virtual {v0, v1, v2}, Ll/mob0;->l(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    :catch_0
    :cond_0
    return-object v0
.end method

.method public g0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/l6m;->g0(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g1(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x1

    .line 8
    invoke-interface {v0, v1}, Lcom/momo/piplinemomoext/input/audio/a;->l(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/l6m;->g1(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public getEffectsVolume()D
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public i(IILl/fpf0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->i(IILl/fpf0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/l6m;->j()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public k0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, " "

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, " startRecord"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 55
    .line 56
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 60
    .line 61
    iget-boolean v1, p0, Ll/fr2;->j:Z

    .line 62
    .line 63
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->H0(Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 67
    .line 68
    iget-object v1, p0, Ll/fr2;->v:Ll/brx;

    .line 69
    .line 70
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->S0(Ll/brx;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/fr2;->m:Ll/j410$b;

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    iget-object v1, p0, Ll/fr2;->a:Ll/c410;

    .line 78
    .line 79
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 80
    .line 81
    invoke-interface {v1, v0, v2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->l0(Ll/j410$b;Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    iget v0, p0, Ll/fr2;->k:I

    .line 85
    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    iget v1, p0, Ll/fr2;->l:I

    .line 89
    .line 90
    if-eqz v1, :cond_2

    .line 91
    .line 92
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 93
    .line 94
    invoke-interface {v2, v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->y(II)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 98
    .line 99
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->F()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iget-object v1, p0, Ll/fr2;->a:Ll/c410;

    .line 104
    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    iget-object v0, p0, Ll/fr2;->b:Ll/z5m;

    .line 108
    .line 109
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 110
    .line 111
    iget-object v3, p0, Ll/fr2;->d:Ll/uow;

    .line 112
    .line 113
    invoke-interface {v1, v0, v2, v3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->m0(Ll/z5m;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 117
    .line 118
    iget-object v1, p0, Ll/fr2;->b:Ll/z5m;

    .line 119
    .line 120
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->n0(Ll/z5m;)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_3
    iget-object v0, p0, Ll/fr2;->b:Ll/z5m;

    .line 125
    .line 126
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 127
    .line 128
    iget-object v3, p0, Ll/fr2;->d:Ll/uow;

    .line 129
    .line 130
    invoke-interface {v1, v0, v2, v3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Y(Ll/z5m;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 131
    .line 132
    .line 133
    :goto_0
    iget-object v0, p0, Ll/fr2;->h:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz v0, :cond_4

    .line 136
    .line 137
    iget-object v1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 138
    .line 139
    if-eqz v1, :cond_4

    .line 140
    .line 141
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->J(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    :cond_4
    const/4 v0, 0x1

    .line 145
    iput-boolean v0, p0, Ll/fr2;->g:Z

    .line 146
    .line 147
    iget-wide v0, p0, Ll/fr2;->n:J

    .line 148
    .line 149
    const-wide/16 v2, 0x0

    .line 150
    .line 151
    cmp-long v0, v0, v2

    .line 152
    .line 153
    if-nez v0, :cond_5

    .line 154
    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 156
    .line 157
    .line 158
    move-result-wide v0

    .line 159
    iput-wide v0, p0, Ll/fr2;->n:J

    .line 160
    .line 161
    :cond_5
    :goto_1
    return-void
.end method

.method public k2(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public m2()Ll/dpl;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fr2;->d:Ll/uow;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0, p0}, Ll/f410;->a(Ll/uow;Ll/q210$a;)Ll/dpl;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public n(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->n(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->p(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p2(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/t23;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/t23;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Ll/t23;->R1(Z)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/fr2$c;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, v0}, Ll/fr2$c;-><init>(Ll/fr2;Ljava/lang/String;Ll/t23;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/s23;->Q1(Ll/s23$a;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/fr2;->a:Ll/c410;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/fr2;->b:Ll/z5m;

    .line 23
    .line 24
    invoke-interface {p1, p0, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->w0(Ll/z5m;Ll/dfj;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public pauseAllEffects()V
    .locals 0

    .line 1
    return-void
.end method

.method public pauseEffect(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/l6m;->q()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public q2(Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string v0, "\u622a\u56fe\u5b8c\u6210:"

    .line 2
    .line 3
    const-string v1, "\u622a\u56fe\u5b8c\u6210"

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-lez v2, :cond_3

    .line 12
    .line 13
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 14
    .line 15
    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 25
    .line 26
    .line 27
    :cond_0
    new-instance v3, Ljava/io/FileOutputStream;

    .line 28
    .line 29
    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/fr2;->t:Landroid/graphics/Bitmap;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 37
    .line 38
    const/16 v5, 0x64

    .line 39
    .line 40
    invoke-virtual {v2, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 44
    .line 45
    .line 46
    new-instance v2, Landroid/os/Bundle;

    .line 47
    .line 48
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v3, "RecordDesc"

    .line 52
    .line 53
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v2, v3, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 61
    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    const/16 v1, 0x2021

    .line 65
    .line 66
    invoke-interface {p0, v1, v2}, Ll/l6m$a;->a(ILandroid/os/Bundle;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    const-string p0, "BasePusherPipline_RecordFile"

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :catch_0
    move-exception p0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catch_1
    move-exception p0

    .line 85
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_0
    return-void
.end method

.method public r()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    invoke-interface {p0}, Ll/l6m;->r()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public r2(Ll/z5m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fr2;->b:Ll/z5m;

    .line 2
    .line 3
    return-void
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 2
    .line 3
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v3, " "

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v3, "release"

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-string v3, "momoCodec already release beforerelease"

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    const/4 v0, 0x0

    .line 80
    iput-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/fr2;->v2()V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 86
    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 93
    .line 94
    :cond_1
    iput-object v0, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 95
    .line 96
    iget-object v1, p0, Ll/fr2;->q:Landroid/os/HandlerThread;

    .line 97
    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 101
    .line 102
    .line 103
    iput-object v0, p0, Ll/fr2;->q:Landroid/os/HandlerThread;

    .line 104
    .line 105
    :cond_2
    return-void
.end method

.method public resumeAllEffects()V
    .locals 0

    .line 1
    return-void
.end method

.method public resumeEffect(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public s2()Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method public stopSurroundMusic()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ll/l6m;->stopSurroundMusic()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public t(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->t(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t0()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x5

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, " BasePusherPipline startRecord:"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, ",codec hashcode:"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v3, " "

    .line 81
    .line 82
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v3, " startRecord"

    .line 99
    .line 100
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v3, "Pipeline_Normal_pip->PIPLINE"

    .line 108
    .line 109
    invoke-virtual {v0, v3, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 113
    .line 114
    iget-boolean v1, p0, Ll/fr2;->j:Z

    .line 115
    .line 116
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->H0(Z)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 120
    .line 121
    iget-object v1, p0, Ll/fr2;->v:Ll/brx;

    .line 122
    .line 123
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->S0(Ll/brx;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/fr2;->m:Ll/j410$b;

    .line 127
    .line 128
    if-eqz v0, :cond_1

    .line 129
    .line 130
    iget-object v1, p0, Ll/fr2;->a:Ll/c410;

    .line 131
    .line 132
    iget-object v3, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 133
    .line 134
    invoke-interface {v1, v0, v3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->l0(Ll/j410$b;Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 135
    .line 136
    .line 137
    :cond_1
    iget v0, p0, Ll/fr2;->k:I

    .line 138
    .line 139
    if-eqz v0, :cond_2

    .line 140
    .line 141
    iget v1, p0, Ll/fr2;->l:I

    .line 142
    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object v3, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 146
    .line 147
    invoke-interface {v3, v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->y(II)V

    .line 148
    .line 149
    .line 150
    :cond_2
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 151
    .line 152
    if-eqz v0, :cond_4

    .line 153
    .line 154
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->F()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_3

    .line 159
    .line 160
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v3, " BasePusherPipline addMediaCodecFilter:"

    .line 177
    .line 178
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 192
    .line 193
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 212
    .line 213
    iget-object v1, p0, Ll/fr2;->b:Ll/z5m;

    .line 214
    .line 215
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 216
    .line 217
    iget-object v3, p0, Ll/fr2;->d:Ll/uow;

    .line 218
    .line 219
    invoke-interface {v0, v1, v2, v3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->m0(Ll/z5m;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 223
    .line 224
    iget-object v1, p0, Ll/fr2;->b:Ll/z5m;

    .line 225
    .line 226
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->V(Ll/z5m;)V

    .line 227
    .line 228
    .line 229
    goto :goto_0

    .line 230
    :cond_3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    new-instance v1, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    const-string v3, " BasePusherPipline appendCodecFilter:"

    .line 247
    .line 248
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 252
    .line 253
    .line 254
    move-result v3

    .line 255
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 262
    .line 263
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 282
    .line 283
    iget-object v1, p0, Ll/fr2;->b:Ll/z5m;

    .line 284
    .line 285
    iget-object v2, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 286
    .line 287
    iget-object v3, p0, Ll/fr2;->d:Ll/uow;

    .line 288
    .line 289
    invoke-interface {v0, v1, v2, v3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Y(Ll/z5m;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 290
    .line 291
    .line 292
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/fr2;->h:Ljava/lang/String;

    .line 293
    .line 294
    if-eqz v0, :cond_5

    .line 295
    .line 296
    iget-object v1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 297
    .line 298
    if-eqz v1, :cond_5

    .line 299
    .line 300
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->J(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    :cond_5
    const/4 v0, 0x1

    .line 304
    iput-boolean v0, p0, Ll/fr2;->g:Z

    .line 305
    .line 306
    iget-wide v0, p0, Ll/fr2;->n:J

    .line 307
    .line 308
    const-wide/16 v2, 0x0

    .line 309
    .line 310
    cmp-long v0, v0, v2

    .line 311
    .line 312
    if-nez v0, :cond_6

    .line 313
    .line 314
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 315
    .line 316
    .line 317
    move-result-wide v0

    .line 318
    iput-wide v0, p0, Ll/fr2;->n:J

    .line 319
    .line 320
    :cond_6
    const/4 p0, 0x0

    .line 321
    return p0
.end method

.method public t2()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fr2;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Ll/fr2;->c:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/content/Context;

    .line 24
    .line 25
    return-object p0
.end method

.method public u0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "is "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public u2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fr2;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public v2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public w0(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "msec "

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 30
    .line 31
    invoke-interface {p0, p1, p2}, Ll/l6m;->w0(J)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public w2(II)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 2
    .line 3
    instance-of p1, p0, Ll/s410;

    .line 4
    .line 5
    const/16 v0, 0x1e

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    instance-of p0, p0, Ll/tc0;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/16 v0, 0x1f

    .line 15
    .line 16
    :cond_1
    :goto_0
    invoke-static {v0, p2}, Ll/s5r;->R(II)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public x2(Ll/brx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fr2;->v:Ll/brx;

    .line 2
    .line 3
    return-void
.end method

.method public y(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startRecordFile~"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "BasePusherPipline_RecordFile"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/16 v1, 0x2010

    .line 27
    .line 28
    iput v1, v0, Landroid/os/Message;->what:I

    .line 29
    .line 30
    new-instance v1, Landroid/os/Bundle;

    .line 31
    .line 32
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v2, "RecordDesc"

    .line 36
    .line 37
    const-string v3, "\u53d1\u9001\u547d\u4ee4\uff1a\u5f00\u59cb\u5f55\u5236"

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string v2, ""

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    move-object p1, v2

    .line 47
    :cond_0
    const-string v3, "playFile"

    .line 48
    .line 49
    invoke-virtual {v1, v3, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    if-nez p2, :cond_1

    .line 53
    .line 54
    move-object p2, v2

    .line 55
    :cond_1
    const-string p1, "destFile"

    .line 56
    .line 57
    invoke-virtual {v1, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/fr2;->r:Landroid/os/Handler;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 66
    .line 67
    .line 68
    const/4 p0, 0x1

    .line 69
    return p0
.end method

.method public y1()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/l6m;->y1()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public y2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fr2;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->z(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public z2(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const-string v0, "BasePusherPipline_RecordFile"

    .line 8
    .line 9
    const-string v2, "RecordDesc"

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-lez v4, :cond_4

    .line 19
    .line 20
    :cond_1
    iget-object v4, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 21
    .line 22
    invoke-interface {v4, v3}, Lcom/momo/piplinemomoext/input/audio/a;->x0(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v4, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 26
    .line 27
    new-instance v5, Ll/fr2$b;

    .line 28
    .line 29
    invoke-direct {v5, p0}, Ll/fr2$b;-><init>(Ll/fr2;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {v4, v5}, Ll/l6m;->G1(Ll/gb1;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/fr2;->g1(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_3

    .line 40
    .line 41
    new-instance p2, Landroid/os/Bundle;

    .line 42
    .line 43
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v3, "\u64ad\u653e\u4f34\u594f\u5931\u8d25"

    .line 47
    .line 48
    invoke-virtual {p2, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    const/16 v2, -0x2006

    .line 56
    .line 57
    invoke-interface {p0, v2, p2}, Ll/l6m$a;->a(ILandroid/os/Bundle;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string p2, "\u64ad\u653e\u4f34\u594f\u5931\u8d25:"

    .line 63
    .line 64
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return v1

    .line 78
    :cond_3
    new-instance p1, Landroid/os/Bundle;

    .line 79
    .line 80
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v1, "\u64ad\u653e\u4f34\u594f\u5f00\u59cb"

    .line 84
    .line 85
    invoke-virtual {p1, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 89
    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    const/16 v4, 0x2005

    .line 93
    .line 94
    invoke-interface {v1, v4, p1}, Ll/l6m$a;->a(ILandroid/os/Bundle;)V

    .line 95
    .line 96
    .line 97
    :cond_4
    new-instance p1, Ljava/io/File;

    .line 98
    .line 99
    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_5

    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 109
    .line 110
    .line 111
    :cond_5
    iget-object p1, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 112
    .line 113
    if-nez p1, :cond_6

    .line 114
    .line 115
    new-instance p1, Lcom/momo/pipline/codec/a;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/fr2;->t2()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-direct {p1, v1}, Lcom/momo/pipline/codec/a;-><init>(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    iput-object p1, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 125
    .line 126
    invoke-virtual {p1, p2}, Lcom/momo/pipline/codec/a;->V2(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_6
    iget-object p1, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 130
    .line 131
    if-eqz p1, :cond_8

    .line 132
    .line 133
    iget-object p1, p0, Ll/fr2;->a:Ll/c410;

    .line 134
    .line 135
    invoke-interface {p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->F()Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    iget-object p2, p0, Ll/fr2;->a:Ll/c410;

    .line 140
    .line 141
    if-nez p1, :cond_7

    .line 142
    .line 143
    iget-object p1, p0, Ll/fr2;->b:Ll/z5m;

    .line 144
    .line 145
    iget-object v1, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 146
    .line 147
    iget-object v4, p0, Ll/fr2;->d:Ll/uow;

    .line 148
    .line 149
    invoke-interface {p2, p1, v1, v4}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->m0(Ll/z5m;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_7
    iget-object p1, p0, Ll/fr2;->b:Ll/z5m;

    .line 154
    .line 155
    iget-object v1, p0, Ll/fr2;->p:Lcom/momo/pipline/codec/a;

    .line 156
    .line 157
    iget-object v4, p0, Ll/fr2;->d:Ll/uow;

    .line 158
    .line 159
    invoke-interface {p2, p1, v1, v4}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Y(Ll/z5m;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 160
    .line 161
    .line 162
    :goto_0
    new-instance p1, Landroid/os/Bundle;

    .line 163
    .line 164
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string p2, "\u5f00\u59cb\u5f55\u5236"

    .line 168
    .line 169
    invoke-virtual {p1, v2, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget-object p2, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 173
    .line 174
    if-eqz p2, :cond_8

    .line 175
    .line 176
    const/16 v1, 0x2010

    .line 177
    .line 178
    invoke-interface {p2, v1, p1}, Ll/l6m$a;->a(ILandroid/os/Bundle;)V

    .line 179
    .line 180
    .line 181
    new-instance p1, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    const-string p2, "strartRecord Iml:"

    .line 184
    .line 185
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    iget-object p2, p0, Ll/fr2;->s:Ll/l6m$a;

    .line 189
    .line 190
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string p2, "; this:"

    .line 194
    .line 195
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :cond_8
    iput-boolean v3, p0, Ll/fr2;->u:Z

    .line 209
    .line 210
    return v3
.end method
