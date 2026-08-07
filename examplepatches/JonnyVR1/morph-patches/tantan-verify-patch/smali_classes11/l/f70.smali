.class public Ll/f70;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/f70$a;
    }
.end annotation


# instance fields
.field public final a:Ll/ioy0;

.field public final b:Landroid/content/Context;

.field public final c:Ll/lps0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/lps0;Ll/ioy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f70;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f70;->c:Ll/lps0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/f70;->a:Ll/ioy0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/s70;)V
    .locals 0
    .param p1    # Ll/s70;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresPermission;
        value = "android.permission.INTERNET"
    .end annotation

    .line 1
    iget-object p1, p1, Ll/s70;->a:Ll/xxu0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f70;->c(Ll/xxu0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b(Ll/xxu0;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/f70;->c:Ll/lps0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/f70;->a:Ll/ioy0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/f70;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v1, p0, p1}, Ll/ioy0;->a(Landroid/content/Context;Ll/xxu0;)Lcom/google/android/gms/ads/internal/client/zzl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p0}, Ll/lps0;->l3(Lcom/google/android/gms/ads/internal/client/zzl;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    const-string p1, "Failed to load ad."

    .line 17
    .line 18
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final c(Ll/xxu0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f70;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/wis0;->c:Ll/kis0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Ll/sgs0;->Ga:Ll/dgs0;

    .line 21
    .line 22
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object v0, Ll/kbt0;->b:Ljava/util/concurrent/ExecutorService;

    .line 40
    .line 41
    new-instance v1, Ll/u9r0;

    .line 42
    .line 43
    invoke-direct {v1, p0, p1}, Ll/u9r0;-><init>(Ll/f70;Ll/xxu0;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Ll/f70;->c:Ll/lps0;

    .line 51
    .line 52
    iget-object v1, p0, Ll/f70;->a:Ll/ioy0;

    .line 53
    .line 54
    iget-object p0, p0, Ll/f70;->b:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {v1, p0, p1}, Ll/ioy0;->a(Landroid/content/Context;Ll/xxu0;)Lcom/google/android/gms/ads/internal/client/zzl;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {v0, p0}, Ll/lps0;->l3(Lcom/google/android/gms/ads/internal/client/zzl;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :catch_0
    move-exception p0

    .line 65
    const-string p1, "Failed to load ad."

    .line 66
    .line 67
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
