.class Lcom/android/billingclient/api/b;
.super Lcom/android/billingclient/api/a;
.source "SourceFile"


# instance fields
.field private A:Z

.field private B:Lcom/android/billingclient/api/e;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private C:Z

.field private D:Ljava/util/concurrent/ExecutorService;

.field private volatile E:Ll/rrv0;

.field private final F:Ljava/lang/Long;

.field private final a:Ljava/lang/Object;

.field private volatile b:I

.field private final c:Ljava/lang/String;

.field private final d:Landroid/os/Handler;

.field private volatile e:Lcom/android/billingclient/api/n0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private f:Landroid/content/Context;

.field private g:Lcom/android/billingclient/api/g0;

.field private volatile h:Ll/jsr0;

.field private volatile i:Lcom/android/billingclient/api/s;

.field private j:Z

.field private k:Z

.field private l:I

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Z

.field private u:Z

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/android/billingclient/api/g0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/concurrent/ExecutorService;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 126
    invoke-direct {p0}, Lcom/android/billingclient/api/a;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/billingclient/api/b;->b:I

    new-instance p3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p4

    invoke-direct {p3, p4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p3, p0, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    iput p1, p0, Lcom/android/billingclient/api/b;->l:I

    new-instance p1, Ljava/util/Random;

    .line 127
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    invoke-virtual {p1}, Ljava/util/Random;->nextLong()J

    move-result-wide p3

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 128
    invoke-static {}, Lcom/android/billingclient/api/b;->L()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 129
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 130
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/r0;->D()Ll/e7y0;

    move-result-object p2

    .line 131
    invoke-virtual {p2, p3}, Ll/e7y0;->s(Ljava/lang/String;)Ll/e7y0;

    iget-object p3, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 132
    invoke-virtual {p3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ll/e7y0;->r(Ljava/lang/String;)Ll/e7y0;

    .line 133
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p3

    invoke-virtual {p2, p3, p4}, Ll/e7y0;->q(J)Ll/e7y0;

    iget-object p1, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 134
    invoke-virtual {p2}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/play_billing/r0;

    .line 135
    new-instance p3, Lcom/android/billingclient/api/i0;

    invoke-direct {p3, p1, p2}, Lcom/android/billingclient/api/i0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/play_billing/r0;)V

    iput-object p3, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    iget-object p0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 136
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/android/billingclient/api/e;Landroid/content/Context;Ll/tot0;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Lcom/android/billingclient/api/g0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/util/concurrent/ExecutorService;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/billingclient/api/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/android/billingclient/api/b;->b:I

    .line 13
    .line 14
    new-instance p4, Landroid/os/Handler;

    .line 15
    .line 16
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    invoke-direct {p4, p5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 21
    .line 22
    .line 23
    iput-object p4, p0, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    .line 24
    .line 25
    iput p1, p0, Lcom/android/billingclient/api/b;->l:I

    .line 26
    .line 27
    new-instance p1, Ljava/util/Random;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/util/Random;->nextLong()J

    .line 33
    .line 34
    .line 35
    move-result-wide p4

    .line 36
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 41
    .line 42
    invoke-static {}, Lcom/android/billingclient/api/b;->L()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    iput-object p4, p0, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    iput-object p3, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 53
    .line 54
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/r0;->D()Ll/e7y0;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-static {}, Lcom/android/billingclient/api/b;->L()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p4

    .line 62
    invoke-virtual {p3, p4}, Ll/e7y0;->s(Ljava/lang/String;)Ll/e7y0;

    .line 63
    .line 64
    .line 65
    iget-object p4, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 66
    .line 67
    invoke-virtual {p4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p4

    .line 71
    invoke-virtual {p3, p4}, Ll/e7y0;->r(Ljava/lang/String;)Ll/e7y0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 75
    .line 76
    .line 77
    move-result-wide p4

    .line 78
    invoke-virtual {p3, p4, p5}, Ll/e7y0;->q(J)Ll/e7y0;

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 82
    .line 83
    invoke-virtual {p3}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    check-cast p3, Lcom/google/android/gms/internal/play_billing/r0;

    .line 88
    .line 89
    new-instance p4, Lcom/android/billingclient/api/i0;

    .line 90
    .line 91
    invoke-direct {p4, p1, p3}, Lcom/android/billingclient/api/i0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/play_billing/r0;)V

    .line 92
    .line 93
    .line 94
    iput-object p4, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 95
    .line 96
    const-string p1, "BillingClient"

    .line 97
    .line 98
    const-string p3, "Billing client should have a valid listener but the provided is null."

    .line 99
    .line 100
    invoke-static {p1, p3}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance v0, Lcom/android/billingclient/api/n0;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 106
    .line 107
    const/4 v5, 0x0

    .line 108
    iget-object v6, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 109
    .line 110
    const/4 v2, 0x0

    .line 111
    const/4 v3, 0x0

    .line 112
    const/4 v4, 0x0

    .line 113
    invoke-direct/range {v0 .. v6}, Lcom/android/billingclient/api/n0;-><init>(Landroid/content/Context;Ll/vkb0;Ll/tot0;Ll/bas0;Ll/ydk0;Lcom/android/billingclient/api/g0;)V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 117
    .line 118
    iput-object p2, p0, Lcom/android/billingclient/api/b;->B:Lcom/android/billingclient/api/e;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/android/billingclient/api/e;Landroid/content/Context;Ll/vkb0;Ll/bas0;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/bas0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Lcom/android/billingclient/api/g0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/concurrent/ExecutorService;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 137
    invoke-static {}, Lcom/android/billingclient/api/b;->L()Ljava/lang/String;

    move-result-object p5

    invoke-direct {p0}, Lcom/android/billingclient/api/a;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/billingclient/api/b;->b:I

    new-instance p6, Landroid/os/Handler;

    .line 138
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p7

    invoke-direct {p6, p7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p6, p0, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    iput p1, p0, Lcom/android/billingclient/api/b;->l:I

    new-instance p1, Ljava/util/Random;

    .line 139
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    invoke-virtual {p1}, Ljava/util/Random;->nextLong()J

    move-result-wide p6

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    iput-object p5, p0, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    const/4 p6, 0x0

    move-object p1, p3

    move-object p3, p2

    move-object p2, p4

    const/4 p4, 0x0

    .line 140
    invoke-direct/range {p0 .. p6}, Lcom/android/billingclient/api/b;->l(Landroid/content/Context;Ll/vkb0;Lcom/android/billingclient/api/e;Ll/bas0;Ljava/lang/String;Lcom/android/billingclient/api/g0;)V

    return-void
.end method

.method public static bridge synthetic A(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->A:Z

    return-void
.end method

.method public static bridge synthetic B(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->m:Z

    return-void
.end method

.method public static bridge synthetic B0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    return-object p0
.end method

.method public static bridge synthetic C(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->n:Z

    return-void
.end method

.method public static bridge synthetic D(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->o:Z

    return-void
.end method

.method public static bridge synthetic D0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/d;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->J()Lcom/android/billingclient/api/d;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic E(Lcom/android/billingclient/api/b;Ll/jsr0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic F(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->k:Z

    return-void
.end method

.method public static bridge synthetic F0(Lcom/android/billingclient/api/b;)Ll/jsr0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic G(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->j:Z

    return-void
.end method

.method public static bridge synthetic H(Lcom/android/billingclient/api/b;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/billingclient/api/b;->R(I)V

    return-void
.end method

.method public static bridge synthetic H0(Lcom/android/billingclient/api/b;)Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    return-object p0
.end method

.method public static bridge synthetic I(Lcom/android/billingclient/api/b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/billingclient/api/b;->b:I

    return p0
.end method

.method public static bridge synthetic I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    return-object p0
.end method

.method private final J()Lcom/android/billingclient/api/d;
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x0

    .line 3
    filled-new-array {v1, v0}, [I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v2, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v2

    .line 10
    :goto_0
    const/4 v3, 0x2

    .line 11
    if-ge v1, v3, :cond_1

    .line 12
    .line 13
    :try_start_0
    aget v3, v0, v1

    .line 14
    .line 15
    iget v4, p0, Lcom/android/billingclient/api/b;->b:I

    .line 16
    .line 17
    if-ne v4, v3, :cond_0

    .line 18
    .line 19
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    sget-object p0, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 21
    .line 22
    return-object p0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    sget-object p0, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 30
    .line 31
    return-object p0

    .line 32
    :goto_1
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    throw p0
.end method

.method private final K(Lcom/android/billingclient/api/g;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object p1

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private static L()Ljava/lang/String;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 1
    :try_start_0
    const-string v0, "com.android.billingclient.ktx.BuildConfig"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "VERSION_NAME"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    return-object v0

    .line 21
    :catch_0
    const-string v0, "7.1.1"

    .line 22
    .line 23
    return-object v0
.end method

.method private final declared-synchronized M()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->D:Ljava/util/concurrent/ExecutorService;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget v0, Lcom/google/android/gms/internal/play_billing/p;->a:I

    .line 7
    .line 8
    new-instance v1, Lcom/android/billingclient/api/o;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/android/billingclient/api/o;-><init>(Lcom/android/billingclient/api/b;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/billingclient/api/b;->D:Ljava/util/concurrent/ExecutorService;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->D:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-object v0

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw v0
.end method

.method public static bridge synthetic M0(Lcom/android/billingclient/api/b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    return-object p0
.end method

.method private final N(Ll/x06;Ll/y06;)V
    .locals 9

    .line 1
    const-string v0, "Error consuming purchase with token. Response code: "

    .line 2
    .line 3
    const-string v1, "Consuming purchase with token: "

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/x06;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    :try_start_0
    const-string p1, "BillingClient"

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p1, v1}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter p1
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 29
    :try_start_1
    iget-object v1, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 30
    .line 31
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    :try_start_2
    sget-object v5, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 35
    .line 36
    const-string v7, "Service has been reset to null."
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    const/16 v6, 0x77

    .line 40
    .line 41
    move-object v2, p0

    .line 42
    move-object v3, p2

    .line 43
    :try_start_3
    invoke-direct/range {v2 .. v8}, Lcom/android/billingclient/api/b;->b0(Ll/y06;Ljava/lang/String;Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    :goto_0
    move-object p0, v0

    .line 49
    move-object v8, p0

    .line 50
    goto/16 :goto_4

    .line 51
    .line 52
    :catch_1
    move-exception v0

    .line 53
    :goto_1
    move-object p0, v0

    .line 54
    move-object v8, p0

    .line 55
    goto/16 :goto_5

    .line 56
    .line 57
    :catch_2
    move-exception v0

    .line 58
    move-object v2, p0

    .line 59
    move-object v3, p2

    .line 60
    goto :goto_0

    .line 61
    :catch_3
    move-exception v0

    .line 62
    move-object v2, p0

    .line 63
    move-object v3, p2

    .line 64
    goto :goto_1

    .line 65
    :cond_0
    move-object v2, p0

    .line 66
    move-object v3, p2

    .line 67
    iget-boolean p0, v2, Lcom/android/billingclient/api/b;->o:Z
    :try_end_3
    .catch Landroid/os/DeadObjectException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 68
    .line 69
    iget-object p1, v2, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 70
    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    :try_start_4
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iget-boolean p1, v2, Lcom/android/billingclient/api/b;->o:Z

    .line 78
    .line 79
    iget-object p2, v2, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v5, v2, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 82
    .line 83
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 84
    .line 85
    .line 86
    move-result-wide v5

    .line 87
    new-instance v7, Landroid/os/Bundle;

    .line 88
    .line 89
    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 90
    .line 91
    .line 92
    if-eqz p1, :cond_1

    .line 93
    .line 94
    invoke-static {v7, p2, v5, v6}, Lcom/google/android/gms/internal/play_billing/p;->c(Landroid/os/Bundle;Ljava/lang/String;J)Landroid/os/Bundle;

    .line 95
    .line 96
    .line 97
    :cond_1
    const/16 p1, 0x9

    .line 98
    .line 99
    invoke-interface {v1, p1, p0, v4, v7}, Ll/jsr0;->K2(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string p1, "RESPONSE_CODE"

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    const-string p2, "BillingClient"

    .line 110
    .line 111
    invoke-static {p0, p2}, Lcom/google/android/gms/internal/play_billing/p;->g(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    goto :goto_2

    .line 116
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const/4 p1, 0x3

    .line 121
    invoke-interface {v1, p1, p0, v4}, Ll/jsr0;->D4(ILjava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    const-string p0, ""

    .line 126
    .line 127
    :goto_2
    invoke-static {p1, p0}, Lcom/android/billingclient/api/h0;->a(ILjava/lang/String;)Lcom/android/billingclient/api/d;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    if-nez p1, :cond_3

    .line 132
    .line 133
    const-string p0, "BillingClient"

    .line 134
    .line 135
    const-string p1, "Successfully consumed purchase."

    .line 136
    .line 137
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-interface {v3, v5, v4}, Ll/y06;->f(Lcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    const/4 v8, 0x0

    .line 157
    const/16 v6, 0x17

    .line 158
    .line 159
    invoke-direct/range {v2 .. v8}, Lcom/android/billingclient/api/b;->b0(Ll/y06;Ljava/lang/String;Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)V
    :try_end_4
    .catch Landroid/os/DeadObjectException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :catchall_0
    move-exception v0

    .line 164
    move-object v2, p0

    .line 165
    move-object v3, p2

    .line 166
    :goto_3
    move-object p0, v0

    .line 167
    :try_start_5
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 168
    :try_start_6
    throw p0
    :try_end_6
    .catch Landroid/os/DeadObjectException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 169
    :catchall_1
    move-exception v0

    .line 170
    goto :goto_3

    .line 171
    :goto_4
    const-string v7, "Error consuming purchase!"

    .line 172
    .line 173
    sget-object v5, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 174
    .line 175
    const/16 v6, 0x1d

    .line 176
    .line 177
    invoke-direct/range {v2 .. v8}, Lcom/android/billingclient/api/b;->b0(Ll/y06;Ljava/lang/String;Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :goto_5
    const-string v7, "Error consuming purchase!"

    .line 182
    .line 183
    sget-object v5, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 184
    .line 185
    const/16 v6, 0x1d

    .line 186
    .line 187
    invoke-direct/range {v2 .. v8}, Lcom/android/billingclient/api/b;->b0(Ll/y06;Ljava/lang/String;Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method private final O(Lcom/google/android/gms/internal/play_billing/m0;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/billingclient/api/b;->l:I

    .line 4
    .line 5
    invoke-interface {v0, p1, p0}, Lcom/android/billingclient/api/g0;->f(Lcom/google/android/gms/internal/play_billing/m0;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    const-string p1, "BillingClient"

    .line 11
    .line 12
    const-string v0, "Unable to log."

    .line 13
    .line 14
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private final P(Lcom/google/android/gms/internal/play_billing/n0;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/billingclient/api/b;->l:I

    .line 4
    .line 5
    invoke-interface {v0, p1, p0}, Lcom/android/billingclient/api/g0;->e(Lcom/google/android/gms/internal/play_billing/n0;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    const-string p1, "BillingClient"

    .line 11
    .line 12
    const-string v0, "Unable to log."

    .line 13
    .line 14
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private final Q(Ljava/lang/String;Ll/ukb0;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x9

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzco;->zzl()Lcom/google/android/gms/internal/play_billing/zzco;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p2, p1, p0}, Ll/ukb0;->b(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string p1, "BillingClient"

    .line 30
    .line 31
    const-string v0, "Please provide a valid product type."

    .line 32
    .line 33
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/android/billingclient/api/h0;->h:Lcom/android/billingclient/api/d;

    .line 37
    .line 38
    const/16 v0, 0x32

    .line 39
    .line 40
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzco;->zzl()Lcom/google/android/gms/internal/play_billing/zzco;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p2, p1, p0}, Ll/ukb0;->b(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    new-instance v2, Lcom/android/billingclient/api/p;

    .line 52
    .line 53
    invoke-direct {v2, p0, p1, p2}, Lcom/android/billingclient/api/p;-><init>(Lcom/android/billingclient/api/b;Ljava/lang/String;Ll/ukb0;)V

    .line 54
    .line 55
    .line 56
    new-instance v5, Lcom/android/billingclient/api/h;

    .line 57
    .line 58
    invoke-direct {v5, p0, p2}, Lcom/android/billingclient/api/h;-><init>(Lcom/android/billingclient/api/b;Ll/ukb0;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->o0()Landroid/os/Handler;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    const-wide/16 v3, 0x7530

    .line 70
    .line 71
    invoke-static/range {v2 .. v7}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-nez p1, :cond_2

    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->J()Lcom/android/billingclient/api/d;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const/16 v0, 0x19

    .line 82
    .line 83
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzco;->zzl()Lcom/google/android/gms/internal/play_billing/zzco;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-interface {p2, p1, p0}, Ll/ukb0;->b(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method

.method private final R(I)V
    .locals 6

    .line 1
    const-string v0, "Setting clientState from "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget v2, p0, Lcom/android/billingclient/api/b;->b:I

    .line 7
    .line 8
    const/4 v3, 0x3

    .line 9
    if-ne v2, v3, :cond_0

    .line 10
    .line 11
    monitor-exit v1

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v2, "BillingClient"

    .line 16
    .line 17
    iget v3, p0, Lcom/android/billingclient/api/b;->b:I

    .line 18
    .line 19
    invoke-static {v3}, Lcom/android/billingclient/api/b;->V(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {p1}, Lcom/android/billingclient/api/b;->V(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    new-instance v5, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, " to "

    .line 36
    .line 37
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iput p1, p0, Lcom/android/billingclient/api/b;->b:I

    .line 51
    .line 52
    monitor-exit v1

    .line 53
    return-void

    .line 54
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0
.end method

.method private final declared-synchronized S()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->D:Ljava/util/concurrent/ExecutorService;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/android/billingclient/api/b;->D:Ljava/util/concurrent/ExecutorService;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/billingclient/api/b;->E:Ll/rrv0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method

.method private final T()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :try_start_1
    iget-object v2, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 14
    .line 15
    .line 16
    :try_start_2
    iput-object v1, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :catchall_1
    move-exception v2

    .line 24
    :try_start_3
    const-string v3, "BillingClient"

    .line 25
    .line 26
    const-string v4, "There was an exception while unbinding service!"

    .line 27
    .line 28
    invoke-static {v3, v4, v2}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 29
    .line 30
    .line 31
    :try_start_4
    iput-object v1, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 32
    .line 33
    iput-object v1, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_2
    move-exception v2

    .line 37
    iput-object v1, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;

    .line 40
    .line 41
    throw v2

    .line 42
    :cond_0
    :goto_0
    monitor-exit v0

    .line 43
    return-void

    .line 44
    :goto_1
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 45
    throw p0
.end method

.method private final U()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/billingclient/api/b;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/billingclient/api/b;->B:Lcom/android/billingclient/api/e;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/billingclient/api/e;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private static final V(I)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const-string p0, "CLOSED"

    return-object p0

    :cond_0
    const-string p0, "CONNECTED"

    return-object p0

    :cond_1
    const-string p0, "CONNECTING"

    return-object p0

    :cond_2
    const-string p0, "DISCONNECTED"

    return-object p0
.end method

.method private final W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;
    .locals 1
    .param p4    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "BillingClient"

    .line 2
    .line 3
    invoke-static {v0, p3, p4}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    const/4 p3, 0x7

    .line 7
    invoke-static {p4}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    invoke-direct {p0, p2, p3, p1, p4}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Lcom/android/billingclient/api/u;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->a()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p3, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p2, p1, p3}, Lcom/android/billingclient/api/u;-><init>(ILjava/lang/String;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method private final X(ILcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Ll/wxt0;
    .locals 1
    .param p5    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/16 p1, 0x9

    .line 2
    .line 3
    invoke-static {p5}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, p3, p1, p2, v0}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "BillingClient"

    .line 11
    .line 12
    invoke-static {p0, p4, p5}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ll/wxt0;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-direct {p0, p2, p1}, Ll/wxt0;-><init>(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method private final Y(Ljava/lang/String;I)Ll/wxt0;
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "Querying owned items, item type: "

    .line 4
    .line 5
    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "BillingClient"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v3, v0}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-boolean v2, v1, Lcom/android/billingclient/api/b;->o:Z

    .line 24
    .line 25
    iget-boolean v3, v1, Lcom/android/billingclient/api/b;->w:Z

    .line 26
    .line 27
    iget-object v4, v1, Lcom/android/billingclient/api/b;->B:Lcom/android/billingclient/api/e;

    .line 28
    .line 29
    invoke-virtual {v4}, Lcom/android/billingclient/api/e;->a()Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    iget-object v5, v1, Lcom/android/billingclient/api/b;->B:Lcom/android/billingclient/api/e;

    .line 34
    .line 35
    invoke-virtual {v5}, Lcom/android/billingclient/api/e;->b()Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    iget-object v6, v1, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 40
    .line 41
    move-object v7, v6

    .line 42
    iget-object v6, v1, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 45
    .line 46
    .line 47
    move-result-wide v7

    .line 48
    invoke-static/range {v2 .. v8}, Lcom/google/android/gms/internal/play_billing/p;->d(ZZZZLjava/lang/String;J)Landroid/os/Bundle;

    .line 49
    .line 50
    .line 51
    move-result-object v14

    .line 52
    const/4 v2, 0x0

    .line 53
    move-object v13, v2

    .line 54
    :cond_0
    :try_start_0
    iget-object v2, v1, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 55
    .line 56
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :try_start_1
    iget-object v9, v1, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 58
    .line 59
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    if-nez v9, :cond_1

    .line 61
    .line 62
    :try_start_2
    sget-object v3, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 63
    .line 64
    const-string v5, "Service has been reset to null"

    .line 65
    .line 66
    const/4 v6, 0x0

    .line 67
    const/16 v2, 0x9

    .line 68
    .line 69
    const/16 v4, 0x77

    .line 70
    .line 71
    invoke-direct/range {v1 .. v6}, Lcom/android/billingclient/api/b;->X(ILcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Ll/wxt0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    return-object v0

    .line 76
    :catch_0
    move-exception v0

    .line 77
    move-object v6, v0

    .line 78
    goto/16 :goto_3

    .line 79
    .line 80
    :catch_1
    move-exception v0

    .line 81
    move-object v6, v0

    .line 82
    goto/16 :goto_4

    .line 83
    .line 84
    :cond_1
    iget-boolean v2, v1, Lcom/android/billingclient/api/b;->o:Z

    .line 85
    .line 86
    const/16 v3, 0x9

    .line 87
    .line 88
    const/4 v4, 0x1

    .line 89
    if-eqz v2, :cond_3

    .line 90
    .line 91
    iget-boolean v2, v1, Lcom/android/billingclient/api/b;->w:Z

    .line 92
    .line 93
    if-eq v4, v2, :cond_2

    .line 94
    .line 95
    move v10, v3

    .line 96
    goto :goto_0

    .line 97
    :cond_2
    const/16 v2, 0x13

    .line 98
    .line 99
    move v10, v2

    .line 100
    :goto_0
    iget-object v2, v1, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 101
    .line 102
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v11

    .line 106
    move-object/from16 v12, p1

    .line 107
    .line 108
    invoke-interface/range {v9 .. v14}, Ll/jsr0;->a2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    move-object/from16 v12, p1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_3
    iget-object v2, v1, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 116
    .line 117
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    const/4 v5, 0x3

    .line 122
    move-object/from16 v12, p1

    .line 123
    .line 124
    invoke-interface {v9, v5, v2, v12, v13}, Ll/jsr0;->e1(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 125
    .line 126
    .line 127
    move-result-object v2
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 128
    :goto_1
    const-string v5, "BillingClient"

    .line 129
    .line 130
    const-string v6, "getPurchase()"

    .line 131
    .line 132
    invoke-static {v2, v5, v6}, Lcom/android/billingclient/api/m0;->a(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Lcom/android/billingclient/api/l0;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    move v6, v3

    .line 137
    invoke-virtual {v5}, Lcom/android/billingclient/api/l0;->a()Lcom/android/billingclient/api/d;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    sget-object v7, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 142
    .line 143
    if-eq v3, v7, :cond_4

    .line 144
    .line 145
    invoke-virtual {v5}, Lcom/android/billingclient/api/l0;->b()I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    const-string v5, "Purchase bundle invalid"

    .line 150
    .line 151
    const/4 v6, 0x0

    .line 152
    const/16 v2, 0x9

    .line 153
    .line 154
    invoke-direct/range {v1 .. v6}, Lcom/android/billingclient/api/b;->X(ILcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Ll/wxt0;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    return-object v0

    .line 159
    :cond_4
    const-string v1, "INAPP_PURCHASE_ITEM_LIST"

    .line 160
    .line 161
    invoke-virtual {v2, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    const-string v3, "INAPP_PURCHASE_DATA_LIST"

    .line 166
    .line 167
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    const-string v5, "INAPP_DATA_SIGNATURE_LIST"

    .line 172
    .line 173
    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    const/4 v7, 0x0

    .line 178
    move v8, v7

    .line 179
    :goto_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 180
    .line 181
    .line 182
    move-result v9

    .line 183
    if-ge v7, v9, :cond_6

    .line 184
    .line 185
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    check-cast v9, Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v10

    .line 195
    check-cast v10, Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v11

    .line 201
    check-cast v11, Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v11

    .line 207
    const-string v13, "Sku is owned: "

    .line 208
    .line 209
    const-string v15, "BillingClient"

    .line 210
    .line 211
    invoke-virtual {v13, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v11

    .line 215
    invoke-static {v15, v11}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    :try_start_3
    new-instance v11, Lcom/android/billingclient/api/Purchase;

    .line 219
    .line 220
    invoke-direct {v11, v9, v10}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 221
    .line 222
    .line 223
    invoke-virtual {v11}, Lcom/android/billingclient/api/Purchase;->e()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v9

    .line 227
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result v9

    .line 231
    if-eqz v9, :cond_5

    .line 232
    .line 233
    const-string v8, "BillingClient"

    .line 234
    .line 235
    const-string v9, "BUG: empty/null token!"

    .line 236
    .line 237
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    move v8, v4

    .line 241
    :cond_5
    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    add-int/lit8 v7, v7, 0x1

    .line 245
    .line 246
    goto :goto_2

    .line 247
    :catch_2
    move-exception v0

    .line 248
    move-object v6, v0

    .line 249
    const-string v5, "Got an exception trying to decode the purchase!"

    .line 250
    .line 251
    sget-object v3, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 252
    .line 253
    const/16 v4, 0x33

    .line 254
    .line 255
    const/16 v2, 0x9

    .line 256
    .line 257
    move-object/from16 v1, p0

    .line 258
    .line 259
    invoke-direct/range {v1 .. v6}, Lcom/android/billingclient/api/b;->X(ILcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Ll/wxt0;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    return-object v0

    .line 264
    :cond_6
    move-object/from16 v1, p0

    .line 265
    .line 266
    if-eqz v8, :cond_7

    .line 267
    .line 268
    const/16 v3, 0x1a

    .line 269
    .line 270
    sget-object v4, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 271
    .line 272
    invoke-direct {v1, v3, v6, v4}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 273
    .line 274
    .line 275
    :cond_7
    const-string v3, "INAPP_CONTINUATION_TOKEN"

    .line 276
    .line 277
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v13

    .line 281
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    const-string v3, "Continuation token: "

    .line 286
    .line 287
    const-string v4, "BillingClient"

    .line 288
    .line 289
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    invoke-static {v4, v2}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    if-eqz v2, :cond_0

    .line 301
    .line 302
    new-instance v1, Ll/wxt0;

    .line 303
    .line 304
    sget-object v2, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 305
    .line 306
    invoke-direct {v1, v2, v0}, Ll/wxt0;-><init>(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 307
    .line 308
    .line 309
    return-object v1

    .line 310
    :catchall_0
    move-exception v0

    .line 311
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 312
    :try_start_5
    throw v0
    :try_end_5
    .catch Landroid/os/DeadObjectException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 313
    :goto_3
    const-string v5, "Got exception trying to get purchases try to reconnect"

    .line 314
    .line 315
    sget-object v3, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 316
    .line 317
    const/16 v4, 0x34

    .line 318
    .line 319
    const/16 v2, 0x9

    .line 320
    .line 321
    invoke-direct/range {v1 .. v6}, Lcom/android/billingclient/api/b;->X(ILcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Ll/wxt0;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    return-object v0

    .line 326
    :goto_4
    const-string v5, "Got exception trying to get purchases try to reconnect"

    .line 327
    .line 328
    sget-object v3, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 329
    .line 330
    const/16 v4, 0x34

    .line 331
    .line 332
    const/16 v2, 0x9

    .line 333
    .line 334
    move-object/from16 v1, p0

    .line 335
    .line 336
    invoke-direct/range {v1 .. v6}, Lcom/android/billingclient/api/b;->X(ILcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Ll/wxt0;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    return-object v0
.end method

.method private final Z(Lcom/android/billingclient/api/d;II)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "Unable to create logging payload"

    .line 7
    .line 8
    const-string v3, "BillingLogger"

    .line 9
    .line 10
    const/4 v4, 0x5

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Lcom/android/billingclient/api/f0;->a:I

    .line 14
    .line 15
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/m0;->D()Ll/t2y0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/o0;->D()Ll/r4y0;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    invoke-virtual {v5, v6}, Ll/r4y0;->r(I)Ll/r4y0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->a()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v5, p1}, Ll/r4y0;->q(Ljava/lang/String;)Ll/r4y0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v5, p2}, Ll/r4y0;->s(I)Ll/r4y0;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v5}, Ll/t2y0;->o(Ll/r4y0;)Ll/t2y0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v4}, Ll/t2y0;->r(I)Ll/t2y0;

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/t0;->A()Ll/f8y0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1, p3}, Ll/f8y0;->o(I)Ll/f8y0;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/google/android/gms/internal/play_billing/t0;

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Ll/t2y0;->q(Lcom/google/android/gms/internal/play_billing/t0;)Ll/t2y0;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/google/android/gms/internal/play_billing/m0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    move-object v1, p1

    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception p1

    .line 71
    invoke-static {v3, v2, p1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    invoke-direct {p0, v1}, Lcom/android/billingclient/api/b;->O(Lcom/google/android/gms/internal/play_billing/m0;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    sget p1, Lcom/android/billingclient/api/f0;->a:I

    .line 79
    .line 80
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/n0;->C()Ll/f4y0;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, v4}, Ll/f4y0;->r(I)Ll/f4y0;

    .line 85
    .line 86
    .line 87
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/t0;->A()Ll/f8y0;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p2, p3}, Ll/f8y0;->o(I)Ll/f8y0;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    check-cast p2, Lcom/google/android/gms/internal/play_billing/t0;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Ll/f4y0;->o(Lcom/google/android/gms/internal/play_billing/t0;)Ll/f4y0;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/google/android/gms/internal/play_billing/n0;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 108
    .line 109
    move-object v1, p1

    .line 110
    goto :goto_1

    .line 111
    :catch_1
    move-exception p1

    .line 112
    invoke-static {v3, v2, p1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    :goto_1
    invoke-direct {p0, v1}, Lcom/android/billingclient/api/b;->P(Lcom/google/android/gms/internal/play_billing/n0;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method private final a0(Ll/d10;Lcom/android/billingclient/api/d;ILjava/lang/Exception;)V
    .locals 2
    .param p4    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "BillingClient"

    .line 2
    .line 3
    const-string v1, "Error in acknowledge purchase!"

    .line 4
    .line 5
    invoke-static {v0, v1, p4}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    invoke-static {p4}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    invoke-direct {p0, p3, v0, p2, p4}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, p2}, Ll/d10;->e(Lcom/android/billingclient/api/d;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private final b0(Ll/y06;Ljava/lang/String;Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p6    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "BillingClient"

    .line 2
    .line 3
    invoke-static {v0, p5, p6}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    const/4 p5, 0x4

    .line 7
    invoke-static {p6}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p6

    .line 11
    invoke-direct {p0, p4, p5, p3, p6}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, p3, p2}, Ll/y06;->f(Lcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic c0(Lcom/android/billingclient/api/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->T()V

    return-void
.end method

.method public static bridge synthetic i0(Lcom/android/billingclient/api/b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/billingclient/api/b;->y:Z

    return p0
.end method

.method public static bridge synthetic j0(Lcom/android/billingclient/api/b;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Lcom/android/billingclient/api/b;->b:I

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-ne p0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    monitor-exit v0

    .line 12
    return v1

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public static bridge synthetic k0(Lcom/android/billingclient/api/b;Ljava/lang/String;I)Ll/wxt0;
    .locals 0

    .line 1
    const/16 p2, 0x9

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/b;->Y(Ljava/lang/String;I)Ll/wxt0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private l(Landroid/content/Context;Ll/vkb0;Lcom/android/billingclient/api/e;Ll/bas0;Ljava/lang/String;Lcom/android/billingclient/api/g0;)V
    .locals 7
    .param p4    # Ll/bas0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Lcom/android/billingclient/api/g0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/r0;->D()Ll/e7y0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1, p5}, Ll/e7y0;->s(Ljava/lang/String;)Ll/e7y0;

    .line 12
    .line 13
    .line 14
    iget-object p5, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    invoke-virtual {p1, p5}, Ll/e7y0;->r(Ljava/lang/String;)Ll/e7y0;

    .line 21
    .line 22
    .line 23
    iget-object p5, p0, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 24
    .line 25
    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    invoke-virtual {p1, v0, v1}, Ll/e7y0;->q(J)Ll/e7y0;

    .line 30
    .line 31
    .line 32
    if-eqz p6, :cond_0

    .line 33
    .line 34
    iput-object p6, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object p5, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/google/android/gms/internal/play_billing/r0;

    .line 44
    .line 45
    new-instance p6, Lcom/android/billingclient/api/i0;

    .line 46
    .line 47
    invoke-direct {p6, p5, p1}, Lcom/android/billingclient/api/i0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/play_billing/r0;)V

    .line 48
    .line 49
    .line 50
    iput-object p6, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 51
    .line 52
    :goto_0
    if-nez p2, :cond_1

    .line 53
    .line 54
    const-string p1, "BillingClient"

    .line 55
    .line 56
    const-string p5, "Billing client should have a valid listener but the provided is null."

    .line 57
    .line 58
    invoke-static {p1, p5}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    new-instance v0, Lcom/android/billingclient/api/n0;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 64
    .line 65
    const/4 v5, 0x0

    .line 66
    iget-object v6, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 67
    .line 68
    const/4 v3, 0x0

    .line 69
    move-object v2, p2

    .line 70
    move-object v4, p4

    .line 71
    invoke-direct/range {v0 .. v6}, Lcom/android/billingclient/api/n0;-><init>(Landroid/content/Context;Ll/vkb0;Ll/tot0;Ll/bas0;Ll/ydk0;Lcom/android/billingclient/api/g0;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 75
    .line 76
    iput-object p3, p0, Lcom/android/billingclient/api/b;->B:Lcom/android/billingclient/api/e;

    .line 77
    .line 78
    if-eqz v4, :cond_2

    .line 79
    .line 80
    const/4 p1, 0x1

    .line 81
    goto :goto_1

    .line 82
    :cond_2
    const/4 p1, 0x0

    .line 83
    :goto_1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->C:Z

    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static bridge synthetic l0(Lcom/android/billingclient/api/b;IILcom/android/billingclient/api/d;)V
    .locals 0

    .line 1
    const/4 p2, 0x6

    invoke-direct {p0, p1, p2, p3}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    return-void
.end method

.method public static synthetic m(Lcom/android/billingclient/api/b;Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;
    .locals 1

    .line 1
    move-object p3, p0

    .line 2
    move-object p0, p1

    .line 3
    const-wide/16 p1, 0x7530

    .line 4
    .line 5
    invoke-direct {p3}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    move-object v0, p5

    .line 10
    move-object p5, p3

    .line 11
    move-object p3, p4

    .line 12
    move-object p4, v0

    .line 13
    invoke-static/range {p0 .. p5}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static bridge synthetic m0(Lcom/android/billingclient/api/b;IILcom/android/billingclient/api/d;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p2, 0x6

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    return-void
.end method

.method public static n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;
    .locals 2
    .param p3    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p5, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    long-to-double p1, p1

    .line 6
    new-instance p5, Ll/dir0;

    .line 7
    .line 8
    invoke-direct {p5, p0, p3}, Ll/dir0;-><init>(Ljava/util/concurrent/Future;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    const-wide v0, 0x3fee666666666666L    # 0.95

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    mul-double/2addr p1, v0

    .line 17
    double-to-long p1, p1

    .line 18
    invoke-virtual {p4, p5, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    const-string p1, "BillingClient"

    .line 24
    .line 25
    const-string p2, "Async task throws exception!"

    .line 26
    .line 27
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public static bridge synthetic n0(Lcom/android/billingclient/api/b;I)V
    .locals 0

    .line 1
    const/4 p1, 0x6

    invoke-direct {p0, p1}, Lcom/android/billingclient/api/b;->u0(I)V

    return-void
.end method

.method public static bridge synthetic o(Lcom/android/billingclient/api/b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/billingclient/api/b;->l:I

    return-void
.end method

.method private final o0()Landroid/os/Handler;
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Landroid/os/Handler;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public static bridge synthetic p(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->p:Z

    return-void
.end method

.method private final p0()Lcom/android/billingclient/api/d;
    .locals 3

    .line 1
    const-string v0, "BillingClient"

    .line 2
    .line 3
    const-string v1, "Service connection is valid. No need to re-initialize."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/n0;->C()Ll/f4y0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x6

    .line 13
    invoke-virtual {v0, v1}, Ll/f4y0;->r(I)Ll/f4y0;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/a1;->A()Ll/tcy0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v1, v2}, Ll/tcy0;->o(Z)Ll/tcy0;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/f4y0;->q(Ll/tcy0;)Ll/f4y0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/google/android/gms/internal/play_billing/n0;

    .line 32
    .line 33
    invoke-direct {p0, v0}, Lcom/android/billingclient/api/b;->P(Lcom/google/android/gms/internal/play_billing/n0;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 37
    .line 38
    return-object p0
.end method

.method public static bridge synthetic q(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->q:Z

    return-void
.end method

.method public static bridge synthetic q0(Lcom/android/billingclient/api/b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/billingclient/api/b;->l:I

    return p0
.end method

.method public static bridge synthetic r(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->r:Z

    return-void
.end method

.method private final r0(IILjava/lang/Exception;)V
    .locals 2
    .param p3    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "BillingClient"

    .line 2
    .line 3
    const-string v1, "showInAppMessages error."

    .line 4
    .line 5
    invoke-static {v0, v1, p3}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    .line 9
    .line 10
    invoke-static {p3}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/o0;->D()Ll/r4y0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p1}, Ll/r4y0;->r(I)Ll/r4y0;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ll/r4y0;->s(I)Ll/r4y0;

    .line 22
    .line 23
    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ll/r4y0;->o(Ljava/lang/String;)Ll/r4y0;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/m0;->D()Ll/t2y0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, v0}, Ll/t2y0;->o(Ll/r4y0;)Ll/t2y0;

    .line 37
    .line 38
    .line 39
    const/16 p2, 0x1e

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Ll/t2y0;->r(I)Ll/t2y0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/google/android/gms/internal/play_billing/m0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_1
    const-string p2, "BillingLogger"

    .line 52
    .line 53
    const-string p3, "Unable to create logging payload"

    .line 54
    .line 55
    invoke-static {p2, p3, p1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    :goto_2
    invoke-interface {p0, p1}, Lcom/android/billingclient/api/g0;->d(Lcom/google/android/gms/internal/play_billing/m0;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static bridge synthetic s(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->s:Z

    return-void
.end method

.method private s0(IILcom/android/billingclient/api/d;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/android/billingclient/api/f0;->b(IILcom/android/billingclient/api/d;)Lcom/google/android/gms/internal/play_billing/m0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/billingclient/api/b;->O(Lcom/google/android/gms/internal/play_billing/m0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    const-string p1, "BillingClient"

    .line 11
    .line 12
    const-string p2, "Unable to log."

    .line 13
    .line 14
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic t(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->t:Z

    return-void
.end method

.method private final t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V
    .locals 0
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-static {p1, p2, p3, p4}, Lcom/android/billingclient/api/f0;->c(IILcom/android/billingclient/api/d;Ljava/lang/String;)Lcom/google/android/gms/internal/play_billing/m0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/billingclient/api/b;->O(Lcom/google/android/gms/internal/play_billing/m0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    const-string p1, "BillingClient"

    .line 11
    .line 12
    const-string p2, "Unable to log."

    .line 13
    .line 14
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic u(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->u:Z

    return-void
.end method

.method private u0(I)V
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/android/billingclient/api/f0;->d(I)Lcom/google/android/gms/internal/play_billing/n0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/billingclient/api/b;->P(Lcom/google/android/gms/internal/play_billing/n0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    const-string p1, "BillingClient"

    .line 11
    .line 12
    const-string v0, "Unable to log."

    .line 13
    .line 14
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic v(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->v:Z

    return-void
.end method

.method public static bridge synthetic v0(Lcom/android/billingclient/api/b;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic w(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->w:Z

    return-void
.end method

.method public static bridge synthetic x(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->x:Z

    return-void
.end method

.method public static bridge synthetic y(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->y:Z

    return-void
.end method

.method public static bridge synthetic y0(Lcom/android/billingclient/api/b;)Landroid/os/Handler;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->o0()Landroid/os/Handler;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic z(Lcom/android/billingclient/api/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/billingclient/api/b;->z:Z

    return-void
.end method

.method public static bridge synthetic z0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/n0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    return-object p0
.end method


# virtual methods
.method public final A0(Lcom/android/billingclient/api/g;)Lcom/android/billingclient/api/u;
    .locals 22
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual/range {p1 .. p1}, Lcom/android/billingclient/api/g;->c()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v5

    .line 12
    invoke-virtual/range {p1 .. p1}, Lcom/android/billingclient/api/g;->b()Lcom/google/android/gms/internal/play_billing/zzco;

    .line 13
    .line 14
    .line 15
    move-result-object v8

    .line 16
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v9

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, v9, :cond_f

    .line 22
    .line 23
    add-int/lit8 v11, v2, 0x14

    .line 24
    .line 25
    if-le v11, v9, :cond_0

    .line 26
    .line 27
    move v3, v9

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    move v3, v11

    .line 30
    :goto_1
    new-instance v4, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-interface {v8, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/4 v6, 0x0

    .line 49
    :goto_2
    if-ge v6, v3, :cond_1

    .line 50
    .line 51
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    check-cast v7, Lcom/android/billingclient/api/g$b;

    .line 56
    .line 57
    invoke-virtual {v7}, Lcom/android/billingclient/api/g$b;->b()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    add-int/lit8 v6, v6, 0x1

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_1
    new-instance v6, Landroid/os/Bundle;

    .line 68
    .line 69
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v3, "ITEM_ID_LIST"

    .line 73
    .line 74
    invoke-virtual {v6, v3, v2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 75
    .line 76
    .line 77
    iget-object v2, v1, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 78
    .line 79
    const-string v3, "playBillingLibraryVersion"

    .line 80
    .line 81
    invoke-virtual {v6, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :try_start_0
    iget-object v2, v1, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 85
    .line 86
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    move-object v3, v2

    .line 88
    :try_start_1
    iget-object v2, v1, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 89
    .line 90
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    const/4 v13, 0x0

    .line 92
    if-nez v2, :cond_2

    .line 93
    .line 94
    :try_start_2
    sget-object v0, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 95
    .line 96
    const-string v2, "Service has been reset to null."

    .line 97
    .line 98
    const/16 v3, 0x77

    .line 99
    .line 100
    invoke-direct {v1, v0, v3, v2, v13}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    return-object v0

    .line 105
    :catch_0
    move-exception v0

    .line 106
    goto/16 :goto_6

    .line 107
    .line 108
    :catch_1
    move-exception v0

    .line 109
    const/16 v4, 0x2b

    .line 110
    .line 111
    goto/16 :goto_7

    .line 112
    .line 113
    :cond_2
    iget-boolean v3, v1, Lcom/android/billingclient/api/b;->x:Z

    .line 114
    .line 115
    const/4 v7, 0x1

    .line 116
    if-eq v7, v3, :cond_3

    .line 117
    .line 118
    const/16 v3, 0x11

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_3
    const/16 v3, 0x14

    .line 122
    .line 123
    :goto_3
    iget-object v14, v1, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 124
    .line 125
    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v14

    .line 129
    invoke-direct {v1}, Lcom/android/billingclient/api/b;->U()Z

    .line 130
    .line 131
    .line 132
    move-result v15

    .line 133
    iget-object v10, v1, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 134
    .line 135
    invoke-direct/range {p0 .. p1}, Lcom/android/billingclient/api/b;->K(Lcom/android/billingclient/api/g;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    invoke-direct/range {p0 .. p1}, Lcom/android/billingclient/api/b;->K(Lcom/android/billingclient/api/g;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    invoke-direct/range {p0 .. p1}, Lcom/android/billingclient/api/b;->K(Lcom/android/billingclient/api/g;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    invoke-direct/range {p0 .. p1}, Lcom/android/billingclient/api/b;->K(Lcom/android/billingclient/api/g;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    iget-object v12, v1, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 148
    .line 149
    move-object/from16 v16, v14

    .line 150
    .line 151
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    .line 152
    .line 153
    .line 154
    move-result-wide v13

    .line 155
    new-instance v12, Landroid/os/Bundle;

    .line 156
    .line 157
    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-static {v12, v10, v13, v14}, Lcom/google/android/gms/internal/play_billing/p;->c(Landroid/os/Bundle;Ljava/lang/String;J)Landroid/os/Bundle;

    .line 161
    .line 162
    .line 163
    const-string v10, "enablePendingPurchases"

    .line 164
    .line 165
    invoke-virtual {v12, v10, v7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 166
    .line 167
    .line 168
    const-string v10, "SKU_DETAILS_RESPONSE_FORMAT"

    .line 169
    .line 170
    const-string v13, "PRODUCT_DETAILS"

    .line 171
    .line 172
    invoke-virtual {v12, v10, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    if-eqz v15, :cond_4

    .line 176
    .line 177
    const-string v10, "enablePendingPurchaseForSubscriptions"

    .line 178
    .line 179
    invoke-virtual {v12, v10, v7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 180
    .line 181
    .line 182
    :cond_4
    new-instance v10, Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .line 186
    .line 187
    new-instance v13, Ljava/util/ArrayList;

    .line 188
    .line 189
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 193
    .line 194
    .line 195
    move-result v14

    .line 196
    const/4 v15, 0x0

    .line 197
    const/16 v17, 0x0

    .line 198
    .line 199
    const/16 v18, 0x0

    .line 200
    .line 201
    :goto_4
    if-ge v15, v14, :cond_6

    .line 202
    .line 203
    invoke-interface {v4, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v19

    .line 207
    check-cast v19, Lcom/android/billingclient/api/g$b;

    .line 208
    .line 209
    move/from16 v20, v7

    .line 210
    .line 211
    const/4 v7, 0x0

    .line 212
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 216
    .line 217
    .line 218
    move-result v21

    .line 219
    xor-int/lit8 v7, v21, 0x1

    .line 220
    .line 221
    or-int v17, v17, v7

    .line 222
    .line 223
    invoke-virtual/range {v19 .. v19}, Lcom/android/billingclient/api/g$b;->c()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v7

    .line 227
    move-object/from16 v19, v2

    .line 228
    .line 229
    const-string v2, "first_party"

    .line 230
    .line 231
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v2

    .line 235
    if-eqz v2, :cond_5

    .line 236
    .line 237
    const-string v2, "Serialized DocId is required for constructing ExtraParams to query ProductDetails for all first party products."

    .line 238
    .line 239
    const/4 v7, 0x0

    .line 240
    invoke-static {v7, v2}, Ll/ses0;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move/from16 v18, v20

    .line 247
    .line 248
    :cond_5
    add-int/lit8 v15, v15, 0x1

    .line 249
    .line 250
    move-object/from16 v2, v19

    .line 251
    .line 252
    move/from16 v7, v20

    .line 253
    .line 254
    goto :goto_4

    .line 255
    :cond_6
    move-object/from16 v19, v2

    .line 256
    .line 257
    if-eqz v17, :cond_7

    .line 258
    .line 259
    const-string v2, "SKU_OFFER_ID_TOKEN_LIST"

    .line 260
    .line 261
    invoke-virtual {v12, v2, v10}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 262
    .line 263
    .line 264
    :cond_7
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    if-nez v2, :cond_8

    .line 269
    .line 270
    const-string v2, "SKU_SERIALIZED_DOCID_LIST"

    .line 271
    .line 272
    invoke-virtual {v12, v2, v13}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 273
    .line 274
    .line 275
    :cond_8
    if-eqz v18, :cond_9

    .line 276
    .line 277
    const/4 v7, 0x0

    .line 278
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 279
    .line 280
    .line 281
    move-result v2

    .line 282
    if-nez v2, :cond_9

    .line 283
    .line 284
    const-string v2, "accountName"

    .line 285
    .line 286
    invoke-virtual {v12, v2, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    :cond_9
    move-object v7, v12

    .line 290
    move-object/from16 v4, v16

    .line 291
    .line 292
    move-object/from16 v2, v19

    .line 293
    .line 294
    invoke-interface/range {v2 .. v7}, Ll/jsr0;->F2(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 295
    .line 296
    .line 297
    move-result-object v2
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 298
    if-nez v2, :cond_a

    .line 299
    .line 300
    const-string v0, "queryProductDetailsAsync got empty product details response."

    .line 301
    .line 302
    sget-object v2, Lcom/android/billingclient/api/h0;->C:Lcom/android/billingclient/api/d;

    .line 303
    .line 304
    const/16 v3, 0x2c

    .line 305
    .line 306
    const/4 v7, 0x0

    .line 307
    invoke-direct {v1, v2, v3, v0, v7}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    return-object v0

    .line 312
    :cond_a
    const-string v3, "DETAILS_LIST"

    .line 313
    .line 314
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 315
    .line 316
    .line 317
    move-result v3

    .line 318
    const/4 v4, 0x6

    .line 319
    if-nez v3, :cond_c

    .line 320
    .line 321
    const-string v0, "BillingClient"

    .line 322
    .line 323
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/play_billing/p;->b(Landroid/os/Bundle;Ljava/lang/String;)I

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    const-string v3, "BillingClient"

    .line 328
    .line 329
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/play_billing/p;->g(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    if-eqz v0, :cond_b

    .line 334
    .line 335
    invoke-static {v0, v2}, Lcom/android/billingclient/api/h0;->a(ILjava/lang/String;)Lcom/android/billingclient/api/d;

    .line 336
    .line 337
    .line 338
    move-result-object v2

    .line 339
    new-instance v3, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    const-string v4, "getSkuDetails() failed for queryProductDetailsAsync. Response code: "

    .line 342
    .line 343
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    const/16 v3, 0x17

    .line 354
    .line 355
    const/4 v7, 0x0

    .line 356
    invoke-direct {v1, v2, v3, v0, v7}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    return-object v0

    .line 361
    :cond_b
    const/4 v7, 0x0

    .line 362
    invoke-static {v4, v2}, Lcom/android/billingclient/api/h0;->a(ILjava/lang/String;)Lcom/android/billingclient/api/d;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    const/16 v2, 0x2d

    .line 367
    .line 368
    const-string v3, "getSkuDetails() returned a bundle with neither an error nor a product detail list for queryProductDetailsAsync."

    .line 369
    .line 370
    invoke-direct {v1, v0, v2, v3, v7}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    return-object v0

    .line 375
    :cond_c
    const-string v3, "DETAILS_LIST"

    .line 376
    .line 377
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    if-eqz v2, :cond_e

    .line 382
    .line 383
    const/4 v3, 0x0

    .line 384
    :goto_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 385
    .line 386
    .line 387
    move-result v6

    .line 388
    if-ge v3, v6, :cond_d

    .line 389
    .line 390
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object v6

    .line 394
    check-cast v6, Ljava/lang/String;

    .line 395
    .line 396
    :try_start_3
    new-instance v7, Lcom/android/billingclient/api/f;

    .line 397
    .line 398
    invoke-direct {v7, v6}, Lcom/android/billingclient/api/f;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 399
    .line 400
    .line 401
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v6

    .line 405
    const-string v10, "Got product details: "

    .line 406
    .line 407
    invoke-virtual {v10, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v6

    .line 411
    const-string v10, "BillingClient"

    .line 412
    .line 413
    invoke-static {v10, v6}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    .line 418
    .line 419
    add-int/lit8 v3, v3, 0x1

    .line 420
    .line 421
    goto :goto_5

    .line 422
    :catch_2
    move-exception v0

    .line 423
    const-string v2, "Error trying to decode SkuDetails."

    .line 424
    .line 425
    invoke-static {v4, v2}, Lcom/android/billingclient/api/h0;->a(ILjava/lang/String;)Lcom/android/billingclient/api/d;

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    const/16 v3, 0x2f

    .line 430
    .line 431
    const-string v4, "Got a JSON exception trying to decode ProductDetails. \n Exception: "

    .line 432
    .line 433
    invoke-direct {v1, v2, v3, v4, v0}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    return-object v0

    .line 438
    :cond_d
    move v2, v11

    .line 439
    goto/16 :goto_0

    .line 440
    .line 441
    :cond_e
    const-string v0, "queryProductDetailsAsync got null response list"

    .line 442
    .line 443
    sget-object v2, Lcom/android/billingclient/api/h0;->C:Lcom/android/billingclient/api/d;

    .line 444
    .line 445
    const/16 v3, 0x2e

    .line 446
    .line 447
    const/4 v7, 0x0

    .line 448
    invoke-direct {v1, v2, v3, v0, v7}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    return-object v0

    .line 453
    :catchall_0
    move-exception v0

    .line 454
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 455
    :try_start_5
    throw v0
    :try_end_5
    .catch Landroid/os/DeadObjectException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 456
    :goto_6
    const-string v2, "queryProductDetailsAsync got a remote exception (try to reconnect)."

    .line 457
    .line 458
    sget-object v3, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 459
    .line 460
    const/16 v4, 0x2b

    .line 461
    .line 462
    invoke-direct {v1, v3, v4, v2, v0}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    return-object v0

    .line 467
    :goto_7
    const-string v2, "queryProductDetailsAsync got a remote exception (try to reconnect)."

    .line 468
    .line 469
    sget-object v3, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 470
    .line 471
    invoke-direct {v1, v3, v4, v2, v0}, Lcom/android/billingclient/api/b;->W(Lcom/android/billingclient/api/d;ILjava/lang/String;Ljava/lang/Exception;)Lcom/android/billingclient/api/u;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    return-object v0

    .line 476
    :cond_f
    const-string v1, ""

    .line 477
    .line 478
    new-instance v2, Lcom/android/billingclient/api/u;

    .line 479
    .line 480
    const/4 v3, 0x0

    .line 481
    invoke-direct {v2, v3, v1, v0}, Lcom/android/billingclient/api/u;-><init>(ILjava/lang/String;Ljava/util/List;)V

    .line 482
    .line 483
    .line 484
    return-object v2
.end method

.method public final C0()Lcom/android/billingclient/api/g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/b;->g:Lcom/android/billingclient/api/g0;

    return-object p0
.end method

.method public final E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, Lcom/android/billingclient/api/o0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/android/billingclient/api/o0;-><init>(Lcom/android/billingclient/api/b;Lcom/android/billingclient/api/d;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public final declared-synchronized G0()Ll/rrv0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->E:Ll/rrv0;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/d0w0;->a(Ljava/util/concurrent/ExecutorService;)Ll/rrv0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/billingclient/api/b;->E:Ll/rrv0;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/billingclient/api/b;->E:Ll/rrv0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-object v0

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public final synthetic J0(Ll/d10;Ll/c10;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/16 v0, 0x1c

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    :try_start_1
    iget-object v3, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 8
    .line 9
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    :try_start_2
    sget-object p2, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 13
    .line 14
    const/16 v2, 0x77

    .line 15
    .line 16
    invoke-direct {p0, p1, p2, v2, v1}, Lcom/android/billingclient/api/b;->a0(Ll/d10;Lcom/android/billingclient/api/d;ILjava/lang/Exception;)V

    .line 17
    .line 18
    .line 19
    return-object v1

    .line 20
    :catch_0
    move-exception p2

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception p2

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p2}, Ll/c10;->a()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object v4, p0, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v5, p0, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 37
    .line 38
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    new-instance v7, Landroid/os/Bundle;

    .line 43
    .line 44
    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v7, v4, v5, v6}, Lcom/google/android/gms/internal/play_billing/p;->c(Landroid/os/Bundle;Ljava/lang/String;J)Landroid/os/Bundle;

    .line 48
    .line 49
    .line 50
    const/16 v4, 0x9

    .line 51
    .line 52
    invoke-interface {v3, v4, v2, p2, v7}, Ll/jsr0;->p4(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 53
    .line 54
    .line 55
    move-result-object p0
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 56
    const-string p2, "BillingClient"

    .line 57
    .line 58
    invoke-static {p0, p2}, Lcom/google/android/gms/internal/play_billing/p;->b(Landroid/os/Bundle;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    const-string v0, "BillingClient"

    .line 63
    .line 64
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/play_billing/p;->g(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p2, p0}, Lcom/android/billingclient/api/h0;->a(ILjava/lang/String;)Lcom/android/billingclient/api/d;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p1, p0}, Ll/d10;->e(Lcom/android/billingclient/api/d;)V

    .line 73
    .line 74
    .line 75
    return-object v1

    .line 76
    :catchall_0
    move-exception p2

    .line 77
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 78
    :try_start_4
    throw p2
    :try_end_4
    .catch Landroid/os/DeadObjectException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 79
    :goto_0
    sget-object v2, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 80
    .line 81
    invoke-direct {p0, p1, v2, v0, p2}, Lcom/android/billingclient/api/b;->a0(Ll/d10;Lcom/android/billingclient/api/d;ILjava/lang/Exception;)V

    .line 82
    .line 83
    .line 84
    return-object v1

    .line 85
    :goto_1
    sget-object v2, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 86
    .line 87
    invoke-direct {p0, p1, v2, v0, p2}, Lcom/android/billingclient/api/b;->a0(Ll/d10;Lcom/android/billingclient/api/d;ILjava/lang/Exception;)V

    .line 88
    .line 89
    .line 90
    return-object v1
.end method

.method public final synthetic K0(Ll/x06;Ll/y06;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/b;->N(Ll/x06;Ll/y06;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public final synthetic L0(Landroid/os/Bundle;Landroid/app/Activity;Landroid/os/ResultReceiver;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/16 v0, 0x76

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    iget-object v3, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v3
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    :try_start_1
    iget-object v4, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 9
    .line 10
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    const/16 p1, 0x77

    .line 14
    .line 15
    :try_start_2
    invoke-direct {p0, v1, p1, v2}, Lcom/android/billingclient/api/b;->r0(IILjava/lang/Exception;)V

    .line 16
    .line 17
    .line 18
    goto :goto_2

    .line 19
    :catch_0
    move-exception p1

    .line 20
    goto :goto_0

    .line 21
    :catch_1
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object v3, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    new-instance v5, Lcom/android/billingclient/api/t;

    .line 30
    .line 31
    new-instance v6, Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-direct {v6, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v5, v6, p3, v2}, Lcom/android/billingclient/api/t;-><init>(Ljava/lang/ref/WeakReference;Landroid/os/ResultReceiver;Ll/ens0;)V

    .line 37
    .line 38
    .line 39
    const/16 p2, 0xc

    .line 40
    .line 41
    invoke-interface {v4, p2, v3, p1, v5}, Ll/jsr0;->V5(ILjava/lang/String;Landroid/os/Bundle;Ll/cvr0;)V
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 42
    .line 43
    .line 44
    goto :goto_2

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 47
    :try_start_4
    throw p1
    :try_end_4
    .catch Landroid/os/DeadObjectException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 48
    :goto_0
    const/4 p2, 0x6

    .line 49
    invoke-direct {p0, p2, v0, p1}, Lcom/android/billingclient/api/b;->r0(IILjava/lang/Exception;)V

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :goto_1
    invoke-direct {p0, v1, v0, p1}, Lcom/android/billingclient/api/b;->r0(IILjava/lang/Exception;)V

    .line 54
    .line 55
    .line 56
    :goto_2
    return-object v2
.end method

.method public a(Ll/c10;Ll/d10;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object p1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p2, p1}, Ll/d10;->e(Lcom/android/billingclient/api/d;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p1}, Ll/c10;->a()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string p1, "BillingClient"

    .line 29
    .line 30
    const-string v0, "Please provide a valid purchase token."

    .line 31
    .line 32
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object p1, Lcom/android/billingclient/api/h0;->j:Lcom/android/billingclient/api/d;

    .line 36
    .line 37
    const/16 v0, 0x1a

    .line 38
    .line 39
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p2, p1}, Ll/d10;->e(Lcom/android/billingclient/api/d;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-boolean v0, p0, Lcom/android/billingclient/api/b;->o:Z

    .line 47
    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    sget-object p1, Lcom/android/billingclient/api/h0;->b:Lcom/android/billingclient/api/d;

    .line 51
    .line 52
    const/16 v0, 0x1b

    .line 53
    .line 54
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p2, p1}, Ll/d10;->e(Lcom/android/billingclient/api/d;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    new-instance v2, Lcom/android/billingclient/api/q0;

    .line 62
    .line 63
    invoke-direct {v2, p0, p2, p1}, Lcom/android/billingclient/api/q0;-><init>(Lcom/android/billingclient/api/b;Ll/d10;Ll/c10;)V

    .line 64
    .line 65
    .line 66
    new-instance v5, Lcom/android/billingclient/api/r0;

    .line 67
    .line 68
    invoke-direct {v5, p0, p2}, Lcom/android/billingclient/api/r0;-><init>(Lcom/android/billingclient/api/b;Ll/d10;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->o0()Landroid/os/Handler;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    const-wide/16 v3, 0x7530

    .line 80
    .line 81
    invoke-static/range {v2 .. v7}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-nez p1, :cond_3

    .line 86
    .line 87
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->J()Lcom/android/billingclient/api/d;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const/16 v0, 0x19

    .line 92
    .line 93
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p2, p1}, Ll/d10;->e(Lcom/android/billingclient/api/d;)V

    .line 97
    .line 98
    .line 99
    :cond_3
    return-void
.end method

.method public b(Ll/x06;Ll/y06;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    invoke-direct {p0, v2, v1, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ll/x06;->a()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p2, v0, p0}, Ll/y06;->f(Lcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v2, Lcom/android/billingclient/api/i;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1, p2}, Lcom/android/billingclient/api/i;-><init>(Lcom/android/billingclient/api/b;Ll/x06;Ll/y06;)V

    .line 25
    .line 26
    .line 27
    new-instance v5, Lcom/android/billingclient/api/j;

    .line 28
    .line 29
    invoke-direct {v5, p0, p2, p1}, Lcom/android/billingclient/api/j;-><init>(Lcom/android/billingclient/api/b;Ll/y06;Ll/x06;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->o0()Landroid/os/Handler;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    const-wide/16 v3, 0x7530

    .line 41
    .line 42
    invoke-static/range {v2 .. v7}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->J()Lcom/android/billingclient/api/d;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/16 v2, 0x19

    .line 53
    .line 54
    invoke-direct {p0, v2, v1, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ll/x06;->a()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p2, v0, p0}, Ll/y06;->f(Lcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public c()V
    .locals 5

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/billingclient/api/b;->u0(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/billingclient/api/n0;->f()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    :try_start_1
    const-string v2, "BillingClient"

    .line 21
    .line 22
    const-string v3, "There was an exception while shutting down broadcast manager while ending connection!"

    .line 23
    .line 24
    invoke-static {v2, v3, v1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 25
    .line 26
    .line 27
    :cond_0
    :goto_0
    :try_start_2
    const-string v1, "BillingClient"

    .line 28
    .line 29
    const-string v2, "Unbinding from service."

    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->T()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_1
    move-exception v1

    .line 39
    :try_start_3
    const-string v2, "BillingClient"

    .line 40
    .line 41
    const-string v3, "There was an exception while unbinding from the service while ending connection!"

    .line 42
    .line 43
    invoke-static {v2, v3, v1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 44
    .line 45
    .line 46
    :goto_1
    const/4 v1, 0x3

    .line 47
    :try_start_4
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->S()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 48
    .line 49
    .line 50
    :goto_2
    :try_start_5
    invoke-direct {p0, v1}, Lcom/android/billingclient/api/b;->R(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 51
    .line 52
    .line 53
    goto :goto_3

    .line 54
    :catchall_2
    move-exception p0

    .line 55
    goto :goto_4

    .line 56
    :catchall_3
    move-exception v2

    .line 57
    :try_start_6
    const-string v3, "BillingClient"

    .line 58
    .line 59
    const-string v4, "There was an exception while shutting down the executor service while ending connection!"

    .line 60
    .line 61
    invoke-static {v3, v4, v2}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :goto_3
    :try_start_7
    monitor-exit v0

    .line 66
    return-void

    .line 67
    :catchall_4
    move-exception v2

    .line 68
    invoke-direct {p0, v1}, Lcom/android/billingclient/api/b;->R(I)V

    .line 69
    .line 70
    .line 71
    throw v2

    .line 72
    :goto_4
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 73
    throw p0
.end method

.method public final d(Ljava/lang/String;)Lcom/android/billingclient/api/d;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x5

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-object p1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0, v1, v2, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 18
    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_0
    invoke-direct {p0, v2}, Lcom/android/billingclient/api/b;->u0(I)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_1
    sget-object v0, Lcom/android/billingclient/api/h0;->a:Lcom/android/billingclient/api/d;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/16 v3, 0x9

    .line 32
    .line 33
    const/16 v4, 0xa

    .line 34
    .line 35
    const/16 v5, 0x13

    .line 36
    .line 37
    sparse-switch v0, :sswitch_data_0

    .line 38
    .line 39
    .line 40
    goto/16 :goto_f

    .line 41
    .line 42
    :sswitch_0
    const-string v0, "subscriptions"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_11

    .line 49
    .line 50
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->j:Z

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    sget-object p1, Lcom/android/billingclient/api/h0;->o:Lcom/android/billingclient/api/d;

    .line 58
    .line 59
    :goto_0
    invoke-direct {p0, p1, v3, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 60
    .line 61
    .line 62
    return-object p1

    .line 63
    :sswitch_1
    const-string v0, "priceChangeConfirmation"

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_11

    .line 70
    .line 71
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->n:Z

    .line 72
    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    sget-object p1, Lcom/android/billingclient/api/h0;->r:Lcom/android/billingclient/api/d;

    .line 79
    .line 80
    :goto_1
    const/16 v0, 0x23

    .line 81
    .line 82
    const/4 v1, 0x4

    .line 83
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 84
    .line 85
    .line 86
    return-object p1

    .line 87
    :sswitch_2
    const-string v0, "lll"

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_11

    .line 94
    .line 95
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->A:Z

    .line 96
    .line 97
    if-eqz p1, :cond_4

    .line 98
    .line 99
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_4
    sget-object p1, Lcom/android/billingclient/api/h0;->y:Lcom/android/billingclient/api/d;

    .line 103
    .line 104
    :goto_2
    const/16 v0, 0x74

    .line 105
    .line 106
    invoke-direct {p0, p1, v0, v5}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 107
    .line 108
    .line 109
    return-object p1

    .line 110
    :sswitch_3
    const-string v0, "kkk"

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_11

    .line 117
    .line 118
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->z:Z

    .line 119
    .line 120
    if-eqz p1, :cond_5

    .line 121
    .line 122
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_5
    sget-object p1, Lcom/android/billingclient/api/h0;->x:Lcom/android/billingclient/api/d;

    .line 126
    .line 127
    :goto_3
    const/16 v0, 0x67

    .line 128
    .line 129
    const/16 v1, 0x12

    .line 130
    .line 131
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 132
    .line 133
    .line 134
    return-object p1

    .line 135
    :sswitch_4
    const-string v0, "jjj"

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_11

    .line 142
    .line 143
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->y:Z

    .line 144
    .line 145
    if-eqz p1, :cond_6

    .line 146
    .line 147
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 148
    .line 149
    goto :goto_4

    .line 150
    :cond_6
    sget-object p1, Lcom/android/billingclient/api/h0;->E:Lcom/android/billingclient/api/d;

    .line 151
    .line 152
    :goto_4
    const/16 v0, 0x42

    .line 153
    .line 154
    const/16 v1, 0xe

    .line 155
    .line 156
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 157
    .line 158
    .line 159
    return-object p1

    .line 160
    :sswitch_5
    const-string v0, "iii"

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_11

    .line 167
    .line 168
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->x:Z

    .line 169
    .line 170
    if-eqz p1, :cond_7

    .line 171
    .line 172
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 173
    .line 174
    goto :goto_5

    .line 175
    :cond_7
    sget-object p1, Lcom/android/billingclient/api/h0;->D:Lcom/android/billingclient/api/d;

    .line 176
    .line 177
    :goto_5
    const/16 v0, 0x3c

    .line 178
    .line 179
    const/16 v1, 0xd

    .line 180
    .line 181
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 182
    .line 183
    .line 184
    return-object p1

    .line 185
    :sswitch_6
    const-string v0, "hhh"

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_11

    .line 192
    .line 193
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->v:Z

    .line 194
    .line 195
    if-eqz p1, :cond_8

    .line 196
    .line 197
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 198
    .line 199
    goto :goto_6

    .line 200
    :cond_8
    sget-object p1, Lcom/android/billingclient/api/h0;->B:Lcom/android/billingclient/api/d;

    .line 201
    .line 202
    :goto_6
    const/16 v0, 0x21

    .line 203
    .line 204
    const/16 v1, 0xc

    .line 205
    .line 206
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 207
    .line 208
    .line 209
    return-object p1

    .line 210
    :sswitch_7
    const-string v0, "ggg"

    .line 211
    .line 212
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_11

    .line 217
    .line 218
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->v:Z

    .line 219
    .line 220
    if-eqz p1, :cond_9

    .line 221
    .line 222
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 223
    .line 224
    goto :goto_7

    .line 225
    :cond_9
    sget-object p1, Lcom/android/billingclient/api/h0;->A:Lcom/android/billingclient/api/d;

    .line 226
    .line 227
    :goto_7
    const/16 v0, 0x20

    .line 228
    .line 229
    const/16 v1, 0xb

    .line 230
    .line 231
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 232
    .line 233
    .line 234
    return-object p1

    .line 235
    :sswitch_8
    const-string v0, "fff"

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-eqz v0, :cond_11

    .line 242
    .line 243
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->u:Z

    .line 244
    .line 245
    if-eqz p1, :cond_a

    .line 246
    .line 247
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 248
    .line 249
    goto :goto_8

    .line 250
    :cond_a
    sget-object p1, Lcom/android/billingclient/api/h0;->v:Lcom/android/billingclient/api/d;

    .line 251
    .line 252
    :goto_8
    const/16 v0, 0x14

    .line 253
    .line 254
    invoke-direct {p0, p1, v0, v4}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 255
    .line 256
    .line 257
    return-object p1

    .line 258
    :sswitch_9
    const-string v0, "eee"

    .line 259
    .line 260
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-eqz v0, :cond_11

    .line 265
    .line 266
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->t:Z

    .line 267
    .line 268
    if-eqz p1, :cond_b

    .line 269
    .line 270
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 271
    .line 272
    goto :goto_9

    .line 273
    :cond_b
    sget-object p1, Lcom/android/billingclient/api/h0;->t:Lcom/android/billingclient/api/d;

    .line 274
    .line 275
    :goto_9
    const/16 v0, 0x3d

    .line 276
    .line 277
    invoke-direct {p0, p1, v0, v3}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 278
    .line 279
    .line 280
    return-object p1

    .line 281
    :sswitch_a
    const-string v0, "ddd"

    .line 282
    .line 283
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-eqz v0, :cond_11

    .line 288
    .line 289
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->r:Z

    .line 290
    .line 291
    if-eqz p1, :cond_c

    .line 292
    .line 293
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 294
    .line 295
    goto :goto_a

    .line 296
    :cond_c
    sget-object p1, Lcom/android/billingclient/api/h0;->u:Lcom/android/billingclient/api/d;

    .line 297
    .line 298
    :goto_a
    const/16 v0, 0x15

    .line 299
    .line 300
    const/4 v1, 0x7

    .line 301
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 302
    .line 303
    .line 304
    return-object p1

    .line 305
    :sswitch_b
    const-string v0, "ccc"

    .line 306
    .line 307
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_11

    .line 312
    .line 313
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->t:Z

    .line 314
    .line 315
    if-eqz p1, :cond_d

    .line 316
    .line 317
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 318
    .line 319
    goto :goto_b

    .line 320
    :cond_d
    sget-object p1, Lcom/android/billingclient/api/h0;->t:Lcom/android/billingclient/api/d;

    .line 321
    .line 322
    :goto_b
    const/16 v0, 0x8

    .line 323
    .line 324
    invoke-direct {p0, p1, v5, v0}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 325
    .line 326
    .line 327
    return-object p1

    .line 328
    :sswitch_c
    const-string v0, "bbb"

    .line 329
    .line 330
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-eqz v0, :cond_11

    .line 335
    .line 336
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->q:Z

    .line 337
    .line 338
    if-eqz p1, :cond_e

    .line 339
    .line 340
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 341
    .line 342
    goto :goto_c

    .line 343
    :cond_e
    sget-object p1, Lcom/android/billingclient/api/h0;->w:Lcom/android/billingclient/api/d;

    .line 344
    .line 345
    :goto_c
    const/16 v0, 0x1e

    .line 346
    .line 347
    invoke-direct {p0, p1, v0, v2}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 348
    .line 349
    .line 350
    return-object p1

    .line 351
    :sswitch_d
    const-string v0, "aaa"

    .line 352
    .line 353
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    move-result v0

    .line 357
    if-eqz v0, :cond_11

    .line 358
    .line 359
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->s:Z

    .line 360
    .line 361
    if-eqz p1, :cond_f

    .line 362
    .line 363
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 364
    .line 365
    goto :goto_d

    .line 366
    :cond_f
    sget-object p1, Lcom/android/billingclient/api/h0;->s:Lcom/android/billingclient/api/d;

    .line 367
    .line 368
    :goto_d
    const/16 v0, 0x1f

    .line 369
    .line 370
    const/4 v1, 0x6

    .line 371
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 372
    .line 373
    .line 374
    return-object p1

    .line 375
    :sswitch_e
    const-string v0, "subscriptionsUpdate"

    .line 376
    .line 377
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-eqz v0, :cond_11

    .line 382
    .line 383
    iget-boolean p1, p0, Lcom/android/billingclient/api/b;->k:Z

    .line 384
    .line 385
    if-eqz p1, :cond_10

    .line 386
    .line 387
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 388
    .line 389
    goto :goto_e

    .line 390
    :cond_10
    sget-object p1, Lcom/android/billingclient/api/h0;->p:Lcom/android/billingclient/api/d;

    .line 391
    .line 392
    :goto_e
    const/4 v0, 0x3

    .line 393
    invoke-direct {p0, p1, v4, v0}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 394
    .line 395
    .line 396
    return-object p1

    .line 397
    :cond_11
    :goto_f
    const-string v0, "BillingClient"

    .line 398
    .line 399
    const-string v1, "Unsupported feature: "

    .line 400
    .line 401
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p1

    .line 405
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    .line 407
    .line 408
    sget-object p1, Lcom/android/billingclient/api/h0;->z:Lcom/android/billingclient/api/d;

    .line 409
    .line 410
    const/16 v0, 0x22

    .line 411
    .line 412
    const/4 v1, 0x1

    .line 413
    invoke-direct {p0, p1, v0, v1}, Lcom/android/billingclient/api/b;->Z(Lcom/android/billingclient/api/d;II)V

    .line 414
    .line 415
    .line 416
    return-object p1

    .line 417
    :sswitch_data_0
    .sparse-switch
        -0x1928a0a1 -> :sswitch_e
        0x17841 -> :sswitch_d
        0x17c22 -> :sswitch_c
        0x18003 -> :sswitch_b
        0x183e4 -> :sswitch_a
        0x187c5 -> :sswitch_9
        0x18ba6 -> :sswitch_8
        0x18f87 -> :sswitch_7
        0x19368 -> :sswitch_6
        0x19749 -> :sswitch_5
        0x19b2a -> :sswitch_4
        0x19f0b -> :sswitch_3
        0x1a2ec -> :sswitch_2
        0xc5ff92e -> :sswitch_1
        0x7674caf6 -> :sswitch_0
    .end sparse-switch
.end method

.method public final synthetic d0(Ll/d10;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/billingclient/api/h0;->n:Lcom/android/billingclient/api/d;

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    invoke-direct {p0, v1, v2, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1, v0}, Ll/d10;->e(Lcom/android/billingclient/api/d;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final e()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/android/billingclient/api/b;->b:I

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    const/4 v3, 0x0

    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    return v3

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public final synthetic e0(Lcom/android/billingclient/api/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/billingclient/api/n0;->d()Ll/vkb0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/billingclient/api/n0;->d()Ll/vkb0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p0, p1, v0}, Ll/vkb0;->d(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "BillingClient"

    .line 21
    .line 22
    const-string p1, "No valid listener is set in BroadcastManager"

    .line 23
    .line 24
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public f(Landroid/app/Activity;Lcom/android/billingclient/api/c;)Lcom/android/billingclient/api/d;
    .locals 34

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v8, "BUY_INTENT"

    .line 4
    .line 5
    const-string v0, "proxyPackageVersion"

    .line 6
    .line 7
    iget-object v2, v1, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 8
    .line 9
    const/4 v9, 0x2

    .line 10
    if-eqz v2, :cond_3d

    .line 11
    .line 12
    iget-object v2, v1, Lcom/android/billingclient/api/b;->e:Lcom/android/billingclient/api/n0;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/android/billingclient/api/n0;->d()Ll/vkb0;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    if-eqz v2, :cond_3d

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/billingclient/api/b;->e()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    sget-object v0, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 27
    .line 28
    invoke-direct {v1, v9, v9, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->h()Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->i()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const/4 v10, 0x0

    .line 44
    invoke-static {v2, v10}, Ll/h0u0;->a(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Lcom/android/billingclient/api/SkuDetails;

    .line 49
    .line 50
    invoke-static {v3, v10}, Ll/h0u0;->a(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    check-cast v5, Lcom/android/billingclient/api/c$b;

    .line 55
    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    invoke-virtual {v4}, Lcom/android/billingclient/api/SkuDetails;->a()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-virtual {v4}, Lcom/android/billingclient/api/SkuDetails;->b()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v11

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {v5}, Lcom/android/billingclient/api/c$b;->b()Lcom/android/billingclient/api/f;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-virtual {v6}, Lcom/android/billingclient/api/f;->c()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-virtual {v5}, Lcom/android/billingclient/api/c$b;->b()Lcom/android/billingclient/api/f;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    invoke-virtual {v11}, Lcom/android/billingclient/api/f;->d()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v11

    .line 83
    :goto_0
    const-string v12, "subs"

    .line 84
    .line 85
    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v12

    .line 89
    const/16 v13, 0x9

    .line 90
    .line 91
    const-string v14, "BillingClient"

    .line 92
    .line 93
    if-eqz v12, :cond_3

    .line 94
    .line 95
    iget-boolean v12, v1, Lcom/android/billingclient/api/b;->j:Z

    .line 96
    .line 97
    if-eqz v12, :cond_2

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    const-string v0, "Current client doesn\'t support subscriptions."

    .line 101
    .line 102
    invoke-static {v14, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    sget-object v0, Lcom/android/billingclient/api/h0;->o:Lcom/android/billingclient/api/d;

    .line 106
    .line 107
    invoke-direct {v1, v13, v9, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 111
    .line 112
    .line 113
    return-object v0

    .line 114
    :cond_3
    :goto_1
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->r()Z

    .line 115
    .line 116
    .line 117
    move-result v12

    .line 118
    if-eqz v12, :cond_5

    .line 119
    .line 120
    iget-boolean v12, v1, Lcom/android/billingclient/api/b;->m:Z

    .line 121
    .line 122
    if-eqz v12, :cond_4

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_4
    const-string v0, "Current client doesn\'t support extra params for buy intent."

    .line 126
    .line 127
    invoke-static {v14, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    sget-object v0, Lcom/android/billingclient/api/h0;->i:Lcom/android/billingclient/api/d;

    .line 131
    .line 132
    const/16 v2, 0x12

    .line 133
    .line 134
    invoke-direct {v1, v2, v9, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 138
    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_5
    :goto_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 142
    .line 143
    .line 144
    move-result v12

    .line 145
    const/4 v15, 0x1

    .line 146
    if-le v12, v15, :cond_7

    .line 147
    .line 148
    iget-boolean v12, v1, Lcom/android/billingclient/api/b;->t:Z

    .line 149
    .line 150
    if-eqz v12, :cond_6

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_6
    const-string v0, "Current client doesn\'t support multi-item purchases."

    .line 154
    .line 155
    invoke-static {v14, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    sget-object v0, Lcom/android/billingclient/api/h0;->t:Lcom/android/billingclient/api/d;

    .line 159
    .line 160
    const/16 v2, 0x13

    .line 161
    .line 162
    invoke-direct {v1, v2, v9, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 166
    .line 167
    .line 168
    return-object v0

    .line 169
    :cond_7
    :goto_3
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 170
    .line 171
    .line 172
    move-result v12

    .line 173
    if-nez v12, :cond_9

    .line 174
    .line 175
    iget-boolean v12, v1, Lcom/android/billingclient/api/b;->u:Z

    .line 176
    .line 177
    if-eqz v12, :cond_8

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_8
    const-string v0, "Current client doesn\'t support purchases with ProductDetails."

    .line 181
    .line 182
    invoke-static {v14, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    sget-object v0, Lcom/android/billingclient/api/h0;->v:Lcom/android/billingclient/api/d;

    .line 186
    .line 187
    const/16 v2, 0x14

    .line 188
    .line 189
    invoke-direct {v1, v2, v9, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 193
    .line 194
    .line 195
    return-object v0

    .line 196
    :cond_9
    :goto_4
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->c()Lcom/android/billingclient/api/d;

    .line 197
    .line 198
    .line 199
    move-result-object v12

    .line 200
    sget-object v13, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 201
    .line 202
    if-eq v12, v13, :cond_a

    .line 203
    .line 204
    const/16 v0, 0x78

    .line 205
    .line 206
    invoke-direct {v1, v0, v9, v12}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v1, v12}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 210
    .line 211
    .line 212
    return-object v12

    .line 213
    :cond_a
    iget-boolean v12, v1, Lcom/android/billingclient/api/b;->m:Z

    .line 214
    .line 215
    if-eqz v12, :cond_35

    .line 216
    .line 217
    iget-boolean v12, v1, Lcom/android/billingclient/api/b;->o:Z

    .line 218
    .line 219
    iget-boolean v13, v1, Lcom/android/billingclient/api/b;->w:Z

    .line 220
    .line 221
    iget-object v9, v1, Lcom/android/billingclient/api/b;->B:Lcom/android/billingclient/api/e;

    .line 222
    .line 223
    invoke-virtual {v9}, Lcom/android/billingclient/api/e;->a()Z

    .line 224
    .line 225
    .line 226
    move-result v9

    .line 227
    move-object/from16 v17, v10

    .line 228
    .line 229
    iget-object v10, v1, Lcom/android/billingclient/api/b;->B:Lcom/android/billingclient/api/e;

    .line 230
    .line 231
    invoke-virtual {v10}, Lcom/android/billingclient/api/e;->b()Z

    .line 232
    .line 233
    .line 234
    move-result v10

    .line 235
    iget-boolean v15, v1, Lcom/android/billingclient/api/b;->C:Z

    .line 236
    .line 237
    move-object/from16 v19, v4

    .line 238
    .line 239
    iget-object v4, v1, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 240
    .line 241
    move-object/from16 v20, v5

    .line 242
    .line 243
    iget-object v5, v1, Lcom/android/billingclient/api/b;->F:Ljava/lang/Long;

    .line 244
    .line 245
    move-object/from16 v21, v6

    .line 246
    .line 247
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 248
    .line 249
    .line 250
    move-result-wide v5

    .line 251
    move/from16 v22, v9

    .line 252
    .line 253
    iget-object v9, v1, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 254
    .line 255
    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v9

    .line 259
    move/from16 v23, v10

    .line 260
    .line 261
    new-instance v10, Landroid/os/Bundle;

    .line 262
    .line 263
    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-static {v10, v4, v5, v6}, Lcom/google/android/gms/internal/play_billing/p;->c(Landroid/os/Bundle;Ljava/lang/String;J)Landroid/os/Bundle;

    .line 267
    .line 268
    .line 269
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->b()I

    .line 270
    .line 271
    .line 272
    move-result v4

    .line 273
    if-eqz v4, :cond_b

    .line 274
    .line 275
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->b()I

    .line 276
    .line 277
    .line 278
    move-result v4

    .line 279
    const-string v5, "prorationMode"

    .line 280
    .line 281
    invoke-virtual {v10, v5, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 282
    .line 283
    .line 284
    :cond_b
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->d()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    if-nez v4, :cond_c

    .line 293
    .line 294
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->d()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    const-string v5, "accountId"

    .line 299
    .line 300
    invoke-virtual {v10, v5, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    :cond_c
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->e()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v4

    .line 307
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 308
    .line 309
    .line 310
    move-result v4

    .line 311
    if-nez v4, :cond_d

    .line 312
    .line 313
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->e()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v4

    .line 317
    const-string v5, "obfuscatedProfileId"

    .line 318
    .line 319
    invoke-virtual {v10, v5, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    :cond_d
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->q()Z

    .line 323
    .line 324
    .line 325
    move-result v4

    .line 326
    if-eqz v4, :cond_e

    .line 327
    .line 328
    const-string v4, "isOfferPersonalizedByDeveloper"

    .line 329
    .line 330
    const/4 v5, 0x1

    .line 331
    invoke-virtual {v10, v4, v5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 332
    .line 333
    .line 334
    :cond_e
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 335
    .line 336
    .line 337
    move-result v4

    .line 338
    if-nez v4, :cond_f

    .line 339
    .line 340
    new-instance v4, Ljava/util/ArrayList;

    .line 341
    .line 342
    filled-new-array/range {v17 .. v17}, [Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v5

    .line 346
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 347
    .line 348
    .line 349
    move-result-object v5

    .line 350
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 351
    .line 352
    .line 353
    const-string v5, "skusToReplace"

    .line 354
    .line 355
    invoke-virtual {v10, v5, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 356
    .line 357
    .line 358
    :cond_f
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->f()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 363
    .line 364
    .line 365
    move-result v4

    .line 366
    if-nez v4, :cond_10

    .line 367
    .line 368
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->f()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    const-string v5, "oldSkuPurchaseToken"

    .line 373
    .line 374
    invoke-virtual {v10, v5, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    :cond_10
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 378
    .line 379
    .line 380
    move-result v4

    .line 381
    if-nez v4, :cond_11

    .line 382
    .line 383
    const-string v4, "oldSkuPurchaseId"

    .line 384
    .line 385
    move-object/from16 v5, v17

    .line 386
    .line 387
    invoke-virtual {v10, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    goto :goto_5

    .line 391
    :cond_11
    move-object/from16 v5, v17

    .line 392
    .line 393
    :goto_5
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->g()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v4

    .line 397
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 398
    .line 399
    .line 400
    move-result v4

    .line 401
    if-nez v4, :cond_12

    .line 402
    .line 403
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->g()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v4

    .line 407
    const-string v6, "originalExternalTransactionId"

    .line 408
    .line 409
    invoke-virtual {v10, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    :cond_12
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 413
    .line 414
    .line 415
    move-result v4

    .line 416
    if-nez v4, :cond_13

    .line 417
    .line 418
    const-string v4, "paymentsPurchaseParams"

    .line 419
    .line 420
    invoke-virtual {v10, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    :cond_13
    if-eqz v12, :cond_14

    .line 424
    .line 425
    if-eqz v22, :cond_14

    .line 426
    .line 427
    const-string v4, "enablePendingPurchases"

    .line 428
    .line 429
    const/4 v5, 0x1

    .line 430
    invoke-virtual {v10, v4, v5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 431
    .line 432
    .line 433
    goto :goto_6

    .line 434
    :cond_14
    const/4 v5, 0x1

    .line 435
    :goto_6
    if-eqz v13, :cond_15

    .line 436
    .line 437
    if-eqz v23, :cond_15

    .line 438
    .line 439
    const-string v4, "enablePendingPurchaseForSubscriptions"

    .line 440
    .line 441
    invoke-virtual {v10, v4, v5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 442
    .line 443
    .line 444
    :cond_15
    if-eqz v15, :cond_16

    .line 445
    .line 446
    const-string v4, "enableAlternativeBilling"

    .line 447
    .line 448
    invoke-virtual {v10, v4, v5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 449
    .line 450
    .line 451
    :cond_16
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->i()Ljava/util/List;

    .line 452
    .line 453
    .line 454
    move-result-object v4

    .line 455
    invoke-interface {v4}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 456
    .line 457
    .line 458
    move-result-object v4

    .line 459
    new-instance v5, Ll/s9r0;

    .line 460
    .line 461
    invoke-direct {v5}, Ll/s9r0;-><init>()V

    .line 462
    .line 463
    .line 464
    invoke-interface {v4, v5}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 465
    .line 466
    .line 467
    move-result v4

    .line 468
    if-eqz v4, :cond_17

    .line 469
    .line 470
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/w;->y()Ll/adw0;

    .line 471
    .line 472
    .line 473
    move-result-object v4

    .line 474
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/c;->i()Ljava/util/List;

    .line 475
    .line 476
    .line 477
    move-result-object v5

    .line 478
    invoke-interface {v5}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 479
    .line 480
    .line 481
    move-result-object v5

    .line 482
    new-instance v6, Ll/i9s0;

    .line 483
    .line 484
    invoke-direct {v6}, Ll/i9s0;-><init>()V

    .line 485
    .line 486
    .line 487
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 488
    .line 489
    .line 490
    move-result-object v5

    .line 491
    new-instance v6, Ll/a6t0;

    .line 492
    .line 493
    invoke-direct {v6, v9}, Ll/a6t0;-><init>(Ljava/lang/String;)V

    .line 494
    .line 495
    .line 496
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 497
    .line 498
    .line 499
    move-result-object v5

    .line 500
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzco;->zzo()Ljava/util/stream/Collector;

    .line 501
    .line 502
    .line 503
    move-result-object v6

    .line 504
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    move-result-object v5

    .line 508
    check-cast v5, Ljava/lang/Iterable;

    .line 509
    .line 510
    invoke-virtual {v4, v5}, Ll/adw0;->o(Ljava/lang/Iterable;)Ll/adw0;

    .line 511
    .line 512
    .line 513
    invoke-virtual {v4}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 514
    .line 515
    .line 516
    move-result-object v4

    .line 517
    check-cast v4, Lcom/google/android/gms/internal/play_billing/w;

    .line 518
    .line 519
    invoke-virtual {v4}, Lcom/google/android/gms/internal/play_billing/y;->d()[B

    .line 520
    .line 521
    .line 522
    move-result-object v4

    .line 523
    const-string v5, "subscriptionProductReplacementParamsList"

    .line 524
    .line 525
    invoke-virtual {v10, v5, v4}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 526
    .line 527
    .line 528
    :cond_17
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 529
    .line 530
    .line 531
    move-result v4

    .line 532
    const-string v5, "additionalSkuTypes"

    .line 533
    .line 534
    const-string v6, "additionalSkus"

    .line 535
    .line 536
    const-string v9, "SKU_SERIALIZED_DOCID_LIST"

    .line 537
    .line 538
    const-string v12, "skuDetailsTokens"

    .line 539
    .line 540
    const-string v13, "SKU_OFFER_ID_TOKEN_LIST"

    .line 541
    .line 542
    if-nez v4, :cond_21

    .line 543
    .line 544
    new-instance v4, Ljava/util/ArrayList;

    .line 545
    .line 546
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 547
    .line 548
    .line 549
    new-instance v15, Ljava/util/ArrayList;

    .line 550
    .line 551
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 552
    .line 553
    .line 554
    move-object/from16 v23, v11

    .line 555
    .line 556
    new-instance v11, Ljava/util/ArrayList;

    .line 557
    .line 558
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 559
    .line 560
    .line 561
    move-object/from16 v24, v8

    .line 562
    .line 563
    new-instance v8, Ljava/util/ArrayList;

    .line 564
    .line 565
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 566
    .line 567
    .line 568
    new-instance v7, Ljava/util/ArrayList;

    .line 569
    .line 570
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 571
    .line 572
    .line 573
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 574
    .line 575
    .line 576
    move-result-object v25

    .line 577
    const/16 v26, 0x0

    .line 578
    .line 579
    const/16 v27, 0x0

    .line 580
    .line 581
    const/16 v28, 0x0

    .line 582
    .line 583
    const/16 v29, 0x0

    .line 584
    .line 585
    :goto_7
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    .line 586
    .line 587
    .line 588
    move-result v30

    .line 589
    if-eqz v30, :cond_1a

    .line 590
    .line 591
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v30

    .line 595
    check-cast v30, Lcom/android/billingclient/api/SkuDetails;

    .line 596
    .line 597
    invoke-virtual/range {v30 .. v30}, Lcom/android/billingclient/api/SkuDetails;->h()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v31

    .line 601
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->isEmpty()Z

    .line 602
    .line 603
    .line 604
    move-result v31

    .line 605
    if-nez v31, :cond_18

    .line 606
    .line 607
    move-object/from16 v31, v0

    .line 608
    .line 609
    invoke-virtual/range {v30 .. v30}, Lcom/android/billingclient/api/SkuDetails;->h()Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v0

    .line 613
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 614
    .line 615
    .line 616
    goto :goto_8

    .line 617
    :cond_18
    move-object/from16 v31, v0

    .line 618
    .line 619
    :goto_8
    invoke-virtual/range {v30 .. v30}, Lcom/android/billingclient/api/SkuDetails;->e()Ljava/lang/String;

    .line 620
    .line 621
    .line 622
    move-result-object v0

    .line 623
    move-object/from16 v32, v14

    .line 624
    .line 625
    invoke-virtual/range {v30 .. v30}, Lcom/android/billingclient/api/SkuDetails;->d()Ljava/lang/String;

    .line 626
    .line 627
    .line 628
    move-result-object v14

    .line 629
    invoke-virtual/range {v30 .. v30}, Lcom/android/billingclient/api/SkuDetails;->c()I

    .line 630
    .line 631
    .line 632
    move-result v33

    .line 633
    invoke-virtual/range {v30 .. v30}, Lcom/android/billingclient/api/SkuDetails;->g()Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object v1

    .line 637
    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 638
    .line 639
    .line 640
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 641
    .line 642
    .line 643
    move-result v0

    .line 644
    const/16 v18, 0x1

    .line 645
    .line 646
    xor-int/lit8 v0, v0, 0x1

    .line 647
    .line 648
    or-int v26, v26, v0

    .line 649
    .line 650
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 651
    .line 652
    .line 653
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 654
    .line 655
    .line 656
    move-result v0

    .line 657
    xor-int/lit8 v0, v0, 0x1

    .line 658
    .line 659
    or-int v27, v27, v0

    .line 660
    .line 661
    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 666
    .line 667
    .line 668
    if-eqz v33, :cond_19

    .line 669
    .line 670
    move/from16 v0, v18

    .line 671
    .line 672
    goto :goto_9

    .line 673
    :cond_19
    const/4 v0, 0x0

    .line 674
    :goto_9
    or-int v28, v28, v0

    .line 675
    .line 676
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 677
    .line 678
    .line 679
    move-result v0

    .line 680
    xor-int/lit8 v0, v0, 0x1

    .line 681
    .line 682
    or-int v29, v29, v0

    .line 683
    .line 684
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    move-object/from16 v1, p0

    .line 688
    .line 689
    move-object/from16 v0, v31

    .line 690
    .line 691
    move-object/from16 v14, v32

    .line 692
    .line 693
    goto :goto_7

    .line 694
    :cond_1a
    move-object/from16 v31, v0

    .line 695
    .line 696
    move-object/from16 v32, v14

    .line 697
    .line 698
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 699
    .line 700
    .line 701
    move-result v0

    .line 702
    if-nez v0, :cond_1b

    .line 703
    .line 704
    invoke-virtual {v10, v12, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 705
    .line 706
    .line 707
    :cond_1b
    if-eqz v26, :cond_1c

    .line 708
    .line 709
    invoke-virtual {v10, v13, v15}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 710
    .line 711
    .line 712
    :cond_1c
    if-eqz v27, :cond_1d

    .line 713
    .line 714
    const-string v0, "SKU_OFFER_ID_LIST"

    .line 715
    .line 716
    invoke-virtual {v10, v0, v11}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 717
    .line 718
    .line 719
    :cond_1d
    if-eqz v28, :cond_1e

    .line 720
    .line 721
    const-string v0, "SKU_OFFER_TYPE_LIST"

    .line 722
    .line 723
    invoke-virtual {v10, v0, v8}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 724
    .line 725
    .line 726
    :cond_1e
    if-eqz v29, :cond_1f

    .line 727
    .line 728
    invoke-virtual {v10, v9, v7}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 729
    .line 730
    .line 731
    :cond_1f
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 732
    .line 733
    .line 734
    move-result v0

    .line 735
    const/4 v1, 0x1

    .line 736
    if-le v0, v1, :cond_2a

    .line 737
    .line 738
    new-instance v0, Ljava/util/ArrayList;

    .line 739
    .line 740
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 741
    .line 742
    .line 743
    move-result v1

    .line 744
    add-int/lit8 v1, v1, -0x1

    .line 745
    .line 746
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 747
    .line 748
    .line 749
    new-instance v1, Ljava/util/ArrayList;

    .line 750
    .line 751
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 752
    .line 753
    .line 754
    move-result v4

    .line 755
    add-int/lit8 v4, v4, -0x1

    .line 756
    .line 757
    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 758
    .line 759
    .line 760
    const/4 v4, 0x1

    .line 761
    :goto_a
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 762
    .line 763
    .line 764
    move-result v7

    .line 765
    if-ge v4, v7, :cond_20

    .line 766
    .line 767
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 768
    .line 769
    .line 770
    move-result-object v7

    .line 771
    check-cast v7, Lcom/android/billingclient/api/SkuDetails;

    .line 772
    .line 773
    invoke-virtual {v7}, Lcom/android/billingclient/api/SkuDetails;->a()Ljava/lang/String;

    .line 774
    .line 775
    .line 776
    move-result-object v7

    .line 777
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 778
    .line 779
    .line 780
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 781
    .line 782
    .line 783
    move-result-object v7

    .line 784
    check-cast v7, Lcom/android/billingclient/api/SkuDetails;

    .line 785
    .line 786
    invoke-virtual {v7}, Lcom/android/billingclient/api/SkuDetails;->b()Ljava/lang/String;

    .line 787
    .line 788
    .line 789
    move-result-object v7

    .line 790
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 791
    .line 792
    .line 793
    add-int/lit8 v4, v4, 0x1

    .line 794
    .line 795
    goto :goto_a

    .line 796
    :cond_20
    invoke-virtual {v10, v6, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 797
    .line 798
    .line 799
    invoke-virtual {v10, v5, v1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 800
    .line 801
    .line 802
    goto/16 :goto_d

    .line 803
    .line 804
    :cond_21
    move-object/from16 v31, v0

    .line 805
    .line 806
    move-object/from16 v24, v8

    .line 807
    .line 808
    move-object/from16 v23, v11

    .line 809
    .line 810
    move-object/from16 v32, v14

    .line 811
    .line 812
    new-instance v0, Ljava/util/ArrayList;

    .line 813
    .line 814
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 815
    .line 816
    .line 817
    move-result v1

    .line 818
    add-int/lit8 v1, v1, -0x1

    .line 819
    .line 820
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 821
    .line 822
    .line 823
    new-instance v1, Ljava/util/ArrayList;

    .line 824
    .line 825
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 826
    .line 827
    .line 828
    move-result v2

    .line 829
    add-int/lit8 v2, v2, -0x1

    .line 830
    .line 831
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 832
    .line 833
    .line 834
    new-instance v2, Ljava/util/ArrayList;

    .line 835
    .line 836
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 837
    .line 838
    .line 839
    new-instance v4, Ljava/util/ArrayList;

    .line 840
    .line 841
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 842
    .line 843
    .line 844
    new-instance v7, Ljava/util/ArrayList;

    .line 845
    .line 846
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 847
    .line 848
    .line 849
    new-instance v8, Ljava/util/ArrayList;

    .line 850
    .line 851
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 852
    .line 853
    .line 854
    const/4 v11, 0x0

    .line 855
    :goto_b
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 856
    .line 857
    .line 858
    move-result v14

    .line 859
    if-ge v11, v14, :cond_27

    .line 860
    .line 861
    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 862
    .line 863
    .line 864
    move-result-object v14

    .line 865
    check-cast v14, Lcom/android/billingclient/api/c$b;

    .line 866
    .line 867
    invoke-virtual {v14}, Lcom/android/billingclient/api/c$b;->b()Lcom/android/billingclient/api/f;

    .line 868
    .line 869
    .line 870
    move-result-object v15

    .line 871
    invoke-virtual {v15}, Lcom/android/billingclient/api/f;->h()Ljava/lang/String;

    .line 872
    .line 873
    .line 874
    move-result-object v25

    .line 875
    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->isEmpty()Z

    .line 876
    .line 877
    .line 878
    move-result v25

    .line 879
    if-nez v25, :cond_22

    .line 880
    .line 881
    move-object/from16 v25, v14

    .line 882
    .line 883
    invoke-virtual {v15}, Lcom/android/billingclient/api/f;->h()Ljava/lang/String;

    .line 884
    .line 885
    .line 886
    move-result-object v14

    .line 887
    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 888
    .line 889
    .line 890
    goto :goto_c

    .line 891
    :cond_22
    move-object/from16 v25, v14

    .line 892
    .line 893
    :goto_c
    invoke-virtual/range {v25 .. v25}, Lcom/android/billingclient/api/c$b;->c()Ljava/lang/String;

    .line 894
    .line 895
    .line 896
    move-result-object v14

    .line 897
    invoke-virtual {v4, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 898
    .line 899
    .line 900
    invoke-virtual {v15}, Lcom/android/billingclient/api/f;->i()Ljava/lang/String;

    .line 901
    .line 902
    .line 903
    move-result-object v14

    .line 904
    invoke-virtual {v15}, Lcom/android/billingclient/api/f;->j()Ljava/util/List;

    .line 905
    .line 906
    .line 907
    move-result-object v25

    .line 908
    if-eqz v25, :cond_24

    .line 909
    .line 910
    invoke-virtual {v15}, Lcom/android/billingclient/api/f;->j()Ljava/util/List;

    .line 911
    .line 912
    .line 913
    move-result-object v25

    .line 914
    invoke-interface/range {v25 .. v25}, Ljava/util/List;->isEmpty()Z

    .line 915
    .line 916
    .line 917
    move-result v25

    .line 918
    if-nez v25, :cond_24

    .line 919
    .line 920
    invoke-virtual {v15}, Lcom/android/billingclient/api/f;->j()Ljava/util/List;

    .line 921
    .line 922
    .line 923
    move-result-object v15

    .line 924
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 925
    .line 926
    .line 927
    move-result-object v15

    .line 928
    :cond_23
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    .line 929
    .line 930
    .line 931
    move-result v25

    .line 932
    if-eqz v25, :cond_24

    .line 933
    .line 934
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 935
    .line 936
    .line 937
    move-result-object v25

    .line 938
    check-cast v25, Lcom/android/billingclient/api/f$b;

    .line 939
    .line 940
    invoke-virtual/range {v25 .. v25}, Lcom/android/billingclient/api/f$b;->f()Ljava/lang/String;

    .line 941
    .line 942
    .line 943
    move-result-object v26

    .line 944
    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 945
    .line 946
    .line 947
    move-result v26

    .line 948
    if-nez v26, :cond_23

    .line 949
    .line 950
    invoke-virtual/range {v25 .. v25}, Lcom/android/billingclient/api/f$b;->f()Ljava/lang/String;

    .line 951
    .line 952
    .line 953
    move-result-object v14

    .line 954
    :cond_24
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 955
    .line 956
    .line 957
    move-result v15

    .line 958
    if-nez v15, :cond_25

    .line 959
    .line 960
    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 961
    .line 962
    .line 963
    :cond_25
    if-lez v11, :cond_26

    .line 964
    .line 965
    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 966
    .line 967
    .line 968
    move-result-object v14

    .line 969
    check-cast v14, Lcom/android/billingclient/api/c$b;

    .line 970
    .line 971
    invoke-virtual {v14}, Lcom/android/billingclient/api/c$b;->b()Lcom/android/billingclient/api/f;

    .line 972
    .line 973
    .line 974
    move-result-object v14

    .line 975
    invoke-virtual {v14}, Lcom/android/billingclient/api/f;->c()Ljava/lang/String;

    .line 976
    .line 977
    .line 978
    move-result-object v14

    .line 979
    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 980
    .line 981
    .line 982
    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 983
    .line 984
    .line 985
    move-result-object v14

    .line 986
    check-cast v14, Lcom/android/billingclient/api/c$b;

    .line 987
    .line 988
    invoke-virtual {v14}, Lcom/android/billingclient/api/c$b;->b()Lcom/android/billingclient/api/f;

    .line 989
    .line 990
    .line 991
    move-result-object v14

    .line 992
    invoke-virtual {v14}, Lcom/android/billingclient/api/f;->d()Ljava/lang/String;

    .line 993
    .line 994
    .line 995
    move-result-object v14

    .line 996
    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 997
    .line 998
    .line 999
    :cond_26
    add-int/lit8 v11, v11, 0x1

    .line 1000
    .line 1001
    goto/16 :goto_b

    .line 1002
    .line 1003
    :cond_27
    invoke-virtual {v10, v13, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1004
    .line 1005
    .line 1006
    const-string v4, "AUTO_PAY_BALANCE_THRESHOLD_LIST"

    .line 1007
    .line 1008
    invoke-virtual {v10, v4, v8}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1009
    .line 1010
    .line 1011
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1012
    .line 1013
    .line 1014
    move-result v4

    .line 1015
    if-nez v4, :cond_28

    .line 1016
    .line 1017
    invoke-virtual {v10, v12, v2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1018
    .line 1019
    .line 1020
    :cond_28
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1021
    .line 1022
    .line 1023
    move-result v2

    .line 1024
    if-nez v2, :cond_29

    .line 1025
    .line 1026
    invoke-virtual {v10, v9, v7}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1027
    .line 1028
    .line 1029
    :cond_29
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1030
    .line 1031
    .line 1032
    move-result v2

    .line 1033
    if-nez v2, :cond_2a

    .line 1034
    .line 1035
    invoke-virtual {v10, v6, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1036
    .line 1037
    .line 1038
    invoke-virtual {v10, v5, v1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1039
    .line 1040
    .line 1041
    :cond_2a
    :goto_d
    invoke-virtual {v10, v13}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 1042
    .line 1043
    .line 1044
    move-result v0

    .line 1045
    move-object/from16 v1, p0

    .line 1046
    .line 1047
    if-eqz v0, :cond_2c

    .line 1048
    .line 1049
    iget-boolean v0, v1, Lcom/android/billingclient/api/b;->r:Z

    .line 1050
    .line 1051
    if-eqz v0, :cond_2b

    .line 1052
    .line 1053
    goto :goto_e

    .line 1054
    :cond_2b
    sget-object v0, Lcom/android/billingclient/api/h0;->u:Lcom/android/billingclient/api/d;

    .line 1055
    .line 1056
    const/16 v2, 0x15

    .line 1057
    .line 1058
    const/4 v3, 0x2

    .line 1059
    invoke-direct {v1, v2, v3, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 1060
    .line 1061
    .line 1062
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 1063
    .line 1064
    .line 1065
    return-object v0

    .line 1066
    :cond_2c
    :goto_e
    const-string v0, "skuPackageName"

    .line 1067
    .line 1068
    if-eqz v19, :cond_2d

    .line 1069
    .line 1070
    invoke-virtual/range {v19 .. v19}, Lcom/android/billingclient/api/SkuDetails;->f()Ljava/lang/String;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v2

    .line 1074
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1075
    .line 1076
    .line 1077
    move-result v2

    .line 1078
    if-nez v2, :cond_2d

    .line 1079
    .line 1080
    invoke-virtual/range {v19 .. v19}, Lcom/android/billingclient/api/SkuDetails;->f()Ljava/lang/String;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v2

    .line 1084
    invoke-virtual {v10, v0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1085
    .line 1086
    .line 1087
    :goto_f
    const/4 v5, 0x1

    .line 1088
    :goto_10
    const/4 v7, 0x0

    .line 1089
    goto :goto_11

    .line 1090
    :cond_2d
    if-eqz v20, :cond_2e

    .line 1091
    .line 1092
    invoke-virtual/range {v20 .. v20}, Lcom/android/billingclient/api/c$b;->b()Lcom/android/billingclient/api/f;

    .line 1093
    .line 1094
    .line 1095
    move-result-object v2

    .line 1096
    invoke-virtual {v2}, Lcom/android/billingclient/api/f;->g()Ljava/lang/String;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v2

    .line 1100
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1101
    .line 1102
    .line 1103
    move-result v2

    .line 1104
    if-nez v2, :cond_2e

    .line 1105
    .line 1106
    invoke-virtual/range {v20 .. v20}, Lcom/android/billingclient/api/c$b;->b()Lcom/android/billingclient/api/f;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v2

    .line 1110
    invoke-virtual {v2}, Lcom/android/billingclient/api/f;->g()Ljava/lang/String;

    .line 1111
    .line 1112
    .line 1113
    move-result-object v2

    .line 1114
    invoke-virtual {v10, v0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1115
    .line 1116
    .line 1117
    goto :goto_f

    .line 1118
    :cond_2e
    const/4 v5, 0x0

    .line 1119
    goto :goto_10

    .line 1120
    :goto_11
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1121
    .line 1122
    .line 1123
    move-result v0

    .line 1124
    if-nez v0, :cond_2f

    .line 1125
    .line 1126
    const-string v0, "accountName"

    .line 1127
    .line 1128
    invoke-virtual {v10, v0, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1129
    .line 1130
    .line 1131
    :cond_2f
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 1132
    .line 1133
    .line 1134
    move-result-object v0

    .line 1135
    if-nez v0, :cond_30

    .line 1136
    .line 1137
    const-string v0, "Activity\'s intent is null."

    .line 1138
    .line 1139
    move-object/from16 v8, v32

    .line 1140
    .line 1141
    invoke-static {v8, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 1142
    .line 1143
    .line 1144
    goto :goto_12

    .line 1145
    :cond_30
    move-object/from16 v8, v32

    .line 1146
    .line 1147
    const-string v2, "PROXY_PACKAGE"

    .line 1148
    .line 1149
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 1150
    .line 1151
    .line 1152
    move-result-object v4

    .line 1153
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1154
    .line 1155
    .line 1156
    move-result v4

    .line 1157
    if-nez v4, :cond_31

    .line 1158
    .line 1159
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 1160
    .line 1161
    .line 1162
    move-result-object v0

    .line 1163
    const-string v2, "proxyPackage"

    .line 1164
    .line 1165
    invoke-virtual {v10, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1166
    .line 1167
    .line 1168
    :try_start_0
    iget-object v2, v1, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 1169
    .line 1170
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v2

    .line 1174
    const/4 v4, 0x0

    .line 1175
    invoke-virtual {v2, v0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 1176
    .line 1177
    .line 1178
    move-result-object v0

    .line 1179
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1180
    .line 1181
    move-object/from16 v2, v31

    .line 1182
    .line 1183
    :try_start_1
    invoke-virtual {v10, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1184
    .line 1185
    .line 1186
    goto :goto_12

    .line 1187
    :catch_0
    move-object/from16 v2, v31

    .line 1188
    .line 1189
    :catch_1
    const-string v0, "package not found"

    .line 1190
    .line 1191
    invoke-virtual {v10, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1192
    .line 1193
    .line 1194
    :cond_31
    :goto_12
    iget-boolean v0, v1, Lcom/android/billingclient/api/b;->u:Z

    .line 1195
    .line 1196
    if-eqz v0, :cond_32

    .line 1197
    .line 1198
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 1199
    .line 1200
    .line 1201
    move-result v0

    .line 1202
    if-nez v0, :cond_32

    .line 1203
    .line 1204
    const/16 v13, 0x11

    .line 1205
    .line 1206
    :goto_13
    move v2, v13

    .line 1207
    goto :goto_14

    .line 1208
    :cond_32
    iget-boolean v0, v1, Lcom/android/billingclient/api/b;->s:Z

    .line 1209
    .line 1210
    if-eqz v0, :cond_33

    .line 1211
    .line 1212
    if-eqz v5, :cond_33

    .line 1213
    .line 1214
    const/16 v13, 0xf

    .line 1215
    .line 1216
    goto :goto_13

    .line 1217
    :cond_33
    iget-boolean v0, v1, Lcom/android/billingclient/api/b;->o:Z

    .line 1218
    .line 1219
    if-eqz v0, :cond_34

    .line 1220
    .line 1221
    const/16 v2, 0x9

    .line 1222
    .line 1223
    goto :goto_14

    .line 1224
    :cond_34
    const/4 v13, 0x6

    .line 1225
    goto :goto_13

    .line 1226
    :goto_14
    new-instance v0, Lcom/android/billingclient/api/n;

    .line 1227
    .line 1228
    move-object/from16 v5, p2

    .line 1229
    .line 1230
    move-object v6, v10

    .line 1231
    move-object/from16 v3, v21

    .line 1232
    .line 1233
    move-object/from16 v4, v23

    .line 1234
    .line 1235
    invoke-direct/range {v0 .. v6}, Lcom/android/billingclient/api/n;-><init>(Lcom/android/billingclient/api/b;ILjava/lang/String;Ljava/lang/String;Lcom/android/billingclient/api/c;Landroid/os/Bundle;)V

    .line 1236
    .line 1237
    .line 1238
    iget-object v15, v1, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    .line 1239
    .line 1240
    invoke-direct {v1}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 1241
    .line 1242
    .line 1243
    move-result-object v16

    .line 1244
    const-wide/16 v12, 0x1388

    .line 1245
    .line 1246
    const/4 v14, 0x0

    .line 1247
    move-object v11, v0

    .line 1248
    invoke-static/range {v11 .. v16}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 1249
    .line 1250
    .line 1251
    move-result-object v0

    .line 1252
    goto :goto_15

    .line 1253
    :cond_35
    move-object v3, v6

    .line 1254
    move-object/from16 v24, v8

    .line 1255
    .line 1256
    move-object v7, v10

    .line 1257
    move-object v4, v11

    .line 1258
    move-object v8, v14

    .line 1259
    new-instance v9, Lcom/android/billingclient/api/p0;

    .line 1260
    .line 1261
    invoke-direct {v9, v1, v3, v4}, Lcom/android/billingclient/api/p0;-><init>(Lcom/android/billingclient/api/b;Ljava/lang/String;Ljava/lang/String;)V

    .line 1262
    .line 1263
    .line 1264
    iget-object v13, v1, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    .line 1265
    .line 1266
    invoke-direct {v1}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 1267
    .line 1268
    .line 1269
    move-result-object v14

    .line 1270
    const-wide/16 v10, 0x1388

    .line 1271
    .line 1272
    const/4 v12, 0x0

    .line 1273
    invoke-static/range {v9 .. v14}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 1274
    .line 1275
    .line 1276
    move-result-object v0

    .line 1277
    :goto_15
    if-nez v0, :cond_36

    .line 1278
    .line 1279
    :try_start_2
    sget-object v0, Lcom/android/billingclient/api/h0;->d:Lcom/android/billingclient/api/d;

    .line 1280
    .line 1281
    const/16 v2, 0x19

    .line 1282
    .line 1283
    const/4 v3, 0x2

    .line 1284
    invoke-direct {v1, v2, v3, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 1285
    .line 1286
    .line 1287
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 1288
    .line 1289
    .line 1290
    return-object v0

    .line 1291
    :catch_2
    move-exception v0

    .line 1292
    goto/16 :goto_1c

    .line 1293
    .line 1294
    :catch_3
    move-exception v0

    .line 1295
    goto/16 :goto_1d

    .line 1296
    .line 1297
    :catch_4
    move-exception v0

    .line 1298
    goto/16 :goto_1d

    .line 1299
    .line 1300
    :cond_36
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 1301
    .line 1302
    const-wide/16 v3, 0x1388

    .line 1303
    .line 1304
    invoke-interface {v0, v3, v4, v2}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 1305
    .line 1306
    .line 1307
    move-result-object v0

    .line 1308
    move-object v2, v0

    .line 1309
    check-cast v2, Landroid/os/Bundle;

    .line 1310
    .line 1311
    invoke-static {v2, v8}, Lcom/google/android/gms/internal/play_billing/p;->b(Landroid/os/Bundle;Ljava/lang/String;)I

    .line 1312
    .line 1313
    .line 1314
    move-result v0

    .line 1315
    invoke-static {v2, v8}, Lcom/google/android/gms/internal/play_billing/p;->g(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 1316
    .line 1317
    .line 1318
    move-result-object v3

    .line 1319
    if-eqz v0, :cond_3c

    .line 1320
    .line 1321
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1322
    .line 1323
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1324
    .line 1325
    .line 1326
    const-string v5, "Unable to buy item, Error response code: "

    .line 1327
    .line 1328
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1329
    .line 1330
    .line 1331
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1332
    .line 1333
    .line 1334
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1335
    .line 1336
    .line 1337
    move-result-object v4

    .line 1338
    invoke-static {v8, v4}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 1339
    .line 1340
    .line 1341
    invoke-static {v0, v3}, Lcom/android/billingclient/api/h0;->a(ILjava/lang/String;)Lcom/android/billingclient/api/d;

    .line 1342
    .line 1343
    .line 1344
    move-result-object v3
    :try_end_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1345
    if-nez v2, :cond_37

    .line 1346
    .line 1347
    :goto_16
    const/4 v4, 0x1

    .line 1348
    const/4 v5, 0x1

    .line 1349
    goto :goto_18

    .line 1350
    :cond_37
    :try_start_3
    const-string v0, "LOG_REASON"

    .line 1351
    .line 1352
    invoke-virtual {v2, v0}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v0

    .line 1356
    if-nez v0, :cond_38

    .line 1357
    .line 1358
    goto :goto_16

    .line 1359
    :cond_38
    instance-of v4, v0, Ljava/lang/Integer;

    .line 1360
    .line 1361
    if-eqz v4, :cond_39

    .line 1362
    .line 1363
    check-cast v0, Ljava/lang/Integer;

    .line 1364
    .line 1365
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1366
    .line 1367
    .line 1368
    move-result v0

    .line 1369
    invoke-static {v0}, Ll/b5y0;->a(I)I

    .line 1370
    .line 1371
    .line 1372
    move-result v5

    .line 1373
    const/4 v4, 0x1

    .line 1374
    goto :goto_18

    .line 1375
    :catchall_0
    move-exception v0

    .line 1376
    goto :goto_17

    .line 1377
    :cond_39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1378
    .line 1379
    .line 1380
    move-result-object v0

    .line 1381
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 1382
    .line 1383
    .line 1384
    move-result-object v0

    .line 1385
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1386
    .line 1387
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1388
    .line 1389
    .line 1390
    const-string v5, "Unexpected type for bundle log reason: "

    .line 1391
    .line 1392
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1393
    .line 1394
    .line 1395
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1396
    .line 1397
    .line 1398
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v0

    .line 1402
    invoke-static {v8, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1403
    .line 1404
    .line 1405
    goto :goto_16

    .line 1406
    :goto_17
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1407
    .line 1408
    .line 1409
    move-result-object v0

    .line 1410
    const-string v4, "Failed to get log reason from bundle: "

    .line 1411
    .line 1412
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1413
    .line 1414
    .line 1415
    move-result-object v0

    .line 1416
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1417
    .line 1418
    .line 1419
    move-result-object v0

    .line 1420
    invoke-static {v8, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/util/concurrent/CancellationException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1421
    .line 1422
    .line 1423
    goto :goto_16

    .line 1424
    :goto_18
    if-ne v5, v4, :cond_3a

    .line 1425
    .line 1426
    const/16 v5, 0x17

    .line 1427
    .line 1428
    :cond_3a
    if-nez v2, :cond_3b

    .line 1429
    .line 1430
    :goto_19
    move-object v10, v7

    .line 1431
    :goto_1a
    const/4 v2, 0x2

    .line 1432
    goto :goto_1b

    .line 1433
    :cond_3b
    :try_start_5
    const-string v0, "ADDITIONAL_LOG_DETAILS"

    .line 1434
    .line 1435
    invoke-virtual {v2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 1436
    .line 1437
    .line 1438
    move-result-object v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1439
    goto :goto_1a

    .line 1440
    :catchall_1
    move-exception v0

    .line 1441
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1442
    .line 1443
    .line 1444
    move-result-object v0

    .line 1445
    const-string v2, "Failed to get additional log details from bundle: "

    .line 1446
    .line 1447
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1448
    .line 1449
    .line 1450
    move-result-object v0

    .line 1451
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1452
    .line 1453
    .line 1454
    move-result-object v0

    .line 1455
    invoke-static {v8, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 1456
    .line 1457
    .line 1458
    goto :goto_19

    .line 1459
    :goto_1b
    invoke-direct {v1, v5, v2, v3, v10}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 1460
    .line 1461
    .line 1462
    invoke-virtual {v1, v3}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 1463
    .line 1464
    .line 1465
    return-object v3

    .line 1466
    :cond_3c
    new-instance v0, Landroid/content/Intent;

    .line 1467
    .line 1468
    const-class v3, Lcom/android/billingclient/api/ProxyBillingActivity;

    .line 1469
    .line 1470
    move-object/from16 v7, p1

    .line 1471
    .line 1472
    invoke-direct {v0, v7, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1473
    .line 1474
    .line 1475
    move-object/from16 v3, v24

    .line 1476
    .line 1477
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 1478
    .line 1479
    .line 1480
    move-result-object v2

    .line 1481
    check-cast v2, Landroid/app/PendingIntent;

    .line 1482
    .line 1483
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1484
    .line 1485
    .line 1486
    invoke-virtual {v7, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_6
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/util/concurrent/CancellationException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 1487
    .line 1488
    .line 1489
    sget-object v0, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 1490
    .line 1491
    return-object v0

    .line 1492
    :goto_1c
    const-string v2, "Exception while launching billing flow. Try to reconnect"

    .line 1493
    .line 1494
    invoke-static {v8, v2, v0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1495
    .line 1496
    .line 1497
    sget-object v2, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 1498
    .line 1499
    invoke-static {v0}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 1500
    .line 1501
    .line 1502
    move-result-object v0

    .line 1503
    const/4 v3, 0x5

    .line 1504
    const/4 v4, 0x2

    .line 1505
    invoke-direct {v1, v3, v4, v2, v0}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 1506
    .line 1507
    .line 1508
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 1509
    .line 1510
    .line 1511
    return-object v2

    .line 1512
    :goto_1d
    const-string v2, "Time out while launching billing flow. Try to reconnect"

    .line 1513
    .line 1514
    invoke-static {v8, v2, v0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1515
    .line 1516
    .line 1517
    sget-object v2, Lcom/android/billingclient/api/h0;->n:Lcom/android/billingclient/api/d;

    .line 1518
    .line 1519
    invoke-static {v0}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 1520
    .line 1521
    .line 1522
    move-result-object v0

    .line 1523
    const/4 v3, 0x4

    .line 1524
    const/4 v4, 0x2

    .line 1525
    invoke-direct {v1, v3, v4, v2, v0}, Lcom/android/billingclient/api/b;->t0(IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 1526
    .line 1527
    .line 1528
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/b;->E0(Lcom/android/billingclient/api/d;)Lcom/android/billingclient/api/d;

    .line 1529
    .line 1530
    .line 1531
    return-object v2

    .line 1532
    :cond_3d
    move v4, v9

    .line 1533
    sget-object v0, Lcom/android/billingclient/api/h0;->F:Lcom/android/billingclient/api/d;

    .line 1534
    .line 1535
    const/16 v2, 0xc

    .line 1536
    .line 1537
    invoke-direct {v1, v2, v4, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 1538
    .line 1539
    .line 1540
    return-object v0
.end method

.method public final synthetic f0(Ll/y06;Ll/x06;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/billingclient/api/h0;->n:Lcom/android/billingclient/api/d;

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    invoke-direct {p0, v1, v2, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ll/x06;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, v0, p0}, Ll/y06;->f(Lcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic g0(Ll/am90;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/billingclient/api/h0;->n:Lcom/android/billingclient/api/d;

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    const/4 v2, 0x7

    .line 6
    invoke-direct {p0, v1, v2, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v0, p0}, Ll/am90;->a(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public h(Lcom/android/billingclient/api/g;Ll/am90;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x7

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object p1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p2, p1, p0}, Ll/am90;->a(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-boolean v0, p0, Lcom/android/billingclient/api/b;->u:Z

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const-string p1, "BillingClient"

    .line 28
    .line 29
    const-string v0, "Querying product details is not supported."

    .line 30
    .line 31
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object p1, Lcom/android/billingclient/api/h0;->v:Lcom/android/billingclient/api/d;

    .line 35
    .line 36
    const/16 v0, 0x14

    .line 37
    .line 38
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-interface {p2, p1, p0}, Ll/am90;->a(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    new-instance v2, Lcom/android/billingclient/api/k;

    .line 51
    .line 52
    invoke-direct {v2, p0, p1, p2}, Lcom/android/billingclient/api/k;-><init>(Lcom/android/billingclient/api/b;Lcom/android/billingclient/api/g;Ll/am90;)V

    .line 53
    .line 54
    .line 55
    new-instance v5, Lcom/android/billingclient/api/l;

    .line 56
    .line 57
    invoke-direct {v5, p0, p2}, Lcom/android/billingclient/api/l;-><init>(Lcom/android/billingclient/api/b;Ll/am90;)V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->o0()Landroid/os/Handler;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    const-wide/16 v3, 0x7530

    .line 69
    .line 70
    invoke-static/range {v2 .. v7}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->J()Lcom/android/billingclient/api/d;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const/16 v0, 0x19

    .line 81
    .line 82
    invoke-direct {p0, v0, v1, p1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 83
    .line 84
    .line 85
    new-instance p0, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-interface {p2, p1, p0}, Ll/am90;->a(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method

.method public final synthetic h0(Ll/ukb0;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/billingclient/api/h0;->n:Lcom/android/billingclient/api/d;

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    const/16 v2, 0x9

    .line 6
    .line 7
    invoke-direct {p0, v1, v2, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzco;->zzl()Lcom/google/android/gms/internal/play_billing/zzco;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p1, v0, p0}, Ll/ukb0;->b(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final i(Ll/zvb0;Ll/ukb0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/zvb0;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/b;->Q(Ljava/lang/String;Ll/ukb0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final j(Landroid/app/Activity;Ll/drm;Ll/erm;)Lcom/android/billingclient/api/d;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "BillingClient"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Service disconnected."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-boolean v0, p0, Lcom/android/billingclient/api/b;->q:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string p0, "Current client doesn\'t support showing in-app messages."

    .line 22
    .line 23
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/android/billingclient/api/h0;->w:Lcom/android/billingclient/api/d;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    const v0, 0x1020002

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 46
    .line 47
    .line 48
    new-instance v0, Landroid/os/Bundle;

    .line 49
    .line 50
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v3, "KEY_WINDOW_TOKEN"

    .line 54
    .line 55
    invoke-static {v0, v3, v1}, Ll/wi3;->b(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/IBinder;)V

    .line 56
    .line 57
    .line 58
    iget v1, v2, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    const-string v3, "KEY_DIMEN_LEFT"

    .line 61
    .line 62
    invoke-virtual {v0, v3, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    iget v1, v2, Landroid/graphics/Rect;->top:I

    .line 66
    .line 67
    const-string v3, "KEY_DIMEN_TOP"

    .line 68
    .line 69
    invoke-virtual {v0, v3, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    iget v1, v2, Landroid/graphics/Rect;->right:I

    .line 73
    .line 74
    const-string v3, "KEY_DIMEN_RIGHT"

    .line 75
    .line 76
    invoke-virtual {v0, v3, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    iget v1, v2, Landroid/graphics/Rect;->bottom:I

    .line 80
    .line 81
    const-string v2, "KEY_DIMEN_BOTTOM"

    .line 82
    .line 83
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 87
    .line 88
    const-string v2, "playBillingLibraryVersion"

    .line 89
    .line 90
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ll/drm;->b()Ljava/util/ArrayList;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    const-string v1, "KEY_CATEGORY_IDS"

    .line 98
    .line 99
    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    .line 103
    .line 104
    new-instance v1, Lcom/android/billingclient/api/zzav;

    .line 105
    .line 106
    invoke-direct {v1, p0, p2, p3}, Lcom/android/billingclient/api/zzav;-><init>(Lcom/android/billingclient/api/b;Landroid/os/Handler;Ll/erm;)V

    .line 107
    .line 108
    .line 109
    new-instance v2, Lcom/android/billingclient/api/m;

    .line 110
    .line 111
    invoke-direct {v2, p0, v0, p1, v1}, Lcom/android/billingclient/api/m;-><init>(Lcom/android/billingclient/api/b;Landroid/os/Bundle;Landroid/app/Activity;Landroid/os/ResultReceiver;)V

    .line 112
    .line 113
    .line 114
    iget-object v6, p0, Lcom/android/billingclient/api/b;->d:Landroid/os/Handler;

    .line 115
    .line 116
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->M()Ljava/util/concurrent/ExecutorService;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    const-wide/16 v3, 0x1388

    .line 121
    .line 122
    const/4 v5, 0x0

    .line 123
    invoke-static/range {v2 .. v7}, Lcom/android/billingclient/api/b;->n(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    .line 124
    .line 125
    .line 126
    sget-object p0, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 127
    .line 128
    return-object p0
.end method

.method public k(Ll/ay2;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Lcom/android/billingclient/api/b;->e()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->p0()Lcom/android/billingclient/api/d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    monitor-exit v0

    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto/16 :goto_4

    .line 19
    .line 20
    :cond_0
    iget v1, p0, Lcom/android/billingclient/api/b;->b:I

    .line 21
    .line 22
    const/4 v2, 0x6

    .line 23
    const/4 v3, 0x1

    .line 24
    if-ne v1, v3, :cond_1

    .line 25
    .line 26
    const-string v1, "BillingClient"

    .line 27
    .line 28
    const-string v3, "Client is already in the process of connecting to billing service."

    .line 29
    .line 30
    invoke-static {v1, v3}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object v1, Lcom/android/billingclient/api/h0;->e:Lcom/android/billingclient/api/d;

    .line 34
    .line 35
    const/16 v3, 0x25

    .line 36
    .line 37
    invoke-direct {p0, v3, v2, v1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 38
    .line 39
    .line 40
    monitor-exit v0

    .line 41
    :goto_0
    move-object p0, v1

    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_1
    iget v1, p0, Lcom/android/billingclient/api/b;->b:I

    .line 45
    .line 46
    const/4 v4, 0x3

    .line 47
    if-ne v1, v4, :cond_2

    .line 48
    .line 49
    const-string v1, "BillingClient"

    .line 50
    .line 51
    const-string v3, "Client was already closed and can\'t be reused. Please create another instance."

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget-object v1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 57
    .line 58
    const/16 v3, 0x26

    .line 59
    .line 60
    invoke-direct {p0, v3, v2, v1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 61
    .line 62
    .line 63
    monitor-exit v0

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    invoke-direct {p0, v3}, Lcom/android/billingclient/api/b;->R(I)V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->T()V

    .line 69
    .line 70
    .line 71
    const-string v1, "BillingClient"

    .line 72
    .line 73
    const-string v4, "Starting in-app billing setup."

    .line 74
    .line 75
    invoke-static {v1, v4}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v1, Lcom/android/billingclient/api/s;

    .line 79
    .line 80
    const/4 v4, 0x0

    .line 81
    invoke-direct {v1, p0, p1, v4}, Lcom/android/billingclient/api/s;-><init>(Lcom/android/billingclient/api/b;Ll/ay2;Ll/ens0;)V

    .line 82
    .line 83
    .line 84
    iput-object v1, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;

    .line 85
    .line 86
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    new-instance v0, Landroid/content/Intent;

    .line 88
    .line 89
    const-string v1, "com.android.vending.billing.InAppBillingService.BIND"

    .line 90
    .line 91
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const-string v1, "com.android.vending"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 100
    .line 101
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const/4 v5, 0x0

    .line 106
    invoke-virtual {v1, v0, v5}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const/16 v6, 0x29

    .line 111
    .line 112
    if-eqz v1, :cond_8

    .line 113
    .line 114
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result v7

    .line 118
    if-nez v7, :cond_8

    .line 119
    .line 120
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 125
    .line 126
    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 127
    .line 128
    const/16 v6, 0x28

    .line 129
    .line 130
    if-eqz v1, :cond_7

    .line 131
    .line 132
    iget-object v7, v1, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v1, v1, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    .line 135
    .line 136
    const-string v8, "com.android.vending"

    .line 137
    .line 138
    invoke-static {v7, v8}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v8

    .line 142
    if-eqz v8, :cond_6

    .line 143
    .line 144
    if-eqz v1, :cond_6

    .line 145
    .line 146
    new-instance v6, Landroid/content/ComponentName;

    .line 147
    .line 148
    invoke-direct {v6, v7, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    new-instance v1, Landroid/content/Intent;

    .line 152
    .line 153
    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v6}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/android/billingclient/api/b;->c:Ljava/lang/String;

    .line 160
    .line 161
    const-string v6, "playBillingLibraryVersion"

    .line 162
    .line 163
    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 167
    .line 168
    monitor-enter v0

    .line 169
    :try_start_1
    iget v6, p0, Lcom/android/billingclient/api/b;->b:I

    .line 170
    .line 171
    const/4 v7, 0x2

    .line 172
    if-ne v6, v7, :cond_3

    .line 173
    .line 174
    invoke-direct {p0}, Lcom/android/billingclient/api/b;->p0()Lcom/android/billingclient/api/d;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    monitor-exit v0

    .line 179
    goto :goto_3

    .line 180
    :catchall_1
    move-exception p0

    .line 181
    goto :goto_1

    .line 182
    :cond_3
    iget v6, p0, Lcom/android/billingclient/api/b;->b:I

    .line 183
    .line 184
    if-eq v6, v3, :cond_4

    .line 185
    .line 186
    const-string v1, "BillingClient"

    .line 187
    .line 188
    const-string v3, "Client state no longer CONNECTING, returning service disconnected."

    .line 189
    .line 190
    invoke-static {v1, v3}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    sget-object v1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 194
    .line 195
    const/16 v3, 0x75

    .line 196
    .line 197
    invoke-direct {p0, v3, v2, v1}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 198
    .line 199
    .line 200
    monitor-exit v0

    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_4
    iget-object v6, p0, Lcom/android/billingclient/api/b;->i:Lcom/android/billingclient/api/s;

    .line 204
    .line 205
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 206
    iget-object v0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 207
    .line 208
    invoke-virtual {v0, v1, v6, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-eqz v0, :cond_5

    .line 213
    .line 214
    const-string p0, "BillingClient"

    .line 215
    .line 216
    const-string v0, "Service was bonded successfully."

    .line 217
    .line 218
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    move-object p0, v4

    .line 222
    goto :goto_3

    .line 223
    :cond_5
    const-string v0, "BillingClient"

    .line 224
    .line 225
    const-string v1, "Connection to Billing service is blocked."

    .line 226
    .line 227
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    const/16 v6, 0x27

    .line 231
    .line 232
    goto :goto_2

    .line 233
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 234
    throw p0

    .line 235
    :cond_6
    const-string v0, "BillingClient"

    .line 236
    .line 237
    const-string v1, "The device doesn\'t have valid Play Store."

    .line 238
    .line 239
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    goto :goto_2

    .line 243
    :cond_7
    const-string v0, "BillingClient"

    .line 244
    .line 245
    const-string v1, "The device doesn\'t have valid Play Store."

    .line 246
    .line 247
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    :cond_8
    :goto_2
    invoke-direct {p0, v5}, Lcom/android/billingclient/api/b;->R(I)V

    .line 251
    .line 252
    .line 253
    const-string v0, "BillingClient"

    .line 254
    .line 255
    const-string v1, "Billing service unavailable on device."

    .line 256
    .line 257
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    sget-object v0, Lcom/android/billingclient/api/h0;->c:Lcom/android/billingclient/api/d;

    .line 261
    .line 262
    invoke-direct {p0, v6, v2, v0}, Lcom/android/billingclient/api/b;->s0(IILcom/android/billingclient/api/d;)V

    .line 263
    .line 264
    .line 265
    move-object p0, v0

    .line 266
    :goto_3
    if-eqz p0, :cond_9

    .line 267
    .line 268
    invoke-interface {p1, p0}, Ll/ay2;->a(Lcom/android/billingclient/api/d;)V

    .line 269
    .line 270
    .line 271
    :cond_9
    return-void

    .line 272
    :goto_4
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 273
    throw p0
.end method

.method public final synthetic w0(ILjava/lang/String;Ljava/lang/String;Lcom/android/billingclient/api/c;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 p4, 0x5

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v1
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    :try_start_1
    iget-object v2, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 6
    .line 7
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    :try_start_2
    sget-object p0, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 11
    .line 12
    const/16 p1, 0x77

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/play_billing/p;->m(Lcom/android/billingclient/api/d;I)Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    move-object p0, v0

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception v0

    .line 23
    move-object p0, v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const/4 v7, 0x0

    .line 32
    move v3, p1

    .line 33
    move-object v5, p2

    .line 34
    move-object v6, p3

    .line 35
    move-object v8, p5

    .line 36
    invoke-interface/range {v2 .. v8}, Ll/jsr0;->G5(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 37
    .line 38
    .line 39
    move-result-object p0
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 40
    return-object p0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 44
    :try_start_4
    throw p0
    :try_end_4
    .catch Landroid/os/DeadObjectException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 45
    :goto_0
    sget-object p1, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p1, p4, p0}, Lcom/google/android/gms/internal/play_billing/p;->n(Lcom/android/billingclient/api/d;ILjava/lang/String;)Landroid/os/Bundle;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :goto_1
    sget-object p1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p1, p4, p0}, Lcom/google/android/gms/internal/play_billing/p;->n(Lcom/android/billingclient/api/d;ILjava/lang/String;)Landroid/os/Bundle;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public final synthetic x0(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v1, 0x5

    .line 2
    :try_start_0
    iget-object v2, p0, Lcom/android/billingclient/api/b;->a:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    :try_start_1
    iget-object v3, p0, Lcom/android/billingclient/api/b;->h:Ll/jsr0;

    .line 6
    .line 7
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    if-nez v3, :cond_0

    .line 9
    .line 10
    :try_start_2
    sget-object p0, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 11
    .line 12
    const/16 p1, 0x77

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/play_billing/p;->m(Lcom/android/billingclient/api/d;I)Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    move-object p0, v0

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception v0

    .line 23
    move-object p0, v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/android/billingclient/api/b;->f:Landroid/content/Context;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    const/4 v8, 0x0

    .line 32
    const/4 v4, 0x3

    .line 33
    move-object v6, p1

    .line 34
    move-object v7, p2

    .line 35
    invoke-interface/range {v3 .. v8}, Ll/jsr0;->n3(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    move-result-object p0
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 39
    return-object p0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p0, v0

    .line 42
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    :try_start_4
    throw p0
    :try_end_4
    .catch Landroid/os/DeadObjectException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 44
    :goto_0
    sget-object p1, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p1, v1, p0}, Lcom/google/android/gms/internal/play_billing/p;->n(Lcom/android/billingclient/api/d;ILjava/lang/String;)Landroid/os/Bundle;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :goto_1
    sget-object p1, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p1, v1, p0}, Lcom/google/android/gms/internal/play_billing/p;->n(Lcom/android/billingclient/api/d;ILjava/lang/String;)Landroid/os/Bundle;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
