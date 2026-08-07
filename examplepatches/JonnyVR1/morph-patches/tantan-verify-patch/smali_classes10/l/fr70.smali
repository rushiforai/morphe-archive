.class public Ll/fr70;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/mu40;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public i:I

.field public j:I

.field public final k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

.field public final l:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

.field public m:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

.field public n:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/fr70;->i:I

    .line 6
    .line 7
    const-string v0, "unknown_"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/fr70;->m:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 14
    .line 15
    iput-object p2, p0, Ll/fr70;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 16
    .line 17
    iput-object p3, p0, Ll/fr70;->l:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 18
    .line 19
    const/4 p2, 0x2

    .line 20
    invoke-static {p2}, Ll/wft;->b(I)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    new-instance p2, Ll/q580;

    .line 27
    .line 28
    invoke-direct {p2, p1}, Ll/q580;-><init>(Ll/dum;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    new-instance p2, Ll/p380;

    .line 35
    .line 36
    invoke-direct {p2, p1}, Ll/p380;-><init>(Ll/dum;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 40
    .line 41
    .line 42
    new-instance p2, Ll/jw70;

    .line 43
    .line 44
    invoke-direct {p2, p1}, Ll/jw70;-><init>(Ll/dum;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 48
    .line 49
    .line 50
    new-instance p2, Ll/bz70;

    .line 51
    .line 52
    invoke-direct {p2, p1}, Ll/bz70;-><init>(Ll/dum;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    new-instance p2, Ll/t480;

    .line 60
    .line 61
    invoke-direct {p2, p1}, Ll/t480;-><init>(Ll/dum;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 65
    .line 66
    .line 67
    new-instance p2, Ll/n280;

    .line 68
    .line 69
    invoke-direct {p2, p1}, Ll/n280;-><init>(Ll/dum;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 73
    .line 74
    .line 75
    new-instance p2, Ll/gx70;

    .line 76
    .line 77
    invoke-direct {p2, p1}, Ll/gx70;-><init>(Ll/dum;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 81
    .line 82
    .line 83
    new-instance p2, Ll/my70;

    .line 84
    .line 85
    invoke-direct {p2, p1}, Ll/my70;-><init>(Ll/dum;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 89
    .line 90
    .line 91
    new-instance p2, Ll/du70;

    .line 92
    .line 93
    invoke-direct {p2, p1}, Ll/du70;-><init>(Ll/dum;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public static synthetic J3(Ll/fr70;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    return-void
.end method

.method public static synthetic K3(Ll/fr70;Ll/adx;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->c4(Ll/adx;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/fr70;Ll/ku70;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->f4(Ll/ku70;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/fr70;Ll/uu70;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->h4(Ll/uu70;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/hct;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hct;->a:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic O3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/fr70;Ll/hct;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->e4(Ll/hct;)V

    return-void
.end method

.method public static synthetic R3(Ll/fr70;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fr70;->a4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic S3(Ll/fr70;Ll/jct;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->b4(Ll/jct;)V

    return-void
.end method

.method public static synthetic T3(Ll/fr70;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->k4(I)V

    return-void
.end method

.method public static synthetic U3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V3(Ll/fr70;Ll/aa80;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->d4(Ll/aa80;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/hct;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hct;->b:Z

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

.method public static synthetic X3(Ll/fr70;Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->g4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V

    return-void
.end method

.method private synthetic a4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fr70;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final Y3(I)I
    .locals 2

    .line 1
    new-instance v0, Ll/qc80;

    .line 2
    .line 3
    const/16 v1, 0x258

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/qc80;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x3

    .line 21
    if-eq p1, p0, :cond_0

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    return p1
.end method

.method public Z3()Z
    .locals 2

    .line 1
    new-instance v0, Ll/qc80;

    .line 2
    .line 3
    const/16 v1, 0x258

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/qc80;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget p0, p0, Ll/fr70;->i:I

    .line 22
    .line 23
    if-eq p0, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    return v1
.end method

.method public final synthetic b4(Ll/jct;)V
    .locals 1

    .line 1
    iget v0, p1, Ll/jct;->a:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/fr70;->l4(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Ll/jct;->b:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/fr70;->j4(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic c4(Ll/adx;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fr70;->Z3()Z

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

.method public final synthetic d4(Ll/aa80;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Ll/fr70;->i:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic e4(Ll/hct;)V
    .locals 0

    .line 1
    const/4 p1, 0x2

    .line 2
    invoke-virtual {p0, p1}, Ll/fr70;->k4(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic f4(Ll/ku70;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Ll/fr70;->j:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fr70;->n:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic h4(Ll/uu70;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr70;->n:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;->giftId:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public final i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v1, "pk_created"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    const-string v1, "pk_end"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, p1}, Ll/fr70;->n4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p0, v0, p1}, Ll/fr70;->o4(ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final j4(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fr70;->m:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    return-void
.end method

.method public final k4(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fr70;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public l4(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/fr70;->Y3(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/fr70;->i:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/n180;->m(I)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->startPkAnim()Ll/v3f$c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->stopPkAnim()Ll/v3f$c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 38
    .line 39
    .line 40
    :goto_0
    const/4 v0, -0x1

    .line 41
    if-ne p1, v0, :cond_1

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, p1, v0}, Ll/fr70;->o4(ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public m4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_connect:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ya:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 20
    .line 21
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->X7:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget v0, p0, Ll/fr70;->i:I

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    if-eq v0, v1, :cond_4

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    if-eq v0, v2, :cond_3

    .line 44
    .line 45
    const/4 p0, 0x3

    .line 46
    if-eq v0, p0, :cond_2

    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Va:I

    .line 50
    .line 51
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    invoke-static {p0, v1}, Ll/su70;->d(Ll/i6t;Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    invoke-static {p0, v1}, Ll/su70;->e(Ll/i6t;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final n4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkEnd:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;

    .line 2
    .line 3
    iget-object v0, p0, Ll/fr70;->m:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;->getIsLeave()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;->getLeaveUserId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/mu40;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string p1, "LiveModuleLoadWrapper"

    .line 39
    .line 40
    const-string v0, "show end toast when receive long link end"

    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/fr70;->m:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 46
    .line 47
    const-string v0, "playing"

    .line 48
    .line 49
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->wa:I

    .line 56
    .line 57
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    iget-object p0, p0, Ll/fr70;->m:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 62
    .line 63
    const-string p1, "punishing"

    .line 64
    .line 65
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ze:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 74
    .line 75
    .line 76
    :cond_4
    :goto_0
    return-void
.end method

.method public final o4(ZLcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/x6t;->M3()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "pk motion switch ,isAnchor:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/mu40;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/mu40;->p()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ",motion:"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/t610;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 54
    .line 55
    invoke-direct {v0, p1, v1}, Ll/t610;-><init>(ZLcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V

    .line 56
    .line 57
    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    const/4 p1, 0x3

    .line 61
    invoke-virtual {p0, p1}, Ll/fr70;->l4(I)V

    .line 62
    .line 63
    .line 64
    const/4 p1, 0x2

    .line 65
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_1

    .line 70
    .line 71
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 72
    .line 73
    iget-object v1, p0, Ll/fr70;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 74
    .line 75
    invoke-direct {p1, v1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ll/t610;->b(Ll/g0m;)Ll/t610;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance p2, Ll/uq70;

    .line 83
    .line 84
    invoke-direct {p2}, Ll/uq70;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p2}, Ll/t610;->a(Ll/z20;)Ll/t610;

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 92
    .line 93
    iget-object v1, p0, Ll/fr70;->l:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 94
    .line 95
    invoke-direct {p1, v1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, p1}, Ll/t610;->b(Ll/g0m;)Ll/t610;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-instance p2, Ll/vq70;

    .line 103
    .line 104
    invoke-direct {p2}, Ll/vq70;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p2}, Ll/t610;->a(Ll/z20;)Ll/t610;

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    const/4 p1, 0x1

    .line 112
    invoke-virtual {p0, p1}, Ll/fr70;->l4(I)V

    .line 113
    .line 114
    .line 115
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;->motionSwitch()Ll/v3f$d;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public t()V
    .locals 2

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
    check-cast v0, Ll/mu40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->U()Lrx/c;

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
    new-instance v1, Ll/rq70;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/rq70;-><init>(Ll/fr70;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->clickBottomPkIcon()Ll/v3f$c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lrx/c;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/yq70;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/yq70;-><init>(Ll/fr70;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lrx/c;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/zq70;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/zq70;-><init>(Ll/fr70;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    new-instance v0, Ll/ar70;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/ar70;-><init>(Ll/fr70;)V

    .line 101
    .line 102
    .line 103
    const-class v1, Ll/adx;

    .line 104
    .line 105
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 106
    .line 107
    .line 108
    new-instance v0, Ll/br70;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Ll/br70;-><init>(Ll/fr70;)V

    .line 111
    .line 112
    .line 113
    const-class v1, Ll/aa80;

    .line 114
    .line 115
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->showPkDialog()Ll/v3f$d;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Lrx/c;

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/cr70;

    .line 139
    .line 140
    invoke-direct {v1}, Ll/cr70;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v1, Ll/dr70;

    .line 148
    .line 149
    invoke-direct {v1}, Ll/dr70;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/er70;

    .line 157
    .line 158
    invoke-direct {v1, p0}, Ll/er70;-><init>(Ll/fr70;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->startRandomSeek()Ll/v3f$d;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Lrx/c;

    .line 183
    .line 184
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    new-instance v1, Ll/sq70;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Ll/sq70;-><init>(Ll/fr70;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 198
    .line 199
    .line 200
    new-instance v0, Ll/tq70;

    .line 201
    .line 202
    invoke-direct {v0, p0}, Ll/tq70;-><init>(Ll/fr70;)V

    .line 203
    .line 204
    .line 205
    const-class v1, Ll/ku70;

    .line 206
    .line 207
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 215
    .line 216
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->updateFirstGift()Ll/v3f$d;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    check-cast v0, Lrx/c;

    .line 225
    .line 226
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    new-instance v1, Ll/wq70;

    .line 231
    .line 232
    invoke-direct {v1, p0}, Ll/wq70;-><init>(Ll/fr70;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 240
    .line 241
    .line 242
    new-instance v0, Ll/xq70;

    .line 243
    .line 244
    invoke-direct {v0, p0}, Ll/xq70;-><init>(Ll/fr70;)V

    .line 245
    .line 246
    .line 247
    const-class v1, Ll/uu70;

    .line 248
    .line 249
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 250
    .line 251
    .line 252
    return-void
.end method
