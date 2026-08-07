.class public final Ll/tyu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dyu0;


# instance fields
.field public final a:J

.field public final b:Ll/iyu0;

.field public final c:Ll/h6w0;


# direct methods
.method public constructor <init>(JLandroid/content/Context;Ll/iyu0;Ll/dlt0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/tyu0;->a:J

    .line 5
    .line 6
    iput-object p4, p0, Ll/tyu0;->b:Ll/iyu0;

    .line 7
    .line 8
    invoke-virtual {p5}, Ll/dlt0;->z()Ll/j6w0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1, p3}, Ll/j6w0;->a(Landroid/content/Context;)Ll/j6w0;

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, p6}, Ll/j6w0;->zza(Ljava/lang/String;)Ll/j6w0;

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ll/j6w0;->zzc()Ll/k6w0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {p1}, Ll/k6w0;->zza()Ll/h6w0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/tyu0;->c:Ll/h6w0;

    .line 27
    .line 28
    return-void
.end method

.method public static bridge synthetic b(Ll/tyu0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tyu0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic c(Ll/tyu0;)Ll/iyu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tyu0;->b:Ll/iyu0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/ads/internal/client/zzl;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/tyu0;->c:Ll/h6w0;

    .line 2
    .line 3
    new-instance v1, Ll/ryu0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ryu0;-><init>(Ll/tyu0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, v1}, Ll/h6w0;->s5(Lcom/google/android/gms/ads/internal/client/zzl;Ll/s7t0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string p1, "#007 Could not call remote method."

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final zza()V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzc()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/tyu0;->c:Ll/h6w0;

    .line 2
    .line 3
    new-instance v1, Ll/syu0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/syu0;-><init>(Ll/tyu0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/h6w0;->R0(Ll/o7t0;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/tyu0;->c:Ll/h6w0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/h6w0;->g0(Ll/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    const-string v0, "#007 Could not call remote method."

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
