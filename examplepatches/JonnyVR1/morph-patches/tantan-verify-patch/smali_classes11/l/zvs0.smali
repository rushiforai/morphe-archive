.class public final Ll/zvs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pqs0;


# instance fields
.field public final a:Ll/vus0;

.field public final b:Ll/tct0;

.field public final synthetic c:Ll/aws0;


# direct methods
.method public constructor <init>(Ll/aws0;Ll/vus0;Ll/tct0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zvs0;->c:Ll/aws0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/zvs0;->a:Ll/vus0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/zvs0;->b:Ll/tct0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/zvs0;->b:Ll/tct0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zvs0;->c:Ll/aws0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/aws0;->a(Ll/aws0;)Ll/gvs0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1, p1}, Ll/gvs0;->a(Lorg/json/JSONObject;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ll/tct0;->b(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    goto :goto_1

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception p1

    .line 20
    :try_start_1
    iget-object v0, p0, Ll/zvs0;->b:Ll/tct0;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :goto_0
    iget-object p0, p0, Ll/zvs0;->a:Ll/vus0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/vus0;->g()V

    .line 29
    .line 30
    .line 31
    throw p1

    .line 32
    :catch_1
    :goto_1
    iget-object p0, p0, Ll/zvs0;->a:Ll/vus0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/vus0;->g()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final zza(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/zvs0;->b:Ll/tct0;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    :try_start_0
    new-instance p1, Lcom/google/android/gms/internal/ads/zzbrm;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/google/android/gms/internal/ads/zzbrm;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 11
    .line 12
    .line 13
    goto :goto_1

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/ads/zzbrm;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zzbrm;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    goto :goto_1

    .line 25
    :goto_0
    iget-object p0, p0, Ll/zvs0;->a:Ll/vus0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/vus0;->g()V

    .line 28
    .line 29
    .line 30
    throw p1

    .line 31
    :catch_0
    :goto_1
    iget-object p0, p0, Ll/zvs0;->a:Ll/vus0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/vus0;->g()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
