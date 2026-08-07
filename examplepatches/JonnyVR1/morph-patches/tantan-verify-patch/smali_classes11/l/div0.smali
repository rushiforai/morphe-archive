.class public final Ll/div0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcv0;


# instance fields
.field public final a:Ljava/util/Map;

.field public final b:Ll/huu0;


# direct methods
.method public constructor <init>(Ll/huu0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/div0;->a:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p1, p0, Ll/div0;->b:Ll/huu0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lorg/json/JSONObject;)Ll/scv0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/div0;->a:Ljava/util/Map;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/scv0;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/div0;->b:Ll/huu0;

    .line 13
    .line 14
    invoke-virtual {v0, p1, p2}, Ll/huu0;->c(Ljava/lang/String;Lorg/json/JSONObject;)Ll/r8w0;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Ll/scv0;

    .line 19
    .line 20
    new-instance v1, Ll/wev0;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/wev0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, p2, v1, p1}, Ll/scv0;-><init>(Ljava/lang/Object;Ll/g8u0;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Ll/div0;->a:Ljava/util/Map;

    .line 29
    .line 30
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    monitor-exit p0

    .line 37
    return-object v0

    .line 38
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p1
.end method
