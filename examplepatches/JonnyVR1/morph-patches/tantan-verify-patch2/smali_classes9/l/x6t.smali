.class public Ll/x6t;
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
            "Ll/siv;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/riv;

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
    iput-object v0, p0, Ll/x6t;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/x6t;->k:Ll/dum;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic J3(Ll/x6t;Ll/t610;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x6t;->N3(Ll/t610;)V

    return-void
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/siv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/siv;->b(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

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

.method public static P3(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Ll/siv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/siv;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            ")",
            "Ll/siv;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/w6t;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/w6t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/siv;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6t;->j:Ll/riv;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/riv;->c()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

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

.method public M3()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6t;->j:Ll/riv;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->NULL:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/riv;->c()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final N3(Ll/t610;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Ll/t610;->a:Z

    .line 2
    .line 3
    iget-object v1, p1, Ll/t610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/t610;->d:Ll/z20;

    .line 8
    .line 9
    iget-object p1, p1, Ll/t610;->c:Ll/g0m;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0, p1}, Ll/x6t;->R3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/z20;Ll/g0m;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, v1}, Ll/x6t;->S3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final O3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x6t;->k:Ll/dum;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/dum;->d:Z

    .line 4
    .line 5
    iget-object v1, p0, Ll/x6t;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/siv;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 12
    .line 13
    new-instance v3, Ll/q6t;

    .line 14
    .line 15
    invoke-direct {v3}, Ll/q6t;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v2, v3}, Ll/siv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/tcj;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/x6t;->i:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v1, Ll/siv;

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_connect:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 29
    .line 30
    new-instance v3, Ll/r6t;

    .line 31
    .line 32
    invoke-direct {v3}, Ll/r6t;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-direct {v1, v2, v3}, Ll/siv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/tcj;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/x6t;->i:Ljava/util/ArrayList;

    .line 42
    .line 43
    new-instance v0, Ll/siv;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 46
    .line 47
    new-instance v2, Ll/s6t;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/s6t;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-direct {v0, v1, v2}, Ll/siv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/tcj;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    new-instance v0, Ll/siv;

    .line 60
    .line 61
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 62
    .line 63
    new-instance v3, Ll/t6t;

    .line 64
    .line 65
    invoke-direct {v3}, Ll/t6t;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-direct {v0, v2, v3}, Ll/siv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/tcj;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/x6t;->i:Ljava/util/ArrayList;

    .line 75
    .line 76
    new-instance v1, Ll/siv;

    .line 77
    .line 78
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_connect:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 79
    .line 80
    new-instance v3, Ll/u6t;

    .line 81
    .line 82
    invoke-direct {v3}, Ll/u6t;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-direct {v1, v2, v3}, Ll/siv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/tcj;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/x6t;->i:Ljava/util/ArrayList;

    .line 92
    .line 93
    new-instance v0, Ll/siv;

    .line 94
    .line 95
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 96
    .line 97
    new-instance v2, Ll/v6t;

    .line 98
    .line 99
    invoke-direct {v2}, Ll/v6t;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-direct {v0, v1, v2}, Ll/siv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/tcj;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public R3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/z20;Ll/g0m;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            ">;",
            "Ll/g0m;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x6t;->j:Ll/riv;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/riv;->a(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/x6t;->j:Ll/riv;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/riv;->b()V

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
    invoke-virtual {v1}, Ll/riv;->c()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

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
    iget-object v0, p0, Ll/x6t;->i:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-static {v0, p1}, Ll/x6t;->P3(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Ll/siv;

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
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->NULL:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 44
    .line 45
    invoke-interface {p2, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object v0, p0, Ll/x6t;->k:Ll/dum;

    .line 50
    .line 51
    invoke-virtual {p1, p0, v0, p3}, Ll/siv;->a(Ll/x6t;Ll/dum;Ll/g0m;)Ll/riv;

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
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->NULL:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 63
    .line 64
    invoke-interface {p2, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    iput-object p1, p0, Ll/x6t;->j:Ll/riv;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/riv;->e()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final S3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x6t;->j:Ll/riv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/riv;->c()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-ne v0, p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Ll/x6t;->j:Ll/riv;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/riv;->f()V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Ll/x6t;->j:Ll/riv;

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;->motionSwitch()Ll/v3f$d;

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
    new-instance v1, Ll/p6t;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/p6t;-><init>(Ll/x6t;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public init()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x6t;->O3()V

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
    iget-object v0, p0, Ll/x6t;->j:Ll/riv;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {v0}, Ll/riv;->f()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/x6t;->j:Ll/riv;

    .line 14
    .line 15
    return-void
.end method
