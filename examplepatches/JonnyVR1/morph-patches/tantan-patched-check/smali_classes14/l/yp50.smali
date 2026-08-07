.class public Ll/yp50;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static b:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "unionid"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/x1d0;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/api/api/Network;->basic(Ll/x1d0$a;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :try_start_0
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/api/api/Network;->maybeUpdateRequestBeforeCall(Ll/x1d0;)Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public static c()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Ll/yp50$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/yp50$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/zp50;->b(Landroid/content/Context;Ll/cpl;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "unionid"

    .line 12
    .line 13
    invoke-static {}, Ll/zp50;->e()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/vp50;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/vp50;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/zp50;->h(Ll/r1m;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/wp50;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/wp50;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/zp50;->i(Ll/w4m;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/zwk;->e()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ll/zp50;->j(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/zp50;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static e()J
    .locals 2

    .line 1
    sget-wide v0, Ll/yp50;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static f()V
    .locals 2

    .line 1
    sget-boolean v0, Ll/yp50;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    sput-wide v0, Ll/yp50;->b:J

    .line 11
    .line 12
    invoke-static {}, Ll/zp50;->g()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    sput-boolean v0, Ll/yp50;->a:Z

    .line 17
    .line 18
    return-void
.end method
