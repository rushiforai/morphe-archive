.class public Ll/n70;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/n70;


# instance fields
.field public a:Lcom/google/android/ump/ConsentInformation;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/n70;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/n70;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ll/m70;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/m70;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/google/android/gms/ads/MobileAds;->a(Landroid/content/Context;Ll/nm50;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    sget-object p1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p5:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 12
    .line 13
    const/16 v0, 0x32

    .line 14
    .line 15
    const-string v1, "intl_admob_init"

    .line 16
    .line 17
    invoke-static {p0, v1, p1, v0}, Lcom/tantanapp/common/utils/CrashHelper;->f(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic c(Ll/n70;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/m1j;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/n70;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/m1j;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Runnable;Ll/ium;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic e(Ll/m1j;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static g()Ll/n70;
    .locals 1

    .line 1
    sget-object v0, Ll/n70;->b:Ll/n70;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/n70;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/n70;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/n70;->b:Ll/n70;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/n70;->b:Ll/n70;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n70;->a:Lcom/google/android/ump/ConsentInformation;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/google/android/ump/ConsentInformation;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/sfk0;->a(Landroid/content/Context;)Lcom/google/android/ump/ConsentInformation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/n70;->a:Lcom/google/android/ump/ConsentInformation;

    .line 6
    .line 7
    new-instance v0, Ll/wx5$a;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/wx5$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/wx5$a;->a()Ll/wx5;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/n70;->a:Lcom/google/android/ump/ConsentInformation;

    .line 17
    .line 18
    new-instance v2, Ll/i70;

    .line 19
    .line 20
    invoke-direct {v2, p0, p1, p2}, Ll/i70;-><init>(Ll/n70;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    new-instance v3, Ll/j70;

    .line 24
    .line 25
    invoke-direct {v3}, Ll/j70;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v1, p1, v0, v2, v3}, Lcom/google/android/ump/ConsentInformation;->a(Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/n70;->a:Lcom/google/android/ump/ConsentInformation;

    .line 32
    .line 33
    invoke-interface {v0}, Lcom/google/android/ump/ConsentInformation;->b()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Ll/n70;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/m1j;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/n70;->a:Lcom/google/android/ump/ConsentInformation;

    .line 2
    .line 3
    invoke-interface {p3}, Lcom/google/android/ump/ConsentInformation;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/n70;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    new-instance v0, Ll/k70;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/k70;-><init>(Ll/n70;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/sfk0;->b(Landroid/app/Activity;Ll/vx5$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final k(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    new-instance p0, Ll/l70;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/l70;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
