.class public Ll/kyo0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/dum;

.field public k:Ll/lwo0;

.field public l:Ll/t2p0;

.field public m:Ll/uyo0;

.field public n:Ll/u0p0;

.field public o:Ll/k1p0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Ll/k1p0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kyo0;->j:Ll/dum;

    .line 5
    .line 6
    iput-object p3, p0, Ll/kyo0;->o:Ll/k1p0;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Ll/lwo0;

    .line 12
    .line 13
    iget-object p3, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-direct {p2, p3, p0}, Ll/lwo0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/kyo0;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Ll/kyo0;->k:Ll/lwo0;

    .line 19
    .line 20
    new-instance p2, Ll/t2p0;

    .line 21
    .line 22
    iget-object p3, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-direct {p2, p3, p0}, Ll/t2p0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/kyo0;)V

    .line 25
    .line 26
    .line 27
    iput-object p2, p0, Ll/kyo0;->l:Ll/t2p0;

    .line 28
    .line 29
    new-instance p2, Ll/uyo0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-direct {p2, p0, p3}, Ll/uyo0;-><init>(Ll/xzs;Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    iput-object p2, p0, Ll/kyo0;->m:Ll/uyo0;

    .line 39
    .line 40
    new-instance p2, Ll/u0p0;

    .line 41
    .line 42
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    invoke-direct {p2, p1, p0}, Ll/u0p0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/kyo0;)V

    .line 45
    .line 46
    .line 47
    iput-object p2, p0, Ll/kyo0;->n:Ll/u0p0;

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Ll/u0p0;->K(Ll/kyo0;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private synthetic G4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/kyo0;->l:Ll/t2p0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->getSelectCpInfo()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ll/t2p0;->N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic S3(Ll/kyo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ll/vxj0;)V

    return-void
.end method

.method public static synthetic T3(Ll/kyo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kyo0;->y4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic U3(Ll/kyo0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kyo0;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic V3(Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W3(Ll/kyo0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kyo0;->E4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic X3(Ll/kyo0;Ljava/lang/String;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kyo0;->C4(Ljava/lang/String;ILjava/util/List;)V

    return-void
.end method

.method public static synthetic Y3(Ll/kyo0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kyo0;->z4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a4(Ll/y20;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d4(Ll/kyo0;ZLjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kyo0;->B4(ZLjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic e4(Ll/kyo0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->A4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;)V

    return-void
.end method

.method public static synthetic f4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g4(Ll/kyo0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kyo0;->G4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic h4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i4(Ll/kyo0;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->F4(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m4(Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n4(Ll/kyo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kyo0;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;)V

    return-void
.end method

.method public static synthetic o4(Ll/kyo0;Ljava/lang/String;ILandroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kyo0;->D4(Ljava/lang/String;ILandroid/util/Pair;)V

    return-void
.end method


# virtual methods
.method public final synthetic A4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyo0;->m:Ll/uyo0;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Ll/uyo0;->t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B4(ZLjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 3

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v2, 0xc8

    .line 6
    .line 7
    if-ne v1, v2, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ch:I

    .line 12
    .line 13
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/kyo0;->Y4()V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->P4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_2

    .line 31
    .line 32
    iget-object p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public final synthetic C4(Ljava/lang/String;ILjava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kyo0;->n:Ll/u0p0;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p3, v0, p1, p2}, Ll/u0p0;->S(Ljava/util/List;Ljava/util/List;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic D4(Ljava/lang/String;ILandroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kyo0;->n:Ll/u0p0;

    .line 2
    .line 3
    iget-object v0, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/List;

    .line 6
    .line 7
    iget-object p3, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p3, Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, v0, p3, p1, p2}, Ll/u0p0;->S(Ljava/util/List;Ljava/util/List;Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic E4(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p1}, Ll/kyo0;->P4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic F4(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyo0;->n:Ll/u0p0;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Ll/u0p0;->R(Ljava/util/List;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kyo0;->j:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0, p1, p2}, Ll/fwo0;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/qxo0;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/qxo0;-><init>(Ll/kyo0;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/rxo0;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/rxo0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public I4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kyo0;->j:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/fwo0;->m(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/xxo0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/xxo0;-><init>(Ll/kyo0;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/zxo0;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/zxo0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public J4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p1, v0}, Ll/kyo0;->T4(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public K4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->Q4(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public L4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->wore:Z

    .line 5
    .line 6
    xor-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->id:I

    .line 9
    .line 10
    invoke-virtual {p0, v0, p2, p1}, Ll/kyo0;->R4(ZLjava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public M4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    const-string v0, "0"

    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p2, p1}, Ll/kyo0;->Q4(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public N4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskType:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, -0x1

    .line 16
    sparse-switch v1, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :sswitch_0
    const-string v1, "first_send_gift"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v2, 0x2

    .line 30
    goto :goto_0

    .line 31
    :sswitch_1
    const-string v1, "send_gift"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 v2, 0x1

    .line 41
    goto :goto_0

    .line 42
    :sswitch_2
    const-string v1, "signin"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const/4 v2, 0x0

    .line 52
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :pswitch_0
    invoke-virtual {p0, p2}, Ll/kyo0;->S4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :pswitch_1
    iget-object v0, p0, Ll/kyo0;->j:Ll/dum;

    .line 61
    .line 62
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskType:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0, v1, v2, v3}, Ll/fwo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/yxo0;

    .line 79
    .line 80
    invoke-direct {v1, p0, p2}, Ll/yxo0;-><init>(Ll/kyo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 81
    .line 82
    .line 83
    new-instance p0, Ll/cyo0;

    .line 84
    .line 85
    invoke-direct {p0}, Ll/cyo0;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskCpStatus:I

    .line 96
    .line 97
    if-nez p0, :cond_4

    .line 98
    .line 99
    invoke-static {}, Ll/ryo0;->g()V

    .line 100
    .line 101
    .line 102
    :cond_4
    :goto_1
    return-void

    .line 103
    :sswitch_data_0
    .sparse-switch
        -0x35ca905e -> :sswitch_2
        0x191c787 -> :sswitch_1
        0x3cfdf8b8 -> :sswitch_0
    .end sparse-switch

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public O4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/kyo0;->k:Ll/lwo0;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/lwo0;->T(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/ryo0;->b()V

    .line 12
    .line 13
    .line 14
    :cond_1
    :goto_0
    return-void
.end method

.method public P4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kyo0;->j:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/fwo0;->m(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/ayo0;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1, p2}, Ll/ayo0;-><init>(Ll/kyo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ll/byo0;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Ll/byo0;-><init>(Ll/kyo0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final Q4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Ll/fwo0;->n(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/dyo0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2}, Ll/dyo0;-><init>(Ll/kyo0;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/eyo0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/eyo0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final R4(ZLjava/lang/String;I)V
    .locals 1

    .line 1
    invoke-static {p1, p2, p3}, Ll/fwo0;->s(ZLjava/lang/String;I)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0, p3}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    new-instance v0, Ll/uxo0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1, p2}, Ll/uxo0;-><init>(Ll/kyo0;ZLjava/lang/String;)V

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
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final S4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceSweetEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;->dismissSweetCpDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1, p1}, Ll/kyo0;->Z4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public T4(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/fwo0;->o(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/fyo0;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2}, Ll/fyo0;-><init>(Ll/kyo0;Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/gyo0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/gyo0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v0, Ll/hyo0;

    .line 34
    .line 35
    invoke-direct {v0, p0, p1, p2}, Ll/hyo0;-><init>(Ll/kyo0;Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, v0}, Ll/kyo0;->t4(Ljava/lang/String;Ll/y20;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public U4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/rwn0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public V4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyo0;->o:Ll/k1p0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k1p0;->t4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public W4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyo0;->o:Ll/k1p0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k1p0;->u4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kyo0;->j:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/fwo0;->u(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/sxo0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/sxo0;-><init>(Ll/kyo0;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/txo0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/txo0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public Y4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kyo0;->n:Ll/u0p0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u0p0;->r:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/fwo0;->q(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/vxo0;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Ll/vxo0;-><init>(Ll/kyo0;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/wxo0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/wxo0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final Z4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/rwn0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, p1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object p1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    new-instance v2, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v2, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iput-object p2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p2, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    iput-object p3, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    check-cast p3, Ll/rwn0;

    .line 77
    .line 78
    invoke-virtual {p3}, Ll/rwn0;->P2()Ll/hrk0;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {p3, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-nez p1, :cond_1

    .line 87
    .line 88
    invoke-static {p0, p2}, Ll/ydn0;->d(Ll/i6t;Ll/nsv;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    if-eqz v0, :cond_2

    .line 93
    .line 94
    invoke-static {p0, p1, v0}, Ll/ydn0;->h(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    return-void

    .line 98
    :cond_3
    :goto_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ad:I

    .line 99
    .line 100
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final p4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v1, Ll/h64;

    .line 18
    .line 19
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v1, v2, v3, v4}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 29
    .line 30
    const-string v3, "gift-audience-none-voiceLiveMain"

    .line 31
    .line 32
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 33
    .line 34
    invoke-static {v2, v3, v0}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v1, v0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v0, 0x0

    .line 44
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ll/hne0$a;

    .line 55
    .line 56
    invoke-direct {v2}, Ll/hne0$a;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v4, Ll/kyo0$a;

    .line 60
    .line 61
    invoke-direct {v4, p0}, Ll/kyo0$a;-><init>(Ll/kyo0;)V

    .line 62
    .line 63
    .line 64
    const-string p0, "sweetCp"

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string v3, ""

    .line 71
    .line 72
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    const-string v10, "voice_sweet_bind_cp"

    .line 77
    .line 78
    const/4 v5, 0x1

    .line 79
    const-string v6, "sendGiftBindCp"

    .line 80
    .line 81
    const-string v7, "sendGiftBindCp"

    .line 82
    .line 83
    move-object v3, p1

    .line 84
    move-object v9, p2

    .line 85
    invoke-virtual/range {v2 .. v10}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const/4 p1, 0x0

    .line 90
    invoke-virtual {p0, p1}, Ll/hne0$a;->A(Z)Ll/hne0$a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v0}, Ll/hne0$a;->z(Ll/coj;)Ll/hne0$a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public q4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->tb()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;->userId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Ll/kyo0;->p4(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ll/rwn0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/rwn0;->p()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    const-string p0, "p_anchor_audio_room"

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    const-string p0, "p_user_audio_room"

    .line 40
    .line 41
    :goto_1
    invoke-static {p0}, Ll/ryo0;->f(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public r4()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->getSelectCpInfo()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 17
    .line 18
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->s:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->getSelectCpInfo()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 30
    .line 31
    xor-int/2addr p0, v1

    .line 32
    return p0
.end method

.method public s4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyo0;->n:Ll/u0p0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceSweetEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;->showUnbindCpDialog()Ll/v3f$c;

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
    new-instance v1, Ll/nxo0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/nxo0;-><init>(Ll/kyo0;)V

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

.method public final t4(Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fwo0;->o(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/iyo0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/iyo0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1}, Ll/fwo0;->q(Ljava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v1, Ll/jyo0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/jyo0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v1, Ll/gz50;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/gz50;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p1, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Ll/oxo0;

    .line 41
    .line 42
    invoke-direct {p1, p2}, Ll/oxo0;-><init>(Ll/y20;)V

    .line 43
    .line 44
    .line 45
    new-instance p2, Ll/pxo0;

    .line 46
    .line 47
    invoke-direct {p2}, Ll/pxo0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public u4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyo0;->n:Ll/u0p0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

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

.method public final synthetic v4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->G(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic w4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->H(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/kyo0;->H4(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 4
    .line 5
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->y(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getAction()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    sget-object p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->agree:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 17
    .line 18
    if-ne p2, p3, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->z(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getAction()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->refuse:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 37
    .line 38
    if-ne p1, p2, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->z(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_2

    .line 54
    .line 55
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 58
    .line 59
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->z(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public final synthetic z4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->y(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->J9:I

    .line 15
    .line 16
    invoke-virtual {p0, p1, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->C(ZZI)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
