.class public final Ll/gor0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/google/android/gms/ads/internal/client/zzq;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/uws0;

.field public final synthetic f:Ll/s3s0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/gor0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Ll/gor0;->c:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 4
    .line 5
    iput-object p4, p0, Ll/gor0;->d:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Ll/gor0;->e:Ll/uws0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/gor0;->f:Ll/s3s0;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/z4s0;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gor0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "app_open"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s3s0;->q(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/zsv0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/zsv0;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gor0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-object v3, p0, Ll/gor0;->c:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 8
    .line 9
    iget-object v4, p0, Ll/gor0;->d:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, p0, Ll/gor0;->e:Ll/uws0;

    .line 12
    .line 13
    const v6, 0xe52bf80

    .line 14
    .line 15
    .line 16
    move-object v1, p1

    .line 17
    invoke-interface/range {v1 .. v6}, Ll/tbt0;->b4(Ll/p1m;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;I)Ll/oys0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gor0;->f:Ll/s3s0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/s3s0;->b(Ll/s3s0;)Ll/p3y0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/gor0;->b:Landroid/content/Context;

    .line 8
    .line 9
    iget-object v3, p0, Ll/gor0;->c:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 10
    .line 11
    iget-object v4, p0, Ll/gor0;->d:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v5, p0, Ll/gor0;->e:Ll/uws0;

    .line 14
    .line 15
    const/4 v6, 0x4

    .line 16
    invoke-virtual/range {v1 .. v6}, Ll/p3y0;->a(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;I)Ll/oys0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
