.class public Ll/h1j;
.super Ll/q0m;
.source "SourceFile"


# instance fields
.field public final c:Ll/v120;

.field public final d:Z


# direct methods
.method public constructor <init>(Ll/v120;Lrx/c;Ll/g8t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v120;",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;",
            "Ll/g8t;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2, p3}, Ll/q0m;-><init>(Lrx/c;Ll/g8t;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h1j;->c:Ll/v120;

    .line 5
    .line 6
    instance-of p1, p1, Ll/msf0;

    .line 7
    .line 8
    iput-boolean p1, p0, Ll/h1j;->d:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic g(Ll/h1j;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h1j;->j(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h(Ll/h1j;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h1j;->k(Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/q0m;->c(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Ll/h1j;->d:Z

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/f1j;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/f1j;-><init>(Ll/h1j;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final i(Ll/v120;)V
    .locals 1

    .line 1
    instance-of p0, p1, Ll/msf0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Ll/msf0;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Ll/msf0;->c(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    invoke-virtual {p1, p0}, Ll/v120;->a(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic j(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/h1j;->c:Ll/v120;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/h1j;->i(Ll/v120;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/h1j;->l()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/app/Activity;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    move-object p1, v0

    .line 17
    :goto_0
    iget-boolean v1, p0, Ll/h1j;->d:Z

    .line 18
    .line 19
    if-eqz v1, :cond_8

    .line 20
    .line 21
    instance-of v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    instance-of v2, p1, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 26
    .line 27
    if-nez v2, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget-object v3, Ll/uqb0;->c0:Ll/bn5;

    .line 34
    .line 35
    invoke-interface {v3}, Ll/bn5;->getSignOutJumpAct()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-ne v2, v3, :cond_8

    .line 40
    .line 41
    :cond_2
    const/4 v2, 0x0

    .line 42
    const/4 v3, 0x1

    .line 43
    if-eqz v1, :cond_5

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    const-string v1, "LIVE_AUDIENCE_START_DATA"

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    move-object v1, v0

    .line 65
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_4

    .line 70
    .line 71
    const-string v4, "jump_to_tag"

    .line 72
    .line 73
    invoke-virtual {p1, v4, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_4

    .line 78
    .line 79
    const-string v4, "live_type"

    .line 80
    .line 81
    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    xor-int/2addr p1, v3

    .line 90
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    goto :goto_2

    .line 95
    :cond_4
    move-object p1, v0

    .line 96
    goto :goto_2

    .line 97
    :cond_5
    move-object p1, v0

    .line 98
    move-object v1, p1

    .line 99
    :goto_2
    if-nez v1, :cond_6

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_6
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 103
    .line 104
    :goto_3
    const/4 v1, 0x2

    .line 105
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    iget-object p0, p0, Ll/h1j;->c:Ll/v120;

    .line 110
    .line 111
    if-nez v1, :cond_7

    .line 112
    .line 113
    check-cast p0, Ll/msf0;

    .line 114
    .line 115
    invoke-virtual {p0, v3, v3, v0, p1}, Ll/msf0;->d(ZZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Boolean;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_7
    check-cast p0, Ll/msf0;

    .line 120
    .line 121
    invoke-virtual {p0, v3, v2, v0, p1}, Ll/msf0;->d(ZZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Boolean;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_8
    invoke-virtual {p0}, Ll/q0m;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_9

    .line 130
    .line 131
    iget-object p1, p0, Ll/h1j;->c:Ll/v120;

    .line 132
    .line 133
    invoke-virtual {p0, p1}, Ll/h1j;->i(Ll/v120;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 138
    .line 139
    invoke-virtual {v0, p1}, Ll/wrv;->N(Landroid/app/Activity;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_a

    .line 144
    .line 145
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 146
    .line 147
    new-instance v1, Ll/g1j;

    .line 148
    .line 149
    invoke-direct {v1, p0}, Ll/g1j;-><init>(Ll/h1j;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, p1, v1}, Ll/wrv;->b(Landroid/app/Activity;Ll/y20;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_a
    invoke-virtual {p0}, Ll/h1j;->l()V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/q0m;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/q0m;->e()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/h1j;->c:Ll/v120;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/v120;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Ll/v120;->a(Z)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Ll/h1j;->d:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/h1j;->c:Ll/v120;

    .line 27
    .line 28
    check-cast p0, Ll/msf0;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-virtual {p0, v0}, Ll/msf0;->c(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
