.class public final Ll/s8t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w8t0;


# static fields
.field public static final m:Ljava/util/List;


# instance fields
.field public final a:Ll/bnx0;

.field public final b:Ljava/util/LinkedHashMap;

.field public final c:Ljava/util/List;

.field public final d:Ljava/util/List;

.field public final e:Landroid/content/Context;

.field public f:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final g:Lcom/google/android/gms/internal/ads/zzcbp;

.field public final h:Ljava/lang/Object;

.field public i:Ljava/util/HashSet;

.field public j:Z

.field public k:Z

.field public final l:Ll/t8t0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/s8t0;->m:Ljava/util/List;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Lcom/google/android/gms/internal/ads/zzcbp;Ljava/lang/String;Ll/t8t0;)V
    .locals 2
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s8t0;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/s8t0;->d:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 24
    .line 25
    new-instance v0, Ljava/util/HashSet;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/s8t0;->i:Ljava/util/HashSet;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Ll/s8t0;->j:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Ll/s8t0;->k:Z

    .line 36
    .line 37
    const-string v0, "SafeBrowsing config is not present."

    .line 38
    .line 39
    invoke-static {p3, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :cond_0
    iput-object p1, p0, Ll/s8t0;->e:Landroid/content/Context;

    .line 53
    .line 54
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 60
    .line 61
    iput-object p5, p0, Ll/s8t0;->l:Ll/t8t0;

    .line 62
    .line 63
    iput-object p3, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 64
    .line 65
    iget-object p1, p3, Lcom/google/android/gms/internal/ads/zzcbp;->zze:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result p3

    .line 75
    if-eqz p3, :cond_1

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    check-cast p3, Ljava/lang/String;

    .line 82
    .line 83
    iget-object p5, p0, Ll/s8t0;->i:Ljava/util/HashSet;

    .line 84
    .line 85
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 86
    .line 87
    invoke-virtual {p3, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-virtual {p5, p3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    iget-object p1, p0, Ll/s8t0;->i:Ljava/util/HashSet;

    .line 96
    .line 97
    const-string p3, "cookie"

    .line 98
    .line 99
    sget-object p5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 100
    .line 101
    invoke-virtual {p3, p5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    invoke-virtual {p1, p3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/google/android/gms/internal/ads/v6;->L()Ll/bnx0;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const/16 p3, 0x9

    .line 113
    .line 114
    invoke-virtual {p1, p3}, Ll/bnx0;->D(I)Ll/bnx0;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, p4}, Ll/bnx0;->z(Ljava/lang/String;)Ll/bnx0;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, p4}, Ll/bnx0;->x(Ljava/lang/String;)Ll/bnx0;

    .line 121
    .line 122
    .line 123
    invoke-static {}, Lcom/google/android/gms/internal/ads/d6;->L()Ll/cnx0;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    iget-object p4, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 128
    .line 129
    iget-object p4, p4, Lcom/google/android/gms/internal/ads/zzcbp;->zza:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz p4, :cond_2

    .line 132
    .line 133
    invoke-virtual {p3, p4}, Ll/cnx0;->q(Ljava/lang/String;)Ll/cnx0;

    .line 134
    .line 135
    .line 136
    :cond_2
    invoke-virtual {p3}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    check-cast p3, Lcom/google/android/gms/internal/ads/d6;

    .line 141
    .line 142
    invoke-virtual {p1, p3}, Ll/bnx0;->w(Lcom/google/android/gms/internal/ads/d6;)Ll/bnx0;

    .line 143
    .line 144
    .line 145
    invoke-static {}, Lcom/google/android/gms/internal/ads/s6;->L()Ll/gox0;

    .line 146
    .line 147
    .line 148
    move-result-object p3

    .line 149
    iget-object p4, p0, Ll/s8t0;->e:Landroid/content/Context;

    .line 150
    .line 151
    invoke-static {p4}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    .line 152
    .line 153
    .line 154
    move-result-object p4

    .line 155
    invoke-virtual {p4}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->isCallerInstantApp()Z

    .line 156
    .line 157
    .line 158
    move-result p4

    .line 159
    invoke-virtual {p3, p4}, Ll/gox0;->s(Z)Ll/gox0;

    .line 160
    .line 161
    .line 162
    iget-object p2, p2, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz p2, :cond_3

    .line 165
    .line 166
    invoke-virtual {p3, p2}, Ll/gox0;->q(Ljava/lang/String;)Ll/gox0;

    .line 167
    .line 168
    .line 169
    :cond_3
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    iget-object p4, p0, Ll/s8t0;->e:Landroid/content/Context;

    .line 174
    .line 175
    invoke-virtual {p2, p4}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getApkVersion(Landroid/content/Context;)I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    int-to-long p4, p2

    .line 180
    const-wide/16 v0, 0x0

    .line 181
    .line 182
    cmp-long p2, p4, v0

    .line 183
    .line 184
    if-lez p2, :cond_4

    .line 185
    .line 186
    invoke-virtual {p3, p4, p5}, Ll/gox0;->r(J)Ll/gox0;

    .line 187
    .line 188
    .line 189
    :cond_4
    invoke-virtual {p3}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    check-cast p2, Lcom/google/android/gms/internal/ads/s6;

    .line 194
    .line 195
    invoke-virtual {p1, p2}, Ll/bnx0;->v(Lcom/google/android/gms/internal/ads/s6;)Ll/bnx0;

    .line 196
    .line 197
    .line 198
    iput-object p1, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 199
    .line 200
    return-void
.end method

.method public static bridge synthetic d()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Ll/s8t0;->m:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final A(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    iget-object p0, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0}, Ll/bnx0;->t()Ll/bnx0;

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ll/bnx0;->u(Ljava/lang/String;)Ll/bnx0;

    .line 15
    .line 16
    .line 17
    :goto_0
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public final a(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/google/android/gms/internal/ads/zzcbp;->zzc:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_7

    .line 8
    .line 9
    :cond_0
    iget-boolean v0, p0, Ll/s8t0;->j:Z

    .line 10
    .line 11
    if-nez v0, :cond_8

    .line 12
    .line 13
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    goto :goto_6

    .line 21
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->isDrawingCacheEnabled()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    invoke-static {v3}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 35
    .line 36
    .line 37
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception v2

    .line 40
    goto :goto_1

    .line 41
    :cond_2
    move-object v3, v1

    .line 42
    :goto_0
    :try_start_1
    invoke-virtual {p1, v2}, Landroid/view/View;->setDrawingCacheEnabled(Z)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    .line 44
    .line 45
    goto :goto_3

    .line 46
    :catch_1
    move-exception v2

    .line 47
    goto :goto_2

    .line 48
    :goto_1
    move-object v3, v1

    .line 49
    :goto_2
    const-string v4, "Fail to capture the web view"

    .line 50
    .line 51
    invoke-static {v4, v2}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_3
    if-nez v3, :cond_5

    .line 55
    .line 56
    :try_start_2
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v2, :cond_4

    .line 65
    .line 66
    if-nez v3, :cond_3

    .line 67
    .line 68
    goto :goto_4

    .line 69
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    sget-object v6, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 78
    .line 79
    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    new-instance v5, Landroid/graphics/Canvas;

    .line 84
    .line 85
    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 86
    .line 87
    .line 88
    const/4 v6, 0x0

    .line 89
    invoke-virtual {p1, v6, v6, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, v5}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 93
    .line 94
    .line 95
    move-object v1, v4

    .line 96
    goto :goto_6

    .line 97
    :catch_2
    move-exception p1

    .line 98
    goto :goto_5

    .line 99
    :cond_4
    :goto_4
    const-string p1, "Width or height of view is zero"

    .line 100
    .line 101
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    .line 102
    .line 103
    .line 104
    goto :goto_6

    .line 105
    :goto_5
    const-string v2, "Fail to capture the webview"

    .line 106
    .line 107
    invoke-static {v2, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    goto :goto_6

    .line 111
    :cond_5
    move-object v1, v3

    .line 112
    :goto_6
    if-nez v1, :cond_6

    .line 113
    .line 114
    const-string p0, "Failed to capture the webview bitmap."

    .line 115
    .line 116
    invoke-static {p0}, Ll/v8t0;->a(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_6
    iput-boolean v0, p0, Ll/s8t0;->j:Z

    .line 121
    .line 122
    new-instance p1, Ll/o8t0;

    .line 123
    .line 124
    invoke-direct {p1, p0, v1}, Ll/o8t0;-><init>(Ll/s8t0;Landroid/graphics/Bitmap;)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    if-eq p0, v0, :cond_7

    .line 140
    .line 141
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_7
    sget-object p0, Ll/oct0;->a:Ll/xvw0;

    .line 146
    .line 147
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 148
    .line 149
    .line 150
    :cond_8
    :goto_7
    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/util/Map;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x3

    .line 5
    if-ne p3, v1, :cond_0

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    :try_start_0
    iput-boolean v2, p0, Ll/s8t0;->k:Z

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto/16 :goto_4

    .line 13
    .line 14
    :cond_0
    :goto_0
    iget-object v2, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 15
    .line 16
    invoke-virtual {v2, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_2

    .line 21
    .line 22
    if-ne p3, v1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/fox0;

    .line 31
    .line 32
    const/4 p1, 0x4

    .line 33
    invoke-virtual {p0, p1}, Ll/fox0;->u(I)Ll/fox0;

    .line 34
    .line 35
    .line 36
    :cond_1
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/ads/r6;->M()Ll/fox0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {p3}, Ll/eox0;->a(I)I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-eqz p3, :cond_3

    .line 47
    .line 48
    invoke-virtual {v1, p3}, Ll/fox0;->u(I)Ll/fox0;

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p3, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 52
    .line 53
    invoke-virtual {p3}, Ljava/util/AbstractMap;->size()I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    invoke-virtual {v1, p3}, Ll/fox0;->r(I)Ll/fox0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p1}, Ll/fox0;->t(Ljava/lang/String;)Ll/fox0;

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/google/android/gms/internal/ads/j6;->L()Ll/jnx0;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    iget-object v2, p0, Ll/s8t0;->i:Ljava/util/HashSet;

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/util/HashSet;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-nez v2, :cond_7

    .line 74
    .line 75
    if-eqz p2, :cond_7

    .line 76
    .line 77
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    :cond_4
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_7

    .line 90
    .line 91
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Ljava/util/Map$Entry;

    .line 96
    .line 97
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    if-eqz v3, :cond_5

    .line 102
    .line 103
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    const-string v3, ""

    .line 111
    .line 112
    :goto_2
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    if-eqz v4, :cond_6

    .line 117
    .line 118
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_6
    const-string v2, ""

    .line 126
    .line 127
    :goto_3
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 128
    .line 129
    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    iget-object v5, p0, Ll/s8t0;->i:Ljava/util/HashSet;

    .line 134
    .line 135
    invoke-virtual {v5, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-eqz v4, :cond_4

    .line 140
    .line 141
    invoke-static {}, Lcom/google/android/gms/internal/ads/h6;->L()Ll/inx0;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-static {v3}, Lcom/google/android/gms/internal/ads/zzgyl;->zzw(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzgyl;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-virtual {v4, v3}, Ll/inx0;->q(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/inx0;

    .line 150
    .line 151
    .line 152
    invoke-static {v2}, Lcom/google/android/gms/internal/ads/zzgyl;->zzw(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzgyl;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {v4, v2}, Ll/inx0;->r(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/inx0;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v4}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    check-cast v2, Lcom/google/android/gms/internal/ads/h6;

    .line 164
    .line 165
    invoke-virtual {p3, v2}, Ll/jnx0;->q(Lcom/google/android/gms/internal/ads/h6;)Ll/jnx0;

    .line 166
    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_7
    invoke-virtual {p3}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    check-cast p2, Lcom/google/android/gms/internal/ads/j6;

    .line 174
    .line 175
    invoke-virtual {v1, p2}, Ll/fox0;->s(Lcom/google/android/gms/internal/ads/j6;)Ll/fox0;

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 179
    .line 180
    invoke-virtual {p0, p1, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    monitor-exit v0

    .line 184
    return-void

    .line 185
    :goto_4
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    throw p0
.end method

.method public final synthetic c(Ljava/util/Map;)Ll/hpr;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    goto/16 :goto_3

    .line 5
    .line 6
    :cond_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_5

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/lang/String;

    .line 31
    .line 32
    new-instance v4, Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v3, "matches"

    .line 38
    .line 39
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    iget-object v4, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 46
    .line 47
    monitor-enter v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    :try_start_1
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    iget-object v6, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    :try_start_2
    iget-object v7, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 56
    .line 57
    invoke-virtual {v7, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    check-cast v7, Ll/fox0;

    .line 62
    .line 63
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 64
    if-nez v7, :cond_2

    .line 65
    .line 66
    :try_start_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v5, "Cannot find the corresponding resource object for "

    .line 72
    .line 73
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v2}, Ll/v8t0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    monitor-exit v4

    .line 87
    goto :goto_0

    .line 88
    :catchall_0
    move-exception p0

    .line 89
    goto :goto_2

    .line 90
    :cond_2
    const/4 v2, 0x0

    .line 91
    move v6, v2

    .line 92
    :goto_1
    if-ge v6, v5, :cond_3

    .line 93
    .line 94
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    move-result-object v8

    .line 98
    const-string v9, "threat_type"

    .line 99
    .line 100
    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    invoke-virtual {v7, v8}, Ll/fox0;->q(Ljava/lang/String;)Ll/fox0;

    .line 105
    .line 106
    .line 107
    add-int/lit8 v6, v6, 0x1

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    iget-boolean v3, p0, Ll/s8t0;->f:Z

    .line 111
    .line 112
    if-lez v5, :cond_4

    .line 113
    .line 114
    move v2, v0

    .line 115
    :cond_4
    or-int/2addr v2, v3

    .line 116
    iput-boolean v2, p0, Ll/s8t0;->f:Z

    .line 117
    .line 118
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 119
    goto :goto_0

    .line 120
    :catchall_1
    move-exception p0

    .line 121
    :try_start_4
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 122
    :try_start_5
    throw p0

    .line 123
    :goto_2
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 124
    :try_start_6
    throw p0

    .line 125
    :cond_5
    :goto_3
    iget-boolean p1, p0, Ll/s8t0;->f:Z

    .line 126
    .line 127
    if-eqz p1, :cond_6

    .line 128
    .line 129
    iget-object p1, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 130
    .line 131
    monitor-enter p1
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0

    .line 132
    :try_start_7
    iget-object v1, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 133
    .line 134
    const/16 v2, 0xa

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Ll/bnx0;->D(I)Ll/bnx0;

    .line 137
    .line 138
    .line 139
    monitor-exit p1

    .line 140
    goto :goto_4

    .line 141
    :catchall_2
    move-exception p0

    .line 142
    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 143
    :try_start_8
    throw p0

    .line 144
    :cond_6
    :goto_4
    iget-boolean p1, p0, Ll/s8t0;->f:Z

    .line 145
    .line 146
    const/4 v1, 0x0

    .line 147
    if-eqz p1, :cond_7

    .line 148
    .line 149
    iget-object v2, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 150
    .line 151
    iget-boolean v2, v2, Lcom/google/android/gms/internal/ads/zzcbp;->zzg:Z

    .line 152
    .line 153
    if-nez v2, :cond_9

    .line 154
    .line 155
    :cond_7
    iget-boolean v2, p0, Ll/s8t0;->k:Z

    .line 156
    .line 157
    if-eqz v2, :cond_8

    .line 158
    .line 159
    iget-object v2, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 160
    .line 161
    iget-boolean v2, v2, Lcom/google/android/gms/internal/ads/zzcbp;->zzf:Z

    .line 162
    .line 163
    if-nez v2, :cond_9

    .line 164
    .line 165
    :cond_8
    if-nez p1, :cond_e

    .line 166
    .line 167
    iget-object p1, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 168
    .line 169
    iget-boolean p1, p1, Lcom/google/android/gms/internal/ads/zzcbp;->zzd:Z

    .line 170
    .line 171
    if-eqz p1, :cond_e

    .line 172
    .line 173
    :cond_9
    iget-object p1, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 174
    .line 175
    monitor-enter p1
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_0

    .line 176
    :try_start_9
    iget-object v2, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    if-eqz v3, :cond_a

    .line 191
    .line 192
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    check-cast v3, Ll/fox0;

    .line 197
    .line 198
    iget-object v4, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 199
    .line 200
    invoke-virtual {v3}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    check-cast v3, Lcom/google/android/gms/internal/ads/r6;

    .line 205
    .line 206
    invoke-virtual {v4, v3}, Ll/bnx0;->s(Lcom/google/android/gms/internal/ads/r6;)Ll/bnx0;

    .line 207
    .line 208
    .line 209
    goto :goto_5

    .line 210
    :catchall_3
    move-exception p0

    .line 211
    goto/16 :goto_7

    .line 212
    .line 213
    :cond_a
    iget-object v2, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 214
    .line 215
    iget-object v3, p0, Ll/s8t0;->c:Ljava/util/List;

    .line 216
    .line 217
    invoke-virtual {v2, v3}, Ll/bnx0;->q(Ljava/lang/Iterable;)Ll/bnx0;

    .line 218
    .line 219
    .line 220
    iget-object v2, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 221
    .line 222
    iget-object v3, p0, Ll/s8t0;->d:Ljava/util/List;

    .line 223
    .line 224
    invoke-virtual {v2, v3}, Ll/bnx0;->r(Ljava/lang/Iterable;)Ll/bnx0;

    .line 225
    .line 226
    .line 227
    invoke-static {}, Ll/v8t0;->b()Z

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    if-eqz v2, :cond_c

    .line 232
    .line 233
    new-instance v2, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    iget-object v3, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 236
    .line 237
    invoke-virtual {v3}, Ll/bnx0;->B()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    iget-object v4, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 242
    .line 243
    invoke-virtual {v4}, Ll/bnx0;->A()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v4

    .line 247
    new-instance v5, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 250
    .line 251
    .line 252
    const-string v6, "Sending SB report\n  url: "

    .line 253
    .line 254
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v3, "\n  clickUrl: "

    .line 261
    .line 262
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    const-string v3, "\n  resources: \n"

    .line 269
    .line 270
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    iget-object v3, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 281
    .line 282
    invoke-virtual {v3}, Ll/bnx0;->C()Ljava/util/List;

    .line 283
    .line 284
    .line 285
    move-result-object v3

    .line 286
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 291
    .line 292
    .line 293
    move-result v4

    .line 294
    if-eqz v4, :cond_b

    .line 295
    .line 296
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v4

    .line 300
    check-cast v4, Lcom/google/android/gms/internal/ads/r6;

    .line 301
    .line 302
    const-string v5, "    ["

    .line 303
    .line 304
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v4}, Lcom/google/android/gms/internal/ads/r6;->L()I

    .line 308
    .line 309
    .line 310
    move-result v5

    .line 311
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string v5, "] "

    .line 315
    .line 316
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v4}, Lcom/google/android/gms/internal/ads/r6;->O()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    goto :goto_6

    .line 327
    :cond_b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-static {v2}, Ll/v8t0;->a(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    :cond_c
    iget-object v2, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 335
    .line 336
    invoke-virtual {v2}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    check-cast v2, Lcom/google/android/gms/internal/ads/v6;

    .line 341
    .line 342
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    iget-object v3, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 347
    .line 348
    iget-object v3, v3, Lcom/google/android/gms/internal/ads/zzcbp;->zzb:Ljava/lang/String;

    .line 349
    .line 350
    new-instance v4, Ll/bts0;

    .line 351
    .line 352
    iget-object p0, p0, Ll/s8t0;->e:Landroid/content/Context;

    .line 353
    .line 354
    invoke-direct {v4, p0}, Ll/bts0;-><init>(Landroid/content/Context;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v4, v0, v3, v1, v2}, Ll/bts0;->b(ILjava/lang/String;Ljava/util/Map;[B)Ll/hpr;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    invoke-static {}, Ll/v8t0;->b()Z

    .line 362
    .line 363
    .line 364
    move-result v0

    .line 365
    if-eqz v0, :cond_d

    .line 366
    .line 367
    sget-object v0, Ll/p8t0;->a:Ll/p8t0;

    .line 368
    .line 369
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 370
    .line 371
    invoke-interface {p0, v0, v1}, Ll/hpr;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 372
    .line 373
    .line 374
    :cond_d
    sget-object v0, Ll/q8t0;->a:Ll/q8t0;

    .line 375
    .line 376
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 377
    .line 378
    invoke-static {p0, v0, v1}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    monitor-exit p1

    .line 383
    return-object p0

    .line 384
    :goto_7
    monitor-exit p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 385
    :try_start_a
    throw p0

    .line 386
    :cond_e
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 387
    .line 388
    .line 389
    move-result-object p0
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_0

    .line 390
    return-object p0

    .line 391
    :catch_0
    move-exception p0

    .line 392
    sget-object p1, Ll/pjs0;->b:Ll/kis0;

    .line 393
    .line 394
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    check-cast p1, Ljava/lang/Boolean;

    .line 399
    .line 400
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 401
    .line 402
    .line 403
    move-result p1

    .line 404
    if-eqz p1, :cond_f

    .line 405
    .line 406
    const-string p1, "Failed to get SafeBrowsing metadata"

    .line 407
    .line 408
    invoke-static {p1, p0}, Ll/dct0;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 409
    .line 410
    .line 411
    :cond_f
    new-instance p0, Ljava/lang/Exception;

    .line 412
    .line 413
    const-string p1, "Safebrowsing report transmission failed."

    .line 414
    .line 415
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    return-object p0
.end method

.method public final synthetic e(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgyl;->zzt()Lcom/google/android/gms/internal/ads/i5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget-object p0, p0, Ll/s8t0;->a:Ll/bnx0;

    .line 15
    .line 16
    invoke-static {}, Lcom/google/android/gms/internal/ads/q6;->L()Ll/znx0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/i5;->m()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v1, v0}, Ll/znx0;->q(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/znx0;

    .line 25
    .line 26
    .line 27
    const-string v0, "image/png"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ll/znx0;->r(Ljava/lang/String;)Ll/znx0;

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x2

    .line 33
    invoke-virtual {v1, v0}, Ll/znx0;->s(I)Ll/znx0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/google/android/gms/internal/ads/q6;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/bnx0;->y(Lcom/google/android/gms/internal/ads/q6;)Ll/bnx0;

    .line 43
    .line 44
    .line 45
    monitor-exit p1

    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method public final zza()Lcom/google/android/gms/internal/ads/zzcbp;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zze()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/s8t0;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/s8t0;->b:Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    sget-object v1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/n8t0;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/n8t0;-><init>(Ll/s8t0;)V

    .line 18
    .line 19
    .line 20
    sget-object v3, Ll/oct0;->f:Ll/xvw0;

    .line 21
    .line 22
    invoke-static {v1, v2, v3}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 27
    .line 28
    sget-object v4, Ll/oct0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 29
    .line 30
    const-wide/16 v5, 0xa

    .line 31
    .line 32
    invoke-static {v1, v5, v6, v2, v4}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v4, Ll/r8t0;

    .line 37
    .line 38
    invoke-direct {v4, p0, v2}, Ll/r8t0;-><init>(Ll/s8t0;Ll/hpr;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v4, v3}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Ll/s8t0;->m:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    monitor-exit v0

    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0
.end method

.method public final zzi()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/common/util/PlatformVersion;->isAtLeastKitKat()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/s8t0;->g:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/google/android/gms/internal/ads/zzcbp;->zzc:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/s8t0;->j:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
