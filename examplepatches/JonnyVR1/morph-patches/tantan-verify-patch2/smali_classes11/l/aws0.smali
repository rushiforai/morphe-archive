.class public final Ll/aws0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/evs0;


# instance fields
.field public final a:Ll/gvs0;

.field public final b:Ll/hvs0;

.field public final c:Ll/bvs0;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/bvs0;Ljava/lang/String;Ll/hvs0;Ll/gvs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aws0;->c:Ll/bvs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/aws0;->d:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/aws0;->b:Ll/hvs0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/aws0;->a:Ll/gvs0;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Ll/aws0;)Ll/gvs0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aws0;->a:Ll/gvs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/aws0;Ll/vus0;Ll/cvs0;Ljava/lang/Object;Ll/tct0;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Ll/aqs0;->o:Ll/qqs0;

    .line 13
    .line 14
    new-instance v2, Ll/zvs0;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1, p4}, Ll/zvs0;-><init>(Ll/aws0;Ll/vus0;Ll/tct0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v0, v2}, Ll/qqs0;->c(Ljava/lang/String;Ll/pqs0;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v2, "id"

    .line 28
    .line 29
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    const-string v0, "args"

    .line 33
    .line 34
    iget-object v2, p0, Ll/aws0;->b:Ll/hvs0;

    .line 35
    .line 36
    invoke-interface {v2, p3}, Ll/hvs0;->zzb(Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-virtual {v1, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/aws0;->d:Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {p2, p0, v1}, Ll/xts0;->z0(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p0

    .line 50
    :try_start_1
    invoke-virtual {p4, p0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 51
    .line 52
    .line 53
    const-string p2, "Unable to invokeJavascript"

    .line 54
    .line 55
    invoke-static {p2, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ll/vus0;->g()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    invoke-virtual {p1}, Ll/vus0;->g()V

    .line 64
    .line 65
    .line 66
    throw p0
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/aws0;->zzb(Ljava/lang/Object;)Ll/hpr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final zzb(Ljava/lang/Object;)Ll/hpr;
    .locals 3

    .line 1
    new-instance v0, Ll/tct0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tct0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/aws0;->c:Ll/bvs0;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2}, Ll/bvs0;->b(Ll/v2s0;)Ll/vus0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "callJs > getEngine: Promise created"

    .line 14
    .line 15
    invoke-static {v2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/pvs0;

    .line 19
    .line 20
    invoke-direct {v2, p0, v1, p1, v0}, Ll/pvs0;-><init>(Ll/aws0;Ll/vus0;Ljava/lang/Object;Ll/tct0;)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/qvs0;

    .line 24
    .line 25
    invoke-direct {p1, p0, v0, v1}, Ll/qvs0;-><init>(Ll/aws0;Ll/tct0;Ll/vus0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2, p1}, Ll/kdt0;->e(Ll/xct0;Ll/vct0;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method
