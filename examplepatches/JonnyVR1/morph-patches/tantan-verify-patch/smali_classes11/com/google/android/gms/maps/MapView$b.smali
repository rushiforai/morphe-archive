.class public final Lcom/google/android/gms/maps/MapView$b;
.super Ll/xtd;


# annotations
.annotation build Lcom/google/android/gms/common/util/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/maps/MapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xtd<",
        "Lcom/google/android/gms/maps/MapView$a;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Landroid/view/ViewGroup;

.field public final f:Landroid/content/Context;

.field public g:Ll/wl50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wl50<",
            "Lcom/google/android/gms/maps/MapView$a;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Lcom/google/android/gms/maps/GoogleMapOptions;

.field public final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/um50;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V
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
    iput-object v0, p0, Lcom/google/android/gms/maps/MapView$b;->i:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/google/android/gms/maps/MapView$b;->e:Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/google/android/gms/maps/MapView$b;->f:Landroid/content/Context;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/google/android/gms/maps/MapView$b;->h:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(Ll/wl50;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wl50<",
            "Lcom/google/android/gms/maps/MapView$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/maps/MapView$b;->g:Ll/wl50;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xtd;->b()Ll/her;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_2

    .line 10
    .line 11
    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/maps/MapView$b;->f:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {p1}, Ll/oxw;->a(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/google/android/gms/maps/MapView$b;->f:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {p1}, Ll/k4t0;->c(Landroid/content/Context;)Ll/t1v0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/maps/MapView$b;->f:Landroid/content/Context;

    .line 23
    .line 24
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/google/android/gms/maps/MapView$b;->h:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 29
    .line 30
    invoke-interface {p1, v0, v1}, Ll/t1v0;->j7(Ll/p1m;Lcom/google/android/gms/maps/GoogleMapOptions;)Ll/jyl;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/maps/MapView$b;->g:Ll/wl50;

    .line 38
    .line 39
    new-instance v1, Lcom/google/android/gms/maps/MapView$a;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/google/android/gms/maps/MapView$b;->e:Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-direct {v1, v2, p1}, Lcom/google/android/gms/maps/MapView$a;-><init>(Landroid/view/ViewGroup;Ll/jyl;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v1}, Ll/wl50;->a(Ll/her;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/google/android/gms/maps/MapView$b;->i:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/um50;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xtd;->b()Ll/her;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Lcom/google/android/gms/maps/MapView$a;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/MapView$a;->c(Ll/um50;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/maps/MapView$b;->i:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {p0}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_1

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :catch_0
    move-exception p0

    .line 84
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 85
    .line 86
    .line 87
    :catch_1
    :cond_2
    :goto_1
    return-void
.end method
