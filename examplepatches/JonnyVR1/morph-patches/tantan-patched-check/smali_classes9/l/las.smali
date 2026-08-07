.class public Ll/las;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

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
    iput-object p1, p0, Ll/las;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic J3(Ll/las;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/las;->V3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic K3(Ll/las;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/las;->U3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/las;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/las;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method

.method public static synthetic M3(Ll/las;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/las;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    return-void
.end method

.method public static synthetic N3(Ll/las;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/las;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;)V

    return-void
.end method

.method public static S3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

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
    return-object p0

    .line 8
    :cond_0
    invoke-static {p1}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic U3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/las;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic V3(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/las;->R3()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 19
    .line 20
    :goto_0
    if-ne p1, v0, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Ll/las;->i:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->i()V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method


# virtual methods
.method public final O3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/las;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/las;->R3()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final P3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/muj;->U(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/jfv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/jfv;->f()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/las;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    new-instance v1, Ll/kas;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Ll/kas;-><init>(Ll/las;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/wqe;->b(Ljava/lang/String;Ll/y20;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-virtual {p0, p1}, Ll/las;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public R3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/las;->i:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/las;->i:Ljava/util/ArrayList;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 27
    .line 28
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 31
    .line 32
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 33
    .line 34
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->e(JLcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->l4()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {v1, v0, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/fas;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/fas;-><init>(Ll/las;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/gas;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/gas;-><init>(Ll/las;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/has;

    .line 55
    .line 56
    invoke-direct {v0}, Ll/has;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/i6t;->u3(Ll/qcj;)Ll/i6t$a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/ias;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/ias;-><init>(Ll/las;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final T3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/las;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/las;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final X3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;->wealthHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserWealthHierarchy;

    .line 19
    .line 20
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserWealthHierarchy;->grade:I

    .line 21
    .line 22
    int-to-long v2, v2

    .line 23
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserWealthHierarchy;->icon:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/las;->S3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

    .line 68
    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 74
    .line 75
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->showDuration:I

    .line 76
    .line 77
    int-to-long v2, v2

    .line 78
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 79
    .line 80
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->isWealthHierarchy:Z

    .line 81
    .line 82
    iput-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 83
    .line 84
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradientDirection:I

    .line 85
    .line 86
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 87
    .line 88
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

    .line 89
    .line 90
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 91
    .line 92
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradientDirection:I

    .line 93
    .line 94
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 95
    .line 96
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 97
    .line 98
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 99
    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 101
    .line 102
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrlEndMargin:I

    .line 103
    .line 104
    int-to-long v1, v1

    .line 105
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 106
    .line 107
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 110
    .line 111
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->animationSizeType:J

    .line 112
    .line 113
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 114
    .line 115
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->enterVersion:J

    .line 116
    .line 117
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 124
    .line 125
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 128
    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 132
    .line 133
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ll/las;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public Y3(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/16 v1, 0x5dc

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "gift"

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0, v3, p1, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p0, v3, p1, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "live"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "giftBanner"

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public Z3(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->i()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ll/oo2;->A0()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v3}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, v1, v2, v3}, Ll/aiv;->N0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/jas;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/jas;-><init>(Ll/las;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method
