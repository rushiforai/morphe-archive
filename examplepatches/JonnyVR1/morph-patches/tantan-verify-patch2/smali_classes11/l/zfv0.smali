.class public final Ll/zfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tfv0;


# instance fields
.field public final a:Ll/qju0;

.field public final b:Ll/xvw0;

.field public final c:Ll/wou0;

.field public final d:Ll/s8w0;

.field public final e:Ll/bsu0;


# direct methods
.method public constructor <init>(Ll/qju0;Ll/xvw0;Ll/wou0;Ll/s8w0;Ll/bsu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zfv0;->a:Ll/qju0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zfv0;->b:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/zfv0;->c:Ll/wou0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/zfv0;->d:Ll/s8w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/zfv0;->e:Ll/bsu0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 0

    .line 1
    iget-object p0, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/u6w0;->c:Lorg/json/JSONObject;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;)Ll/hpr;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zfv0;->d:Ll/s8w0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/s8w0;->a()Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/wfv0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p2}, Ll/wfv0;-><init>(Ll/zfv0;Ll/q6w0;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/zfv0;->b:Ll/xvw0;

    .line 13
    .line 14
    invoke-static {v0, v1, v2}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/xfv0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1, p2}, Ll/xfv0;-><init>(Ll/zfv0;Ll/b7w0;Ll/q6w0;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/zfv0;->b:Ll/xvw0;

    .line 24
    .line 25
    invoke-static {v0, v1, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic c(Ll/hpr;Ll/hpr;Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)Ll/ilu0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/ulu0;

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ll/qru0;

    .line 12
    .line 13
    new-instance v0, Ll/a0u0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, p3, p4, v1}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance p3, Ll/gmu0;

    .line 20
    .line 21
    invoke-direct {p3, p1}, Ll/gmu0;-><init>(Ll/ulu0;)V

    .line 22
    .line 23
    .line 24
    new-instance p4, Ll/fku0;

    .line 25
    .line 26
    invoke-direct {p4, p5, p2}, Ll/fku0;-><init>(Lorg/json/JSONObject;Ll/qru0;)V

    .line 27
    .line 28
    .line 29
    iget-object p5, p0, Ll/zfv0;->a:Ll/qju0;

    .line 30
    .line 31
    invoke-virtual {p5, v0, p3, p4}, Ll/qju0;->c(Ll/a0u0;Ll/gmu0;Ll/fku0;)Ll/vlu0;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-virtual {p3}, Ll/vlu0;->j()Ll/cru0;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    invoke-virtual {p4}, Ll/cru0;->b()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3}, Ll/vlu0;->k()Ll/mru0;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-virtual {p4, p2}, Ll/mru0;->a(Ll/qru0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3}, Ll/vlu0;->i()Ll/gqu0;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p1}, Ll/ulu0;->f0()Ll/wit0;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p2, p1}, Ll/gqu0;->a(Ll/wit0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3}, Ll/vlu0;->l()Ll/asu0;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object p0, p0, Ll/zfv0;->e:Ll/bsu0;

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Ll/asu0;->a(Ll/bsu0;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p3}, Ll/xlu0;->h()Ll/ilu0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public final synthetic d(Ll/qru0;Lorg/json/JSONObject;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zfv0;->d:Ll/s8w0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/s8w0;->b(Ll/hpr;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "success"

    .line 11
    .line 12
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const-string p0, "json"

    .line 19
    .line 20
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "ads"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/ads/zzbrm;

    .line 36
    .line 37
    const-string p1, "process json failed"

    .line 38
    .line 39
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzbrm;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p0
.end method

.method public final synthetic e(Ll/q6w0;Ll/qru0;)Ll/hpr;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "isNonagon"

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    sget-object v1, Ll/sgs0;->w8:Ll/dgs0;

    .line 13
    .line 14
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lcom/google/android/gms/common/util/PlatformVersion;->isAtLeastR()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    const-string v1, "skipDeepLinkValidation"

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    .line 42
    .line 43
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object p1, p1, Ll/q6w0;->t:Ll/u6w0;

    .line 47
    .line 48
    iget-object p1, p1, Ll/u6w0;->c:Lorg/json/JSONObject;

    .line 49
    .line 50
    const-string v2, "response"

    .line 51
    .line 52
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    const-string p1, "sdk_params"

    .line 56
    .line 57
    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    const-string p1, "google.afma.nativeAds.preProcessJson"

    .line 61
    .line 62
    invoke-virtual {p2, p1, v1}, Ll/qru0;->d(Ljava/lang/String;Lorg/json/JSONObject;)Ll/hpr;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v0, Ll/vfv0;

    .line 67
    .line 68
    invoke-direct {v0, p0, p2}, Ll/vfv0;-><init>(Ll/zfv0;Ll/qru0;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/zfv0;->b:Ll/xvw0;

    .line 72
    .line 73
    invoke-static {p1, v0, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public final synthetic f(Ll/b7w0;Ll/q6w0;Lorg/json/JSONArray;)Ll/hpr;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance p0, Lcom/google/android/gms/internal/ads/zzead;

    .line 9
    .line 10
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 19
    .line 20
    iget-object v0, v0, Ll/y6w0;->a:Ll/o7w0;

    .line 21
    .line 22
    iget v0, v0, Ll/o7w0;->k:I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x1

    .line 26
    if-le v0, v3, :cond_3

    .line 27
    .line 28
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v3, p0, Ll/zfv0;->d:Ll/s8w0;

    .line 33
    .line 34
    iget-object v4, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 35
    .line 36
    iget-object v4, v4, Ll/y6w0;->a:Ll/o7w0;

    .line 37
    .line 38
    iget v4, v4, Ll/o7w0;->k:I

    .line 39
    .line 40
    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-virtual {v3, v4}, Ll/s8w0;->c(I)V

    .line 45
    .line 46
    .line 47
    new-instance v3, Ljava/util/ArrayList;

    .line 48
    .line 49
    iget-object v4, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 50
    .line 51
    iget-object v4, v4, Ll/y6w0;->a:Ll/o7w0;

    .line 52
    .line 53
    iget v4, v4, Ll/o7w0;->k:I

    .line 54
    .line 55
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget-object v4, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 59
    .line 60
    iget-object v4, v4, Ll/y6w0;->a:Ll/o7w0;

    .line 61
    .line 62
    iget v4, v4, Ll/o7w0;->k:I

    .line 63
    .line 64
    if-ge v2, v4, :cond_2

    .line 65
    .line 66
    if-ge v2, v0, :cond_1

    .line 67
    .line 68
    invoke-virtual {p3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {p0, p1, p2, v4}, Ll/zfv0;->g(Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)Ll/hpr;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    new-instance v4, Lcom/google/android/gms/internal/ads/zzead;

    .line 81
    .line 82
    invoke-direct {v4, v1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(I)V

    .line 83
    .line 84
    .line 85
    invoke-static {v4}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    invoke-static {v3}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_3
    invoke-virtual {p3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    invoke-virtual {p0, p1, p2, p3}, Ll/zfv0;->g(Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)Ll/hpr;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iget-object p0, p0, Ll/zfv0;->b:Ll/xvw0;

    .line 109
    .line 110
    sget-object p2, Ll/yfv0;->a:Ll/yfv0;

    .line 111
    .line 112
    invoke-static {p1, p2, p0}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0
.end method

.method public final g(Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)Ll/hpr;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/zfv0;->c:Ll/wou0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zfv0;->d:Ll/s8w0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/s8w0;->a()Ll/hpr;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    invoke-virtual {v0, p1, p2, p3}, Ll/wou0;->a(Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)Ll/hpr;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const/4 v0, 0x2

    .line 14
    new-array v0, v0, [Ll/hpr;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    aput-object v5, v0, v1

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    aput-object v4, v0, v1

    .line 21
    .line 22
    invoke-static {v0}, Ll/pvw0;->c([Ll/hpr;)Ll/ovw0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v2, Ll/ufv0;

    .line 27
    .line 28
    move-object v3, p0

    .line 29
    move-object v6, p1

    .line 30
    move-object v7, p2

    .line 31
    move-object v8, p3

    .line 32
    invoke-direct/range {v2 .. v8}, Ll/ufv0;-><init>(Ll/zfv0;Ll/hpr;Ll/hpr;Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, v3, Ll/zfv0;->b:Ll/xvw0;

    .line 36
    .line 37
    invoke-virtual {v0, v2, p0}, Ll/ovw0;->a(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method
