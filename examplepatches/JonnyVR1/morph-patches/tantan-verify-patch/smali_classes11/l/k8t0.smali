.class public final Ll/k8t0;
.super Ll/n7t0;
.source "SourceFile"


# instance fields
.field public a:Ll/gcj;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/bp50;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n7t0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a6(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8t0;->a:Ll/gcj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/client/zze;->F()Ll/b70;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/gcj;->c(Ll/b70;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final o8(Ll/gcj;)V
    .locals 0
    .param p1    # Ll/gcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/k8t0;->a:Ll/gcj;

    .line 2
    .line 3
    return-void
.end method

.method public final p8(Ll/bp50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k8t0;->b:Ll/bp50;

    .line 2
    .line 3
    return-void
.end method

.method public final u6(Ll/i7t0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/k8t0;->b:Ll/bp50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/v7t0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/v7t0;-><init>(Ll/i7t0;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Ll/bp50;->a(Ll/t8d0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final zze()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8t0;->a:Ll/gcj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gcj;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zzf()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8t0;->a:Ll/gcj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gcj;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zzg()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8t0;->a:Ll/gcj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gcj;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zzh(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzj()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8t0;->a:Ll/gcj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gcj;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
