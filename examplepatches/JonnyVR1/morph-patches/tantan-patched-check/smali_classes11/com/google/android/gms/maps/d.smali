.class public final Lcom/google/android/gms/maps/d;
.super Ll/its0;


# instance fields
.field public final synthetic a:Ll/un50;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/maps/StreetViewPanoramaView$a;Ll/un50;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/gms/maps/d;->a:Ll/un50;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/its0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final y0(Ll/h6m;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/maps/d;->a:Ll/un50;

    .line 2
    .line 3
    new-instance v0, Ll/b8g0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/b8g0;-><init>(Ll/h6m;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/un50;->a(Ll/b8g0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
