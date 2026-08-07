.class public final Ll/uqr0;
.super Ll/wzr0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/app/PendingIntent;

.field public final synthetic b:Lcom/google/android/gms/location/LocationRequest;


# direct methods
.method public constructor <init>(Ll/x0s0;Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/PendingIntent;Lcom/google/android/gms/location/LocationRequest;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/uqr0;->a:Landroid/app/PendingIntent;

    .line 2
    .line 3
    iput-object p4, p0, Ll/uqr0;->b:Lcom/google/android/gms/location/LocationRequest;

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
    iget-object v0, p0, Ll/uqr0;->a:Landroid/app/PendingIntent;

    .line 4
    .line 5
    iget-object v1, p0, Ll/uqr0;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 6
    .line 7
    invoke-static {p0}, Ll/x0s0;->a(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)Ll/sni0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, v0, v1, p0}, Ll/f5u0;->o(Landroid/app/PendingIntent;Lcom/google/android/gms/location/LocationRequest;Ll/sni0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
