.class public final Lcom/google/android/gms/maps/e;
.super Ll/hwr0;


# instance fields
.field public final synthetic a:Ll/um50;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/maps/SupportMapFragment$a;Ll/um50;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/gms/maps/e;->a:Ll/um50;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/hwr0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final K0(Ll/sul;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/maps/e;->a:Ll/um50;

    .line 2
    .line 3
    new-instance v0, Ll/w6k;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/w6k;-><init>(Ll/sul;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/um50;->P2(Ll/w6k;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
