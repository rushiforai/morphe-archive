.class public Lcom/google/android/gms/ads/internal/overlay/b;
.super Ll/q1t0;
.source "SourceFile"

# interfaces
.implements Ll/igr0;


# static fields
.field public static final w:I
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field public final a:Landroid/app/Activity;

.field public b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public c:Ll/wit0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public d:Lcom/google/android/gms/ads/internal/overlay/a;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public e:Lcom/google/android/gms/ads/internal/overlay/zzs;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public f:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public g:Landroid/widget/FrameLayout;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public h:Landroid/webkit/WebChromeClient$CustomViewCallback;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public i:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public j:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public k:Lcom/google/android/gms/ads/internal/overlay/zzh;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public l:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final m:Ljava/lang/Object;

.field public final n:Landroid/view/View$OnClickListener;

.field public o:Ljava/lang/Runnable;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Landroid/widget/Toolbar;

.field public v:I
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    sput v0, Lcom/google/android/gms/ads/internal/overlay/b;->w:I

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/q1t0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->f:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->i:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->j:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->l:Z

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 15
    .line 16
    new-instance v2, Ljava/lang/Object;

    .line 17
    .line 18
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->m:Ljava/lang/Object;

    .line 22
    .line 23
    new-instance v2, Ll/oyv0;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/oyv0;-><init>(Lcom/google/android/gms/ads/internal/overlay/b;)V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->n:Landroid/view/View$OnClickListener;

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->r:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->s:Z

    .line 33
    .line 34
    iput-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->t:Z

    .line 35
    .line 36
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 37
    .line 38
    return-void
.end method

.method public static final v8(Ll/hfw0;Landroid/view/View;)V
    .locals 1
    .param p0    # Ll/hfw0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/bxy0;->a()Ll/kcv0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p0, p1}, Ll/kcv0;->e(Ll/hfw0;Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public final C(Ll/p1m;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/content/res/Configuration;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/internal/overlay/b;->u8(Landroid/content/res/Configuration;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final G()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->e:Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/b;->d6(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final M()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->m:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->p:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->o:Ljava/lang/Runnable;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v2, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->o:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-virtual {v2, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method

