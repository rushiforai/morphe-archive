.class public final Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;
.super Ll/xtd;


# annotations
.annotation build Lcom/google/android/gms/common/util/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/maps/StreetViewPanoramaFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xtd<",
        "Lcom/google/android/gms/maps/StreetViewPanoramaFragment$a;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Landroid/app/Fragment;

.field public f:Ll/wl50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wl50<",
            "Lcom/google/android/gms/maps/StreetViewPanoramaFragment$a;",
            ">;"
        }
    .end annotation
.end field

.field public g:Landroid/app/Activity;

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/un50;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Fragment;)V
    .locals 1
    .annotation build Lcom/google/android/gms/common/util/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/xtd;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->h:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->e:Landroid/app/Fragment;

    .line 12
    .line 13
    return-void
.end method

.method private final v(Landroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->g:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->x()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic w(Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->v(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final x()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->g:Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->f:Ll/wl50;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xtd;->b()Ll/her;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->g:Landroid/app/Activity;

    .line 16
    .line 17
    invoke-static {v0}, Ll/oxw;->a(Landroid/content/Context;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->g:Landroid/app/Activity;

    .line 21
    .line 22
    invoke-static {v0}, Ll/k4t0;->c(Landroid/content/Context;)Ll/t1v0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->g:Landroid/app/Activity;

    .line 27
    .line 28
    invoke-static {v1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v0, v1}, Ll/t1v0;->x(Ll/p1m;)Ll/i6m;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->f:Ll/wl50;

    .line 37
    .line 38
    new-instance v2, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$a;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->e:Landroid/app/Fragment;

    .line 41
    .line 42
    invoke-direct {v2, v3, v0}, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$a;-><init>(Landroid/app/Fragment;Ll/i6m;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v1, v2}, Ll/wl50;->a(Ll/her;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->h:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ll/un50;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xtd;->b()Ll/her;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$a;

    .line 71
    .line 72
    invoke-virtual {v2, v1}, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$a;->c(Ll/un50;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->h:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_1

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catch_0
    move-exception p0

    .line 83
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 84
    .line 85
    .line 86
    :catch_1
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Ll/wl50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wl50<",
            "Lcom/google/android/gms/maps/StreetViewPanoramaFragment$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->f:Ll/wl50;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/maps/StreetViewPanoramaFragment$b;->x()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
