.class public final Ll/frt0;
.super Ll/qsy0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/sni0;


# direct methods
.method public constructor <init>(Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/frt0;->a:Ll/sni0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/qsy0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final N0(Lcom/google/android/gms/location/LocationSettingsResult;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationSettingsResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/google/android/gms/location/LocationSettingsResponse;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Lcom/google/android/gms/location/LocationSettingsResponse;-><init>(Lcom/google/android/gms/location/LocationSettingsResult;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/frt0;->a:Ll/sni0;

    .line 11
    .line 12
    invoke-static {v0, v1, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ll/sni0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
