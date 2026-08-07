.class public final synthetic Ll/imv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s6u0;


# instance fields
.field public final synthetic a:Ll/wlv0;

.field public final synthetic b:Ll/xss0;


# direct methods
.method public synthetic constructor <init>(Ll/wlv0;Ll/xss0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/imv0;->a:Ll/wlv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/imv0;->b:Ll/xss0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final u(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/imv0;->a:Ll/wlv0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/wlv0;->u(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/imv0;->b:Ll/xss0;

    .line 7
    .line 8
    const-string v0, "#007 Could not call remote method."

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    :try_start_0
    invoke-interface {p0, p1}, Ll/xss0;->f(Lcom/google/android/gms/ads/internal/client/zze;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v1

    .line 17
    invoke-static {v0, v1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    :goto_0
    if-eqz p0, :cond_1

    .line 21
    .line 22
    :try_start_1
    iget p1, p1, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/xss0;->zze(I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :catch_1
    move-exception p0

    .line 29
    invoke-static {v0, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_1
    return-void
.end method
