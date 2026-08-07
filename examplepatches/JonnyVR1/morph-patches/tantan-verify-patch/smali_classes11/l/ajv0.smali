.class public final Ll/ajv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcv0;


# instance fields
.field public final a:Ll/rcv0;

.field public final b:Ll/ucv0;

.field public final c:Ll/lcw0;

.field public final d:Ll/xvw0;


# direct methods
.method public constructor <init>(Ll/lcw0;Ll/xvw0;Ll/rcv0;Ll/ucv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ajv0;->c:Ll/lcw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ajv0;->d:Ll/xvw0;

    .line 7
    .line 8
    iput-object p4, p0, Ll/ajv0;->b:Ll/ucv0;

    .line 9
    .line 10
    iput-object p3, p0, Ll/ajv0;->a:Ll/rcv0;

    .line 11
    .line 12
    return-void
.end method

.method public static final e(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Error from: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ", code: "

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 0

    .line 1
    iget-object p0, p2, Ll/q6w0;->u:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

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
    .locals 6

    .line 1
    iget-object v0, p2, Ll/q6w0;->u:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :catch_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/String;

    .line 18
    .line 19
    :try_start_0
    iget-object v2, p0, Ll/ajv0;->a:Ll/rcv0;

    .line 20
    .line 21
    iget-object v3, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-interface {v2, v1, v3}, Ll/rcv0;->a(Ljava/lang/String;Lorg/json/JSONObject;)Ll/scv0;

    .line 24
    .line 25
    .line 26
    move-result-object v0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    if-nez v0, :cond_1

    .line 30
    .line 31
    new-instance p0, Lcom/google/android/gms/internal/ads/zzelp;

    .line 32
    .line 33
    const-string p1, "Unable to instantiate mediation adapter class."

    .line 34
    .line 35
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzelp;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    new-instance v1, Ll/tct0;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/tct0;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/ziv0;

    .line 49
    .line 50
    invoke-direct {v2, p0, v0, v1}, Ll/ziv0;-><init>(Ll/ajv0;Ll/scv0;Ll/tct0;)V

    .line 51
    .line 52
    .line 53
    iget-object v3, v0, Ll/scv0;->c:Ll/g8u0;

    .line 54
    .line 55
    invoke-interface {v3, v2}, Ll/g8u0;->P3(Ll/f8u0;)V

    .line 56
    .line 57
    .line 58
    iget-boolean v2, p2, Ll/q6w0;->N:Z

    .line 59
    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    iget-object v2, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 63
    .line 64
    iget-object v2, v2, Ll/y6w0;->a:Ll/o7w0;

    .line 65
    .line 66
    iget-object v2, v2, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/zzl;->zzm:Landroid/os/Bundle;

    .line 69
    .line 70
    const-class v3, Lcom/google/ads/mediation/admob/AdMobAdapter;

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    if-nez v4, :cond_2

    .line 81
    .line 82
    new-instance v4, Landroid/os/Bundle;

    .line 83
    .line 84
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    const-string v2, "render_test_ad_label"

    .line 95
    .line 96
    const/4 v3, 0x1

    .line 97
    invoke-virtual {v4, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 98
    .line 99
    .line 100
    :cond_3
    iget-object v2, p0, Ll/ajv0;->c:Ll/lcw0;

    .line 101
    .line 102
    sget-object v3, Lcom/google/android/gms/internal/ads/zzflg;->zzq:Lcom/google/android/gms/internal/ads/zzflg;

    .line 103
    .line 104
    new-instance v4, Ll/xiv0;

    .line 105
    .line 106
    invoke-direct {v4, p0, p1, p2, v0}, Ll/xiv0;-><init>(Ll/ajv0;Ll/b7w0;Ll/q6w0;Ll/scv0;)V

    .line 107
    .line 108
    .line 109
    iget-object v5, p0, Ll/ajv0;->d:Ll/xvw0;

    .line 110
    .line 111
    invoke-static {v4, v5, v3, v2}, Ll/rbw0;->d(Ll/lbw0;Ll/xvw0;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    sget-object v3, Lcom/google/android/gms/internal/ads/zzflg;->zzr:Lcom/google/android/gms/internal/ads/zzflg;

    .line 116
    .line 117
    invoke-virtual {v2, v3}, Ll/dcw0;->b(Ljava/lang/Object;)Ll/dcw0;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v2, v1}, Ll/dcw0;->d(Ll/hpr;)Ll/dcw0;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    sget-object v2, Lcom/google/android/gms/internal/ads/zzflg;->zzs:Lcom/google/android/gms/internal/ads/zzflg;

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Ll/dcw0;->b(Ljava/lang/Object;)Ll/dcw0;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    new-instance v2, Ll/yiv0;

    .line 132
    .line 133
    invoke-direct {v2, p0, p1, p2, v0}, Ll/yiv0;-><init>(Ll/ajv0;Ll/b7w0;Ll/q6w0;Ll/scv0;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1, v2}, Ll/dcw0;->e(Ll/kbw0;)Ll/dcw0;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Ll/dcw0;->a()Ll/mbw0;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0
.end method

.method public final synthetic c(Ll/b7w0;Ll/q6w0;Ll/scv0;Ljava/lang/Void;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ajv0;->b:Ll/ucv0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/ucv0;->a(Ll/b7w0;Ll/q6w0;Ll/scv0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic d(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ajv0;->b:Ll/ucv0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/ucv0;->b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
