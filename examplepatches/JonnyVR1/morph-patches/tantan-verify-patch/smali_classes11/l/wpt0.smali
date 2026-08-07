.class public final Ll/wpt0;
.super Ll/fyx0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/sni0;

.field public final synthetic b:Lcom/google/android/gms/location/zzr;


# direct methods
.method public constructor <init>(Ll/sni0;Lcom/google/android/gms/location/zzr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wpt0;->a:Ll/sni0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wpt0;->b:Lcom/google/android/gms/location/zzr;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/fyx0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final Z7(Lcom/google/android/gms/internal/location/zzg;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/location/zzg;->getStatus()Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/wpt0;->a:Ll/sni0;

    .line 6
    .line 7
    invoke-static {p1, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ll/sni0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final zze()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wpt0;->b:Lcom/google/android/gms/location/zzr;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/gms/location/zzr;->zzf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
