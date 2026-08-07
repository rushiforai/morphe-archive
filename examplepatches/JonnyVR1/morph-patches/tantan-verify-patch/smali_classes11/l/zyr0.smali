.class public abstract Ll/zyr0;
.super Ll/f9s0;

# interfaces
.implements Ll/hxr0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "com.google.android.gms.maps.internal.IOnMarkerClickListener"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/f9s0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final O(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p1, p4, :cond_0

    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ll/ayy0;->P2(Landroid/os/IBinder;)Ll/axy0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Ll/hxr0;->l5(Ll/axy0;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 17
    .line 18
    .line 19
    invoke-static {p3, p0}, Ll/y5t0;->a(Landroid/os/Parcel;Z)V

    .line 20
    .line 21
    .line 22
    return p4

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
