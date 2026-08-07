.class public Ll/w3o0;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/p5o0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/o5o0;

.field public k:Ll/dum;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/w3o0;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/w3o0;->k:Ll/dum;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/p5o0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/p5o0;->b(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic K3(Ll/w3o0;Ll/abo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w3o0;->N3(Ll/abo0;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private O3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w3o0;->k:Ll/dum;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/dum;->d:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/w3o0;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/p5o0;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_call_normal:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 12
    .line 13
    new-instance v2, Ll/t3o0;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/t3o0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/p5o0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/tcj;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Ll/p5o0;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->voice_call_normal:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 28
    .line 29
    new-instance v2, Ll/u3o0;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/u3o0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-direct {v0, v1, v2}, Ll/p5o0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/tcj;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static P3(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)Ll/p5o0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/p5o0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;",
            ")",
            "Ll/p5o0;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/v3o0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/v3o0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/p5o0;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public M3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o5o0;->c()Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-ne p0, p1, :cond_0

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

.method public final N3(Ll/abo0;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Ll/abo0;->a:Z

    .line 2
    .line 3
    iget-object v1, p1, Ll/abo0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/abo0;->d:Ll/z20;

    .line 8
    .line 9
    iget-object p1, p1, Ll/abo0;->c:Ll/ram;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0, p1}, Ll/w3o0;->R3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/z20;Ll/ram;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, v1}, Ll/w3o0;->S3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public R3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/z20;Ll/ram;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;",
            ">;",
            "Ll/ram;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/o5o0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/o5o0;->b()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v1}, Ll/o5o0;->c()Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p2, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/w3o0;->i:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-static {v0, p1}, Ll/w3o0;->P3(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)Ll/p5o0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    const/4 p0, 0x2

    .line 39
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->NULL:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 44
    .line 45
    invoke-interface {p2, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object v0, p0, Ll/w3o0;->k:Ll/dum;

    .line 50
    .line 51
    invoke-virtual {p1, p0, v0, p3}, Ll/p5o0;->a(Ll/w3o0;Ll/dum;Ll/ram;)Ll/o5o0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    const/4 p0, 0x3

    .line 58
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;->NULL:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 63
    .line 64
    invoke-interface {p2, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    iput-object p1, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/o5o0;->e()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final S3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/o5o0;->c()Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-ne v0, p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/o5o0;->f()V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;->motionSwitch()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/r3o0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/r3o0;-><init>(Ll/w3o0;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/s3o0;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/s3o0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public init()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w3o0;->O3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {v0}, Ll/o5o0;->f()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/w3o0;->j:Ll/o5o0;

    .line 14
    .line 15
    return-void
.end method
