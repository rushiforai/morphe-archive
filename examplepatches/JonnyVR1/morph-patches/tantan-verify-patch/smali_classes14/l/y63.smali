.class public Ll/y63;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y63$a;
    }
.end annotation


# instance fields
.field public a:J

.field public b:Z

.field public c:Ll/kcg0;

.field public d:Ll/kcg0;

.field public final e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public final f:Ll/x20;

.field public final g:Ll/x20;

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/y63;->a:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/y63;->b:Z

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/y63;->e:Lrx/subjects/a;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/y63;->h:Z

    .line 19
    .line 20
    new-instance v0, Ll/p63;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/p63;-><init>(Ll/y63;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/y63;->f:Ll/x20;

    .line 26
    .line 27
    new-instance v0, Ll/q63;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/q63;-><init>(Ll/y63;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/y63;->g:Ll/x20;

    .line 33
    .line 34
    return-void
.end method

.method public synthetic constructor <init>(Ll/z63;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ll/y63;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/google/common/base/Optional;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/m27;->V3()Lrx/c;

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    return-object p0
.end method

.method public static synthetic b(Ll/y63;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y63;->l()V

    return-void
.end method

.method public static synthetic c(Ll/y63;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y63;->s()V

    return-void
.end method

.method public static synthetic d(Ll/y63;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y63;->k()V

    return-void
.end method

.method public static synthetic e(Lcom/google/common/base/Optional;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/BoostStatus;->active:Z

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

.method public static synthetic f(Landroid/net/NetworkInfo;Lcom/google/common/base/Optional;)Lcom/google/common/base/Optional;
    .locals 0

    .line 1
    return-object p1
.end method

.method public static synthetic g(Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ll/y63;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y63;->m(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i(Ll/y63;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y63;->n(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static j()Ll/y63;
    .locals 1

    .line 1
    invoke-static {}, Ll/y63$a;->a()Ll/y63;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final synthetic k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y63;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/y63;->c:Ll/kcg0;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y63;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/y63;->d:Ll/kcg0;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y63;->f:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y63;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/y63;->r()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/y63;->e:Lrx/subjects/a;

    .line 5
    .line 6
    return-object p0
.end method

.method public p(Ll/bb50;)Ll/kcg0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;>;>;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/y63;->r()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/y63;->e:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final q(ILl/bkj0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Ll/y63;->f:Ll/x20;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    iput-boolean v1, p0, Ll/y63;->h:Z

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/m27;->d4()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v2, p0, Ll/y63;->e:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v3, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {v2, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    if-ne p1, v0, :cond_1

    .line 35
    .line 36
    iget-object p2, p0, Ll/y63;->e:Lrx/subjects/a;

    .line 37
    .line 38
    const/4 v0, -0x1

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-static {v0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    if-ne p1, v1, :cond_2

    .line 52
    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 56
    .line 57
    iget-boolean p1, p1, Ll/m27;->q0:Z

    .line 58
    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    invoke-static {}, Ll/pzi0;->o()J

    .line 62
    .line 63
    .line 64
    move-result-wide p1

    .line 65
    iget-wide v0, p0, Ll/y63;->a:J

    .line 66
    .line 67
    sub-long/2addr p1, v0

    .line 68
    const-wide/16 v0, 0xbb8

    .line 69
    .line 70
    cmp-long p1, p1, v0

    .line 71
    .line 72
    if-lez p1, :cond_2

    .line 73
    .line 74
    invoke-static {}, Ll/pzi0;->o()J

    .line 75
    .line 76
    .line 77
    move-result-wide p1

    .line 78
    iput-wide p1, p0, Ll/y63;->a:J

    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/m27;->s3()Lrx/c;

    .line 85
    .line 86
    .line 87
    :cond_2
    return-void
.end method

.method public final r()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y63;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/m27;->F3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/m27;->G3()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    invoke-virtual {p0, v0, v1}, Ll/y63;->q(ILl/bkj0;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/m27;->w3()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    sub-long/2addr v2, v4

    .line 42
    const-wide/16 v4, 0x0

    .line 43
    .line 44
    cmp-long v0, v2, v4

    .line 45
    .line 46
    const/4 v4, 0x2

    .line 47
    if-gtz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0, v4, v1}, Ll/y63;->q(ILl/bkj0;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-boolean v0, p0, Ll/y63;->b:Z

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-static {}, Ll/joa;->D3()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/m27;->V3()Lrx/c;

    .line 80
    .line 81
    .line 82
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    invoke-static {}, Ll/joa;->D3()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    invoke-static {}, Ll/joa;->D3()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput-boolean v0, p0, Ll/y63;->b:Z

    .line 105
    .line 106
    :cond_3
    invoke-static {v2, v3}, Ll/pa3;->e(J)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/16 v5, 0x64

    .line 111
    .line 112
    if-lt v0, v5, :cond_4

    .line 113
    .line 114
    invoke-virtual {p0, v4, v1}, Ll/y63;->q(ILl/bkj0;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iget-boolean v4, p0, Ll/y63;->h:Z

    .line 123
    .line 124
    invoke-static {v0, v2, v3, v4}, Ll/pa3;->d(IJZ)F

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    const-string v5, "%.1f"

    .line 137
    .line 138
    invoke-static {v1, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    const/4 v4, 0x0

    .line 143
    iput-boolean v4, p0, Ll/y63;->h:Z

    .line 144
    .line 145
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-static {v1, v0, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const/4 v1, 0x1

    .line 158
    invoke-virtual {p0, v1, v0}, Ll/y63;->q(ILl/bkj0;)V

    .line 159
    .line 160
    .line 161
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ll/m27;->Z3(Z)V

    .line 166
    .line 167
    .line 168
    new-instance v0, Ll/v63;

    .line 169
    .line 170
    invoke-direct {v0, p0}, Ll/v63;-><init>(Ll/y63;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, v0}, Ll/y63;->u(Ll/x20;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y63;->g:Ll/x20;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/y63;->q(ILl/bkj0;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 14
    .line 15
    iget-object p0, p0, Ll/m27;->e0:Ll/jxd0;

    .line 16
    .line 17
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final u(Ll/x20;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/y63;->c:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x1f4

    .line 6
    .line 7
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/w63;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/w63;-><init>(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/x63;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/x63;-><init>(Ll/y63;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Ll/y63;->c:Ll/kcg0;

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final v()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y63;->d:Ll/kcg0;

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
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/m27;->t3()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/r63;

    .line 22
    .line 23
    invoke-direct {v2}, Ll/r63;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/s63;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/s63;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/t63;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/t63;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/u63;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/u63;-><init>(Ll/y63;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Ll/y63;->d:Ll/kcg0;

    .line 66
    .line 67
    :cond_0
    return-void
.end method
