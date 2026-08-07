.class public Ll/u060;
.super Ll/cz50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cz50<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Ll/kcg0;

.field public final l:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cz50;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/u060;->l:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 5
    .line 6
    return-void
.end method

.method private D4(JJ)V
    .locals 4

    .line 1
    sub-long/2addr p1, p3

    .line 2
    const-wide/16 p3, 0x12c

    .line 3
    .line 4
    cmp-long p3, p1, p3

    .line 5
    .line 6
    iget-object p4, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    if-lez p3, :cond_0

    .line 9
    .line 10
    const-wide/16 v0, 0x3c

    .line 11
    .line 12
    div-long v2, p1, v0

    .line 13
    .line 14
    mul-long/2addr v0, v2

    .line 15
    sub-long/2addr p1, v0

    .line 16
    check-cast p4, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 17
    .line 18
    new-instance p3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v2, v3}, Ll/u060;->n4(J)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, ":"

    .line 31
    .line 32
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, p1, p2}, Ll/u060;->n4(J)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->setCountDownText(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    check-cast p4, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 51
    .line 52
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->setCountDownText(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic W3(Ll/u060;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->z4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic X3(Ll/u060;JLcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/u060;->A4(JLcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Y3(Ll/u060;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u060;->x4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Z3(Ll/u060;Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->v4(Ll/q260;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b4(Ll/u060;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u060;->y4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c4(Ll/u060;Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->r4(Ll/q260;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d4(Ll/u060;Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->t4(Ll/q260;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e4(Ll/u060;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->s4(Ll/q260;)V

    return-void
.end method

.method public static synthetic f4(Ll/u060;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->w4(Ll/q260;)V

    return-void
.end method

.method public static synthetic g4(Ll/u060;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u060;->B4()V

    return-void
.end method

.method public static synthetic h4(Ll/u060;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->u4(Ll/q260;)V

    return-void
.end method

.method public static synthetic i4()V
    .locals 0

    .line 1
    return-void
.end method

.method private n4(J)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0xa

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v0, "0"

    .line 15
    .line 16
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method private synthetic x4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 10
    .line 11
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isForPrepare:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->setViewForReady(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic y4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u060;->l:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->q(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public final synthetic A4(JLcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long v0, v0, p1

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide p3

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Ll/u060;->D4(JJ)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p3}, Ll/u060;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p4}, Ll/x20;->call()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic B4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->J(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public C4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Ll/u060;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1, p1}, Ll/s260;->f(ZLl/oo2;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iput-object p1, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->titleType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationTitleType;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const/4 v2, 0x0

    .line 49
    const/4 v3, -0x1

    .line 50
    sparse-switch v1, :sswitch_data_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :sswitch_0
    const-string v1, "countdown"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const/4 v3, 0x2

    .line 64
    goto :goto_0

    .line 65
    :sswitch_1
    const-string v1, "text"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 v3, 0x1

    .line 75
    goto :goto_0

    .line 76
    :sswitch_2
    const-string v1, "none"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_3

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    move v3, v2

    .line 86
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :pswitch_0
    const-string v0, "shootGame"

    .line 91
    .line 92
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_4

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->countdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 103
    .line 104
    new-instance v0, Ll/j060;

    .line 105
    .line 106
    invoke-direct {v0}, Ll/j060;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p1, v0}, Ll/u060;->E4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :pswitch_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->text:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ll/u060;->F4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :pswitch_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 122
    .line 123
    check-cast p0, Landroid/view/View;

    .line 124
    .line 125
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    :cond_4
    :goto_1
    return-void

    .line 129
    :sswitch_data_0
    .sparse-switch
        0x33af38 -> :sswitch_2
        0x36452d -> :sswitch_1
        0x50995631 -> :sswitch_0
    .end sparse-switch

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final E4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;)V
    .locals 10
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 2
    .line 3
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    const-wide/16 v2, 0x3e8

    .line 7
    .line 8
    div-long v6, v0, v2

    .line 9
    .line 10
    iget-object v0, p0, Ll/u060;->k:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    cmp-long v2, v6, v0

    .line 18
    .line 19
    if-lez v2, :cond_0

    .line 20
    .line 21
    invoke-direct {p0, v6, v7, v0, v1}, Ll/u060;->D4(JJ)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    long-to-int v1, v6

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v4, Ll/i060;

    .line 44
    .line 45
    move-object v5, p0

    .line 46
    move-object v8, p1

    .line 47
    move-object v9, p2

    .line 48
    invoke-direct/range {v4 .. v9}, Ll/i060;-><init>(Ll/u060;JLcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v4}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iput-object p0, v5, Ll/u060;->k:Ll/kcg0;

    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    move-object v5, p0

    .line 63
    move-object v8, p1

    .line 64
    invoke-virtual {v5, v8}, Ll/u060;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final F4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;->content:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;->content:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->setCountDownText(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;->showRules:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleTextRules;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleTextRules;->showType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationTitleShowType;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x1

    .line 35
    const/4 v3, 0x0

    .line 36
    const/4 v4, -0x1

    .line 37
    sparse-switch v1, :sswitch_data_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :sswitch_0
    const-string v1, "off"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 v4, 0x3

    .line 51
    goto :goto_0

    .line 52
    :sswitch_1
    const-string v1, "unknown_"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const/4 v4, 0x2

    .line 62
    goto :goto_0

    .line 63
    :sswitch_2
    const-string v1, "constant"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    move v4, v2

    .line 73
    goto :goto_0

    .line 74
    :sswitch_3
    const-string v1, "duration"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_4

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    move v4, v3

    .line 84
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 85
    .line 86
    .line 87
    :goto_1
    return-void

    .line 88
    :pswitch_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 89
    .line 90
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 91
    .line 92
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->J(Z)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :pswitch_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 97
    .line 98
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 99
    .line 100
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->q(Z)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :pswitch_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 107
    .line 108
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->q(Z)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 113
    .line 114
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->q(Z)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;->showRules:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleTextRules;

    .line 120
    .line 121
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleTextRules;->fadingSeconds:J

    .line 122
    .line 123
    long-to-int p1, v0

    .line 124
    int-to-long v0, p1

    .line 125
    new-instance p1, Ll/k060;

    .line 126
    .line 127
    invoke-direct {p1, p0}, Ll/k060;-><init>(Ll/u060;)V

    .line 128
    .line 129
    .line 130
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 131
    .line 132
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/i6t;->B3(JLjava/util/concurrent/TimeUnit;Ljava/lang/Runnable;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    nop

    .line 137
    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_3
        -0x21d81c5c -> :sswitch_2
        -0xe5022ab -> :sswitch_1
        0x1ad6f -> :sswitch_0
    .end sparse-switch

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public G4(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isForPrepare:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public H4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showAllOperations()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStartEnd()Ll/v3f$d;

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
    new-instance v1, Ll/h060;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/h060;-><init>(Ll/u060;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/l060;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/l060;-><init>(Ll/u060;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->messageIconTrans()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lrx/c;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/m060;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/m060;-><init>(Ll/u060;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/n060;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/n060;-><init>(Ll/u060;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showOperationsItem()Ll/v3f$d;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lrx/c;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v1, Ll/o060;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/o060;-><init>(Ll/u060;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/p060;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/p060;-><init>(Ll/u060;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showAllOperations()Ll/v3f$d;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lrx/c;

    .line 142
    .line 143
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v1, Ll/q060;

    .line 148
    .line 149
    invoke-direct {v1, p0}, Ll/q060;-><init>(Ll/u060;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ll/u060;->q4()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_0

    .line 164
    .line 165
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->hideItem()Ll/v3f$d;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lrx/c;

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    new-instance v1, Ll/r060;

    .line 186
    .line 187
    invoke-direct {v1, p0}, Ll/r060;-><init>(Ll/u060;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->aloneCountDown()Ll/v3f$d;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    const/4 v1, 0x1

    .line 208
    invoke-virtual {v0, v1}, Ll/v3f$b;->i(Z)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Lrx/c;

    .line 213
    .line 214
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    new-instance v1, Ll/s060;

    .line 219
    .line 220
    invoke-direct {v1, p0}, Ll/s060;-><init>(Ll/u060;)V

    .line 221
    .line 222
    .line 223
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 228
    .line 229
    .line 230
    :cond_0
    return-void
.end method

.method public j4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->J(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->setCountDownText(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->J(Z)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v4, -0x1

    .line 47
    sparse-switch v1, :sswitch_data_0

    .line 48
    .line 49
    .line 50
    :goto_1
    move v2, v4

    .line 51
    goto :goto_2

    .line 52
    :sswitch_0
    const-string v1, "textDrawer"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    const/4 v2, 0x4

    .line 62
    goto :goto_2

    .line 63
    :sswitch_1
    const-string v1, "refresh"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    const/4 v2, 0x3

    .line 73
    goto :goto_2

    .line 74
    :sswitch_2
    const-string v1, "close"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_3

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    const/4 v2, 0x2

    .line 84
    goto :goto_2

    .line 85
    :sswitch_3
    const-string v1, "jumpToScheme"

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :sswitch_4
    const-string v1, "h5Drawer"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_4

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    move v2, v3

    .line 104
    :cond_5
    :goto_2
    packed-switch v2, :pswitch_data_0

    .line 105
    .line 106
    .line 107
    goto/16 :goto_3

    .line 108
    .line 109
    :pswitch_0
    const-string p1, "TextDrawer"

    .line 110
    .line 111
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p0, p1}, Ll/cz50;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :pswitch_1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget-object v1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->Element:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;->setPosition(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v1, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 130
    .line 131
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;->setOperationType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 138
    .line 139
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;->setRandomDelaySeconds(J)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 148
    .line 149
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, p1}, Ll/oo2;->H1(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :pswitch_2
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 158
    .line 159
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 160
    .line 161
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->q(Z)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->removeOperationItem()Ll/v3f$d;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    new-instance v0, Ll/q260$a;

    .line 175
    .line 176
    const/16 v1, 0x1fa4

    .line 177
    .line 178
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 179
    .line 180
    .line 181
    iget-object p0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 182
    .line 183
    invoke-virtual {v0, p0}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Ll/q260$a;->a()Ll/q260;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :pswitch_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_6

    .line 202
    .line 203
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    new-instance v0, Ll/bae0$a;

    .line 214
    .line 215
    const/16 v1, 0xc8

    .line 216
    .line 217
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 218
    .line 219
    .line 220
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    :cond_6
    :goto_3
    return-void

    .line 234
    :pswitch_4
    const-string p1, "H5Drawer"

    .line 235
    .line 236
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-virtual {p0, p1}, Ll/cz50;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;)V

    .line 241
    .line 242
    .line 243
    return-void

    .line 244
    nop

    .line 245
    :sswitch_data_0
    .sparse-switch
        -0x5e5d9be2 -> :sswitch_4
        -0x49b98db2 -> :sswitch_3
        0x5a5ddf8 -> :sswitch_2
        0x40b292db -> :sswitch_1
        0x54a4d47e -> :sswitch_0
    .end sparse-switch

    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final k4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->extraData:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "turboCard"

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->extraData:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 50
    .line 51
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 52
    .line 53
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCardInfo;->userId:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->H()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStart()Ll/v3f$d;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance v0, Ll/q260$a;

    .line 83
    .line 84
    const/16 v1, 0x1fa4

    .line 85
    .line 86
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p1}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .line 99
    .line 100
    :catch_0
    :cond_0
    return-void
.end method

.method public l4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Ll/s260;->e(ZLl/oo2;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 33
    .line 34
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/hiv;

    .line 39
    .line 40
    iget-boolean v0, v0, Ll/hiv;->i:Z

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const-string v2, "unknown_"

    .line 59
    .line 60
    sparse-switch v1, :sswitch_data_0

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :sswitch_0
    const-string v1, "H5PopUp"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_0

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :sswitch_1
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :sswitch_2
    const-string v1, "TextDrawer"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_0

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :sswitch_3
    const-string v1, "H5Drawer"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_0

    .line 93
    .line 94
    :goto_0
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/cz50;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    :goto_1
    return-void

    .line 102
    nop

    .line 103
    :sswitch_data_0
    .sparse-switch
        -0x5a8337c2 -> :sswitch_3
        -0x34894f62 -> :sswitch_2
        -0xe5022ab -> :sswitch_1
        0x3fccffdf -> :sswitch_0
    .end sparse-switch
.end method

.method public final m4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/u060;->k:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->G()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public o4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)Landroid/util/Pair;
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->getTheRemainingTime()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->getTotalTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    long-to-float v0, v0

    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 17
    .line 18
    const-string v2, "darkToBright"

    .line 19
    .line 20
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/high16 v2, 0x43b40000    # 360.0f

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    sub-long/2addr p0, v3

    .line 35
    long-to-float p0, p0

    .line 36
    div-float/2addr p0, v0

    .line 37
    mul-float/2addr p0, v2

    .line 38
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 53
    .line 54
    const-string v3, "brightToDark"

    .line 55
    .line 56
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-static {}, Ll/pzi0;->o()J

    .line 63
    .line 64
    .line 65
    move-result-wide v3

    .line 66
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 67
    .line 68
    sub-long/2addr v3, p0

    .line 69
    long-to-float p0, v3

    .line 70
    div-float/2addr p0, v0

    .line 71
    mul-float/2addr p0, v2

    .line 72
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    :cond_2
    :goto_0
    return-object p0
.end method

.method public p4()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q4()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u060;->l:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "shootGame"

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic r4(Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/u060;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic s4(Ll/q260;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->setViewForReady(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic t4(Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/u060;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic u4(Ll/q260;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q260;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1}, Ll/q260;->h()Ll/bnl0$g;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->I(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Ll/bnl0$g;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/q260;->h()Ll/bnl0$g;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->m(Ll/bnl0$g;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic v4(Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/u060;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic w4(Ll/q260;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->setViewForReady(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic z4(Ljava/lang/Integer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/u060;->l:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->countdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 8
    .line 9
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    int-to-long v3, p1

    .line 16
    add-long/2addr v1, v3

    .line 17
    const-wide/16 v3, 0x3e8

    .line 18
    .line 19
    mul-long/2addr v1, v3

    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 21
    .line 22
    iget-object p1, p0, Ll/u060;->l:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->countdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 27
    .line 28
    new-instance v0, Ll/t060;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/t060;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Ll/u060;->E4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
