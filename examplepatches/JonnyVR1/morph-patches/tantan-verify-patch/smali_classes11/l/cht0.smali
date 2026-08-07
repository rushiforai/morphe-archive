.class public final Ll/cht0;
.super Ll/m8y0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/sni0;


# direct methods
.method public constructor <init>(Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cht0;->a:Ll/sni0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/m8y0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final M1(ILandroid/app/PendingIntent;)V
    .locals 0

    .line 1
    new-instance p2, Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/location/GeofenceStatusCodes;->zza(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-direct {p2, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cht0;->a:Ll/sni0;

    .line 11
    .line 12
    invoke-static {p2, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ll/sni0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final V4(I[Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p2, Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/location/GeofenceStatusCodes;->zza(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-direct {p2, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cht0;->a:Ll/sni0;

    .line 11
    .line 12
    invoke-static {p2, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ll/sni0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final m8(I[Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p2, Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/location/GeofenceStatusCodes;->zza(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-direct {p2, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cht0;->a:Ll/sni0;

    .line 11
    .line 12
    invoke-static {p2, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ll/sni0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
