.class public Ll/w7s;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/w7s;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7s;->t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method

.method public static synthetic f0(Ll/w7s;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7s;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/w7s;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w7s;->z0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V

    return-void
.end method

.method public static synthetic h0(Ll/w7s;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7s;->y0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0(Ll/w7s;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w7s;->x0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    return-void
.end method

.method public static synthetic j0(Ll/w7s;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7s;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method

.method public static synthetic k0(Ljava/util/List;)Lcom/p1/mobile/putong/data/Picture;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic l0(Ll/w7s;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7s;->s0(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    return-void
.end method

.method public static synthetic m0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 22
    .line 23
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static synthetic n0(Ll/w7s;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7s;->u0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E2:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private p0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;

    .line 4
    .line 5
    iget-object v0, p0, Ll/w7s;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->A3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/w7s;->a:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "from_voice"

    .line 13
    .line 14
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/w7s;->c:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVirtualVoiceRoomInfo(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/n7s;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/n7s;-><init>(Ll/w7s;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, ""

    .line 50
    .line 51
    invoke-virtual {p0, v0, p1}, Ll/w7s;->q0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Ll/o7s;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/o7s;-><init>(Ll/w7s;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public final A0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 2

    .line 1
    const-string v0, "from_voice"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/w7s;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p2}, Ll/itv;->J(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/t7s;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/t7s;-><init>(Ll/w7s;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/u7s;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/u7s;-><init>(Ll/w7s;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 52
    .line 53
    iget-object p2, p0, Ll/w7s;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 54
    .line 55
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->z6(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p0, p2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    new-instance v0, Ll/v7s;

    .line 66
    .line 67
    invoke-direct {v0, p0, p1}, Ll/v7s;-><init>(Ll/w7s;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Ll/m7s;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Ll/m7s;-><init>(Ll/w7s;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public C0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w7s;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w7s;->a:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public D0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Le:I

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/w7s;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/w7s;->E0(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final E0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->e2()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v1, v1, [Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput-object v0, v1, v2

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "voice_avatar"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/q7s;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/q7s;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/r7s;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/r7s;-><init>(Ll/w7s;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Ll/s7s;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/s7s;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/l7s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/l7s;-><init>(Ll/w7s;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final q0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Picture;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoom;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->T5(ZLjava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/p7s;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2}, Ll/p7s;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 4
    .line 5
    iput-object p1, p0, Ll/w7s;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l2(ZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/w7s;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, ""

    .line 17
    .line 18
    :goto_0
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l2(ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic u0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Ll/yvr;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic x0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 1

    .line 1
    const-string v0, "from_message"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D2:I

    .line 10
    .line 11
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 21
    .line 22
    .line 23
    new-instance p1, Landroid/content/Intent;

    .line 24
    .line 25
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v0, "room_tag"

    .line 29
    .line 30
    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    const/4 v0, -0x1

    .line 36
    invoke-virtual {p2, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w7s;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Ll/yvr;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic z0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w7s;->A0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
