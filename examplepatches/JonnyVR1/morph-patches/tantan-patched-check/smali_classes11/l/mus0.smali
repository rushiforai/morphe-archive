.class public final Ll/mus0;
.super Ll/iys0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/google/android/gms/location/GeofencingRequest;

.field public final synthetic b:Landroid/app/PendingIntent;


# direct methods
.method public constructor <init>(Ll/tzs0;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/mus0;->a:Lcom/google/android/gms/location/GeofencingRequest;

    .line 2
    .line 3
    iput-object p4, p0, Ll/mus0;->b:Landroid/app/PendingIntent;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/iys0;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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
    iget-object v0, p0, Ll/mus0;->a:Lcom/google/android/gms/location/GeofencingRequest;

    .line 4
    .line 5
    iget-object v1, p0, Ll/mus0;->b:Landroid/app/PendingIntent;

    .line 6
    .line 7
    invoke-static {p0}, Ll/tzs0;->a(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)Ll/sni0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, v0, v1, p0}, Ll/f5u0;->i(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;Ll/sni0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
