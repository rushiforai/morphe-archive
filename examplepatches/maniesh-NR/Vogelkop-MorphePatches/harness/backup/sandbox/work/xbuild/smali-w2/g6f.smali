.class public final Lg6f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field public final a:Lvw1;

.field public final b:Landroid/content/Context;

.field public c:Z

.field public final d:Lf6f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lvw1;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lf6f;

    invoke-direct {v0, p0}, Lf6f;-><init>(Lg6f;)V

    iput-object v0, p0, Lg6f;->d:Lf6f;

    iput-object p2, p0, Lg6f;->a:Lvw1;

    iput-object p1, p0, Lg6f;->b:Landroid/content/Context;

    sget-object p0, Lvml;->d:Lumi;

    const-wide/16 p1, 0x3

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, p2, v1}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 6

    iget-object p1, p0, Lg6f;->b:Landroid/content/Context;

    sget v0, Legf;->a:I

    if-nez p2, :cond_8

    const/4 p2, 0x0

    goto :goto_20

    :cond_8
    const-string v0, "com.uodis.opendevice.aidl.OpenDeviceIdentifierService"

    invoke-interface {p2, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_18

    instance-of v1, v0, Lfgf;

    if-eqz v1, :cond_18

    move-object p2, v0

    check-cast p2, Lfgf;

    goto :goto_20

    :cond_18
    new-instance v0, Ldgf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p2, v0, Ldgf;->a:Landroid/os/IBinder;

    move-object p2, v0

    :goto_20
    if-eqz p2, :cond_48

    :try_start_22
    iget-boolean v0, p0, Lg6f;->c:Z

    if-nez v0, :cond_45

    check-cast p2, Ldgf;

    invoke-virtual {p2}, Ldgf;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ldgf;->R0()Z

    move-result p2

    iget-object v1, p0, Lg6f;->a:Lvw1;

    new-instance v2, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    invoke-direct {v2, v0, p2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Lvw1;->a(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)V

    iget-object p2, p0, Lg6f;->d:Lf6f;

    invoke-virtual {p2}, Ln1;->S()V
    :try_end_3f
    .catch Landroid/os/RemoteException; {:try_start_22 .. :try_end_3f} :catch_45
    .catchall {:try_start_22 .. :try_end_3f} :catchall_40

    goto :goto_45

    :catchall_40
    move-exception p2

    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    throw p2

    :catch_45
    :cond_45
    :goto_45
    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_48
    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 2

    return-void
.end method
