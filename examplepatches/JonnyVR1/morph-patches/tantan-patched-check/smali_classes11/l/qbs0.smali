.class public final Ll/qbs0;
.super Ll/yft0;
.source "SourceFile"


# instance fields
.field public final a:Ll/gcj;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcj;)V
    .locals 0
    .param p1    # Ll/gcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/yft0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qbs0;->a:Ll/gcj;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final i0(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qbs0;->a:Ll/gcj;

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

.method public final zzb()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qbs0;->a:Ll/gcj;

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

.method public final zzc()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qbs0;->a:Ll/gcj;

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

.method public final zze()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qbs0;->a:Ll/gcj;

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

.method public final zzf()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qbs0;->a:Ll/gcj;

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
