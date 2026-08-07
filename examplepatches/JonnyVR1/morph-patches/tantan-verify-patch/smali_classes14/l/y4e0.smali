.class public Ll/y4e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->O5:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Ll/y4e0;Ll/abe0;Ljava/lang/Long;Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/y4e0;->i(Ll/abe0;Ljava/lang/Long;Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)V

    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/y4e0;->g(Ll/abe0;)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/core/R$string;->O5:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->G4()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/w4e0;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1, p2}, Ll/w4e0;-><init>(Ll/y4e0;Ll/abe0;Ljava/lang/Long;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ll/x4e0;

    .line 59
    .line 60
    invoke-direct {p0}, Ll/x4e0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1, p2}, Ll/y4e0;->h(Landroid/content/Context;Ljava/lang/Long;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final g(Ll/abe0;)Ljava/lang/Long;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p1}, Ll/abe0;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "endTime"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :catch_0
    :cond_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final h(Landroid/content/Context;Ljava/lang/Long;)V
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->startTime:J

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-gez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q4()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const-string p0, "freeTrialPromotion"

    .line 30
    .line 31
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p1, p0}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->O5:I

    .line 44
    .line 45
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic i(Ll/abe0;Ljava/lang/Long;Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)V
    .locals 0

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1, p2}, Ll/y4e0;->h(Landroid/content/Context;Ljava/lang/Long;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->O5:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
