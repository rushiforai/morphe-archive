.class public final Ll/ghw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fgw0;


# static fields
.field public static final i:Ll/ghw0;

.field public static final j:Landroid/os/Handler;

.field public static k:Landroid/os/Handler;

.field public static final l:Ljava/lang/Runnable;

.field public static final m:Ljava/lang/Runnable;


# instance fields
.field public final a:Ljava/util/List;

.field public b:I

.field public c:Z

.field public final d:Ljava/util/List;

.field public final e:Ll/hgw0;

.field public final f:Ll/wgw0;

.field public final g:Ll/xgw0;

.field public h:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/ghw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ghw0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ghw0;->i:Ll/ghw0;

    .line 7
    .line 8
    new-instance v0, Landroid/os/Handler;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/ghw0;->j:Landroid/os/Handler;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    sput-object v0, Ll/ghw0;->k:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v0, Ll/zgw0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/zgw0;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/ghw0;->l:Ljava/lang/Runnable;

    .line 28
    .line 29
    new-instance v0, Ll/dhw0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/dhw0;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/ghw0;->m:Ljava/lang/Runnable;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>()V
    .locals 2

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
    iput-object v0, p0, Ll/ghw0;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/ghw0;->c:Z

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/ghw0;->d:Ljava/util/List;

    .line 20
    .line 21
    new-instance v0, Ll/wgw0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/wgw0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 27
    .line 28
    new-instance v0, Ll/hgw0;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/hgw0;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/ghw0;->e:Ll/hgw0;

    .line 34
    .line 35
    new-instance v0, Ll/xgw0;

    .line 36
    .line 37
    new-instance v1, Ll/jhw0;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/jhw0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-direct {v0, v1}, Ll/xgw0;-><init>(Ll/jhw0;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/ghw0;->g:Ll/xgw0;

    .line 46
    .line 47
    return-void
.end method

.method public static bridge synthetic b()Landroid/os/Handler;
    .locals 1

    .line 1
    sget-object v0, Ll/ghw0;->k:Landroid/os/Handler;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic c(Ll/ghw0;)Ll/xgw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ghw0;->g:Ll/xgw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static d()Ll/ghw0;
    .locals 1

    .line 1
    sget-object v0, Ll/ghw0;->i:Ll/ghw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic e()Ljava/lang/Runnable;
    .locals 1

    .line 1
    sget-object v0, Ll/ghw0;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic f()Ljava/lang/Runnable;
    .locals 1

    .line 1
    sget-object v0, Ll/ghw0;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic g(Ll/ghw0;)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/ghw0;->b:I

    .line 3
    .line 4
    iget-object v1, p0, Ll/ghw0;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iput-boolean v0, p0, Ll/ghw0;->c:Z

    .line 10
    .line 11
    invoke-static {}, Ll/tfw0;->a()Ll/tfw0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/tfw0;->b()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/kfw0;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    iput-wide v0, p0, Ll/ghw0;->h:J

    .line 41
    .line 42
    iget-object v0, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/wgw0;->i()V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    iget-object v0, p0, Ll/ghw0;->e:Ll/hgw0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/hgw0;->a()Ll/ggw0;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    iget-object v0, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/wgw0;->e()Ljava/util/HashSet;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v3, 0x0

    .line 68
    if-lez v0, :cond_2

    .line 69
    .line 70
    iget-object v0, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/wgw0;->e()Ljava/util/HashSet;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    move-object v6, v0

    .line 91
    check-cast v6, Ljava/lang/String;

    .line 92
    .line 93
    invoke-interface {v5, v3}, Ll/ggw0;->a(Landroid/view/View;)Lorg/json/JSONObject;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    iget-object v0, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 98
    .line 99
    invoke-virtual {v0, v6}, Ll/wgw0;->a(Ljava/lang/String;)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v8, p0, Ll/ghw0;->e:Ll/hgw0;

    .line 104
    .line 105
    invoke-virtual {v8}, Ll/hgw0;->b()Ll/ggw0;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    iget-object v9, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 110
    .line 111
    invoke-virtual {v9, v6}, Ll/wgw0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    if-eqz v9, :cond_1

    .line 116
    .line 117
    invoke-interface {v8, v0}, Ll/ggw0;->a(Landroid/view/View;)Lorg/json/JSONObject;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    invoke-static {v8, v6}, Ll/qgw0;->b(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :try_start_0
    const-string v0, "notVisibleReason"

    .line 125
    .line 126
    invoke-virtual {v8, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :catch_0
    move-exception v0

    .line 131
    const-string v9, "Error with setting not visible reason"

    .line 132
    .line 133
    invoke-static {v9, v0}, Ll/rgw0;->a(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 134
    .line 135
    .line 136
    :goto_2
    invoke-static {v7, v8}, Ll/qgw0;->c(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 137
    .line 138
    .line 139
    :cond_1
    invoke-static {v7}, Ll/qgw0;->f(Lorg/json/JSONObject;)V

    .line 140
    .line 141
    .line 142
    new-instance v0, Ljava/util/HashSet;

    .line 143
    .line 144
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    iget-object v6, p0, Ll/ghw0;->g:Ll/xgw0;

    .line 151
    .line 152
    invoke-virtual {v6, v7, v0, v1, v2}, Ll/xgw0;->c(Lorg/json/JSONObject;Ljava/util/HashSet;J)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_2
    iget-object v0, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 157
    .line 158
    invoke-virtual {v0}, Ll/wgw0;->f()Ljava/util/HashSet;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-lez v0, :cond_3

    .line 167
    .line 168
    invoke-interface {v5, v3}, Ll/ggw0;->a(Landroid/view/View;)Lorg/json/JSONObject;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    const/4 v7, 0x1

    .line 173
    const/4 v8, 0x0

    .line 174
    const/4 v4, 0x0

    .line 175
    move-object v3, p0

    .line 176
    invoke-virtual/range {v3 .. v8}, Ll/ghw0;->k(Landroid/view/View;Ll/ggw0;Lorg/json/JSONObject;IZ)V

    .line 177
    .line 178
    .line 179
    invoke-static {v6}, Ll/qgw0;->f(Lorg/json/JSONObject;)V

    .line 180
    .line 181
    .line 182
    iget-object p0, v3, Ll/ghw0;->g:Ll/xgw0;

    .line 183
    .line 184
    iget-object v0, v3, Ll/ghw0;->f:Ll/wgw0;

    .line 185
    .line 186
    invoke-virtual {v0}, Ll/wgw0;->f()Ljava/util/HashSet;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {p0, v6, v0, v1, v2}, Ll/xgw0;->d(Lorg/json/JSONObject;Ljava/util/HashSet;J)V

    .line 191
    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_3
    move-object v3, p0

    .line 195
    iget-object p0, v3, Ll/ghw0;->g:Ll/xgw0;

    .line 196
    .line 197
    invoke-virtual {p0}, Ll/xgw0;->b()V

    .line 198
    .line 199
    .line 200
    :goto_3
    iget-object p0, v3, Ll/ghw0;->f:Ll/wgw0;

    .line 201
    .line 202
    invoke-virtual {p0}, Ll/wgw0;->g()V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 206
    .line 207
    .line 208
    iget-object p0, v3, Ll/ghw0;->a:Ljava/util/List;

    .line 209
    .line 210
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 211
    .line 212
    .line 213
    move-result p0

    .line 214
    if-lez p0, :cond_5

    .line 215
    .line 216
    iget-object p0, v3, Ll/ghw0;->a:Ljava/util/List;

    .line 217
    .line 218
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    :cond_4
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_5

    .line 227
    .line 228
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    check-cast v0, Ll/fhw0;

    .line 233
    .line 234
    invoke-interface {v0}, Ll/fhw0;->zzb()V

    .line 235
    .line 236
    .line 237
    instance-of v1, v0, Ll/ehw0;

    .line 238
    .line 239
    if-eqz v1, :cond_4

    .line 240
    .line 241
    check-cast v0, Ll/ehw0;

    .line 242
    .line 243
    invoke-interface {v0}, Ll/ehw0;->zza()V

    .line 244
    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_5
    return-void
.end method

.method public static final l()V
    .locals 2

    .line 1
    sget-object v0, Ll/ghw0;->k:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/ghw0;->m:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sput-object v0, Ll/ghw0;->k:Landroid/os/Handler;

    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Ll/ggw0;Lorg/json/JSONObject;Z)V
    .locals 9

    .line 1
    invoke-static {p1}, Ll/ugw0;->a(Landroid/view/View;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_6

    .line 6
    .line 7
    iget-object v0, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/wgw0;->k(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    const/4 v0, 0x3

    .line 14
    if-ne v5, v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_6

    .line 17
    .line 18
    :cond_0
    invoke-interface {p2, p1}, Ll/ggw0;->a(Landroid/view/View;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-static {p3, v4}, Ll/qgw0;->c(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 23
    .line 24
    .line 25
    iget-object p3, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 26
    .line 27
    invoke-virtual {p3, p1}, Ll/wgw0;->d(Landroid/view/View;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    const/4 v7, 0x1

    .line 32
    if-eqz p3, :cond_1

    .line 33
    .line 34
    invoke-static {v4, p3}, Ll/qgw0;->b(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 38
    .line 39
    invoke-virtual {p2, p1}, Ll/wgw0;->j(Landroid/view/View;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :try_start_0
    const-string p2, "hasWindowFocus"

    .line 48
    .line 49
    invoke-virtual {v4, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    .line 54
    move-object p1, v0

    .line 55
    const-string p2, "Error with setting has window focus"

    .line 56
    .line 57
    invoke-static {p2, p1}, Ll/rgw0;->a(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p1, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/wgw0;->h()V

    .line 63
    .line 64
    .line 65
    move-object v1, p0

    .line 66
    goto/16 :goto_5

    .line 67
    .line 68
    :cond_1
    iget-object p3, p0, Ll/ghw0;->f:Ll/wgw0;

    .line 69
    .line 70
    invoke-virtual {p3, p1}, Ll/wgw0;->b(Landroid/view/View;)Ll/vgw0;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    const/4 v1, 0x0

    .line 75
    if-eqz p3, :cond_3

    .line 76
    .line 77
    invoke-virtual {p3}, Ll/vgw0;->a()Ll/wfw0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v2, Lorg/json/JSONArray;

    .line 82
    .line 83
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p3}, Ll/vgw0;->b()Ljava/util/ArrayList;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    move v6, v1

    .line 95
    :goto_1
    if-ge v6, v3, :cond_2

    .line 96
    .line 97
    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    check-cast v8, Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v2, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 104
    .line 105
    .line 106
    add-int/lit8 v6, v6, 0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    :try_start_1
    const-string p3, "isFriendlyObstructionFor"

    .line 110
    .line 111
    invoke-virtual {v4, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    const-string p3, "friendlyObstructionClass"

    .line 115
    .line 116
    invoke-virtual {v0}, Ll/wfw0;->d()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v4, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    const-string p3, "friendlyObstructionPurpose"

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/wfw0;->a()Lcom/google/android/gms/internal/ads/zzfok;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v4, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    const-string p3, "friendlyObstructionReason"

    .line 133
    .line 134
    invoke-virtual {v0}, Ll/wfw0;->c()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v4, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 139
    .line 140
    .line 141
    :goto_2
    move p3, v7

    .line 142
    goto :goto_3

    .line 143
    :catch_1
    move-exception v0

    .line 144
    move-object p3, v0

    .line 145
    const-string v0, "Error with setting friendly obstruction"

    .line 146
    .line 147
    invoke-static {v0, p3}, Ll/rgw0;->a(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_3
    move p3, v1

    .line 152
    :goto_3
    if-nez p4, :cond_4

    .line 153
    .line 154
    if-eqz p3, :cond_5

    .line 155
    .line 156
    :cond_4
    move-object v1, p0

    .line 157
    move-object v2, p1

    .line 158
    move-object v3, p2

    .line 159
    move v6, v7

    .line 160
    goto :goto_4

    .line 161
    :cond_5
    move-object v2, p1

    .line 162
    move-object v3, p2

    .line 163
    move v6, v1

    .line 164
    move-object v1, p0

    .line 165
    :goto_4
    invoke-virtual/range {v1 .. v6}, Ll/ghw0;->k(Landroid/view/View;Ll/ggw0;Lorg/json/JSONObject;IZ)V

    .line 166
    .line 167
    .line 168
    :goto_5
    iget p0, v1, Ll/ghw0;->b:I

    .line 169
    .line 170
    add-int/2addr p0, v7

    .line 171
    iput p0, v1, Ll/ghw0;->b:I

    .line 172
    .line 173
    :cond_6
    :goto_6
    return-void
.end method

.method public final h()V
    .locals 0

    .line 1
    invoke-static {}, Ll/ghw0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    sget-object p0, Ll/ghw0;->k:Landroid/os/Handler;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroid/os/Handler;

    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 12
    .line 13
    .line 14
    sput-object p0, Ll/ghw0;->k:Landroid/os/Handler;

    .line 15
    .line 16
    sget-object v0, Ll/ghw0;->l:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    sget-object p0, Ll/ghw0;->k:Landroid/os/Handler;

    .line 22
    .line 23
    sget-object v0, Ll/ghw0;->m:Ljava/lang/Runnable;

    .line 24
    .line 25
    const-wide/16 v1, 0xc8

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    invoke-static {}, Ll/ghw0;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ghw0;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/ghw0;->j:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Ll/ygw0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ygw0;-><init>(Ll/ghw0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final k(Landroid/view/View;Ll/ggw0;Lorg/json/JSONObject;IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p4, v0, :cond_0

    .line 3
    .line 4
    :goto_0
    move-object p4, p3

    .line 5
    move-object p3, p0

    .line 6
    move-object p0, p2

    .line 7
    move-object p2, p4

    .line 8
    move p4, v0

    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    goto :goto_0

    .line 12
    :goto_1
    invoke-interface/range {p0 .. p5}, Ll/ggw0;->b(Landroid/view/View;Lorg/json/JSONObject;Ll/fgw0;ZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
