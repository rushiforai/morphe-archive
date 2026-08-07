.class public Ll/rs70;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/ou40;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

.field public final j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

.field public k:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

.field public l:Ll/kcg0;

.field public final m:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rs70;->m:Lrx/subjects/b;

    .line 9
    .line 10
    iput-object p2, p0, Ll/rs70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 11
    .line 12
    iput-object p3, p0, Ll/rs70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 13
    .line 14
    new-instance p2, Ll/du70;

    .line 15
    .line 16
    invoke-direct {p2, p1}, Ll/du70;-><init>(Ll/dum;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private H4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/rs70;->M4(ZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic K3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic L3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M3(Ll/rs70;Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->r4(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ljava/lang/Long;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "requestCheck "

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, ""

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic O3(Ll/ugd0;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic P3(Ljava/lang/String;Ll/fyb;)Ll/fyb;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ctyp changed to "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Ll/fyb;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " from "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0, p1}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/fyb;

    .line 30
    .line 31
    return-object p0
.end method

.method public static synthetic R3(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enterRoom current ctyp:"

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
    move-result-object v0

    .line 15
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic S3(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "checkPkData ongoing id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic T3(Ll/rs70;Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V

    return-void
.end method

.method public static synthetic U3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic W3(Ll/rs70;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->C4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X3(Ll/rs70;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->z4(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "pk pkCheckerObs:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic Z3(Ll/rs70;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->J4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic a4(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getPkOngoingObs ongoing id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic b4(Ll/rs70;Ll/uu70;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->G4(Ll/uu70;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c4(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic e4(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p1
.end method

.method public static synthetic f4(Ll/rs70;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->D4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic g4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "pk obs error:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

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
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic h4(Ll/rs70;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->B4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i4(Ll/rs70;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->A4(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic j4(Ll/rs70;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->E4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k4(Ll/rs70;Ll/fyb;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rs70;->y4(Ll/fyb;)V

    return-void
.end method

.method public static synthetic l4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getPkMessageObs message:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->toString()Ljava/lang/String;

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
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

    .line 24
    .line 25
    return-object p0
.end method

.method public static synthetic m4(Ll/rs70;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rs70;->H4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic n4(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingId:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public final synthetic A4(Ljava/lang/Object;)V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/rs70;->J4(Ljava/lang/Long;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic B4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rs70;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rs70;->x4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0, p1}, Ll/rs70;->M4(ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic D4(Ll/vxj0;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0}, Ll/rs70;->M4(ZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rs70;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic F4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rs70;->k:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic G4(Ll/uu70;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rs70;->k:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

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

.method public final I4()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rs70;->w4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/rs70;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/rs70;->m:Lrx/subjects/b;

    .line 10
    .line 11
    new-instance v2, Ll/ps70;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/ps70;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {v0, v1, p0}, Lrx/c;->merge(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final J4(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->h5(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/xr70;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/xr70;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/tr70;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/tr70;-><init>(Ll/rs70;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/yr70;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/yr70;-><init>(Ll/rs70;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p0, p0, Ll/rs70;->m:Lrx/subjects/b;

    .line 47
    .line 48
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/zr70;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/zr70;-><init>(Lrx/subjects/b;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Ll/as70;

    .line 57
    .line 58
    invoke-direct {p0, p1}, Ll/as70;-><init>(Ljava/lang/Long;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final K4(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->j:Ll/x6t;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x6t;->M3()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final L4(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rs70;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p1, "start pk timer"

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/ou40;

    .line 21
    .line 22
    const/4 v0, 0x5

    .line 23
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/16 v0, 0x18

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/wr70;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/wr70;-><init>(Ll/rs70;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/rs70;->l:Ll/kcg0;

    .line 49
    .line 50
    return-void
.end method

.method public final M4(ZLjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rs70;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/rs70;->n:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p2, v0}, Ll/rs70;->K4(Ljava/lang/String;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v0, "pk motion close current first"

    .line 17
    .line 18
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    const-string v1, ""

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Ll/rs70;->M4(ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v0, "pk motion start next"

    .line 28
    .line 29
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, v0, p2}, Ll/rs70;->M4(ZLjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "pk motion switch ,isAnchor:false,motion:"

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/t610;

    .line 54
    .line 55
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 56
    .line 57
    invoke-direct {v0, p1, v1}, Ll/t610;-><init>(ZLcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V

    .line 58
    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    const/4 p1, 0x2

    .line 63
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_1

    .line 68
    .line 69
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 70
    .line 71
    iget-object v1, p0, Ll/rs70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 72
    .line 73
    invoke-direct {p1, v1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ll/t610;->b(Ll/g0m;)Ll/t610;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance p2, Ll/qs70;

    .line 81
    .line 82
    invoke-direct {p2}, Ll/qs70;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p2}, Ll/t610;->a(Ll/z20;)Ll/t610;

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 90
    .line 91
    iget-object v1, p0, Ll/rs70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 92
    .line 93
    invoke-direct {p1, v1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p1}, Ll/t610;->b(Ll/g0m;)Ll/t610;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-instance p2, Ll/lr70;

    .line 101
    .line 102
    invoke-direct {p2}, Ll/lr70;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p2}, Ll/t610;->a(Ll/z20;)Ll/t610;

    .line 106
    .line 107
    .line 108
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;->motionSwitch()Ll/v3f$d;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final p4()V
    .locals 2

    .line 1
    const-string v0, "checker"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/rs70;->s4(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/mr70;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/mr70;-><init>(Ll/rs70;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final q4()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/pr70;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/pr70;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/qr70;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/qr70;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/rr70;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/rr70;-><init>(Ll/rs70;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/sr70;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/sr70;-><init>(Ll/rs70;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final r4(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;)",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/fs70;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fs70;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ll/hs70;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/hs70;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ll/is70;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/is70;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/js70;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/js70;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final s4(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/fyb;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lrx/c;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/nr70;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/nr70;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
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
    check-cast v0, Ll/ou40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/kr70;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/kr70;-><init>(Ll/rs70;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/rs70;->q4()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/rs70;->p4()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/rs70;->t4()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Ll/rs70;->I4()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/vr70;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/vr70;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/gs70;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/gs70;-><init>(Ll/rs70;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ll/ks70;

    .line 63
    .line 64
    invoke-direct {v2}, Ll/ks70;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkEndEvent()Ll/v3f$c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lrx/c;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/ls70;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/ls70;-><init>(Ll/rs70;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->updateCurrentPk()Ll/v3f$d;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lrx/c;

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v1, Ll/ms70;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/ms70;-><init>(Ll/rs70;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->updateFirstGift()Ll/v3f$d;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    check-cast v0, Lrx/c;

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v1, Ll/ns70;

    .line 159
    .line 160
    invoke-direct {v1, p0}, Ll/ns70;-><init>(Ll/rs70;)V

    .line 161
    .line 162
    .line 163
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 168
    .line 169
    .line 170
    new-instance v0, Ll/os70;

    .line 171
    .line 172
    invoke-direct {v0, p0}, Ll/os70;-><init>(Ll/rs70;)V

    .line 173
    .line 174
    .line 175
    const-class v1, Ll/uu70;

    .line 176
    .line 177
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public final t4()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rs70;->u4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "fixed"

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/rs70;->s4(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final u4()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rs70;->x4()Z

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
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/or70;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/or70;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final v4()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->q1()Ll/aj1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/aj1;->U()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/bs70;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/bs70;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/cs70;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/cs70;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, Ll/ds70;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/ds70;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v0, Ll/es70;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/es70;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public final w4()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/tr70;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/tr70;-><init>(Ll/rs70;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/ur70;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/ur70;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final x4()Z
    .locals 2

    .line 1
    new-instance v0, Ll/iu70;

    .line 2
    .line 3
    const/16 v1, 0x258

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/iu70;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/fyb;

    .line 13
    .line 14
    iget p0, p0, Ll/fyb;->a:I

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final synthetic y4(Ll/fyb;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rs70;->x4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Ll/rs70;->L4(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic z4(Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cyr;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
