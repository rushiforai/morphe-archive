.class public final Ll/glt0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/internal/ads/zzcei;

.field public final b:Landroid/content/Context;

.field public final c:Ljava/lang/ref/WeakReference;


# direct methods
.method public synthetic constructor <init>(Ll/elt0;Ll/flt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/elt0;->b(Ll/elt0;)Lcom/google/android/gms/internal/ads/zzcei;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ll/glt0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 9
    .line 10
    invoke-static {p1}, Ll/elt0;->a(Ll/elt0;)Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/glt0;->b:Landroid/content/Context;

    .line 15
    .line 16
    invoke-static {p1}, Ll/elt0;->e(Ll/elt0;)Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/glt0;->c:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/glt0;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/v2s0;
    .locals 3

    .line 1
    new-instance v0, Ll/v2s0;

    .line 2
    .line 3
    new-instance v1, Ll/otx0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/glt0;->b:Landroid/content/Context;

    .line 6
    .line 7
    iget-object p0, p0, Ll/glt0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 8
    .line 9
    invoke-direct {v1, v2, p0}, Ll/otx0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/v2s0;-><init>(Ll/r2s0;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final c()Ll/bks0;
    .locals 1

    .line 1
    new-instance v0, Ll/bks0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/glt0;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/bks0;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final d()Lcom/google/android/gms/internal/ads/zzcei;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/glt0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/glt0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 6
    .line 7
    iget-object p0, p0, Ll/glt0;->b:Landroid/content/Context;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/google/android/gms/ads/internal/util/b;->E(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final f()Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/glt0;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    return-object p0
.end method
