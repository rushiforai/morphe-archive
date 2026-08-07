.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# instance fields
.field public g:Ll/vxd0;

.field public h:Ll/wyd0;

.field public i:Ll/byd0;

.field public j:Ll/byd0;

.field public k:I

.field public l:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->h:Ll/vwa;

    .line 5
    .line 6
    iget-object p2, p1, Ll/vwa;->c:Ll/vxd0;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->g:Ll/vxd0;

    .line 9
    .line 10
    iget-object p2, p1, Ll/vwa;->f:Ll/wyd0;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->h:Ll/wyd0;

    .line 13
    .line 14
    iget-object p2, p1, Ll/vwa;->e:Ll/byd0;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->i:Ll/byd0;

    .line 17
    .line 18
    iget-object p1, p1, Ll/vwa;->d:Ll/byd0;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->j:Ll/byd0;

    .line 21
    .line 22
    const/16 p1, 0x14

    .line 23
    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->k:I

    .line 25
    .line 26
    const/4 p1, 0x5

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->l:I

    .line 28
    .line 29
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "ttt_verification_guide_config"

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/data/VerificationGuideConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 36
    .line 37
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationGuideConfig;

    .line 42
    .line 43
    iget p2, p1, Lcom/p1/mobile/putong/core/data/VerificationGuideConfig;->swipedCard:I

    .line 44
    .line 45
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->k:I

    .line 46
    .line 47
    iget p1, p1, Lcom/p1/mobile/putong/core/data/VerificationGuideConfig;->displayCount:I

    .line 48
    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->l:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    :catch_0
    return-void
.end method

.method private A()Z
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 19
    .line 20
    const-string v2, "pending"

    .line 21
    .line 22
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 31
    .line 32
    const-string v0, "verified"

    .line 33
    .line 34
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    return v1

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_1
    return v1
.end method

