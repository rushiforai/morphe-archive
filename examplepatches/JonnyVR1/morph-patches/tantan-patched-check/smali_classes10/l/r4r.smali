.class public Ll/r4r;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/dn50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;",
        ">;",
        "Ll/dn50;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

.field public j:Ljava/lang/String;

.field public k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/kcg0;

.field public m:I

.field public n:J

.field public o:Ljava/lang/String;

.field public p:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/r4r;->j:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/r4r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4r;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic K3(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/ogw;->a(Ljava/lang/String;Ljava/io/File;)Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic L3(Ll/r4r;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r4r;->e4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic M3(Ll/r4r;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r4r;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    return-void
.end method

.method public static synthetic N3(Ll/r4r;Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4r;->g4(Ll/hrk0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/r4r;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4r;->c4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic P3(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hrk0$a;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic R3(Ll/r4r;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r4r;->h4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S3(Ll/r4r;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVBubble;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4r;->f4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVBubble;)V

    return-void
.end method

.method public static synthetic T3(Ll/r4r;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/r4r;->d4(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V

    return-void
.end method

.method public static synthetic U3(Ll/r4r;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4r;->o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;)V

    return-void
.end method

.method public static bridge synthetic V3(Ll/r4r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r4r;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    return-void
.end method

.method private synthetic e4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->L()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic h4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->H()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private j4()V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p0}, Ll/msn0;->T(Ll/dn50;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/r4r;->l:Ll/kcg0;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method private p4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    iget-object v0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/lang/Float;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/rwn0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    if-eqz p1, :cond_4

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    const v1, 0x3ca3d70a    # 0.02f

    .line 45
    .line 46
    .line 47
    cmpg-float p1, p1, v1

    .line 48
    .line 49
    if-gez p1, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    iget-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 53
    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    iget-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    invoke-static {v0}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->J()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 84
    .line 85
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->J()V

    .line 88
    .line 89
    .line 90
    :cond_5
    :goto_2
    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/yrn0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/yrn0;-><init>(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/e4r;

    .line 15
    .line 16
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ll/e4r;-><init>(Ll/dum;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/x6r;

    .line 25
    .line 26
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/x6r;-><init>(Ll/dum;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/k6r;

    .line 35
    .line 36
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 37
    .line 38
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->C:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;

    .line 43
    .line 44
    invoke-direct {v0, v1, v2}, Ll/k6r;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public U1(Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 4
    .line 5
    invoke-virtual {v0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setMusicTotal(J)V

    .line 6
    .line 7
    .line 8
    iget-object p3, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 9
    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-wide p1, p0, Ll/r4r;->n:J

    .line 31
    .line 32
    cmp-long p1, p5, p1

    .line 33
    .line 34
    if-lez p1, :cond_0

    .line 35
    .line 36
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 39
    .line 40
    invoke-virtual {p1, p5, p6}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setMusicProgress(J)V

    .line 41
    .line 42
    .line 43
    iput-wide p5, p0, Ll/r4r;->n:J

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/r4r;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/r4r;->j:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iput-object p1, p0, Ll/r4r;->j:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p1, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    if-eqz p2, :cond_2

    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-lez p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->word:Ljava/lang/String;

    .line 56
    .line 57
    const-string v1, " \u25cf "

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->getStartTime()J

    .line 76
    .line 77
    .line 78
    move-result-wide v2

    .line 79
    new-instance p1, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    const/4 v4, 0x3

    .line 85
    :goto_0
    if-ltz v4, :cond_1

    .line 86
    .line 87
    new-instance v5, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 88
    .line 89
    invoke-direct {v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v1, v5, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->word:Ljava/lang/String;

    .line 93
    .line 94
    add-int/lit8 v6, v4, 0x1

    .line 95
    .line 96
    int-to-long v6, v6

    .line 97
    const-wide/16 v8, 0x3e8

    .line 98
    .line 99
    mul-long/2addr v6, v8

    .line 100
    sub-long v6, v2, v6

    .line 101
    .line 102
    iput-wide v6, v5, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->begin:J

    .line 103
    .line 104
    int-to-long v6, v4

    .line 105
    mul-long/2addr v6, v8

    .line 106
    sub-long v6, v2, v6

    .line 107
    .line 108
    iput-wide v6, v5, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->end:J

    .line 109
    .line 110
    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    add-int/lit8 v4, v4, -0x1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 117
    .line 118
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;-><init>(Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-interface {p1, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 129
    .line 130
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 131
    .line 132
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setLrcFile(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final X3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r4r;->l:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput p1, p0, Ll/r4r;->m:I

    .line 9
    .line 10
    const-wide/16 v0, 0x1

    .line 11
    .line 12
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-static {v0, v1, p1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/p4r;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/p4r;-><init>(Ll/r4r;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ll/r4r;->l:Ll/kcg0;

    .line 45
    .line 46
    return-void
.end method

.method public final Y3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r4r;->l:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v1, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/r4r;->W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 40
    .line 41
    iget-object p0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setPlayingView(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public final Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 5

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
    const/16 v1, 0x578

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 36
    .line 37
    const/16 v4, 0x1b61

    .line 38
    .line 39
    invoke-static {p0, v2, v3, v4}, Ll/csq;->b(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ll/rwn0;

    .line 52
    .line 53
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0, v2, p1, v4}, Ll/csq;->e(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "live"

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "liveLeaderboard"

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "liveOnlineUser"

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public a4(Ljava/lang/String;)Ll/coj;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    new-instance p1, Ll/h64;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 28
    .line 29
    invoke-direct {p1, v0, v1, v2}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "gift-audience-none-voiceLiveMain"

    .line 35
    .line 36
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 37
    .line 38
    invoke-static {v0, v1, p0}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p1, p0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return-object p0
.end method

.method public final b4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 5

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const-string v2, ""

    .line 4
    .line 5
    if-eqz p1, :cond_6

    .line 6
    .line 7
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    iget-object v3, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 14
    .line 15
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 22
    .line 23
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    iget-object v3, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 34
    .line 35
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    iget-object v3, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 48
    .line 49
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    iget-object v3, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 58
    .line 59
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 62
    .line 63
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_1

    .line 70
    .line 71
    iget-object v3, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 74
    .line 75
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 76
    .line 77
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 78
    .line 79
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_1

    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 87
    .line 88
    iput-object v3, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->id:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p1, p0, Ll/r4r;->o:Ljava/lang/String;

    .line 93
    .line 94
    iget-object p1, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 95
    .line 96
    const-string v3, "prepare"

    .line 97
    .line 98
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    iput-object v2, p0, Ll/r4r;->j:Ljava/lang/String;

    .line 105
    .line 106
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 107
    .line 108
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 109
    .line 110
    iget-object v2, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 111
    .line 112
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setPrepareView(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    .line 113
    .line 114
    .line 115
    iput-wide v0, p0, Ll/r4r;->n:J

    .line 116
    .line 117
    iget-object p1, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 118
    .line 119
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 120
    .line 121
    long-to-int p1, v0

    .line 122
    invoke-virtual {p0, p1}, Ll/r4r;->X3(I)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_2
    iget-object p1, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 129
    .line 130
    const-string v3, "playing"

    .line 131
    .line 132
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_3

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/r4r;->Y3()V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_3
    iget-object p1, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 143
    .line 144
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 145
    .line 146
    const-string v3, "pause"

    .line 147
    .line 148
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_5

    .line 153
    .line 154
    iget-object p1, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 155
    .line 156
    iget-object v0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 159
    .line 160
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_4

    .line 165
    .line 166
    iget-object p1, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 167
    .line 168
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 169
    .line 170
    iget-object v0, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 171
    .line 172
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 177
    .line 178
    invoke-virtual {p0, p1, v0}, Ll/r4r;->W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V

    .line 179
    .line 180
    .line 181
    :cond_4
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 182
    .line 183
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 184
    .line 185
    iget-object p0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 186
    .line 187
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setPauseView(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_5
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 192
    .line 193
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 194
    .line 195
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->F()V

    .line 196
    .line 197
    .line 198
    iput-object v2, p0, Ll/r4r;->j:Ljava/lang/String;

    .line 199
    .line 200
    iput-wide v0, p0, Ll/r4r;->n:J

    .line 201
    .line 202
    return-void

    .line 203
    :cond_6
    :goto_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 204
    .line 205
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->F()V

    .line 208
    .line 209
    .line 210
    iput-object v2, p0, Ll/r4r;->j:Ljava/lang/String;

    .line 211
    .line 212
    iput-wide v0, p0, Ll/r4r;->n:J

    .line 213
    .line 214
    const/4 p1, 0x0

    .line 215
    iput-object p1, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 216
    .line 217
    return-void
.end method

.method public final synthetic c4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget p1, p0, Ll/r4r;->m:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/r4r;->Y3()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    iput p1, p0, Ll/r4r;->m:I

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setCountDownView(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic d4(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Ll/r4r;->W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic f4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVBubble;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r4r;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVBubble;->getGameId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVBubble;->getContent()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVBubble;->getContent()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->I(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic g4(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

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

.method public i4()V
    .locals 4

    .line 1
    sget-object v0, Ll/efv;->U:Ljava/lang/String;

    .line 2
    .line 3
    const v1, 0x440f8000    # 574.0f

    .line 4
    .line 5
    .line 6
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/16 v2, 0x1b61

    .line 11
    .line 12
    const/16 v3, 0x18

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public k4(IILjava/lang/String;)V
    .locals 10

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Ll/r4r;->a4(Ljava/lang/String;)Ll/coj;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/hne0$a;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    new-instance v3, Ll/r4r$b;

    .line 19
    .line 20
    invoke-direct {v3, p0}, Ll/r4r$b;-><init>(Ll/r4r;)V

    .line 21
    .line 22
    .line 23
    const-string v4, "ktvQuickGift"

    .line 24
    .line 25
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-static {v5, v4}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    const-string v9, "source_voice_ktv_quick_gift"

    .line 34
    .line 35
    const-string v5, "ktv_panel"

    .line 36
    .line 37
    const-string v6, "ktv_panel"

    .line 38
    .line 39
    move v4, p2

    .line 40
    move-object v8, p3

    .line 41
    invoke-virtual/range {v1 .. v9}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2, v0}, Ll/hne0$a;->z(Ll/coj;)Ll/hne0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    const/4 p3, 0x0

    .line 50
    invoke-virtual {p2, p3}, Ll/hne0$a;->A(Z)Ll/hne0$a;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Ll/hne0$a;->t()Ll/hne0;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iget-object p3, p2, Ll/hne0;->a:Ll/uoe0;

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p3, Ll/uoe0;->D:Z

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 68
    .line 69
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p3, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    move v4, p2

    .line 78
    move-object v8, p3

    .line 79
    :goto_0
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 80
    .line 81
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 82
    .line 83
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->E()V

    .line 84
    .line 85
    .line 86
    sget-object p2, Ll/htd0;->c:Ll/htd0;

    .line 87
    .line 88
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    check-cast p2, Ll/hiv;

    .line 93
    .line 94
    invoke-virtual {p2, p1}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-eqz p2, :cond_1

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p1, p0, v8, v4}, Ll/qzj;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    :cond_1
    return-void
.end method

.method public l4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/r4r;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x5

    .line 7
    .line 8
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

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
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/g4r;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/g4r;-><init>(Ll/r4r;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/r4r;->p:Ll/kcg0;

    .line 46
    .line 47
    return-void
.end method

.method public m4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r4r;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/r4r;->j4()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/r4r;->p:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n4()V
    .locals 1

    .line 1
    const-string v0, "ktv"

    .line 2
    .line 3
    invoke-static {v0}, Ll/n2m0;->c(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->showFunctionsDialog()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;)V
    .locals 9

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
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/msn0;->x()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getOrderId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    move-object v0, p0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getLevel()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getGiftUv()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getNextLevelGiftUv()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getScore()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    int-to-long v4, p0

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getLevelTip()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getSchema()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRating;->getShowBgSvgaUrl()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->K(IIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p2, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p2, p0, Ll/r4r;->k:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Ll/r4r;->W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void

    .line 33
    :cond_1
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, p2, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/q4r;

    .line 43
    .line 44
    invoke-direct {v0, p3}, Ll/q4r;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-virtual {p2, p3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    new-instance p3, Ll/h4r;

    .line 60
    .line 61
    invoke-direct {p3, p0, p1}, Ll/h4r;-><init>(Ll/r4r;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public s0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r4r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/r4r;->Y3()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p0}, Ll/tqn0;->b(Ll/i6t;Ll/dn50;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->changeCurrentKtvPlayInfo()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/i4r;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/i4r;-><init>(Ll/r4r;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 28
    .line 29
    new-instance v1, Ll/r4r$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/r4r$a;-><init>(Ll/r4r;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->setClickCallback(Ll/b6r;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/aj1;->A0()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/j4r;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/j4r;-><init>(Ll/r4r;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ll/rwn0;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/aj1;->D0()Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x0

    .line 82
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v2, Ll/k4r;

    .line 87
    .line 88
    invoke-direct {v2, p0}, Ll/k4r;-><init>(Ll/r4r;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Ll/rwn0;

    .line 103
    .line 104
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/l4r;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/l4r;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Ll/m4r;

    .line 122
    .line 123
    invoke-direct {v1, p0}, Ll/m4r;-><init>(Ll/r4r;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/n4r;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/n4r;-><init>(Ll/r4r;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 151
    .line 152
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lrx/c;

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    new-instance v1, Ll/o4r;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Ll/o4r;-><init>(Ll/r4r;)V

    .line 169
    .line 170
    .line 171
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 176
    .line 177
    .line 178
    return-void
.end method
