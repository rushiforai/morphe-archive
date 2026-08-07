.class public final Ll/rqu0;
.super Ll/qss0;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;
.implements Ll/eks0;


# instance fields
.field public a:Landroid/view/View;

.field public b:Ll/lpu0;

.field public c:Ll/ilu0;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ll/ilu0;Ll/ulu0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/qss0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/ulu0;->S()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/ulu0;->W()Ll/lpu0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/rqu0;->b:Ll/lpu0;

    .line 15
    .line 16
    iput-object p1, p0, Ll/rqu0;->c:Ll/ilu0;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/rqu0;->d:Z

    .line 20
    .line 21
    iput-boolean p1, p0, Ll/rqu0;->e:Z

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/ulu0;->f0()Ll/wit0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Ll/ulu0;->f0()Ll/wit0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1, p0}, Ll/wit0;->r0(Ll/eks0;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static final o8(Ll/uss0;I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-interface {p0, p1}, Ll/uss0;->zze(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    const-string p1, "#007 Could not call remote method."

    .line 7
    .line 8
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final zzg()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rqu0;->c:Ll/ilu0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object v1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {p0}, Ll/ilu0;->E(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v0, p0, v1, v1, v2}, Ll/ilu0;->i(Landroid/view/View;Ljava/util/Map;Ljava/util/Map;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private final zzh()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    check-cast v0, Landroid/view/ViewGroup;

    .line 15
    .line 16
    iget-object p0, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final U3(Ll/p1m;Ll/uss0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Ll/rqu0;->d:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "Instream ad can not be shown after destroy()."

    .line 11
    .line 12
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x2

    .line 16
    invoke-static {p2, p0}, Ll/rqu0;->o8(Ll/uss0;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-object v1, p0, Ll/rqu0;->b:Ll/lpu0;

    .line 25
    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-boolean v0, p0, Ll/rqu0;->e:Z

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const-string p0, "Instream ad should not be used again."

    .line 35
    .line 36
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2, v1}, Ll/rqu0;->o8(Ll/uss0;I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iput-boolean v1, p0, Ll/rqu0;->e:Z

    .line 44
    .line 45
    invoke-direct {p0}, Ll/rqu0;->zzh()V

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Landroid/view/ViewGroup;

    .line 53
    .line 54
    iget-object v0, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 55
    .line 56
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    const/4 v2, -0x1

    .line 59
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ll/bxy0;->z()Ll/ldt0;

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 69
    .line 70
    invoke-static {p1, p0}, Ll/ldt0;->a(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/bxy0;->z()Ll/ldt0;

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 77
    .line 78
    invoke-static {p1, p0}, Ll/ldt0;->b(Landroid/view/View;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 79
    .line 80
    .line 81
    invoke-direct {p0}, Ll/rqu0;->zzg()V

    .line 82
    .line 83
    .line 84
    :try_start_0
    invoke-interface {p2}, Ll/uss0;->zzf()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :catch_0
    move-exception p0

    .line 89
    const-string p1, "#007 Could not call remote method."

    .line 90
    .line 91
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    :goto_0
    if-nez v0, :cond_4

    .line 96
    .line 97
    const-string p0, "can not get video view."

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    const-string p0, "can not get video controller."

    .line 101
    .line 102
    :goto_1
    const-string p1, "Instream internal error: "

    .line 103
    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const/4 p0, 0x0

    .line 112
    invoke-static {p2, p0}, Ll/rqu0;->o8(Ll/uss0;I)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final onGlobalLayout()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rqu0;->zzg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onScrollChanged()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rqu0;->zzg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final zzb()Ll/lpu0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Ll/rqu0;->d:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "getVideoController: Instream ad should not be used after destroyed"

    .line 11
    .line 12
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/rqu0;->b:Ll/lpu0;

    .line 18
    .line 19
    return-object p0
.end method

.method public final zzc()Ll/xks0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Ll/rqu0;->d:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "getVideoController: Instream ad should not be used after destroyed"

    .line 12
    .line 13
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    iget-object p0, p0, Ll/rqu0;->c:Ll/ilu0;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ilu0;->O()Ll/klu0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ilu0;->O()Ll/klu0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/klu0;->a()Ll/xks0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    return-object v1
.end method

.method public final zzd()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/rqu0;->zzh()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/rqu0;->c:Ll/ilu0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/kzt0;->b()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/rqu0;->c:Ll/ilu0;

    .line 18
    .line 19
    iput-object v0, p0, Ll/rqu0;->a:Landroid/view/View;

    .line 20
    .line 21
    iput-object v0, p0, Ll/rqu0;->b:Ll/lpu0;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/rqu0;->d:Z

    .line 25
    .line 26
    return-void
.end method

.method public final zze(Ll/p1m;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/lqu0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/lqu0;-><init>(Ll/rqu0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/rqu0;->U3(Ll/p1m;Ll/uss0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
