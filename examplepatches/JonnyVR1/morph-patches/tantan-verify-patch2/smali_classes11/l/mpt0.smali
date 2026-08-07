.class public final Ll/mpt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/m4w0;


# instance fields
.field public final a:Ll/ont0;

.field public b:Landroid/content/Context;

.field public c:Ljava/lang/String;

.field public d:Lcom/google/android/gms/ads/internal/client/zzq;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/lpt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mpt0;->a:Ll/ont0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic a(Lcom/google/android/gms/ads/internal/client/zzq;)Ll/m4w0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mpt0;->d:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic zzb(Ljava/lang/String;)Ll/m4w0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mpt0;->c:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic zzc(Landroid/content/Context;)Ll/m4w0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mpt0;->b:Landroid/content/Context;

    .line 5
    .line 6
    return-object p0
.end method

.method public final zzd()Ll/n4w0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/mpt0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/mpt0;->c:Ljava/lang/String;

    .line 9
    .line 10
    const-class v1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/mpt0;->d:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 16
    .line 17
    const-class v1, Lcom/google/android/gms/ads/internal/client/zzq;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/opt0;

    .line 23
    .line 24
    iget-object v3, p0, Ll/mpt0;->a:Ll/ont0;

    .line 25
    .line 26
    iget-object v4, p0, Ll/mpt0;->b:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v5, p0, Ll/mpt0;->c:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v6, p0, Ll/mpt0;->d:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    invoke-direct/range {v2 .. v7}, Ll/opt0;-><init>(Ll/ont0;Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzq;Ll/npt0;)V

    .line 34
    .line 35
    .line 36
    return-object v2
.end method
