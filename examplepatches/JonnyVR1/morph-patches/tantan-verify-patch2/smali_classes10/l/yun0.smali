.class public Ll/yun0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/iun0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/x20;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance p1, Ll/mun0;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/mun0;-><init>(Ll/yun0;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/yun0;->j:Ll/x20;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic J3(Ll/yoh0;)Ll/h5o0;
    .locals 3

    .line 1
    new-instance v0, Ll/h5o0;

    .line 2
    .line 3
    new-instance v1, Ll/i5o0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yoh0;->t()Ll/zoh0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Ll/zoh0;->i()Landroid/text/SpannableStringBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0}, Ll/yoh0;->t()Ll/zoh0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/zoh0;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/mi3;->c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v1, v2, p0}, Ll/i5o0;-><init>(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/h5o0;-><init>(Ll/i5o0;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public static synthetic K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/yun0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yun0;->c4()V

    return-void
.end method

.method public static synthetic N3(Ll/pf2;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Ll/yoh0;

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

.method public static synthetic O3(Ll/yun0;Ljava/lang/String;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yun0;->b4(Ljava/lang/String;Ll/ugd0;)V

    return-void
.end method

.method public static synthetic P3(Ll/pf2;)Ll/yoh0;
    .locals 0

    .line 1
    check-cast p0, Ll/yoh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic S3(Ll/yun0;Ll/iun0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yun0;->Y3(Ll/iun0;)V

    return-void
.end method

.method public static synthetic T3(Ll/jsv;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic U3(Ll/yun0;Ll/iun0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yun0;->Y3(Ll/iun0;)V

    return-void
.end method

.method public static synthetic V3(Ll/yun0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yun0;->a4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic W3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic a4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yun0;->X3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

    .line 23
    .line 24
    iget-object v1, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/iun0;

    .line 31
    .line 32
    iget-object p0, p0, Ll/yun0;->j:Ll/x20;

    .line 33
    .line 34
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->v(Ll/iun0;Ll/x20;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/lun0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/lun0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/pun0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/pun0;-><init>(Ll/yun0;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Ll/qun0;

    .line 36
    .line 37
    invoke-direct {p0}, Ll/qun0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public X3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Y3(Ll/iun0;)V
    .locals 2

    .line 1
    invoke-virtual {p1, p0}, Ll/iun0;->c(Ll/yun0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/zun0;->a(Ll/iun0;)V

    .line 5
    .line 6
    .line 7
    instance-of v0, p1, Ll/h5o0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Ll/h5o0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/h5o0;->n()Ll/i5o0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/h5o0;->n()Ll/i5o0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/i5o0;->j()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    iget-object v1, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 37
    .line 38
    invoke-static {p1, v0, v1}, Ll/zun0;->g(Ll/iun0;ZLjava/util/LinkedList;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    iget-object v1, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 49
    .line 50
    invoke-static {p1, v0, v1}, Ll/zun0;->g(Ll/iun0;ZLjava/util/LinkedList;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-direct {p0}, Ll/yun0;->c4()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public Z3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/itv;->w(Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/nun0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2}, Ll/nun0;-><init>(Ll/yun0;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/oun0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/oun0;-><init>()V

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

.method public final synthetic b4(Ljava/lang/String;Ll/ugd0;)V
    .locals 0

    .line 1
    iget-object p2, p2, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    const/16 p2, 0x1b5c

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    if-ne p2, p0, :cond_1

    .line 15
    .line 16
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Dj:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const/4 p0, 0x2

    .line 29
    if-ne p2, p0, :cond_2

    .line 30
    .line 31
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 32
    .line 33
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vf:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yun0;->i:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

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
    invoke-virtual {v0}, Ll/aj1;->L0()Lrx/c;

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
    new-instance v1, Ll/run0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/run0;-><init>(Ll/yun0;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/sun0;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/sun0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/aj1;->e()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/tun0;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/tun0;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/uun0;

    .line 59
    .line 60
    invoke-direct {v1}, Ll/uun0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/vun0;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/vun0;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/wun0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/wun0;-><init>(Ll/yun0;)V

    .line 83
    .line 84
    .line 85
    new-instance p0, Ll/xun0;

    .line 86
    .line 87
    invoke-direct {p0}, Ll/xun0;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    return-void
.end method
