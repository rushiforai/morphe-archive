.class public final Ll/tzu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s6u0;
.implements Ll/x9u0;
.implements Ll/o8u0;


# instance fields
.field public final a:Ll/j0v0;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public d:I

.field public e:Lcom/google/android/gms/internal/ads/zzdyq;

.field public f:Ll/b6u0;

.field public g:Lcom/google/android/gms/ads/internal/client/zze;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Lorg/json/JSONObject;

.field public l:Z

.field public m:Z

.field public n:Z


# direct methods
.method public constructor <init>(Ll/j0v0;Ll/o7w0;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/tzu0;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/tzu0;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/tzu0;->j:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 13
    .line 14
    iput-object p3, p0, Ll/tzu0;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p1, p2, Ll/o7w0;->f:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p0, Ll/tzu0;->b:Ljava/lang/String;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Ll/tzu0;->d:I

    .line 22
    .line 23
    sget-object p1, Lcom/google/android/gms/internal/ads/zzdyq;->zza:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 24
    .line 25
    iput-object p1, p0, Ll/tzu0;->e:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 26
    .line 27
    return-void
.end method

.method public static f(Lcom/google/android/gms/ads/internal/client/zze;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
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
    const-string v1, "errorDomain"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zze;->zzc:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "errorCode"

    .line 14
    .line 15
    iget v2, p0, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "errorDescription"

    .line 21
    .line 22
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zze;->zzb:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zze;->zzd:Lcom/google/android/gms/ads/internal/client/zze;

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {p0}, Ll/tzu0;->f(Lcom/google/android/gms/ads/internal/client/zze;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_0
    const-string v1, "underlyingError"

    .line 38
    .line 39
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    return-object v0
.end method


# virtual methods
.method public final A(Ll/b7w0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j0v0;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/a7w0;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 23
    .line 24
    iget-object v0, v0, Ll/a7w0;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/q6w0;

    .line 31
    .line 32
    iget v0, v0, Ll/q6w0;->b:I

    .line 33
    .line 34
    iput v0, p0, Ll/tzu0;->d:I

    .line 35
    .line 36
    :cond_1
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 37
    .line 38
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 39
    .line 40
    iget-object v0, v0, Ll/t6w0;->k:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 49
    .line 50
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 51
    .line 52
    iget-object v0, v0, Ll/t6w0;->k:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v0, p0, Ll/tzu0;->h:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 57
    .line 58
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 59
    .line 60
    iget-object v0, v0, Ll/t6w0;->l:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 69
    .line 70
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 71
    .line 72
    iget-object v0, v0, Ll/t6w0;->l:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v0, p0, Ll/tzu0;->i:Ljava/lang/String;

    .line 75
    .line 76
    :cond_3
    sget-object v0, Ll/sgs0;->h9:Ll/dgs0;

    .line 77
    .line 78
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_9

    .line 93
    .line 94
    iget-object v0, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/j0v0;->r()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_4

    .line 101
    .line 102
    const/4 p1, 0x1

    .line 103
    iput-boolean p1, p0, Ll/tzu0;->n:Z

    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 107
    .line 108
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 109
    .line 110
    iget-object v0, v0, Ll/t6w0;->m:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_5

    .line 117
    .line 118
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 119
    .line 120
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 121
    .line 122
    iget-object v0, v0, Ll/t6w0;->m:Ljava/lang/String;

    .line 123
    .line 124
    iput-object v0, p0, Ll/tzu0;->j:Ljava/lang/String;

    .line 125
    .line 126
    :cond_5
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 127
    .line 128
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 129
    .line 130
    iget-object v0, v0, Ll/t6w0;->n:Lorg/json/JSONObject;

    .line 131
    .line 132
    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-lez v0, :cond_6

    .line 137
    .line 138
    iget-object p1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 139
    .line 140
    iget-object p1, p1, Ll/a7w0;->b:Ll/t6w0;

    .line 141
    .line 142
    iget-object p1, p1, Ll/t6w0;->n:Lorg/json/JSONObject;

    .line 143
    .line 144
    iput-object p1, p0, Ll/tzu0;->k:Lorg/json/JSONObject;

    .line 145
    .line 146
    :cond_6
    iget-object p1, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 147
    .line 148
    iget-object v0, p0, Ll/tzu0;->k:Lorg/json/JSONObject;

    .line 149
    .line 150
    if-eqz v0, :cond_7

    .line 151
    .line 152
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    :cond_7
    iget-object v0, p0, Ll/tzu0;->j:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_8

    .line 167
    .line 168
    iget-object p0, p0, Ll/tzu0;->j:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    add-int/2addr v1, p0

    .line 175
    :cond_8
    int-to-long v0, v1

    .line 176
    invoke-virtual {p1, v0, v1}, Ll/j0v0;->j(J)V

    .line 177
    .line 178
    .line 179
    :cond_9
    :goto_0
    return-void
.end method

.method public final R(Ll/kzt0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j0v0;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ll/kzt0;->d()Ll/b6u0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/tzu0;->f:Ll/b6u0;

    .line 15
    .line 16
    sget-object p1, Lcom/google/android/gms/internal/ads/zzdyq;->zzb:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 17
    .line 18
    iput-object p1, p0, Ll/tzu0;->e:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 19
    .line 20
    sget-object p1, Ll/sgs0;->l9:Ll/dgs0;

    .line 21
    .line 22
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 39
    .line 40
    iget-object v0, p0, Ll/tzu0;->b:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p1, v0, p0}, Ll/j0v0;->f(Ljava/lang/String;Ll/tzu0;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public final a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tzu0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
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
    const-string v1, "state"

    .line 7
    .line 8
    iget-object v2, p0, Ll/tzu0;->e:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    iget v1, p0, Ll/tzu0;->d:I

    .line 14
    .line 15
    invoke-static {v1}, Ll/q6w0;->a(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "format"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    sget-object v1, Ll/sgs0;->l9:Ll/dgs0;

    .line 25
    .line 26
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-boolean v1, p0, Ll/tzu0;->l:Z

    .line 43
    .line 44
    const-string v2, "isOutOfContext"

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    iget-boolean v1, p0, Ll/tzu0;->l:Z

    .line 50
    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    iget-boolean v1, p0, Ll/tzu0;->m:Z

    .line 54
    .line 55
    const-string v2, "shown"

    .line 56
    .line 57
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object v1, p0, Ll/tzu0;->f:Ll/b6u0;

    .line 61
    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Ll/tzu0;->g(Ll/b6u0;)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v1, p0, Ll/tzu0;->g:Lcom/google/android/gms/ads/internal/client/zze;

    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/client/zze;->zze:Landroid/os/IBinder;

    .line 75
    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    check-cast v1, Ll/b6u0;

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Ll/tzu0;->g(Ll/b6u0;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v1}, Ll/b6u0;->zzj()Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    new-instance v1, Lorg/json/JSONArray;

    .line 95
    .line 96
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/tzu0;->g:Lcom/google/android/gms/ads/internal/client/zze;

    .line 100
    .line 101
    invoke-static {p0}, Ll/tzu0;->f(Lcom/google/android/gms/ads/internal/client/zze;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v1, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 106
    .line 107
    .line 108
    const-string p0, "errors"

    .line 109
    .line 110
    invoke-virtual {v2, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    :cond_2
    move-object p0, v2

    .line 114
    :goto_0
    const-string v1, "responseInfo"

    .line 115
    .line 116
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    .line 118
    .line 119
    return-object v0
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/tzu0;->l:Z

    .line 3
    .line 4
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/tzu0;->m:Z

    .line 3
    .line 4
    return-void
.end method

.method public final e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tzu0;->e:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 2
    .line 3
    sget-object v0, Lcom/google/android/gms/internal/ads/zzdyq;->zza:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final g(Ll/b6u0;)Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
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
    const-string v1, "winningAdapterClassName"

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/b6u0;->zzg()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "responseSecsSinceEpoch"

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/b6u0;->zzc()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v1, "responseId"

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/b6u0;->zzi()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    sget-object v1, Ll/sgs0;->e9:Ll/dgs0;

    .line 34
    .line 35
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/b6u0;->zzd()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_0

    .line 60
    .line 61
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    const-string v3, "Bidding data: "

    .line 66
    .line 67
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    new-instance v2, Lorg/json/JSONObject;

    .line 75
    .line 76
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const-string v1, "biddingData"

    .line 80
    .line 81
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    .line 83
    .line 84
    :cond_0
    iget-object v1, p0, Ll/tzu0;->h:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_1

    .line 91
    .line 92
    iget-object v1, p0, Ll/tzu0;->h:Ljava/lang/String;

    .line 93
    .line 94
    const-string v2, "adRequestUrl"

    .line 95
    .line 96
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    :cond_1
    iget-object v1, p0, Ll/tzu0;->i:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Ll/tzu0;->i:Ljava/lang/String;

    .line 108
    .line 109
    const-string v2, "postBody"

    .line 110
    .line 111
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    :cond_2
    iget-object v1, p0, Ll/tzu0;->j:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-nez v1, :cond_3

    .line 121
    .line 122
    iget-object v1, p0, Ll/tzu0;->j:Ljava/lang/String;

    .line 123
    .line 124
    const-string v2, "adResponseBody"

    .line 125
    .line 126
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 127
    .line 128
    .line 129
    :cond_3
    iget-object v1, p0, Ll/tzu0;->k:Lorg/json/JSONObject;

    .line 130
    .line 131
    if-eqz v1, :cond_4

    .line 132
    .line 133
    const-string v2, "adResponseHeaders"

    .line 134
    .line 135
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    :cond_4
    sget-object v1, Ll/sgs0;->h9:Ll/dgs0;

    .line 139
    .line 140
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Ljava/lang/Boolean;

    .line 149
    .line 150
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_5

    .line 155
    .line 156
    iget-boolean p0, p0, Ll/tzu0;->n:Z

    .line 157
    .line 158
    const-string v1, "hasExceededMemoryLimit"

    .line 159
    .line 160
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 161
    .line 162
    .line 163
    :cond_5
    new-instance p0, Lorg/json/JSONArray;

    .line 164
    .line 165
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1}, Ll/b6u0;->zzj()Ljava/util/List;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    if-eqz v1, :cond_8

    .line 181
    .line 182
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    check-cast v1, Lcom/google/android/gms/ads/internal/client/zzu;

    .line 187
    .line 188
    new-instance v2, Lorg/json/JSONObject;

    .line 189
    .line 190
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 191
    .line 192
    .line 193
    iget-object v3, v1, Lcom/google/android/gms/ads/internal/client/zzu;->zza:Ljava/lang/String;

    .line 194
    .line 195
    const-string v4, "adapterClassName"

    .line 196
    .line 197
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 198
    .line 199
    .line 200
    iget-wide v3, v1, Lcom/google/android/gms/ads/internal/client/zzu;->zzb:J

    .line 201
    .line 202
    const-string v5, "latencyMillis"

    .line 203
    .line 204
    invoke-virtual {v2, v5, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 205
    .line 206
    .line 207
    sget-object v3, Ll/sgs0;->f9:Ll/dgs0;

    .line 208
    .line 209
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    check-cast v3, Ljava/lang/Boolean;

    .line 218
    .line 219
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    if-eqz v3, :cond_6

    .line 224
    .line 225
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    iget-object v4, v1, Lcom/google/android/gms/ads/internal/client/zzu;->zzd:Landroid/os/Bundle;

    .line 230
    .line 231
    invoke-virtual {v3, v4}, Ll/obt0;->j(Landroid/os/Bundle;)Lorg/json/JSONObject;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    const-string v4, "credentials"

    .line 236
    .line 237
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 238
    .line 239
    .line 240
    :cond_6
    iget-object v1, v1, Lcom/google/android/gms/ads/internal/client/zzu;->zzc:Lcom/google/android/gms/ads/internal/client/zze;

    .line 241
    .line 242
    if-nez v1, :cond_7

    .line 243
    .line 244
    const/4 v1, 0x0

    .line 245
    goto :goto_1

    .line 246
    :cond_7
    invoke-static {v1}, Ll/tzu0;->f(Lcom/google/android/gms/ads/internal/client/zze;)Lorg/json/JSONObject;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    :goto_1
    const-string v3, "error"

    .line 251
    .line 252
    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 256
    .line 257
    .line 258
    goto :goto_0

    .line 259
    :cond_8
    const-string p1, "adNetworks"

    .line 260
    .line 261
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 262
    .line 263
    .line 264
    return-object v0
.end method

.method public final u(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j0v0;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/ads/zzdyq;->zzc:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 11
    .line 12
    iput-object v0, p0, Ll/tzu0;->e:Lcom/google/android/gms/internal/ads/zzdyq;

    .line 13
    .line 14
    iput-object p1, p0, Ll/tzu0;->g:Lcom/google/android/gms/ads/internal/client/zze;

    .line 15
    .line 16
    sget-object p1, Ll/sgs0;->l9:Ll/dgs0;

    .line 17
    .line 18
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 35
    .line 36
    iget-object v0, p0, Ll/tzu0;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, v0, p0}, Ll/j0v0;->f(Ljava/lang/String;Ll/tzu0;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public final x(Lcom/google/android/gms/internal/ads/zzbze;)V
    .locals 1

    .line 1
    sget-object p1, Ll/sgs0;->l9:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/j0v0;->p()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/tzu0;->a:Ll/j0v0;

    .line 28
    .line 29
    iget-object v0, p0, Ll/tzu0;->b:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, v0, p0}, Ll/j0v0;->f(Ljava/lang/String;Ll/tzu0;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
