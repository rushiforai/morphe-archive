.class public final Ll/elt0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/google/android/gms/internal/ads/zzcei;

.field public b:Landroid/content/Context;

.field public c:Ljava/lang/ref/WeakReference;


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

.method public static bridge synthetic a(Ll/elt0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elt0;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/elt0;)Lcom/google/android/gms/internal/ads/zzcei;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elt0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/elt0;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elt0;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final c(Landroid/content/Context;)Ll/elt0;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/elt0;->c:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_0
    iput-object p1, p0, Ll/elt0;->b:Landroid/content/Context;

    .line 19
    .line 20
    return-object p0
.end method

.method public final d(Lcom/google/android/gms/internal/ads/zzcei;)Ll/elt0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/elt0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 2
    .line 3
    return-object p0
.end method
