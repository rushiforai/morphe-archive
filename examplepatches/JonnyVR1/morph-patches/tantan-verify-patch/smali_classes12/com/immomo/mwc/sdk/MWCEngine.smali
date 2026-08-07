.class public Lcom/immomo/mwc/sdk/MWCEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/byl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mwc/sdk/MWCEngine$CodeType;
    }
.end annotation


# static fields
.field private static b:I

.field private static volatile c:Z

.field private static volatile d:Z

.field private static e:Landroid/content/Context;

.field private static volatile f:Ll/byl;

.field private static g:Ll/iml;

.field private static h:Ll/rde0;

.field private static i:Ll/b6g0;

.field private static j:Ll/yse0;

.field private static k:Ll/krq;

.field private static l:Ll/klw;

.field private static m:Ll/uzv;


# instance fields
.field private final a:Lcom/immomo/mwc/sdk/b;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/immomo/mwc/sdk/b;->k()Lcom/immomo/mwc/sdk/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/immomo/mwc/sdk/MWCEngine;->a:Lcom/immomo/mwc/sdk/b;

    .line 9
    .line 10
    return-void
.end method

.method public static A(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "MWCEngine"

    .line 2
    .line 3
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->I()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_3

    .line 9
    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_3

    .line 17
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    invoke-static {p1, p2, p3}, Lcom/immomo/mwc/sdk/WebResourcePool;->f(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    :try_start_0
    invoke-static {p0, p2}, Lcom/immomo/mwc/sdk/WebResourcePool;->d(Ljava/lang/String;Ljava/lang/String;)Lcom/immomo/mwc/sdk/WebResourcePool$b;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    if-eqz p3, :cond_2

    .line 30
    .line 31
    invoke-virtual {p3}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->h()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v5, 0x1

    .line 36
    if-ne v1, v5, :cond_1

    .line 37
    .line 38
    invoke-virtual {p3}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->g()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/lang/String;

    .line 43
    .line 44
    move-object v2, v1

    .line 45
    goto :goto_0

    .line 46
    :catch_0
    move-exception p3

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    :goto_0
    const-string v1, "[MK\u8bf7\u6c42\u547d\u4e2d\u5bb9\u5668\u7f13\u5b58]request:hit:cache: @url=%s, @status=%d, @ts=%d %s"

    .line 49
    .line 50
    invoke-virtual {p3}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->h()I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-static {}, Ll/hrw;->a()J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    const-string v6, "[STYLE:006929,d5f0db,aee3ba]"

    .line 67
    .line 68
    filled-new-array {p1, p3, v5, v6}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    invoke-static {v0, p0, v1, p3}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :goto_1
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 77
    .line 78
    .line 79
    :cond_2
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 80
    .line 81
    .line 82
    move-result-wide v5

    .line 83
    sub-long/2addr v5, v3

    .line 84
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    filled-new-array {p3, v2}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    const-string v1, "check webResource cache cast: %d, data: %s"

    .line 93
    .line 94
    invoke-static {v0, p0, v1, p3}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    if-nez v2, :cond_3

    .line 98
    .line 99
    invoke-static {p0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->H(Ljava/lang/String;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result p3

    .line 103
    if-eqz p3, :cond_3

    .line 104
    .line 105
    invoke-static {}, Ll/hrw;->a()J

    .line 106
    .line 107
    .line 108
    move-result-wide v3

    .line 109
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    const-string v1, "[STYLE:fc0006,feedec,fdcccd]"

    .line 114
    .line 115
    filled-new-array {p1, p2, p3, v1}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const-string p2, "[MK\u8bf7\u6c42\u6ca1\u6709\u547d\u4e2d\u5bb9\u5668\u7f13\u5b58]request:no:hit:cache: @url=%s, @key=%s, @ts=%d %s"

    .line 120
    .line 121
    invoke-static {v0, p0, p2, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    :goto_3
    return-object v2
.end method

.method public static B(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {p0}, Lcom/immomo/mwc/sdk/b;->t(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static C(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2}, Ll/uzv;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static varargs D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Ll/uzv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static E(Landroid/content/Context;Ll/xqw;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/xqw;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-boolean v0, Lcom/immomo/mwc/sdk/MWCEngine;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p0}, Ll/rqw;->d(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->F(Landroid/content/Context;Ll/xqw;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    sput-boolean p0, Lcom/immomo/mwc/sdk/MWCEngine;->d:Z

    .line 14
    .line 15
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->O()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private static F(Landroid/content/Context;Ll/xqw;)V
    .locals 1
    .param p1    # Ll/xqw;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->e:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/xqw;->a()Ll/iml;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->g:Ll/iml;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/xqw;->b()Ll/xim;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/xqw;->f()Ll/rde0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->h:Ll/rde0;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/xqw;->g()Ll/yse0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->j:Ll/yse0;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/xqw;->h()Ll/b6g0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->i:Ll/b6g0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/xqw;->c()Ll/krq;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->k:Ll/krq;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/xqw;->e()Ll/klw;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->l:Ll/klw;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/xqw;->d()Ll/uzv;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sput-object p0, Lcom/immomo/mwc/sdk/MWCEngine;->m:Ll/uzv;

    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    const-string p1, "MWCEngine config completed"

    .line 54
    .line 55
    const-string v0, "MWCEngine"

    .line 56
    .line 57
    invoke-static {v0, p0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private static G()V
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->q()Ll/byl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception v0

    .line 6
    const-string v1, "MWCEngine start failed @error=%s"

    .line 7
    .line 8
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v2, "MWCEngine"

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-static {v2, v3, v1, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static H(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/tqw;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/immomo/mwc/sdk/WebResourcePool;->c(Ljava/lang/String;Ljava/lang/String;)Z

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

.method public static I()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mwc/sdk/MWCEngine;->c:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    return v0
.end method

.method public static J()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mwc/sdk/MWCEngine;->c:Z

    .line 2
    .line 3
    return v0
.end method

.method public static K(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Ll/uzv;->g(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static declared-synchronized L()Ljava/lang/String;
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/mwc/sdk/MWCEngine;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget v1, Lcom/immomo/mwc/sdk/MWCEngine;->b:I

    .line 5
    .line 6
    add-int/lit8 v1, v1, 0x1

    .line 7
    .line 8
    sput v1, Lcom/immomo/mwc/sdk/MWCEngine;->b:I

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    monitor-exit v0

    .line 15
    return-object v1

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v1
.end method

.method private M(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->I()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "MWCEngine"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "MWCEngine disabled, ignore the MWCEngine post event"

    .line 11
    .line 12
    invoke-static {v2, v1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->u()Lcom/immomo/mwc/sdk/b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/b;->u()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string p0, "MWCRuntime isInterrupted, ignore the MWCEngine post event"

    .line 27
    .line 28
    invoke-static {v2, v1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->u()Lcom/immomo/mwc/sdk/b;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Lcom/immomo/mwc/sdk/b;->q()Landroid/os/HandlerThread;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->u()Lcom/immomo/mwc/sdk/b;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Lcom/immomo/mwc/sdk/b;->v(Ljava/lang/Runnable;)Z

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static N(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/mwc/sdk/MWCEngine;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method private static O()V
    .locals 2

    .line 1
    new-instance v0, Ll/vqw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vqw;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-static {v1, v0}, Lcom/immomo/mwc/sdk/utils/thread/b;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static P(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2}, Ll/uzv;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static varargs Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Ll/uzv;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->u()Lcom/immomo/mwc/sdk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/immomo/mwc/sdk/b;->H(Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->G()V

    return-void
.end method

.method public static synthetic g(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/c;Ll/ro5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->u()Lcom/immomo/mwc/sdk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mwc/sdk/b;->d(Lcom/immomo/mwc/sdk/c;Ll/ro5;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Ll/uzv;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2}, Ll/uzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static varargs k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Ll/uzv;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2}, Ll/uzv;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static varargs m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->t()Ll/uzv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Ll/uzv;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static n()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->e:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static o()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mwc/sdk/MWCEngine;->c:Z

    .line 2
    .line 3
    return v0
.end method

.method public static p()Ll/iml;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->g:Ll/iml;

    .line 2
    .line 3
    return-object v0
.end method

.method public static q()Ll/byl;
    .locals 7

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    sget-boolean v1, Lcom/immomo/mwc/sdk/MWCEngine;->d:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/yqw;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/yqw;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    sget-object v1, Lcom/immomo/mwc/sdk/MWCEngine;->f:Ll/byl;

    .line 14
    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    const-class v1, Lcom/immomo/mwc/sdk/MWCEngine;

    .line 18
    .line 19
    monitor-enter v1

    .line 20
    :try_start_0
    sget-object v2, Lcom/immomo/mwc/sdk/MWCEngine;->f:Ll/byl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 21
    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    :try_start_1
    new-instance v3, Lcom/immomo/mwc/sdk/MWCEngine;

    .line 26
    .line 27
    invoke-direct {v3}, Lcom/immomo/mwc/sdk/MWCEngine;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object v3, Lcom/immomo/mwc/sdk/MWCEngine;->f:Ll/byl;

    .line 31
    .line 32
    const-string v3, "MWCEngine"

    .line 33
    .line 34
    const-string v4, "MWCEngine has started"

    .line 35
    .line 36
    invoke-static {v3, v2, v4}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v3

    .line 41
    :try_start_2
    const-string v4, "MWCEngine"

    .line 42
    .line 43
    const-string v5, "MWCEngine start exception @instance=%s, @error=%s"

    .line 44
    .line 45
    new-instance v6, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->f:Ll/byl;

    .line 51
    .line 52
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    filled-new-array {v0, v3}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v4, v2, v5, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->f:Ll/byl;

    .line 67
    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    new-instance v0, Ll/yqw;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/yqw;-><init>()V

    .line 73
    .line 74
    .line 75
    sput-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->f:Ll/byl;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catchall_1
    move-exception v0

    .line 79
    goto :goto_1

    .line 80
    :cond_1
    :goto_0
    monitor-exit v1

    .line 81
    goto :goto_2

    .line 82
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 83
    throw v0

    .line 84
    :cond_2
    :goto_2
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->f:Ll/byl;

    .line 85
    .line 86
    return-object v0
.end method

.method public static r()Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Ll/sqw;->a:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/mwc/sdk/MWCEngine;->k:Ll/krq;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "MWCEngine"

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    :try_start_0
    invoke-interface {v1}, Ll/krq;->a()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    move-object v0, v1

    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v1

    .line 23
    const-string v4, "get:jsf:from:offline:package:exception @error=%s"

    .line 24
    .line 25
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v3, v2, v4, v1}, Lcom/immomo/mwc/sdk/MWCEngine;->Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    :goto_0
    const-string v1, "jsf:path @path=%s"

    .line 33
    .line 34
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-static {v3, v2, v1, v4}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method

.method public static s()Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->k:Ll/krq;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/krq;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "0.0.0.0"

    .line 17
    .line 18
    :goto_0
    const-string v1, "jsf:version @version=%s"

    .line 19
    .line 20
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "MWCEngine"

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-static {v3, v4, v1, v2}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method private static t()Ll/uzv;
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->m:Ll/uzv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-class v0, Lcom/immomo/mwc/sdk/MWCEngine;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    new-instance v1, Ll/aqd;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/aqd;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/immomo/mwc/sdk/MWCEngine;->m:Ll/uzv;

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw v1

    .line 20
    :cond_0
    :goto_0
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->m:Ll/uzv;

    .line 21
    .line 22
    return-object v0
.end method

.method private u()Lcom/immomo/mwc/sdk/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/MWCEngine;->a:Lcom/immomo/mwc/sdk/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static v()Ll/klw;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->l:Ll/klw;

    .line 2
    .line 3
    return-object v0
.end method

.method public static w()Ll/rde0;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->h:Ll/rde0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static x()Ll/yse0;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->j:Ll/yse0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static y()Ll/b6g0;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine;->i:Ll/b6g0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static z(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->B(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/immomo/mwc/sdk/c;->h()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "0.0.0.0"

    .line 13
    .line 14
    :goto_0
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->s()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "jsf:"

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ",sw:"

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->u()Lcom/immomo/mwc/sdk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mwc/sdk/b;->n(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V
    .locals 6
    .param p4    # Ll/z84;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/wqw;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/wqw;-><init>(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->M(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/MWCEngine;->u()Lcom/immomo/mwc/sdk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mwc/sdk/b;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Lcom/immomo/mwc/sdk/c;Ll/ro5;)Ll/byl;
    .locals 0
    .param p1    # Lcom/immomo/mwc/sdk/c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->h(Lcom/immomo/mwc/sdk/c;Ll/ro5;)Lcom/immomo/mwc/sdk/MWCEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Lcom/immomo/mwc/sdk/c;Ll/ro5;)Lcom/immomo/mwc/sdk/MWCEngine;
    .locals 1
    .param p1    # Lcom/immomo/mwc/sdk/c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/uqw;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/uqw;-><init>(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/c;Ll/ro5;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method