.method public static synthetic p(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 2

    .line 1
    const-string v0, "e_avatarVerification_guide_click"

    .line 2
    .line 3
    const-string v1, "p_avatarVerification_guide"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "dialog"

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic r(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s()V
    .locals 2

    .line 1
    const-string v0, "e_avatarVerification_guide_cancle_click"

    .line 2
    .line 3
    const-string v1, "p_avatarVerification_guide"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private v()Z
    .locals 6

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-boolean v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->i:Z

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/pzi0;->o()J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 19
    .line 20
    double-to-long v0, v0

    .line 21
    invoke-static {v3, v4, v0, v1, v2}, Ll/tzi0;->h(JJI)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    :cond_0
    new-instance v0, Ljava/util/Date;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    invoke-virtual {v0, v3, v4}, Ljava/util/Date;->setTime(J)V

    .line 37
    .line 38
    .line 39
    sget-object v1, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->h:Ll/wyd0;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->i:Ll/byd0;

    .line 58
    .line 59
    const-wide/16 v3, 0x0

    .line 60
    .line 61
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v1, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->h:Ll/wyd0;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->i:Ll/byd0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/Long;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    const-wide/16 v3, 0x1

    .line 86
    .line 87
    add-long/2addr v0, v3

    .line 88
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->k:I

    .line 89
    .line 90
    int-to-long v3, v3

    .line 91
    cmp-long v0, v0, v3

    .line 92
    .line 93
    if-ltz v0, :cond_3

    .line 94
    .line 95
    invoke-static {}, Ll/pzi0;->o()J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->g:Ll/vxd0;

    .line 100
    .line 101
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Ljava/lang/Integer;

    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_2

    .line 112
    .line 113
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->l:I

    .line 114
    .line 115
    if-ge v3, v4, :cond_3

    .line 116
    .line 117
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->j:Ll/byd0;

    .line 118
    .line 119
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    check-cast v4, Ljava/lang/Long;

    .line 124
    .line 125
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 126
    .line 127
    .line 128
    move-result-wide v4

    .line 129
    sub-long/2addr v0, v4

    .line 130
    add-int/2addr v3, v2

    .line 131
    const v2, 0x7fffffff

    .line 132
    .line 133
    .line 134
    invoke-static {v3, v2}, Ll/dmk0;->d(II)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    int-to-long v2, v2

    .line 139
    sget-object v4, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    .line 140
    .line 141
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 142
    .line 143
    invoke-virtual {v5, v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    .line 144
    .line 145
    .line 146
    move-result-wide v2

    .line 147
    cmp-long v0, v0, v2

    .line 148
    .line 149
    if-ltz v0, :cond_3

    .line 150
    .line 151
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->A()Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    return p0

    .line 156
    :cond_3
    const/4 p0, 0x0

    .line 157
    return p0
.end method

.method private w(Landroid/view/Window;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 9
    .line 10
    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 11
    .line 12
    const/16 v0, 0x11

    .line 13
    .line 14
    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private z(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 9

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/agc0;->x:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/jl80$a;->w0(I)Ll/jl80$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/kec0;->ud:I

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 37
    .line 38
    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    sget v2, Lcom/p1/mobile/putong/core/R$string;->j8:I

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    filled-new-array {v2, v4}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    const/high16 v4, 0x4d000000    # 1.3421773E8f

    .line 56
    .line 57
    const/4 v5, 0x1

    .line 58
    const/4 v6, 0x1

    .line 59
    const v7, -0x181e3

    .line 60
    .line 61
    .line 62
    move-object v2, p1

    .line 63
    invoke-static/range {v2 .. v8}, Ll/e1b;->y0(Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;IZZI[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    sget v2, Ll/adc0;->ff:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Lv/VText;

    .line 74
    .line 75
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 83
    .line 84
    .line 85
    sget p1, Ll/adc0;->gf:I

    .line 86
    .line 87
    invoke-virtual {v1, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$a;

    .line 92
    .line 93
    invoke-direct {v2, p0, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;Ll/x20;Ll/jl80;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    sget p1, Ll/adc0;->ef:I

    .line 100
    .line 101
    invoke-virtual {v1, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$b;

    .line 106
    .line 107
    invoke-direct {p2, p0, p3, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;Ll/x20;Ll/jl80;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    sget p1, Ll/adc0;->df:I

    .line 114
    .line 115
    invoke-virtual {v1, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$c;

    .line 120
    .line 121
    invoke-direct {p2, p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;Ll/jl80;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    new-instance p1, Ll/alh0;

    .line 128
    .line 129
    invoke-direct {p1, p4}, Ll/alh0;-><init>(Ll/x20;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ll/jl80;->show()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->w(Landroid/view/Window;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method


# virtual methods
.method public final B(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 9

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "p_avatarVerification_guide"

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->real_person_guide:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v7, "swipe_page"

    .line 31
    .line 32
    const-string v8, "swipe"

    .line 33
    .line 34
    const-string v3, "passive"

    .line 35
    .line 36
    const-string v4, "alert"

    .line 37
    .line 38
    const-string v5, "alert_self_definition_basic"

    .line 39
    .line 40
    const-string v6, "card"

    .line 41
    .line 42
    invoke-static/range {v3 .. v8}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v1, v2, v3}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/xkh0;

    .line 63
    .line 64
    invoke-direct {v2, p1}, Ll/xkh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Ll/ykh0;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/ykh0;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v3, Ll/zkh0;

    .line 73
    .line 74
    invoke-direct {v3, v0}, Ll/zkh0;-><init>(Ll/l4g0;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0, v1, v2, p1, v3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->z(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Ll/x20;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->g:Ll/vxd0;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/Integer;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/lit8 v0, v0, 0x1

    .line 93
    .line 94
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->j:Ll/byd0;

    .line 102
    .line 103
    invoke-static {}, Ll/pzi0;->o()J

    .line 104
    .line 105
    .line 106
    move-result-wide v0

    .line 107
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->x(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->y(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->direct:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public y(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->l:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->v()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->B(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->direct:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 28
    .line 29
    return-object p0
.end method
