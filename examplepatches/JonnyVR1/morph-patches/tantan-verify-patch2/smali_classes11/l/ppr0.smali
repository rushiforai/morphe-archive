.class public final Ll/ppr0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/google/android/gms/ads/internal/client/zzq;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/s3s0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/ppr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Ll/ppr0;->c:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 4
    .line 5
    iput-object p4, p0, Ll/ppr0;->d:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/ppr0;->e:Ll/s3s0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/z4s0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ppr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "search"

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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ppr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/ppr0;->c:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ppr0;->d:Ljava/lang/String;

    .line 10
    .line 11
    const v2, 0xe52bf80

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v0, v1, p0, v2}, Ll/tbt0;->E7(Ll/p1m;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;I)Ll/oys0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
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
    iget-object v0, p0, Ll/ppr0;->e:Ll/s3s0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/s3s0;->b(Ll/s3s0;)Ll/p3y0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/ppr0;->b:Landroid/content/Context;

    .line 8
    .line 9
    iget-object v3, p0, Ll/ppr0;->c:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 10
    .line 11
    iget-object v4, p0, Ll/ppr0;->d:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x3

    .line 15
    invoke-virtual/range {v1 .. v6}, Ll/p3y0;->a(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;I)Ll/oys0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
