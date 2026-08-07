.class public final synthetic Ll/rdr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Ll/gjr0;

.field public final synthetic b:Landroid/app/PendingIntent;

.field public final synthetic c:Lcom/google/android/gms/location/SleepSegmentRequest;


# direct methods
.method public synthetic constructor <init>(Ll/gjr0;Landroid/app/PendingIntent;Lcom/google/android/gms/location/SleepSegmentRequest;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rdr0;->a:Ll/gjr0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rdr0;->b:Landroid/app/PendingIntent;

    .line 7
    .line 8
    iput-object p3, p0, Ll/rdr0;->c:Lcom/google/android/gms/location/SleepSegmentRequest;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rdr0;->a:Ll/gjr0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rdr0;->b:Landroid/app/PendingIntent;

    .line 4
    .line 5
    iget-object p0, p0, Ll/rdr0;->c:Lcom/google/android/gms/location/SleepSegmentRequest;

    .line 6
    .line 7
    check-cast p1, Ll/yxv0;

    .line 8
    .line 9
    check-cast p2, Ll/sni0;

    .line 10
    .line 11
    new-instance v2, Ll/ogr0;

    .line 12
    .line 13
    invoke-direct {v2, v0, p2}, Ll/ogr0;-><init>(Ll/gjr0;Ll/sni0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getService()Landroid/os/IInterface;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/oky0;

    .line 21
    .line 22
    invoke-interface {p1, v1, p0, v2}, Ll/oky0;->P0(Landroid/app/PendingIntent;Lcom/google/android/gms/location/SleepSegmentRequest;Lcom/google/android/gms/common/api/internal/IStatusCallback;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
