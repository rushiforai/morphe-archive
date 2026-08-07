.class public final synthetic Ll/bey0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Ll/qoy0;


# direct methods
.method public synthetic constructor <init>(Ll/qoy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bey0;->a:Ll/qoy0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/bey0;->a:Ll/qoy0;

    .line 2
    .line 3
    check-cast p1, Ll/g4u0;

    .line 4
    .line 5
    check-cast p2, Ll/sni0;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getService()Landroid/os/IInterface;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/pqw0;

    .line 12
    .line 13
    new-instance v0, Lcom/google/android/gms/appset/zza;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, v1, v1}, Lcom/google/android/gms/appset/zza;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/dly0;

    .line 20
    .line 21
    invoke-direct {v1, p0, p2}, Ll/dly0;-><init>(Ll/qoy0;Ll/sni0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Ll/pqw0;->Y2(Lcom/google/android/gms/appset/zza;Ll/txv0;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
