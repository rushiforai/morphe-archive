.class public final Ll/hpv0;
.super Ll/kos0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/nqv0;


# direct methods
.method public synthetic constructor <init>(Ll/nqv0;Ll/cov0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hpv0;->a:Ll/nqv0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kos0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final l3(Lcom/google/android/gms/ads/internal/client/zzl;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/hpv0;->p2(Lcom/google/android/gms/ads/internal/client/zzl;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final p2(Lcom/google/android/gms/ads/internal/client/zzl;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const-string p1, "This app is using a lightweight version of the Google Mobile Ads SDK that requires the latest Google Play services to be installed, but Google Play services is either missing or out of date."

    .line 2
    .line 3
    invoke-static {p1}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ll/obt0;->b:Landroid/os/Handler;

    .line 7
    .line 8
    new-instance p2, Ll/xmv0;

    .line 9
    .line 10
    invoke-direct {p2, p0}, Ll/xmv0;-><init>(Ll/hpv0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final zze()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final zzf()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final zzi()Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