.method public final T6(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final a()V
    .locals 0

    .line 1
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzc:Ll/joy0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/joy0;->m4()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final d6(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzw:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/sgs0;->N4:Ll/dgs0;

    .line 9
    .line 10
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget-object v1, Ll/sgs0;->a1:Ll/dgs0;

    .line 25
    .line 26
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v2, 0x0

    .line 41
    const/4 v3, 0x1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    :cond_1
    move v1, v3

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_0
    new-instance v4, Ll/xsy0;

    .line 50
    .line 51
    invoke-direct {v4}, Ll/xsy0;-><init>()V

    .line 52
    .line 53
    .line 54
    const/16 v5, 0x32

    .line 55
    .line 56
    iput v5, v4, Ll/xsy0;->d:I

    .line 57
    .line 58
    if-eq v3, v1, :cond_3

    .line 59
    .line 60
    move v5, v2

    .line 61
    goto :goto_1

    .line 62
    :cond_3
    move v5, v0

    .line 63
    :goto_1
    iput v5, v4, Ll/xsy0;->a:I

    .line 64
    .line 65
    if-eq v3, v1, :cond_4

    .line 66
    .line 67
    move v2, v0

    .line 68
    :cond_4
    iput v2, v4, Ll/xsy0;->b:I

    .line 69
    .line 70
    iput v0, v4, Ll/xsy0;->c:I

    .line 71
    .line 72
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 73
    .line 74
    new-instance v2, Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 75
    .line 76
    invoke-direct {v2, v0, v4, p0}, Lcom/google/android/gms/ads/internal/overlay/zzs;-><init>(Landroid/content/Context;Ll/xsy0;Ll/igr0;)V

    .line 77
    .line 78
    .line 79
    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->e:Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 80
    .line 81
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 82
    .line 83
    const/4 v2, -0x2

    .line 84
    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 85
    .line 86
    .line 87
    const/16 v2, 0xa

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 90
    .line 91
    .line 92
    if-eq v3, v1, :cond_5

    .line 93
    .line 94
    const/16 v1, 0x9

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_5
    const/16 v1, 0xb

    .line 98
    .line 99
    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 103
    .line 104
    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzg:Z

    .line 105
    .line 106
    invoke-virtual {p0, p1, v1}, Lcom/google/android/gms/ads/internal/overlay/b;->x8(ZZ)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->e:Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 112
    .line 113
    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->q:Z

    return-void
.end method

.method public final g1(I[Ljava/lang/String;[I)V
    .locals 2

    .line 1
    const/16 v0, 0x3039

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 6
    .line 7
    invoke-static {}, Ll/sbv0;->e()Ll/rbv0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/rbv0;->a(Landroid/app/Activity;)Ll/rbv0;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 15
    .line 16
    iget p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 17
    .line 18
    const/4 v1, 0x5

    .line 19
    if-ne p1, v1, :cond_0

    .line 20
    .line 21
    move-object p1, p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    invoke-virtual {v0, p1}, Ll/rbv0;->b(Lcom/google/android/gms/ads/internal/overlay/b;)Ll/rbv0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ll/rbv0;->e()Ll/sbv0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzv:Ll/k1t0;

    .line 34
    .line 35
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p0, p2, p3, p1}, Ll/k1t0;->O0([Ljava/lang/String;[ILl/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :catch_0
    :cond_1
    return-void
.end method

.method public final o()Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sget-object v0, Ll/sgs0;->N8:Ll/dgs0;

    .line 10
    .line 11
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 28
    .line 29
    invoke-interface {v0}, Ll/wit0;->canGoBack()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/wit0;->goBack()V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 44
    .line 45
    invoke-interface {v0}, Ll/wit0;->Y()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 52
    .line 53
    const-string v1, "onbackblocked"

    .line 54
    .line 55
    sget-object v2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 56
    .line 57
    invoke-interface {p0, v1, v2}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 58
    .line 59
    .line 60
    :cond_3
    return v0
.end method

.method public final p8(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 8
    .line 9
    sget-object v1, Ll/sgs0;->Y5:Ll/dgs0;

    .line 10
    .line 11
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-lt v0, v1, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 34
    .line 35
    sget-object v1, Ll/sgs0;->Z5:Ll/dgs0;

    .line 36
    .line 37
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-gt v0, v1, :cond_1

    .line 52
    .line 53
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 54
    .line 55
    sget-object v1, Ll/sgs0;->a6:Ll/dgs0;

    .line 56
    .line 57
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-lt v0, v1, :cond_1

    .line 72
    .line 73
    sget-object v1, Ll/sgs0;->b6:Ll/dgs0;

    .line 74
    .line 75
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Ljava/lang/Integer;

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-le v0, v1, :cond_0

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    return-void

    .line 93
    :cond_1
    :goto_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :catchall_0
    move-exception p0

    .line 100
    const-string p1, "AdOverlay.setRequestedOrientation"

    .line 101
    .line 102
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0, p0, p1}, Ll/ebt0;->v(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final q8(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/high16 p1, -0x1000000

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final r8(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->g:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/high16 v1, -0x1000000

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->g:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    invoke-virtual {v0, p1, v1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->g:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->q:Z

    .line 30
    .line 31
    iput-object p2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->h:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 32
    .line 33
    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->f:Z

    .line 34
    .line 35
    return-void
.end method

.method public final s8(Z)V
    .locals 31
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/ads/internal/overlay/zzg;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->q:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/app/Activity;->requestWindowFeature(I)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_19

    .line 20
    .line 21
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-interface {v3}, Ll/wit0;->zzN()Ll/nkt0;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move-object v3, v4

    .line 34
    :goto_0
    const/4 v5, 0x0

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    invoke-interface {v3}, Ll/nkt0;->zzL()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    move v10, v2

    .line 44
    goto :goto_1

    .line 45
    :cond_2
    move v10, v5

    .line 46
    :goto_1
    iput-boolean v5, v0, Lcom/google/android/gms/ads/internal/overlay/b;->l:Z

    .line 47
    .line 48
    if-eqz v10, :cond_6

    .line 49
    .line 50
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 51
    .line 52
    iget v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzj:I

    .line 53
    .line 54
    const/4 v6, 0x6

    .line 55
    if-ne v3, v6, :cond_4

    .line 56
    .line 57
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 58
    .line 59
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    .line 68
    .line 69
    if-ne v3, v2, :cond_3

    .line 70
    .line 71
    move v3, v2

    .line 72
    goto :goto_2

    .line 73
    :cond_3
    move v3, v5

    .line 74
    :goto_2
    iput-boolean v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->l:Z

    .line 75
    .line 76
    goto :goto_4

    .line 77
    :cond_4
    const/4 v6, 0x7

    .line 78
    if-ne v3, v6, :cond_6

    .line 79
    .line 80
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 81
    .line 82
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    .line 91
    .line 92
    const/4 v6, 0x2

    .line 93
    if-ne v3, v6, :cond_5

    .line 94
    .line 95
    move v3, v2

    .line 96
    goto :goto_3

    .line 97
    :cond_5
    move v3, v5

    .line 98
    :goto_3
    iput-boolean v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->l:Z

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_6
    move v3, v5

    .line 102
    :goto_4
    new-instance v6, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    const-string v7, "Delay onShow to next orientation change: "

    .line 105
    .line 106
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-static {v3}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 120
    .line 121
    iget v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzj:I

    .line 122
    .line 123
    invoke-virtual {v0, v3}, Lcom/google/android/gms/ads/internal/overlay/b;->p8(I)V

    .line 124
    .line 125
    .line 126
    const/high16 v3, 0x1000000

    .line 127
    .line 128
    invoke-virtual {v1, v3, v3}, Landroid/view/Window;->setFlags(II)V

    .line 129
    .line 130
    .line 131
    const-string v1, "Hardware acceleration on the AdActivity window enabled."

    .line 132
    .line 133
    invoke-static {v1}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-boolean v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->j:Z

    .line 137
    .line 138
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 139
    .line 140
    if-nez v1, :cond_7

    .line 141
    .line 142
    const/high16 v1, -0x1000000

    .line 143
    .line 144
    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 145
    .line 146
    .line 147
    goto :goto_5

    .line 148
    :cond_7
    sget v1, Lcom/google/android/gms/ads/internal/overlay/b;->w:I

    .line 149
    .line 150
    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 151
    .line 152
    .line 153
    :goto_5
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 154
    .line 155
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 156
    .line 157
    invoke-virtual {v1, v3}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    iput-boolean v2, v0, Lcom/google/android/gms/ads/internal/overlay/b;->q:Z

    .line 161
    .line 162
    if-eqz p1, :cond_e

    .line 163
    .line 164
    :try_start_0
    invoke-static {}, Ll/bxy0;->B()Ll/jjt0;

    .line 165
    .line 166
    .line 167
    iget-object v6, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 168
    .line 169
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 170
    .line 171
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 172
    .line 173
    if-eqz v1, :cond_8

    .line 174
    .line 175
    invoke-interface {v1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    move-object v7, v1

    .line 180
    goto :goto_6

    .line 181
    :cond_8
    move-object v7, v4

    .line 182
    :goto_6
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 183
    .line 184
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 185
    .line 186
    if-eqz v1, :cond_9

    .line 187
    .line 188
    invoke-interface {v1}, Ll/wit0;->e()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    move-object v8, v1

    .line 193
    goto :goto_7

    .line 194
    :cond_9
    move-object v8, v4

    .line 195
    :goto_7
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 196
    .line 197
    iget-object v13, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzm:Lcom/google/android/gms/internal/ads/zzcei;

    .line 198
    .line 199
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 200
    .line 201
    if-eqz v1, :cond_a

    .line 202
    .line 203
    invoke-interface {v1}, Ll/wit0;->zzj()Ll/far0;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    move-object/from16 v16, v1

    .line 208
    .line 209
    goto :goto_8

    .line 210
    :cond_a
    move-object/from16 v16, v4

    .line 211
    .line 212
    :goto_8
    invoke-static {}, Ll/fcs0;->a()Ll/fcs0;

    .line 213
    .line 214
    .line 215
    move-result-object v17

    .line 216
    const/16 v20, 0x0

    .line 217
    .line 218
    const/16 v21, 0x0

    .line 219
    .line 220
    const/4 v9, 0x1

    .line 221
    const/4 v11, 0x0

    .line 222
    const/4 v12, 0x0

    .line 223
    const/4 v14, 0x0

    .line 224
    const/4 v15, 0x0

    .line 225
    const/16 v18, 0x0

    .line 226
    .line 227
    const/16 v19, 0x0

    .line 228
    .line 229
    invoke-static/range {v6 .. v21}, Ll/jjt0;->a(Landroid/content/Context;Ll/xkt0;Ljava/lang/String;ZZLl/v2s0;Ll/his0;Lcom/google/android/gms/internal/ads/zzcei;Ll/khs0;Ll/d9y0;Ll/far0;Ll/fcs0;Ll/q6w0;Ll/t6w0;Ll/qbv0;Ll/s7w0;)Ll/wit0;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    iput-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    .line 235
    invoke-interface {v1}, Ll/wit0;->zzN()Ll/nkt0;

    .line 236
    .line 237
    .line 238
    move-result-object v11

    .line 239
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 240
    .line 241
    iget-object v13, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzp:Ll/yns0;

    .line 242
    .line 243
    iget-object v15, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zze:Ll/aos0;

    .line 244
    .line 245
    iget-object v3, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzi:Ll/rar0;

    .line 246
    .line 247
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 248
    .line 249
    if-eqz v1, :cond_b

    .line 250
    .line 251
    invoke-interface {v1}, Ll/wit0;->zzN()Ll/nkt0;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-interface {v1}, Ll/nkt0;->zzd()Ll/w9s0;

    .line 256
    .line 257
    .line 258
    move-result-object v4

    .line 259
    :cond_b
    move-object/from16 v19, v4

    .line 260
    .line 261
    const/16 v29, 0x0

    .line 262
    .line 263
    const/16 v30, 0x0

    .line 264
    .line 265
    const/4 v12, 0x0

    .line 266
    const/4 v14, 0x0

    .line 267
    const/16 v17, 0x1

    .line 268
    .line 269
    const/16 v18, 0x0

    .line 270
    .line 271
    const/16 v20, 0x0

    .line 272
    .line 273
    const/16 v21, 0x0

    .line 274
    .line 275
    const/16 v22, 0x0

    .line 276
    .line 277
    const/16 v23, 0x0

    .line 278
    .line 279
    const/16 v24, 0x0

    .line 280
    .line 281
    const/16 v25, 0x0

    .line 282
    .line 283
    const/16 v26, 0x0

    .line 284
    .line 285
    const/16 v27, 0x0

    .line 286
    .line 287
    const/16 v28, 0x0

    .line 288
    .line 289
    move-object/from16 v16, v3

    .line 290
    .line 291
    invoke-interface/range {v11 .. v30}, Ll/nkt0;->zzN(Ll/har0;Ll/yns0;Ll/joy0;Ll/aos0;Ll/rar0;ZLl/dqs0;Ll/w9s0;Ll/t0t0;Ll/w8t0;Ll/fbv0;Ll/yew0;Ll/xwu0;Ll/vcw0;Ll/uqs0;Ll/ggu0;Ll/tqs0;Ll/nqs0;Ll/dut0;)V

    .line 292
    .line 293
    .line 294
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 295
    .line 296
    invoke-interface {v1}, Ll/wit0;->zzN()Ll/nkt0;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    new-instance v3, Ll/c2v0;

    .line 301
    .line 302
    invoke-direct {v3, v0}, Ll/c2v0;-><init>(Lcom/google/android/gms/ads/internal/overlay/b;)V

    .line 303
    .line 304
    .line 305
    invoke-interface {v1, v3}, Ll/nkt0;->zzB(Ll/lkt0;)V

    .line 306
    .line 307
    .line 308
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 309
    .line 310
    iget-object v3, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzl:Ljava/lang/String;

    .line 311
    .line 312
    if-eqz v3, :cond_c

    .line 313
    .line 314
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 315
    .line 316
    invoke-interface {v1, v3}, Ll/wit0;->loadUrl(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    goto :goto_9

    .line 320
    :cond_c
    iget-object v13, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzh:Ljava/lang/String;

    .line 321
    .line 322
    if-eqz v13, :cond_d

    .line 323
    .line 324
    iget-object v11, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 325
    .line 326
    iget-object v12, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzf:Ljava/lang/String;

    .line 327
    .line 328
    const-string v15, "UTF-8"

    .line 329
    .line 330
    const/16 v16, 0x0

    .line 331
    .line 332
    const-string v14, "text/html"

    .line 333
    .line 334
    invoke-interface/range {v11 .. v16}, Ll/wit0;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    :goto_9
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 338
    .line 339
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 340
    .line 341
    if-eqz v1, :cond_f

    .line 342
    .line 343
    invoke-interface {v1, v0}, Ll/wit0;->H(Lcom/google/android/gms/ads/internal/overlay/b;)V

    .line 344
    .line 345
    .line 346
    goto :goto_a

    .line 347
    :cond_d
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzg;

    .line 348
    .line 349
    const-string v1, "No URL or HTML to display in ad overlay."

    .line 350
    .line 351
    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzg;-><init>(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    throw v0

    .line 355
    :catch_0
    move-exception v0

    .line 356
    const-string v1, "Error obtaining webview."

    .line 357
    .line 358
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 359
    .line 360
    .line 361
    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/zzg;

    .line 362
    .line 363
    const-string v2, "Could not obtain webview for the overlay."

    .line 364
    .line 365
    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 366
    .line 367
    .line 368
    throw v1

    .line 369
    :cond_e
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 370
    .line 371
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 372
    .line 373
    iput-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 374
    .line 375
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 376
    .line 377
    invoke-interface {v1, v3}, Ll/wit0;->g0(Landroid/content/Context;)V

    .line 378
    .line 379
    .line 380
    :cond_f
    :goto_a
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 381
    .line 382
    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzw:Z

    .line 383
    .line 384
    if-eqz v1, :cond_10

    .line 385
    .line 386
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 387
    .line 388
    .line 389
    move-result-object v1

    .line 390
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 391
    .line 392
    invoke-interface {v3}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 393
    .line 394
    .line 395
    move-result-object v3

    .line 396
    invoke-virtual {v1, v3, v5}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    .line 397
    .line 398
    .line 399
    :cond_10
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 400
    .line 401
    invoke-interface {v1, v0}, Ll/wit0;->X(Lcom/google/android/gms/ads/internal/overlay/b;)V

    .line 402
    .line 403
    .line 404
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 405
    .line 406
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 407
    .line 408
    if-eqz v1, :cond_11

    .line 409
    .line 410
    invoke-interface {v1}, Ll/wit0;->n()Ll/hfw0;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 415
    .line 416
    invoke-static {v1, v3}, Lcom/google/android/gms/ads/internal/overlay/b;->v8(Ll/hfw0;Landroid/view/View;)V

    .line 417
    .line 418
    .line 419
    :cond_11
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 420
    .line 421
    iget v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 422
    .line 423
    const/4 v3, 0x5

    .line 424
    if-eq v1, v3, :cond_15

    .line 425
    .line 426
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 427
    .line 428
    invoke-interface {v1}, Ll/wit0;->getParent()Landroid/view/ViewParent;

    .line 429
    .line 430
    .line 431
    move-result-object v1

    .line 432
    if-eqz v1, :cond_12

    .line 433
    .line 434
    instance-of v4, v1, Landroid/view/ViewGroup;

    .line 435
    .line 436
    if-eqz v4, :cond_12

    .line 437
    .line 438
    check-cast v1, Landroid/view/ViewGroup;

    .line 439
    .line 440
    iget-object v4, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 441
    .line 442
    invoke-interface {v4}, Ll/wit0;->zzF()Landroid/view/View;

    .line 443
    .line 444
    .line 445
    move-result-object v4

    .line 446
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 447
    .line 448
    .line 449
    :cond_12
    iget-boolean v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->j:Z

    .line 450
    .line 451
    if-eqz v1, :cond_13

    .line 452
    .line 453
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 454
    .line 455
    invoke-interface {v1}, Ll/wit0;->v()V

    .line 456
    .line 457
    .line 458
    :cond_13
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 459
    .line 460
    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzw:Z

    .line 461
    .line 462
    const/4 v4, -0x1

    .line 463
    if-eqz v1, :cond_14

    .line 464
    .line 465
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 466
    .line 467
    new-instance v6, Landroid/widget/Toolbar;

    .line 468
    .line 469
    invoke-direct {v6, v1}, Landroid/widget/Toolbar;-><init>(Landroid/content/Context;)V

    .line 470
    .line 471
    .line 472
    iput-object v6, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 473
    .line 474
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 475
    .line 476
    .line 477
    move-result v1

    .line 478
    invoke-virtual {v6, v1}, Landroid/view/View;->setId(I)V

    .line 479
    .line 480
    .line 481
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 482
    .line 483
    invoke-interface {v1}, Ll/wit0;->zzF()Landroid/view/View;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 488
    .line 489
    .line 490
    move-result v6

    .line 491
    invoke-virtual {v1, v6}, Landroid/view/View;->setId(I)V

    .line 492
    .line 493
    .line 494
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 495
    .line 496
    const v6, -0xbbbbbc

    .line 497
    .line 498
    .line 499
    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 500
    .line 501
    .line 502
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 503
    .line 504
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 505
    .line 506
    .line 507
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    invoke-virtual {v1}, Ll/ebt0;->e()Landroid/content/res/Resources;

    .line 512
    .line 513
    .line 514
    move-result-object v1

    .line 515
    sget v6, Ll/acc0;->c:I

    .line 516
    .line 517
    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    iget-object v6, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 522
    .line 523
    invoke-virtual {v6, v1}, Landroid/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 524
    .line 525
    .line 526
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 527
    .line 528
    iget-object v6, v0, Lcom/google/android/gms/ads/internal/overlay/b;->n:Landroid/view/View$OnClickListener;

    .line 529
    .line 530
    invoke-virtual {v1, v6}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 531
    .line 532
    .line 533
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 534
    .line 535
    invoke-virtual {v1, v5}, Landroid/widget/Toolbar;->setTitleMarginStart(I)V

    .line 536
    .line 537
    .line 538
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 539
    .line 540
    const/4 v5, -0x2

    .line 541
    invoke-direct {v1, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 542
    .line 543
    .line 544
    const/16 v6, 0xa

    .line 545
    .line 546
    invoke-virtual {v1, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 547
    .line 548
    .line 549
    iget-object v6, v0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 550
    .line 551
    iget-object v7, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 552
    .line 553
    invoke-virtual {v6, v7, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 554
    .line 555
    .line 556
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 557
    .line 558
    invoke-direct {v1, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 559
    .line 560
    .line 561
    iget-object v4, v0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 562
    .line 563
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 564
    .line 565
    .line 566
    move-result v4

    .line 567
    const/4 v5, 0x3

    .line 568
    invoke-virtual {v1, v5, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 569
    .line 570
    .line 571
    const/16 v4, 0xc

    .line 572
    .line 573
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 574
    .line 575
    .line 576
    iget-object v4, v0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 577
    .line 578
    iget-object v5, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 579
    .line 580
    invoke-interface {v5}, Ll/wit0;->zzF()Landroid/view/View;

    .line 581
    .line 582
    .line 583
    move-result-object v5

    .line 584
    invoke-virtual {v4, v5, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 585
    .line 586
    .line 587
    goto :goto_b

    .line 588
    :cond_14
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 589
    .line 590
    iget-object v5, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 591
    .line 592
    invoke-interface {v5}, Ll/wit0;->zzF()Landroid/view/View;

    .line 593
    .line 594
    .line 595
    move-result-object v5

    .line 596
    invoke-virtual {v1, v5, v4, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 597
    .line 598
    .line 599
    :cond_15
    :goto_b
    if-nez p1, :cond_16

    .line 600
    .line 601
    iget-boolean v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->l:Z

    .line 602
    .line 603
    if-nez v1, :cond_16

    .line 604
    .line 605
    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/b;->zze()V

    .line 606
    .line 607
    .line 608
    :cond_16
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 609
    .line 610
    iget v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 611
    .line 612
    if-eq v1, v3, :cond_18

    .line 613
    .line 614
    invoke-virtual {v0, v10}, Lcom/google/android/gms/ads/internal/overlay/b;->d6(Z)V

    .line 615
    .line 616
    .line 617
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 618
    .line 619
    invoke-interface {v1}, Ll/wit0;->j()Z

    .line 620
    .line 621
    .line 622
    move-result v1

    .line 623
    if-eqz v1, :cond_17

    .line 624
    .line 625
    invoke-virtual {v0, v10, v2}, Lcom/google/android/gms/ads/internal/overlay/b;->x8(ZZ)V

    .line 626
    .line 627
    .line 628
    :cond_17
    return-void

    .line 629
    :cond_18
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 630
    .line 631
    invoke-static {}, Ll/sbv0;->e()Ll/rbv0;

    .line 632
    .line 633
    .line 634
    move-result-object v2

    .line 635
    invoke-virtual {v2, v1}, Ll/rbv0;->a(Landroid/app/Activity;)Ll/rbv0;

    .line 636
    .line 637
    .line 638
    invoke-virtual {v2, v0}, Ll/rbv0;->b(Lcom/google/android/gms/ads/internal/overlay/b;)Ll/rbv0;

    .line 639
    .line 640
    .line 641
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 642
    .line 643
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzq:Ljava/lang/String;

    .line 644
    .line 645
    invoke-virtual {v2, v1}, Ll/rbv0;->c(Ljava/lang/String;)Ll/rbv0;

    .line 646
    .line 647
    .line 648
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 649
    .line 650
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzr:Ljava/lang/String;

    .line 651
    .line 652
    invoke-virtual {v2, v1}, Ll/rbv0;->d(Ljava/lang/String;)Ll/rbv0;

    .line 653
    .line 654
    .line 655
    invoke-virtual {v2}, Ll/rbv0;->e()Ll/sbv0;

    .line 656
    .line 657
    .line 658
    move-result-object v1

    .line 659
    :try_start_1
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/b;->w8(Ll/sbv0;)V
    :try_end_1
    .catch Lcom/google/android/gms/ads/internal/overlay/zzg; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 660
    .line 661
    .line 662
    return-void

    .line 663
    :catch_1
    move-exception v0

    .line 664
    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/zzg;

    .line 665
    .line 666
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v2

    .line 670
    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 671
    .line 672
    .line 673
    throw v1

    .line 674
    :cond_19
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzg;

    .line 675
    .line 676
    const-string v1, "Invalid activity, no window available."

    .line 677
    .line 678
    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzg;-><init>(Ljava/lang/String;)V

    .line 679
    .line 680
    .line 681
    throw v0
.end method

.method public final t8(Ljava/lang/String;)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->u:Landroid/widget/Toolbar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final u8(Landroid/content/res/Configuration;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzo:Lcom/google/android/gms/ads/internal/zzj;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/zzj;->zzb:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    move v0, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v2

    .line 18
    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 19
    .line 20
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v4, v3, p1}, Ll/ccr0;->d(Landroid/app/Activity;Landroid/content/res/Configuration;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-boolean v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->j:Z

    .line 29
    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    sget-object v0, Ll/sgs0;->F0:Ll/dgs0;

    .line 35
    .line 36
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v1, v2

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_1
    if-eqz p1, :cond_3

    .line 56
    .line 57
    sget-object p1, Ll/sgs0;->E0:Ll/dgs0;

    .line 58
    .line 59
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 76
    .line 77
    if-eqz p1, :cond_4

    .line 78
    .line 79
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzo:Lcom/google/android/gms/ads/internal/zzj;

    .line 80
    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    iget-boolean p1, p1, Lcom/google/android/gms/ads/internal/zzj;->zzg:Z

    .line 84
    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    move v2, v1

    .line 88
    :cond_4
    :goto_2
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object p1, Ll/sgs0;->e1:Ll/dgs0;

    .line 95
    .line 96
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_7

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    if-eqz v1, :cond_6

    .line 117
    .line 118
    if-eqz v2, :cond_5

    .line 119
    .line 120
    const/16 p1, 0x1706

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_5
    const/16 p1, 0x1504

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_6
    const/16 p1, 0x100

    .line 127
    .line 128
    :goto_3
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_7
    const/16 p1, 0x800

    .line 133
    .line 134
    const/16 v0, 0x400

    .line 135
    .line 136
    if-eqz v1, :cond_9

    .line 137
    .line 138
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, p1}, Landroid/view/Window;->clearFlags(I)V

    .line 142
    .line 143
    .line 144
    if-eqz v2, :cond_8

    .line 145
    .line 146
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    const/16 p1, 0x1002

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 153
    .line 154
    .line 155
    :cond_8
    return-void

    .line 156
    :cond_9
    invoke-virtual {p0, p1}, Landroid/view/Window;->addFlags(I)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public final v0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "com.google.android.gms.ads.internal.overlay.hasResumed"

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->i:Z

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final w8(Ll/sbv0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/ads/internal/overlay/zzg;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzv:Ll/k1t0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p0, p1}, Ll/k1t0;->Y(Ll/p1m;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p0, Lcom/google/android/gms/ads/internal/overlay/zzg;

    .line 18
    .line 19
    const-string p1, "noioou"

    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/internal/overlay/zzg;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method public final x8(ZZ)V
    .locals 6

    .line 1
    sget-object v0, Ll/sgs0;->Y0:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzo:Lcom/google/android/gms/ads/internal/zzj;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/zzj;->zzh:Z

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    move v0, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v0, v2

    .line 36
    :goto_0
    sget-object v3, Ll/sgs0;->Z0:Ll/dgs0;

    .line 37
    .line 38
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 55
    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    iget-object v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzo:Lcom/google/android/gms/ads/internal/zzj;

    .line 59
    .line 60
    if-eqz v3, :cond_1

    .line 61
    .line 62
    iget-boolean v3, v3, Lcom/google/android/gms/ads/internal/zzj;->zzi:Z

    .line 63
    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    move v3, v1

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    move v3, v2

    .line 69
    :goto_1
    if-eqz p1, :cond_2

    .line 70
    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    if-nez v3, :cond_2

    .line 76
    .line 77
    new-instance p1, Ll/s0t0;

    .line 78
    .line 79
    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 80
    .line 81
    const-string v5, "useCustomClose"

    .line 82
    .line 83
    invoke-direct {p1, v4, v5}, Ll/s0t0;-><init>(Ll/wit0;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const-string v4, "Custom close has been disabled for interstitial ads in this ad slot."

    .line 87
    .line 88
    invoke-virtual {p1, v4}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->e:Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 92
    .line 93
    if-eqz p0, :cond_5

    .line 94
    .line 95
    if-nez v3, :cond_4

    .line 96
    .line 97
    if-eqz p2, :cond_3

    .line 98
    .line 99
    if-nez v0, :cond_3

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    move v1, v2

    .line 103
    :cond_4
    :goto_2
    invoke-virtual {p0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzs;->b(Z)V

    .line 104
    .line 105
    .line 106
    :cond_5
    return-void
.end method

.method public z5(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->q:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/app/Activity;->requestWindowFeature(I)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const-string v2, "com.google.android.gms.ads.internal.overlay.hasResumed"

    .line 15
    .line 16
    invoke-virtual {p1, v2, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    move v2, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v2, v0

    .line 25
    :goto_0
    iput-boolean v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->i:Z

    .line 26
    .line 27
    const/4 v2, 0x4

    .line 28
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-static {v3}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->g(Landroid/content/Intent;)Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iput-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 39
    .line 40
    if-eqz v3, :cond_11

    .line 41
    .line 42
    iget-boolean v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzw:Z

    .line 43
    .line 44
    if-eqz v3, :cond_3

    .line 45
    .line 46
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catch Lcom/google/android/gms/ads/internal/overlay/zzg; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 49
    .line 50
    const/16 v5, 0x1c

    .line 51
    .line 52
    if-lt v3, v5, :cond_2

    .line 53
    .line 54
    :try_start_1
    invoke-static {v4, v1}, Ll/idy0;->a(Landroid/app/Activity;Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :catch_0
    move-exception p1

    .line 59
    goto/16 :goto_4

    .line 60
    .line 61
    :cond_2
    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    const/high16 v4, 0x80000

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 71
    .line 72
    iget-object v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzm:Lcom/google/android/gms/internal/ads/zzcei;

    .line 73
    .line 74
    iget v3, v3, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 75
    .line 76
    const v4, 0x7270e0

    .line 77
    .line 78
    .line 79
    if-le v3, v4, :cond_4

    .line 80
    .line 81
    iput v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 82
    .line 83
    :cond_4
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 84
    .line 85
    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    if-eqz v3, :cond_5

    .line 90
    .line 91
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 92
    .line 93
    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    const-string v4, "shouldCallOnOverlayOpened"

    .line 98
    .line 99
    invoke-virtual {v3, v4, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    iput-boolean v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->t:Z

    .line 104
    .line 105
    :cond_5
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 106
    .line 107
    iget-object v4, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzo:Lcom/google/android/gms/ads/internal/zzj;

    .line 108
    .line 109
    const/4 v5, 0x5

    .line 110
    if-eqz v4, :cond_6

    .line 111
    .line 112
    iget-boolean v6, v4, Lcom/google/android/gms/ads/internal/zzj;->zza:Z

    .line 113
    .line 114
    iput-boolean v6, p0, Lcom/google/android/gms/ads/internal/overlay/b;->j:Z

    .line 115
    .line 116
    if-eqz v6, :cond_8

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_6
    iget v6, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 120
    .line 121
    if-ne v6, v5, :cond_7

    .line 122
    .line 123
    iput-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->j:Z

    .line 124
    .line 125
    :goto_2
    iget v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 126
    .line 127
    if-eq v3, v5, :cond_8

    .line 128
    .line 129
    iget v3, v4, Lcom/google/android/gms/ads/internal/zzj;->zzf:I

    .line 130
    .line 131
    const/4 v4, -0x1

    .line 132
    if-eq v3, v4, :cond_8

    .line 133
    .line 134
    new-instance v3, Ll/u8y0;

    .line 135
    .line 136
    const/4 v4, 0x0

    .line 137
    invoke-direct {v3, p0, v4}, Ll/u8y0;-><init>(Lcom/google/android/gms/ads/internal/overlay/b;Ll/q3y0;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3}, Ll/aas0;->b()Ll/hpr;

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_7
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->j:Z

    .line 145
    .line 146
    :cond_8
    :goto_3
    if-nez p1, :cond_c

    .line 147
    .line 148
    iget-boolean p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->t:Z

    .line 149
    .line 150
    if-eqz p1, :cond_a

    .line 151
    .line 152
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzt:Ll/c7u0;

    .line 155
    .line 156
    if-eqz p1, :cond_9

    .line 157
    .line 158
    invoke-virtual {p1}, Ll/c7u0;->zze()V

    .line 159
    .line 160
    .line 161
    :cond_9
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzc:Ll/joy0;

    .line 164
    .line 165
    if-eqz p1, :cond_a

    .line 166
    .line 167
    invoke-interface {p1}, Ll/joy0;->P2()V

    .line 168
    .line 169
    .line 170
    :cond_a
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 171
    .line 172
    iget v3, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 173
    .line 174
    if-eq v3, v1, :cond_c

    .line 175
    .line 176
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzb:Ll/har0;

    .line 177
    .line 178
    if-eqz p1, :cond_b

    .line 179
    .line 180
    invoke-interface {p1}, Ll/har0;->onAdClicked()V

    .line 181
    .line 182
    .line 183
    :cond_b
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 184
    .line 185
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzu:Ll/ggu0;

    .line 186
    .line 187
    if-eqz p1, :cond_c

    .line 188
    .line 189
    invoke-interface {p1}, Ll/ggu0;->zzs()V

    .line 190
    .line 191
    .line 192
    :cond_c
    new-instance p1, Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 193
    .line 194
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 195
    .line 196
    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 197
    .line 198
    iget-object v6, v4, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzn:Ljava/lang/String;

    .line 199
    .line 200
    iget-object v7, v4, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzm:Lcom/google/android/gms/internal/ads/zzcei;

    .line 201
    .line 202
    iget-object v7, v7, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 203
    .line 204
    iget-object v4, v4, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzs:Ljava/lang/String;

    .line 205
    .line 206
    invoke-direct {p1, v3, v6, v7, v4}, Lcom/google/android/gms/ads/internal/overlay/zzh;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 210
    .line 211
    const/16 v3, 0x3e8

    .line 212
    .line 213
    invoke-virtual {p1, v3}, Landroid/view/View;->setId(I)V

    .line 214
    .line 215
    .line 216
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 221
    .line 222
    invoke-virtual {p1, v3}, Ll/ccr0;->j(Landroid/app/Activity;)V

    .line 223
    .line 224
    .line 225
    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 226
    .line 227
    iget v3, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 228
    .line 229
    if-eq v3, v1, :cond_10

    .line 230
    .line 231
    const/4 v4, 0x2

    .line 232
    if-eq v3, v4, :cond_f

    .line 233
    .line 234
    const/4 p1, 0x3

    .line 235
    if-eq v3, p1, :cond_e

    .line 236
    .line 237
    if-ne v3, v5, :cond_d

    .line 238
    .line 239
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/b;->s8(Z)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_d
    new-instance p1, Lcom/google/android/gms/ads/internal/overlay/zzg;

    .line 244
    .line 245
    const-string v0, "Could not determine ad overlay type."

    .line 246
    .line 247
    invoke-direct {p1, v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    throw p1

    .line 251
    :cond_e
    invoke-virtual {p0, v1}, Lcom/google/android/gms/ads/internal/overlay/b;->s8(Z)V

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :cond_f
    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/a;

    .line 256
    .line 257
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 258
    .line 259
    invoke-direct {v1, p1}, Lcom/google/android/gms/ads/internal/overlay/a;-><init>(Ll/wit0;)V

    .line 260
    .line 261
    .line 262
    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->d:Lcom/google/android/gms/ads/internal/overlay/a;

    .line 263
    .line 264
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/b;->s8(Z)V

    .line 265
    .line 266
    .line 267
    return-void

    .line 268
    :cond_10
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/b;->s8(Z)V

    .line 269
    .line 270
    .line 271
    return-void

    .line 272
    :cond_11
    new-instance p1, Lcom/google/android/gms/ads/internal/overlay/zzg;

    .line 273
    .line 274
    const-string v0, "Could not get info for ad overlay."

    .line 275
    .line 276
    invoke-direct {p1, v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    throw p1
    :try_end_1
    .catch Lcom/google/android/gms/ads/internal/overlay/zzg; {:try_start_1 .. :try_end_1} :catch_0

    .line 280
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    iput v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 288
    .line 289
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 290
    .line 291
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 292
    .line 293
    .line 294
    return-void
.end method

.method public final zzF()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->r:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_3

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->r:Z

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 18
    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 22
    .line 23
    add-int/lit8 v1, v1, -0x1

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ll/wit0;->e0(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->m:Ljava/lang/Object;

    .line 29
    .line 30
    monitor-enter v0

    .line 31
    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->p:Z

    .line 32
    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 36
    .line 37
    invoke-interface {v1}, Ll/wit0;->zzaz()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    sget-object v1, Ll/sgs0;->I4:Ll/dgs0;

    .line 44
    .line 45
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->s:Z

    .line 62
    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 66
    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzc:Ll/joy0;

    .line 70
    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    invoke-interface {v1}, Ll/joy0;->O()V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    :goto_0
    new-instance v1, Ll/y4u0;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/y4u0;-><init>(Lcom/google/android/gms/ads/internal/overlay/b;)V

    .line 82
    .line 83
    .line 84
    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->o:Ljava/lang/Runnable;

    .line 85
    .line 86
    sget-object p0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 87
    .line 88
    sget-object v2, Ll/sgs0;->X0:Ll/dgs0;

    .line 89
    .line 90
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Ljava/lang/Long;

    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v2

    .line 104
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 105
    .line 106
    .line 107
    monitor-exit v0

    .line 108
    return-void

    .line 109
    :cond_2
    monitor-exit v0

    .line 110
    goto :goto_2

    .line 111
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    throw p0

    .line 113
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzc()V

    .line 114
    .line 115
    .line 116
    :cond_4
    :goto_3
    return-void
.end method

.method public final zzb()V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzk:I

    .line 14
    .line 15
    const/4 v1, 0x5

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final zzc()V
    .locals 5
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->s:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/wit0;->zzF()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->d:Lcom/google/android/gms/ads/internal/overlay/a;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/a;->d:Landroid/content/Context;

    .line 30
    .line 31
    invoke-interface {v2, v0}, Ll/wit0;->g0(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-interface {v0, v2}, Ll/wit0;->y0(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->d:Lcom/google/android/gms/ads/internal/overlay/a;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/a;->c:Landroid/view/ViewGroup;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 45
    .line 46
    invoke-interface {v2}, Ll/wit0;->zzF()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/b;->d:Lcom/google/android/gms/ads/internal/overlay/a;

    .line 51
    .line 52
    iget v4, v3, Lcom/google/android/gms/ads/internal/overlay/a;->a:I

    .line 53
    .line 54
    iget-object v3, v3, Lcom/google/android/gms/ads/internal/overlay/a;->b:Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    invoke-virtual {v0, v2, v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->d:Lcom/google/android/gms/ads/internal/overlay/a;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-interface {v0, v2}, Ll/wit0;->g0(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 82
    .line 83
    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 84
    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzc:Ll/joy0;

    .line 88
    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    iget v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 92
    .line 93
    invoke-interface {v0, v1}, Ll/joy0;->m5(I)V

    .line 94
    .line 95
    .line 96
    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 97
    .line 98
    if-eqz v0, :cond_5

    .line 99
    .line 100
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 101
    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    invoke-interface {v0}, Ll/wit0;->n()Ll/hfw0;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzd:Ll/wit0;

    .line 111
    .line 112
    invoke-interface {p0}, Ll/wit0;->zzF()Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {v0, p0}, Lcom/google/android/gms/ads/internal/overlay/b;->v8(Ll/hfw0;Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    :cond_5
    :goto_1
    return-void
.end method

.method public final zzd()V
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzh;->b:Z

    return-void
.end method

.method public final zze()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wit0;->n0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzg()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->f:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzj:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/b;->p8(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->g:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->q:Z

    .line 28
    .line 29
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->g:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->g:Landroid/widget/FrameLayout;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->h:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->h:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 44
    .line 45
    :cond_2
    const/4 v0, 0x0

    .line 46
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->f:Z

    .line 47
    .line 48
    return-void
.end method

.method public final zzi()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    return-void
.end method

.method public final zzj()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final zzm()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->k:Lcom/google/android/gms/ads/internal/overlay/zzh;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/wit0;->zzF()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    :catch_0
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzF()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final zzn()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->l:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zze()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final zzo()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzg()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzc:Ll/joy0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {v0}, Ll/joy0;->M6()V

    .line 13
    .line 14
    .line 15
    :cond_0
    sget-object v0, Ll/sgs0;->K4:Ll/dgs0;

    .line 16
    .line 17
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->d:Lcom/google/android/gms/ads/internal/overlay/a;

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/wit0;->onPause()V

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzF()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final zzr()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->b:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzc:Ll/joy0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ll/joy0;->g7()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/b;->u8(Landroid/content/res/Configuration;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ll/sgs0;->K4:Ll/dgs0;

    .line 26
    .line 27
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-interface {v0}, Ll/wit0;->V()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 54
    .line 55
    invoke-interface {p0}, Ll/wit0;->onResume()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    const-string p0, "The webview does not exist. Ignoring action."

    .line 60
    .line 61
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public final zzt()V
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->K4:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ll/wit0;->V()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/wit0;->onResume()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "The webview does not exist. Ignoring action."

    .line 36
    .line 37
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public final zzu()V
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->K4:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->d:Lcom/google/android/gms/ads/internal/overlay/a;

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->c:Ll/wit0;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/wit0;->onPause()V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzF()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
