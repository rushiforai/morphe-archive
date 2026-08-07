.class public final synthetic Ll/x2z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Landroid/app/PendingIntent;


# direct methods
.method public synthetic constructor <init>(Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x2z0;->a:Landroid/app/PendingIntent;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/x2z0;->a:Landroid/app/PendingIntent;

    .line 2
    .line 3
    check-cast p1, Ll/yxv0;

    .line 4
    .line 5
    check-cast p2, Ll/sni0;

    .line 6
    .line 7
    sget-object v0, Ll/gjr0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 8
    .line 9
    new-instance v0, Ll/air0;

    .line 10
    .line 11
    invoke-direct {v0, p2}, Ll/air0;-><init>(Ll/sni0;)V

    .line 12
    .line 13
    .line 14
    const-string p2, "ResultHolder not provided."

    .line 15
    .line 16
    invoke-static {v0, p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    new-instance p2, Lcom/google/android/gms/common/api/internal/StatusCallback;

    .line 20
    .line 21
    invoke-direct {p2, v0}, Lcom/google/android/gms/common/api/internal/StatusCallback;-><init>(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getService()Landroid/os/IInterface;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ll/oky0;

    .line 29
    .line 30
    invoke-interface {p1, p0, p2}, Ll/oky0;->f1(Landroid/app/PendingIntent;Lcom/google/android/gms/common/api/internal/IStatusCallback;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
