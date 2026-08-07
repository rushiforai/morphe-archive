.class public Ll/spu;
.super Ll/ahu;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Ll/spu;",
        ">;",
        "Ll/iam<",
        "Ll/spu;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ll/wsu;

.field public g:Ll/buu;

.field public h:Ll/kcg0;

.field public i:I


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wsu;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/wsu;-><init>(Ll/knu;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/spu;->f:Ll/wsu;

    .line 10
    .line 11
    new-instance v0, Ll/buu;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/buu;-><init>(Ll/knu;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/spu;->g:Ll/buu;

    .line 17
    .line 18
    return-void
.end method

.method private J3()V
    .locals 3

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    const-string v1, "calling status refresh chat request"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/xnu;->p()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/jwu;->F(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/hpu;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/hpu;-><init>(Ll/spu;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/jpu;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/jpu;-><init>(Ll/spu;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic R2(Ll/spu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->y3()V

    return-void
.end method

.method public static synthetic S2(Ll/spu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->o3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T2(Ll/spu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->B3()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U2(Ll/spu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->u3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;)V

    return-void
.end method

.method public static synthetic V2(Ll/spu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->z3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic W2(Ll/spu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->E3()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X2(Ll/spu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->K3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y2(Ll/spu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->s3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)V

    return-void
.end method

.method public static synthetic Z2(Ll/spu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->I3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a3(Ll/spu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->t3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic b3(Ll/spu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->x3()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ll/spu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->H3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic d3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;->getToast()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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

.method public static synthetic e3(Ll/spu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->v3()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ll/spu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->F3()V

    return-void
.end method

.method public static synthetic g3(Ll/spu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->C3()V

    return-void
.end method

.method public static synthetic h3(Ll/spu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->D3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic i3(Ll/spu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->w3()V

    return-void
.end method

.method public static synthetic j3(Ll/spu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->r3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k3(Ll/spu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spu;->G3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic m3(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "longLink status: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "videoChat"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final synthetic B3()Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xnu;->y()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const-string v0, "pending"

    .line 14
    .line 15
    invoke-static {v0}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-le p0, v0, :cond_0

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

.method public final synthetic C3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/yuk0;->d:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "timeout"

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/xnu;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic D3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic E3()Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xnu;->y()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const-string v0, "connecting"

    .line 14
    .line 15
    invoke-static {v0}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-le p0, v0, :cond_0

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

.method public final synthetic F3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/yuk0;->d:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "timeout"

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/xnu;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic G3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/spu;->J3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 2

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    const-string v1, "calling status refresh chat success "

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/spu;->i:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic I3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/spu;->i:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput p1, p0, Ll/spu;->i:I

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "calling status refresh error: "

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/spu;->i:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "videoChat"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Ll/spu;->i:I

    .line 29
    .line 30
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/vwt;->L5()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-lt p1, v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object p1, Ll/yuk0;->c:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "timeout"

    .line 45
    .line 46
    invoke-virtual {p0, p1, v0}, Ll/xnu;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public L3(ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/spu;->f:Ll/wsu;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/wsu;->j(ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Ll/xou;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/xou;-><init>(Ll/spu;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Ll/aj1;->T1:Lrx/subjects/b;

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v2, Ll/kpu;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/kpu;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v2, Ll/lpu;

    .line 55
    .line 56
    invoke-direct {v2, p0}, Ll/lpu;-><init>(Ll/spu;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v2, Ll/mpu;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/mpu;-><init>(Ll/spu;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v0, v0, Ll/aj1;->S1:Lrx/subjects/b;

    .line 86
    .line 87
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v2, Ll/npu;

    .line 92
    .line 93
    invoke-direct {v2, p0}, Ll/npu;-><init>(Ll/spu;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v0, v0, Ll/aj1;->X1:Lrx/subjects/b;

    .line 114
    .line 115
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v2, Ll/opu;

    .line 120
    .line 121
    invoke-direct {v2, p0}, Ll/opu;-><init>(Ll/spu;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->isFakeCall()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_0

    .line 144
    .line 145
    iget-object v0, p0, Ll/spu;->g:Ll/buu;

    .line 146
    .line 147
    sget-object v2, Ll/tbs;->b:Ll/vwt;

    .line 148
    .line 149
    invoke-virtual {v2}, Ll/vwt;->O5()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    new-instance v3, Ll/ppu;

    .line 154
    .line 155
    invoke-direct {v3, p0}, Ll/ppu;-><init>(Ll/spu;)V

    .line 156
    .line 157
    .line 158
    new-instance v4, Ll/qpu;

    .line 159
    .line 160
    invoke-direct {v4, p0}, Ll/qpu;-><init>(Ll/spu;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v2, v3, v4}, Ll/buu;->e(ILl/pcj;Ll/x20;)V

    .line 164
    .line 165
    .line 166
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->isRandomMatch()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_1

    .line 179
    .line 180
    iget-object v0, p0, Ll/spu;->g:Ll/buu;

    .line 181
    .line 182
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v2}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    iget-object v2, v2, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 191
    .line 192
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->matchTimeoutSec:I

    .line 193
    .line 194
    new-instance v3, Ll/rpu;

    .line 195
    .line 196
    invoke-direct {v3, p0}, Ll/rpu;-><init>(Ll/spu;)V

    .line 197
    .line 198
    .line 199
    new-instance v4, Ll/you;

    .line 200
    .line 201
    invoke-direct {v4, p0}, Ll/you;-><init>(Ll/spu;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0, v2, v3, v4}, Ll/buu;->e(ILl/pcj;Ll/x20;)V

    .line 205
    .line 206
    .line 207
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 212
    .line 213
    invoke-virtual {v0}, Ll/ecl0;->h()Lrx/c;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    new-instance v0, Ll/ipu;

    .line 222
    .line 223
    invoke-direct {v0}, Ll/ipu;-><init>()V

    .line 224
    .line 225
    .line 226
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 231
    .line 232
    .line 233
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/spu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/spu;->n3(Ll/spu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public n3(Ll/spu;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final o3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;->getChatId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;->getChatId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/xnu;->p()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final p3()V
    .locals 14

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    invoke-static {v0}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/vwt;->M5()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v6, Ll/zou;

    .line 28
    .line 29
    invoke-direct {v6, p0}, Ll/zou;-><init>(Ll/spu;)V

    .line 30
    .line 31
    .line 32
    new-instance v7, Ll/apu;

    .line 33
    .line 34
    invoke-direct {v7, p0}, Ll/apu;-><init>(Ll/spu;)V

    .line 35
    .line 36
    .line 37
    const-string v5, "pending"

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    invoke-virtual/range {v2 .. v7}, Ll/spu;->L3(ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, v2, Ll/spu;->g:Ll/buu;

    .line 44
    .line 45
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/vwt;->N5()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    new-instance v3, Ll/bpu;

    .line 52
    .line 53
    invoke-direct {v3, v2}, Ll/bpu;-><init>(Ll/spu;)V

    .line 54
    .line 55
    .line 56
    new-instance v4, Ll/cpu;

    .line 57
    .line 58
    invoke-direct {v4, v2}, Ll/cpu;-><init>(Ll/spu;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v1, v3, v4}, Ll/buu;->e(ILl/pcj;Ll/x20;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    move-object v2, p0

    .line 66
    :goto_0
    invoke-static {v0}, Ll/yuk0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/vwt;->M5()I

    .line 75
    .line 76
    .line 77
    move-result v9

    .line 78
    iget-object v10, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 79
    .line 80
    new-instance v12, Ll/dpu;

    .line 81
    .line 82
    invoke-direct {v12, v2}, Ll/dpu;-><init>(Ll/spu;)V

    .line 83
    .line 84
    .line 85
    new-instance v13, Ll/apu;

    .line 86
    .line 87
    invoke-direct {v13, v2}, Ll/apu;-><init>(Ll/spu;)V

    .line 88
    .line 89
    .line 90
    const-string v11, "connecting"

    .line 91
    .line 92
    move-object v8, v2

    .line 93
    invoke-virtual/range {v8 .. v13}, Ll/spu;->L3(ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, v2, Ll/spu;->g:Ll/buu;

    .line 97
    .line 98
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 99
    .line 100
    invoke-virtual {v1}, Ll/vwt;->N5()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    new-instance v3, Ll/epu;

    .line 105
    .line 106
    invoke-direct {v3, v2}, Ll/epu;-><init>(Ll/spu;)V

    .line 107
    .line 108
    .line 109
    new-instance v4, Ll/fpu;

    .line 110
    .line 111
    invoke-direct {v4, v2}, Ll/fpu;-><init>(Ll/spu;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v1, v3, v4}, Ll/buu;->e(ILl/pcj;Ll/x20;)V

    .line 115
    .line 116
    .line 117
    :cond_2
    invoke-static {v0}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_3

    .line 122
    .line 123
    const/4 p0, 0x0

    .line 124
    iput p0, v2, Ll/spu;->i:I

    .line 125
    .line 126
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 127
    .line 128
    invoke-virtual {v1}, Ll/vwt;->K5()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    new-instance v3, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    const-string v4, "calling  status start  looper: "

    .line 135
    .line 136
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    const-string v4, "videoChat"

    .line 147
    .line 148
    invoke-static {v4, v3}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    int-to-long v3, v1

    .line 152
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 153
    .line 154
    invoke-static {v3, v4, v1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v2, v1, p0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    new-instance v1, Ll/gpu;

    .line 167
    .line 168
    invoke-direct {v1, v2}, Ll/gpu;-><init>(Ll/spu;)V

    .line 169
    .line 170
    .line 171
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    iput-object p0, v2, Ll/spu;->h:Ll/kcg0;

    .line 180
    .line 181
    :cond_3
    invoke-static {v0}, Ll/yuk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-eqz p0, :cond_4

    .line 186
    .line 187
    invoke-virtual {v2, v0}, Ll/spu;->q3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 188
    .line 189
    .line 190
    :cond_4
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    if-eqz p0, :cond_5

    .line 195
    .line 196
    invoke-virtual {v2}, Ll/spu;->reset()V

    .line 197
    .line 198
    .line 199
    iget-object p0, v2, Ll/spu;->h:Ll/kcg0;

    .line 200
    .line 201
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 202
    .line 203
    .line 204
    :cond_5
    :goto_1
    return-void
.end method

.method public final q3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "\u5bf9\u65b9\u5df2\u6302\u65ad"

    .line 6
    .line 7
    const-string v2, "\u901a\u8bdd\u5df2\u4e2d\u65ad"

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->userCancel:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const-string p0, "\u5bf9\u65b9\u5df2\u53d6\u6d88"

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->userHangUp:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->userQuit:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_3

    .line 62
    .line 63
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->banUser:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->userLost:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_3

    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->userPayTimeout:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_3

    .line 104
    .line 105
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 106
    .line 107
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->userNotPay:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-nez p0, :cond_3

    .line 118
    .line 119
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 120
    .line 121
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->userQuitMultiDevice:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_2

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 135
    .line 136
    sget-object p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->timeout:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-eqz p0, :cond_c

    .line 147
    .line 148
    const-string p0, "\u672a\u63a5\u542c"

    .line 149
    .line 150
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_3
    :goto_0
    invoke-static {v2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 159
    .line 160
    sget-object v3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->anchorHangUp:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_5

    .line 171
    .line 172
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 177
    .line 178
    sget-object v1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->banAnchor:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 179
    .line 180
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-nez v0, :cond_6

    .line 189
    .line 190
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 191
    .line 192
    sget-object v1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->anchorLost:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_6

    .line 203
    .line 204
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 205
    .line 206
    sget-object v1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->anchorQuitMultiDevice:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_7

    .line 217
    .line 218
    :cond_6
    invoke-static {v2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    :cond_7
    :goto_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {p0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->isFakeCall()Z

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 234
    .line 235
    if-eqz p0, :cond_9

    .line 236
    .line 237
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->timeout:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 238
    .line 239
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 244
    .line 245
    .line 246
    move-result p0

    .line 247
    if-nez p0, :cond_8

    .line 248
    .line 249
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 250
    .line 251
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->anchorReject:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    if-nez p0, :cond_8

    .line 262
    .line 263
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 264
    .line 265
    sget-object p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->anchorQuit:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 266
    .line 267
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 272
    .line 273
    .line 274
    move-result p0

    .line 275
    if-eqz p0, :cond_c

    .line 276
    .line 277
    :cond_8
    const-string p0, "\u901a\u8bdd\u5931\u8d25\uff0c\u5bf9\u65b9\u5df2\u79bb\u5f00"

    .line 278
    .line 279
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :cond_9
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->timeout:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 284
    .line 285
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-eqz p0, :cond_a

    .line 294
    .line 295
    const-string p0, "\u6682\u65f6\u65e0\u4eba\u63a5\u542c\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 296
    .line 297
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 302
    .line 303
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->anchorReject:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 304
    .line 305
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 310
    .line 311
    .line 312
    move-result p0

    .line 313
    if-eqz p0, :cond_b

    .line 314
    .line 315
    const-string p0, "\u5bf9\u65b9\u6b63\u5728\u5fd9\u788c\u4e2d\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 316
    .line 317
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 322
    .line 323
    sget-object p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->anchorQuit:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 324
    .line 325
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    if-eqz p0, :cond_c

    .line 334
    .line 335
    invoke-static {v2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    :cond_c
    return-void
.end method

.method public final synthetic r3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spu;->p3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/spu;->f:Ll/wsu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wsu;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/spu;->g:Ll/buu;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/buu;->d()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic s3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;->getToast()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p0, p1, v1}, Ll/xnu;->a0(Landroid/app/Activity;Ljava/lang/String;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic t3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic u3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "receive cdn fail"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->getNewPushUrl()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "videoChat"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/xnu;->u()Ll/gcl0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/gcl0;->c()Ll/i0m;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ll/i0m;->a()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    instance-of v0, p0, Ll/ybl0;

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    check-cast p0, Ll/ybl0;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->getNewPushUrl()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/ybl0;->v1(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final synthetic v3()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic w3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/ahu;->L2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic x3()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic y3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/ahu;->L2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic z3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
