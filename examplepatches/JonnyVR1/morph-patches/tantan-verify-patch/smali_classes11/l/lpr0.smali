.class public final Ll/lpr0;
.super Ll/wzr0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/google/android/gms/common/api/internal/ListenerHolder;

.field public final synthetic b:Lcom/google/android/gms/location/LocationRequest;


# direct methods
.method public constructor <init>(Ll/x0s0;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/internal/ListenerHolder;Lcom/google/android/gms/location/LocationRequest;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/lpr0;->a:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 2
    .line 3
    iput-object p4, p0, Ll/lpr0;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/wzr0;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic doExecute(Lcom/google/android/gms/common/api/Api$AnyClient;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/f5u0;

    .line 2
    .line 3
    new-instance v0, Ll/uyr0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/lpr0;->a:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ll/uyr0;-><init>(Lcom/google/android/gms/common/api/internal/ListenerHolder;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/lpr0;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 11
    .line 12
    invoke-static {p0}, Ll/x0s0;->a(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)Ll/sni0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, v0, v1, p0}, Ll/f5u0;->m(Ll/utt0;Lcom/google/android/gms/location/LocationRequest;Ll/sni0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
