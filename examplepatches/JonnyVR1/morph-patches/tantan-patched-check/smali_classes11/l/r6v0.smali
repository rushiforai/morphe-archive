.class public final Ll/r6v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/v9u0;

.field public final b:Ll/u5v0;

.field public final c:Ll/lcw0;

.field public final d:Ll/o7w0;

.field public final e:Lcom/google/android/gms/internal/ads/zzcei;

.field public final f:Ll/hew0;

.field public final g:Ll/cew0;

.field public final h:Landroid/content/Context;

.field public final i:Ll/xvw0;

.field public j:Ll/hpr;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/v9u0;Ll/u5v0;Ll/lcw0;Ll/o7w0;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;Ll/cew0;Landroid/content/Context;Ll/xvw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r6v0;->a:Ll/v9u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/r6v0;->b:Ll/u5v0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r6v0;->c:Ll/lcw0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/r6v0;->d:Ll/o7w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/r6v0;->e:Lcom/google/android/gms/internal/ads/zzcei;

    .line 13
    .line 14
    iput-object p6, p0, Ll/r6v0;->f:Ll/hew0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/r6v0;->g:Ll/cew0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/r6v0;->h:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p9, p0, Ll/r6v0;->i:Ll/xvw0;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic b(Ll/r6v0;)Ll/v9u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r6v0;->a:Ll/v9u0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final synthetic a(Lcom/google/android/gms/internal/ads/zzbze;Ll/g8v0;)Lcom/google/android/gms/internal/ads/zzbym;
    .locals 10

    .line 1
    iget-object v0, p2, Ll/g8v0;->c:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "Content-Type"

    .line 4
    .line 5
    iget-object v2, p2, Ll/g8v0;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzb:Lcom/google/android/gms/internal/ads/zzcei;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p0, p0, Ll/r6v0;->h:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1}, Lcom/google/android/gms/ads/internal/util/b;->E(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object v0, p2, Ll/g8v0;->c:Ljava/util/Map;

    .line 25
    .line 26
    const-string v1, "User-Agent"

    .line 27
    .line 28
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v2, Lcom/google/android/gms/internal/ads/zzbym;

    .line 32
    .line 33
    new-instance v5, Landroid/os/Bundle;

    .line 34
    .line 35
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object p0, p2, Ll/g8v0;->c:Ljava/util/Map;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/util/Map$Entry;

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ljava/lang/String;

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v5, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget v4, p2, Ll/g8v0;->b:I

    .line 77
    .line 78
    iget-object v3, p2, Ll/g8v0;->a:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v6, p2, Ll/g8v0;->d:[B

    .line 81
    .line 82
    iget-boolean v7, p2, Ll/g8v0;->f:Z

    .line 83
    .line 84
    iget-object v8, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzd:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v9, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzh:Ljava/lang/String;

    .line 87
    .line 88
    invoke-direct/range {v2 .. v9}, Lcom/google/android/gms/internal/ads/zzbym;-><init>(Ljava/lang/String;ILandroid/os/Bundle;[BZLjava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-object v2
.end method

.method public final c(Lcom/google/android/gms/internal/ads/zzbze;Lorg/json/JSONObject;Ll/s4t0;)Ll/hpr;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/r6v0;->a:Ll/v9u0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/v9u0;->x(Lcom/google/android/gms/internal/ads/zzbze;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/r6v0;->h:Landroid/content/Context;

    .line 7
    .line 8
    const/16 v1, 0x9

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/q8v0;

    .line 15
    .line 16
    iget-object v2, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzg:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v3, p0, Ll/r6v0;->g:Ll/cew0;

    .line 19
    .line 20
    invoke-direct {v1, v2, v3, v0}, Ll/q8v0;-><init>(Ljava/lang/String;Ll/cew0;Ll/rdw0;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/google/android/gms/internal/ads/zzflg;->zzh:Lcom/google/android/gms/internal/ads/zzflg;

    .line 24
    .line 25
    new-instance v2, Ll/p8v0;

    .line 26
    .line 27
    invoke-direct {v2, p2, p3}, Ll/p8v0;-><init>(Lorg/json/JSONObject;Ll/s4t0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v2}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v3, p0, Ll/r6v0;->c:Ll/lcw0;

    .line 35
    .line 36
    invoke-virtual {v3, v0, v2}, Ll/ecw0;->b(Ljava/lang/Object;Ll/hpr;)Ll/dcw0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, v1}, Ll/dcw0;->e(Ll/kbw0;)Ll/dcw0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/dcw0;->a()Ll/mbw0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/n6v0;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/n6v0;-><init>(Ll/r6v0;Lcom/google/android/gms/internal/ads/zzbze;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/r6v0;->i:Ll/xvw0;

    .line 54
    .line 55
    invoke-static {v0, v1, p1}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object v0, p0, Ll/r6v0;->c:Ll/lcw0;

    .line 60
    .line 61
    sget-object v1, Lcom/google/android/gms/internal/ads/zzflg;->zzj:Lcom/google/android/gms/internal/ads/zzflg;

    .line 62
    .line 63
    invoke-virtual {v0, v1, p1}, Ll/ecw0;->b(Ljava/lang/Object;Ll/hpr;)Ll/dcw0;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v0, p0, Ll/r6v0;->b:Ll/u5v0;

    .line 68
    .line 69
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    new-instance v1, Ll/o6v0;

    .line 73
    .line 74
    invoke-direct {v1, v0}, Ll/o6v0;-><init>(Ll/u5v0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v1}, Ll/dcw0;->f(Ll/xuw0;)Ll/dcw0;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ll/dcw0;->a()Ll/mbw0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Ll/r6v0;->j:Ll/hpr;

    .line 86
    .line 87
    invoke-static {}, Ll/bxy0;->h()Ll/fvs0;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v1, p0, Ll/r6v0;->h:Landroid/content/Context;

    .line 92
    .line 93
    iget-object v2, p0, Ll/r6v0;->e:Lcom/google/android/gms/internal/ads/zzcei;

    .line 94
    .line 95
    iget-object v3, p0, Ll/r6v0;->f:Ll/hew0;

    .line 96
    .line 97
    invoke-virtual {v0, v1, v2, v3}, Ll/fvs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;)Ll/ovs0;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget-object v1, Ll/t7v0;->d:Ll/hvs0;

    .line 102
    .line 103
    sget-object v2, Ll/lvs0;->c:Ll/gvs0;

    .line 104
    .line 105
    const-string v3, "google.afma.response.normalize"

    .line 106
    .line 107
    invoke-virtual {v0, v3, v1, v2}, Ll/ovs0;->a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/evs0;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v1, p0, Ll/r6v0;->c:Ll/lcw0;

    .line 112
    .line 113
    sget-object v2, Lcom/google/android/gms/internal/ads/zzflg;->zzk:Lcom/google/android/gms/internal/ads/zzflg;

    .line 114
    .line 115
    invoke-virtual {v1, v2, p1}, Ll/ecw0;->b(Ljava/lang/Object;Ll/hpr;)Ll/dcw0;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    new-instance v1, Ll/m6v0;

    .line 120
    .line 121
    invoke-direct {v1, p2, p3}, Ll/m6v0;-><init>(Lorg/json/JSONObject;Ll/s4t0;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v1}, Ll/dcw0;->e(Ll/kbw0;)Ll/dcw0;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1, v0}, Ll/dcw0;->f(Ll/xuw0;)Ll/dcw0;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1}, Ll/dcw0;->a()Ll/mbw0;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    new-instance p2, Ll/p6v0;

    .line 137
    .line 138
    invoke-direct {p2, p0}, Ll/p6v0;-><init>(Ll/r6v0;)V

    .line 139
    .line 140
    .line 141
    iget-object p3, p0, Ll/r6v0;->i:Ll/xvw0;

    .line 142
    .line 143
    invoke-static {p1, p2, p3}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    new-instance p2, Ll/q6v0;

    .line 148
    .line 149
    invoke-direct {p2, p0}, Ll/q6v0;-><init>(Ll/r6v0;)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/r6v0;->i:Ll/xvw0;

    .line 153
    .line 154
    invoke-static {p1, p2, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 155
    .line 156
    .line 157
    return-object p1
.end method

.method public final synthetic d(Ljava/io/InputStream;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b7w0;

    .line 2
    .line 3
    new-instance v1, Ll/y6w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/r6v0;->d:Ll/o7w0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/y6w0;-><init>(Ll/o7w0;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ljava/io/InputStreamReader;

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/a7w0;->a(Ljava/io/Reader;)Ll/a7w0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, v1, p0}, Ll/b7w0;-><init>(Ll/y6w0;Ll/a7w0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
