.class public final Ll/ntt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k7u0;


# instance fields
.field public final a:Ll/r8w0;


# direct methods
.method public constructor <init>(Ll/r8w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ntt0;->a:Ll/r8w0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final B(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ntt0;->a:Ll/r8w0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/r8w0;->l()V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    const-string p1, "Cannot invoke onDestroy for the mediation adapter."

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final K(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ntt0;->a:Ll/r8w0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/r8w0;->y()V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    const-string p1, "Cannot invoke onPause for the mediation adapter."

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final P(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ntt0;->a:Ll/r8w0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/r8w0;->z()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/ntt0;->a:Ll/r8w0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/r8w0;->x(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string p1, "Cannot invoke onResume for the mediation adapter."

    .line 16
    .line 17
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
