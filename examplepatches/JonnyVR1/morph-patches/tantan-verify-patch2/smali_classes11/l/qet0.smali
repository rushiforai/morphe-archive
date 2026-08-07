.class public final Ll/qet0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/bft0;

.field public final c:Landroid/view/ViewGroup;

.field public d:Lcom/google/android/gms/internal/ads/zzcfz;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Ll/wit0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    iput-object p1, p0, Ll/qet0;->a:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Ll/qet0;->c:Landroid/view/ViewGroup;

    .line 17
    .line 18
    iput-object p3, p0, Ll/qet0;->b:Ll/bft0;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-object p1, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/internal/ads/zzcfz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzcfz;->o()Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final c(IIII)V
    .locals 1

    .line 1
    const-string v0, "The underlay may only be modified from the UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/ads/zzcfz;->h(IIII)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final d(IIIIIZLl/aft0;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/qet0;->b:Ll/bft0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/bft0;->zzm()Ll/ihs0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/ihs0;->a()Ll/khs0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/qet0;->b:Ll/bft0;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/bft0;->zzk()Ll/hhs0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "vpr2"

    .line 23
    .line 24
    filled-new-array {v2}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v0, v1, v2}, Ll/chs0;->a(Ll/khs0;Ll/hhs0;[Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    iget-object v4, p0, Ll/qet0;->a:Landroid/content/Context;

    .line 32
    .line 33
    iget-object v5, p0, Ll/qet0;->b:Ll/bft0;

    .line 34
    .line 35
    new-instance v3, Lcom/google/android/gms/internal/ads/zzcfz;

    .line 36
    .line 37
    invoke-interface {v5}, Ll/bft0;->zzm()Ll/ihs0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/ihs0;->a()Ll/khs0;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    move v6, p5

    .line 46
    move/from16 v7, p6

    .line 47
    .line 48
    move-object/from16 v9, p7

    .line 49
    .line 50
    invoke-direct/range {v3 .. v9}, Lcom/google/android/gms/internal/ads/zzcfz;-><init>(Landroid/content/Context;Ll/bft0;IZLl/khs0;Ll/aft0;)V

    .line 51
    .line 52
    .line 53
    iput-object v3, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 54
    .line 55
    iget-object v0, p0, Ll/qet0;->c:Landroid/view/ViewGroup;

    .line 56
    .line 57
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 58
    .line 59
    const/4 v2, -0x1

    .line 60
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 61
    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v3, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 68
    .line 69
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/ads/zzcfz;->h(IIII)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/qet0;->b:Ll/bft0;

    .line 73
    .line 74
    invoke-interface {p0, v2}, Ll/bft0;->u(Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    const-string v0, "onDestroy must be called from the UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzcfz;->r()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/qet0;->c:Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget-object v1, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    const-string v0, "onPause must be called from the UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzcfz;->x()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final g(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qet0;->d:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/zzcfz;->e(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
