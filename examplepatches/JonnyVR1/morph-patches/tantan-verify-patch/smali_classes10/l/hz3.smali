.class public Ll/hz3;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/r2s;

.field public final j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/y34;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/r2s;)V
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
    iput-object p1, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/hz3;->k:Ljava/util/HashMap;

    .line 17
    .line 18
    iput-object p2, p0, Ll/hz3;->i:Ll/r2s;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic J3(Ll/hz3;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz3;->d4(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic K3(Ll/hz3;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hz3;->e4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/y34;Ll/y34;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic M3(Ll/hz3;Ll/y34;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz3;->Z3(Ll/y34;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic N3(Ll/hz3;Ll/y34;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz3;->a4(Ll/y34;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ljava/lang/Long;Ll/y34;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic P3(Ll/hz3;Ll/y34;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz3;->c4(Ll/y34;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic R3(Ll/hz3;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz3;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;Ll/y34;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCallId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic T3(Ll/hz3;Ll/y34;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz3;->b4(Ll/y34;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method private synthetic e4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz3;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final V3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hz3;->i:Ll/r2s;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/cz3;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/cz3;-><init>(Ll/r2s;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/n54;->Y3(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public W3(Ljava/lang/Long;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/ez3;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/ez3;-><init>(Ljava/lang/Long;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/y34;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/hz3;->k4(Ll/y34;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/hz3;->m4(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public X3(Ll/qvd;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hz3;->i:Ll/r2s;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0, p0}, Ll/r2s;->u4(ZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz3;->i:Ll/r2s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z3(Ll/y34;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iput-object p2, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a4(Ll/y34;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz3;->i:Ll/r2s;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/qvd;->m()Ll/j2s;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/j2s;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez p0, :cond_0

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

.method public final synthetic b4(Ll/y34;Ljava/lang/Long;)Lrx/c;
    .locals 1

    .line 1
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    sget-object v0, Ll/q24;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->f6(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic c4(Ll/y34;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz3;->f4(Ll/y34;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d4(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz3;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f4(Ll/y34;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H1:I

    .line 4
    .line 5
    iget-object v2, p1, Ll/y34;->b:Ll/h64;

    .line 6
    .line 7
    iget-object v2, v2, Ll/h64;->b:Ljava/lang/String;

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "anchor onConnectFailed callId"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/hz3;->i:Ll/r2s;

    .line 47
    .line 48
    iget-object v1, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    xor-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-virtual {v0, v2, v1}, Ll/r2s;->u4(ZZ)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/hz3;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public g4(Ll/y34;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onVoiceCallAgreed callId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 11
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
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 23
    .line 24
    new-instance v1, Ll/fz3;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Ll/fz3;-><init>(Ll/y34;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/y34;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/hz3;->l4(Ll/y34;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/hz3;->i:Ll/r2s;

    .line 51
    .line 52
    iget-object p0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    const/4 v0, 0x1

    .line 59
    xor-int/2addr p0, v0

    .line 60
    invoke-virtual {p1, v0, p0}, Ll/r2s;->u4(ZZ)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public h4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 2

    .line 1
    const/16 v0, 0x1c

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v1, Ll/dz3;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ll/dz3;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/y34;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 25
    .line 26
    iget-object v1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/hz3;->m4(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/hz3;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final i4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->removeCallCheck()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "report call video success id = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;->VIDEO_TYPE:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;

    .line 24
    .line 25
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Y6(Ljava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/gz3;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/gz3;-><init>(Ll/hz3;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/hz3;->i:Ll/r2s;

    .line 39
    .line 40
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    new-instance v1, Ll/l2s;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/l2s;-><init>(Ll/r2s;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final k4(Ll/y34;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "reportVoiceSuccess callId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 11
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
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;->VOICE_TYPE:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;

    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Y6(Ljava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$ConnectType;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/xy3;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/xy3;-><init>(Ll/hz3;Ll/y34;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/hz3;->i:Ll/r2s;

    .line 43
    .line 44
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    new-instance p1, Ll/l2s;

    .line 48
    .line 49
    invoke-direct {p1, p0}, Ll/l2s;-><init>(Ll/r2s;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final l4(Ll/y34;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startConnectWatchDog callId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 11
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
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/16 v1, 0x1e

    .line 27
    .line 28
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/uy3;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/uy3;-><init>(Ll/hz3;Ll/y34;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/vy3;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Ll/vy3;-><init>(Ll/hz3;Ll/y34;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/wy3;

    .line 62
    .line 63
    invoke-direct {v1, p0, p1}, Ll/wy3;-><init>(Ll/hz3;Ll/y34;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Ll/hz3;->i:Ll/r2s;

    .line 67
    .line 68
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    new-instance v3, Ll/l2s;

    .line 72
    .line 73
    invoke-direct {v3, v2}, Ll/l2s;-><init>(Ll/r2s;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object p0, p0, Ll/hz3;->k:Ljava/util/HashMap;

    .line 85
    .line 86
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final m4(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CallAnchorControlModule stop call timer id = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/hz3;->k:Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/kcg0;

    .line 25
    .line 26
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hz3;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/hz3;->k:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 12
    .line 13
    .line 14
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->f()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ty3;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ty3;-><init>(Ll/hz3;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/hz3;->i:Ll/r2s;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/n54;->a4()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/yy3;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/yy3;-><init>(Ll/hz3;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/zy3;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/zy3;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/az3;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/az3;-><init>(Ll/hz3;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const/16 v1, 0x14

    .line 89
    .line 90
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 91
    .line 92
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ll/bz3;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/bz3;-><init>(Ll/hz3;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    return-void
.end method
