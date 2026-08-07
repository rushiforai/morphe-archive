.class public Ll/xvb0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/wgv0;


# direct methods
.method public constructor <init>(Ll/wgv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xvb0;->a:Ll/wgv0;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/s70;Ll/yvb0;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/google/android/gms/ads/AdFormat;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/s70;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/yvb0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0, p3}, Ll/xvb0;->c(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/s70;Ljava/lang/String;Ll/yvb0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static c(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/s70;Ljava/lang/String;Ll/yvb0;)V
    .locals 7
    .param p2    # Ll/s70;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/wis0;->k:Ll/kis0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Ll/sgs0;->Ga:Ll/dgs0;

    .line 19
    .line 20
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    :cond_0
    move-object v2, p0

    .line 37
    move-object v3, p1

    .line 38
    move-object v4, p2

    .line 39
    move-object v5, p3

    .line 40
    move-object v6, p4

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    sget-object v0, Ll/kbt0;->b:Ljava/util/concurrent/ExecutorService;

    .line 43
    .line 44
    new-instance v1, Ll/b9r0;

    .line 45
    .line 46
    move-object v2, p0

    .line 47
    move-object v3, p1

    .line 48
    move-object v4, p2

    .line 49
    move-object v5, p3

    .line 50
    move-object v6, p4

    .line 51
    invoke-direct/range {v1 .. v6}, Ll/b9r0;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/s70;Ljava/lang/String;Ll/yvb0;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :goto_0
    new-instance p0, Ll/r2t0;

    .line 59
    .line 60
    if-nez v4, :cond_2

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    invoke-virtual {v4}, Ll/s70;->a()Ll/xxu0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    :goto_1
    invoke-direct {p0, v2, v3, p1, v5}, Ll/r2t0;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdFormat;Ll/xxu0;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v6}, Ll/r2t0;->b(Ll/yvb0;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xvb0;->a:Ll/wgv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wgv0;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
