.class public final synthetic Ll/o6z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/location/zzb;

.field public final synthetic b:Landroid/app/PendingIntent;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/location/zzb;Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o6z0;->a:Lcom/google/android/gms/location/zzb;

    .line 5
    .line 6
    iput-object p2, p0, Ll/o6z0;->b:Landroid/app/PendingIntent;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o6z0;->a:Lcom/google/android/gms/location/zzb;

    .line 2
    .line 3
    iget-object p0, p0, Ll/o6z0;->b:Landroid/app/PendingIntent;

    .line 4
    .line 5
    check-cast p1, Ll/yxv0;

    .line 6
    .line 7
    check-cast p2, Ll/sni0;

    .line 8
    .line 9
    sget-object v1, Ll/gjr0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 10
    .line 11
    new-instance v1, Ll/air0;

    .line 12
    .line 13
    invoke-direct {v1, p2}, Ll/air0;-><init>(Ll/sni0;)V

    .line 14
    .line 15
    .line 16
    const-string p2, "ActivityRecognitionRequest can\'t be null."

    .line 17
    .line 18
    invoke-static {v0, p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    const-string p2, "PendingIntent must be specified."

    .line 22
    .line 23
    invoke-static {p0, p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    const-string p2, "ResultHolder not provided."

    .line 27
    .line 28
    invoke-static {v1, p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance p2, Lcom/google/android/gms/common/api/internal/StatusCallback;

    .line 32
    .line 33
    invoke-direct {p2, v1}, Lcom/google/android/gms/common/api/internal/StatusCallback;-><init>(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getService()Landroid/os/IInterface;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ll/oky0;

    .line 41
    .line 42
    invoke-interface {p1, v0, p0, p2}, Ll/oky0;->z2(Lcom/google/android/gms/location/zzb;Landroid/app/PendingIntent;Lcom/google/android/gms/common/api/internal/IStatusCallback;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
