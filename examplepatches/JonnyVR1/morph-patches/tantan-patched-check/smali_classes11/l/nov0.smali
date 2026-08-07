.class public final Ll/nov0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/o7w0;

.field public final c:Lcom/google/android/gms/internal/ads/zzcei;

.field public final d:Ll/ibt0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/o7w0;Lcom/google/android/gms/internal/ads/zzcei;Ll/ibt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nov0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nov0;->b:Ll/o7w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/nov0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 9
    .line 10
    iput-object p4, p0, Ll/nov0;->d:Ll/ibt0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/oov0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nov0;->b:Ll/o7w0;

    .line 2
    .line 3
    new-instance v1, Ll/oov0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->j:Lcom/google/android/gms/ads/internal/client/zzw;

    .line 6
    .line 7
    iget-object v2, p0, Ll/nov0;->d:Ll/ibt0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/nov0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/ibt0;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-direct {v1, v0, p0, v2}, Ll/oov0;-><init>(Lcom/google/android/gms/ads/internal/client/zzw;Lcom/google/android/gms/internal/ads/zzcei;Z)V

    .line 16
    .line 17
    .line 18
    return-object v1
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x9

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/mov0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mov0;-><init>(Ll/nov0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/nov0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
