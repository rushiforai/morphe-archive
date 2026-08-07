.class public final Ll/ynr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ll/v3v0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/v3v0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ynr0;->a:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ynr0;->b:Ll/v3v0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ynr0;->b:Ll/v3v0;

    .line 2
    .line 3
    check-cast p1, Lcom/google/android/gms/internal/ads/zzbze;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/v3v0;->b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/mmr0;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ll/mmr0;-><init>(Lcom/google/android/gms/internal/ads/zzbze;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ynr0;->a:Ljava/util/concurrent/Executor;

    .line 15
    .line 16
    invoke-static {v0, v1, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
