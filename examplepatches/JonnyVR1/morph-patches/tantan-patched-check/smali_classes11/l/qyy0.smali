.class public final Ll/qyy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/app/Application;

.field public final b:Landroid/os/Handler;

.field public final c:Ljava/util/concurrent/Executor;

.field public final d:Ll/tqr0;

.field public final e:Ll/ols0;

.field public final f:Ll/c9y0;

.field public final g:Ll/l3z0;

.field public final h:Ll/m1v0;


# direct methods
.method public constructor <init>(Landroid/app/Application;Ll/hcr0;Landroid/os/Handler;Ljava/util/concurrent/Executor;Ll/tqr0;Ll/ols0;Ll/c9y0;Ll/l3z0;Ll/m1v0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qyy0;->a:Landroid/app/Application;

    .line 5
    .line 6
    iput-object p3, p0, Ll/qyy0;->b:Landroid/os/Handler;

    .line 7
    .line 8
    iput-object p4, p0, Ll/qyy0;->c:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    iput-object p5, p0, Ll/qyy0;->d:Ll/tqr0;

    .line 11
    .line 12
    iput-object p6, p0, Ll/qyy0;->e:Ll/ols0;

    .line 13
    .line 14
    iput-object p7, p0, Ll/qyy0;->f:Ll/c9y0;

    .line 15
    .line 16
    iput-object p8, p0, Ll/qyy0;->g:Ll/l3z0;

    .line 17
    .line 18
    iput-object p9, p0, Ll/qyy0;->h:Ll/m1v0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final synthetic a(Lcom/google/android/ump/ConsentInformation$b;Ll/n6z0;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/psy0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/psy0;-><init>(Lcom/google/android/ump/ConsentInformation$b;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/qyy0;->b:Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    iget-object p1, p2, Ll/n6z0;->b:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 15
    .line 16
    sget-object p2, Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;->NOT_REQUIRED:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 17
    .line 18
    if-eq p1, p2, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/qyy0;->e:Ll/ols0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ols0;->c()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic b(Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p2}, Ll/wx5;->a()Ll/ux5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ux5;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :catch_1
    move-exception p1

    .line 17
    goto :goto_2

    .line 18
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/qyy0;->a:Landroid/app/Application;

    .line 19
    .line 20
    invoke-static {v0}, Ll/bht0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Ll/qyy0;->f:Ll/c9y0;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Ll/c9y0;->c(Landroid/app/Activity;Ll/wx5;)Ll/cdt0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/qyy0;->d(Ll/cdt0;)Ll/sft0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p2, p0, Ll/qyy0;->g:Ll/l3z0;

    .line 34
    .line 35
    new-instance v0, Ll/v1z0;

    .line 36
    .line 37
    invoke-direct {v0, p2, p1}, Ll/v1z0;-><init>(Ll/l3z0;Ll/sft0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/v1z0;->a()Ll/n6z0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p2, p0, Ll/qyy0;->d:Ll/tqr0;

    .line 45
    .line 46
    iget v0, p1, Ll/n6z0;->a:I

    .line 47
    .line 48
    invoke-virtual {p2, v0}, Ll/tqr0;->e(I)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Ll/qyy0;->d:Ll/tqr0;

    .line 52
    .line 53
    iget-object v0, p1, Ll/n6z0;->b:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Ll/tqr0;->g(Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/qyy0;->e:Ll/ols0;

    .line 59
    .line 60
    iget-object v0, p1, Ll/n6z0;->c:Ll/eos0;

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Ll/ols0;->d(Ll/eos0;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Ll/qyy0;->h:Ll/m1v0;

    .line 66
    .line 67
    invoke-virtual {p2}, Ll/m1v0;->a()Ljava/util/concurrent/Executor;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    new-instance v0, Ll/uuy0;

    .line 72
    .line 73
    invoke-direct {v0, p0, p3, p1}, Ll/uuy0;-><init>(Ll/qyy0;Lcom/google/android/ump/ConsentInformation$b;Ll/n6z0;)V

    .line 74
    .line 75
    .line 76
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/consent_sdk/zzg; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :goto_1
    new-instance p2, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 81
    .line 82
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-string p3, "Caught exception when trying to request consent info update: "

    .line 91
    .line 92
    invoke-virtual {p3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const/4 p3, 0x1

    .line 97
    invoke-direct {p2, p3, p1}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/qyy0;->b:Landroid/os/Handler;

    .line 101
    .line 102
    new-instance p1, Ll/qqy0;

    .line 103
    .line 104
    invoke-direct {p1, p4, p2}, Ll/qqy0;-><init>(Lcom/google/android/ump/ConsentInformation$a;Lcom/google/android/gms/internal/consent_sdk/zzg;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :goto_2
    iget-object p0, p0, Ll/qyy0;->b:Landroid/os/Handler;

    .line 112
    .line 113
    new-instance p2, Ll/aoy0;

    .line 114
    .line 115
    invoke-direct {p2, p4, p1}, Ll/aoy0;-><init>(Lcom/google/android/ump/ConsentInformation$a;Lcom/google/android/gms/internal/consent_sdk/zzg;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final c(Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V
    .locals 6
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/ywy0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/ywy0;-><init>(Ll/qyy0;Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, v1, Ll/qyy0;->c:Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final d(Ll/cdt0;)Ll/sft0;
    .locals 7
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/consent_sdk/zzg;
        }
    .end annotation

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/net/URL;

    .line 4
    .line 5
    const-string v2, "https://fundingchoicesmessages.google.com/a/consent"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 15
    .line 16
    const-string v2, "User-Agent"

    .line 17
    .line 18
    iget-object p0, p0, Ll/qyy0;->a:Landroid/app/Application;

    .line 19
    .line 20
    invoke-static {p0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, v2, p0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/16 p0, 0x2710

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 30
    .line 31
    .line 32
    const/16 p0, 0x7530

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    invoke-virtual {v1, p0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 39
    .line 40
    .line 41
    const-string v2, "POST"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v2, "Content-Type"

    .line 47
    .line 48
    const-string v3, "application/json"

    .line 49
    .line 50
    invoke-virtual {v1, v2, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v2, Ljava/io/OutputStreamWriter;

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-direct {v2, v3, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    :try_start_1
    new-instance v3, Landroid/util/JsonWriter;

    .line 63
    .line 64
    invoke-direct {v3, v2}, Landroid/util/JsonWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 65
    .line 66
    .line 67
    :try_start_2
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 68
    .line 69
    .line 70
    iget-object v4, p1, Ll/cdt0;->a:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v4, :cond_0

    .line 73
    .line 74
    const-string v5, "admob_app_id"

    .line 75
    .line 76
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception p0

    .line 84
    goto/16 :goto_8

    .line 85
    .line 86
    :cond_0
    :goto_0
    iget-object v4, p1, Ll/cdt0;->b:Ll/b8t0;

    .line 87
    .line 88
    if-eqz v4, :cond_6

    .line 89
    .line 90
    const-string v5, "device_info"

    .line 91
    .line 92
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 96
    .line 97
    .line 98
    iget v5, v4, Ll/b8t0;->c:I

    .line 99
    .line 100
    if-eq v5, p0, :cond_3

    .line 101
    .line 102
    const-string v6, "os_type"

    .line 103
    .line 104
    invoke-virtual {v3, v6}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 105
    .line 106
    .line 107
    add-int/lit8 v5, v5, -0x1

    .line 108
    .line 109
    if-eqz v5, :cond_2

    .line 110
    .line 111
    if-eq v5, p0, :cond_1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    const-string p0, "ANDROID"

    .line 115
    .line 116
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_2
    const-string p0, "UNKNOWN"

    .line 121
    .line 122
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 123
    .line 124
    .line 125
    :cond_3
    :goto_1
    iget-object p0, v4, Ll/b8t0;->a:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz p0, :cond_4

    .line 128
    .line 129
    const-string v5, "model"

    .line 130
    .line 131
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 135
    .line 136
    .line 137
    :cond_4
    iget-object p0, v4, Ll/b8t0;->b:Ljava/lang/Integer;

    .line 138
    .line 139
    if-eqz p0, :cond_5

    .line 140
    .line 141
    const-string v4, "android_api_level"

    .line 142
    .line 143
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 147
    .line 148
    .line 149
    :cond_5
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 150
    .line 151
    .line 152
    :cond_6
    iget-object p0, p1, Ll/cdt0;->c:Ljava/lang/String;

    .line 153
    .line 154
    if-eqz p0, :cond_7

    .line 155
    .line 156
    const-string v4, "language_code"

    .line 157
    .line 158
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 162
    .line 163
    .line 164
    :cond_7
    iget-object p0, p1, Ll/cdt0;->d:Ljava/lang/Boolean;

    .line 165
    .line 166
    if-eqz p0, :cond_8

    .line 167
    .line 168
    const-string v4, "tag_for_under_age_of_consent"

    .line 169
    .line 170
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Z)Landroid/util/JsonWriter;

    .line 178
    .line 179
    .line 180
    :cond_8
    iget-object p0, p1, Ll/cdt0;->e:Ljava/util/Map;

    .line 181
    .line 182
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    if-nez v4, :cond_a

    .line 187
    .line 188
    const-string v4, "stored_infos_map"

    .line 189
    .line 190
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 194
    .line 195
    .line 196
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    if-eqz v4, :cond_9

    .line 209
    .line 210
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    check-cast v4, Ljava/util/Map$Entry;

    .line 215
    .line 216
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    check-cast v5, Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 223
    .line 224
    .line 225
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    check-cast v4, Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 232
    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_9
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 236
    .line 237
    .line 238
    :cond_a
    iget-object p0, p1, Ll/cdt0;->f:Ll/nat0;

    .line 239
    .line 240
    if-eqz p0, :cond_14

    .line 241
    .line 242
    const-string v4, "screen_info"

    .line 243
    .line 244
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 248
    .line 249
    .line 250
    iget-object v4, p0, Ll/nat0;->a:Ljava/lang/Integer;

    .line 251
    .line 252
    if-eqz v4, :cond_b

    .line 253
    .line 254
    const-string v5, "width"

    .line 255
    .line 256
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 260
    .line 261
    .line 262
    :cond_b
    iget-object v4, p0, Ll/nat0;->b:Ljava/lang/Integer;

    .line 263
    .line 264
    if-eqz v4, :cond_c

    .line 265
    .line 266
    const-string v5, "height"

    .line 267
    .line 268
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 272
    .line 273
    .line 274
    :cond_c
    iget-object v4, p0, Ll/nat0;->c:Ljava/lang/Double;

    .line 275
    .line 276
    if-eqz v4, :cond_d

    .line 277
    .line 278
    const-string v5, "density"

    .line 279
    .line 280
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 284
    .line 285
    .line 286
    :cond_d
    iget-object p0, p0, Ll/nat0;->d:Ljava/util/List;

    .line 287
    .line 288
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    if-nez v4, :cond_13

    .line 293
    .line 294
    const-string v4, "screen_insets"

    .line 295
    .line 296
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginArray()Landroid/util/JsonWriter;

    .line 300
    .line 301
    .line 302
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 307
    .line 308
    .line 309
    move-result v4

    .line 310
    if-eqz v4, :cond_12

    .line 311
    .line 312
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    check-cast v4, Ll/f9t0;

    .line 317
    .line 318
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 319
    .line 320
    .line 321
    iget-object v5, v4, Ll/f9t0;->a:Ljava/lang/Integer;

    .line 322
    .line 323
    if-eqz v5, :cond_e

    .line 324
    .line 325
    const-string v6, "top"

    .line 326
    .line 327
    invoke-virtual {v3, v6}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 331
    .line 332
    .line 333
    :cond_e
    iget-object v5, v4, Ll/f9t0;->b:Ljava/lang/Integer;

    .line 334
    .line 335
    if-eqz v5, :cond_f

    .line 336
    .line 337
    const-string v6, "left"

    .line 338
    .line 339
    invoke-virtual {v3, v6}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 343
    .line 344
    .line 345
    :cond_f
    iget-object v5, v4, Ll/f9t0;->c:Ljava/lang/Integer;

    .line 346
    .line 347
    if-eqz v5, :cond_10

    .line 348
    .line 349
    const-string v6, "right"

    .line 350
    .line 351
    invoke-virtual {v3, v6}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 355
    .line 356
    .line 357
    :cond_10
    iget-object v4, v4, Ll/f9t0;->d:Ljava/lang/Integer;

    .line 358
    .line 359
    if-eqz v4, :cond_11

    .line 360
    .line 361
    const-string v5, "bottom"

    .line 362
    .line 363
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 364
    .line 365
    .line 366
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->value(Ljava/lang/Number;)Landroid/util/JsonWriter;

    .line 367
    .line 368
    .line 369
    :cond_11
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 370
    .line 371
    .line 372
    goto :goto_3

    .line 373
    :cond_12
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endArray()Landroid/util/JsonWriter;

    .line 374
    .line 375
    .line 376
    :cond_13
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 377
    .line 378
    .line 379
    :cond_14
    iget-object p0, p1, Ll/cdt0;->g:Ll/f4t0;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 380
    .line 381
    const-string v4, "version"

    .line 382
    .line 383
    if-eqz p0, :cond_18

    .line 384
    .line 385
    :try_start_3
    const-string v5, "app_info"

    .line 386
    .line 387
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 388
    .line 389
    .line 390
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 391
    .line 392
    .line 393
    iget-object v5, p0, Ll/f4t0;->a:Ljava/lang/String;

    .line 394
    .line 395
    if-eqz v5, :cond_15

    .line 396
    .line 397
    const-string v6, "package_name"

    .line 398
    .line 399
    invoke-virtual {v3, v6}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 403
    .line 404
    .line 405
    :cond_15
    iget-object v5, p0, Ll/f4t0;->b:Ljava/lang/String;

    .line 406
    .line 407
    if-eqz v5, :cond_16

    .line 408
    .line 409
    const-string v6, "publisher_display_name"

    .line 410
    .line 411
    invoke-virtual {v3, v6}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 415
    .line 416
    .line 417
    :cond_16
    iget-object p0, p0, Ll/f4t0;->c:Ljava/lang/String;

    .line 418
    .line 419
    if-eqz p0, :cond_17

    .line 420
    .line 421
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 425
    .line 426
    .line 427
    :cond_17
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 428
    .line 429
    .line 430
    :cond_18
    iget-object p0, p1, Ll/cdt0;->h:Ll/vbt0;

    .line 431
    .line 432
    if-eqz p0, :cond_1a

    .line 433
    .line 434
    const-string v5, "sdk_info"

    .line 435
    .line 436
    invoke-virtual {v3, v5}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 437
    .line 438
    .line 439
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginObject()Landroid/util/JsonWriter;

    .line 440
    .line 441
    .line 442
    iget-object p0, p0, Ll/vbt0;->a:Ljava/lang/String;

    .line 443
    .line 444
    if-eqz p0, :cond_19

    .line 445
    .line 446
    invoke-virtual {v3, v4}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 447
    .line 448
    .line 449
    invoke-virtual {v3, p0}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 450
    .line 451
    .line 452
    :cond_19
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;

    .line 453
    .line 454
    .line 455
    :cond_1a
    iget-object p0, p1, Ll/cdt0;->i:Ljava/util/List;

    .line 456
    .line 457
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 458
    .line 459
    .line 460
    move-result p1

    .line 461
    if-nez p1, :cond_1c

    .line 462
    .line 463
    const-string p1, "debug_params"

    .line 464
    .line 465
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->name(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v3}, Landroid/util/JsonWriter;->beginArray()Landroid/util/JsonWriter;

    .line 469
    .line 470
    .line 471
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 472
    .line 473
    .line 474
    move-result-object p0

    .line 475
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 476
    .line 477
    .line 478
    move-result p1

    .line 479
    if-eqz p1, :cond_1b

    .line 480
    .line 481
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    move-result-object p1

    .line 485
    check-cast p1, Lcom/google/android/gms/internal/consent_sdk/zzca;

    .line 486
    .line 487
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 488
    .line 489
    .line 490
    move-result p1

    .line 491
    packed-switch p1, :pswitch_data_0

    .line 492
    .line 493
    .line 494
    goto :goto_4

    .line 495
    :pswitch_0
    const-string p1, "PREVIEWING_DEBUG_MESSAGES"

    .line 496
    .line 497
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 498
    .line 499
    .line 500
    goto :goto_4

    .line 501
    :pswitch_1
    const-string p1, "GEO_OVERRIDE_NON_EEA"

    .line 502
    .line 503
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 504
    .line 505
    .line 506
    goto :goto_4

    .line 507
    :pswitch_2
    const-string p1, "GEO_OVERRIDE_OTHER"

    .line 508
    .line 509
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 510
    .line 511
    .line 512
    goto :goto_4

    .line 513
    :pswitch_3
    const-string p1, "GEO_OVERRIDE_REGULATED_US_STATE"

    .line 514
    .line 515
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 516
    .line 517
    .line 518
    goto :goto_4

    .line 519
    :pswitch_4
    const-string p1, "GEO_OVERRIDE_EEA"

    .line 520
    .line 521
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 522
    .line 523
    .line 524
    goto :goto_4

    .line 525
    :pswitch_5
    const-string p1, "ALWAYS_SHOW"

    .line 526
    .line 527
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 528
    .line 529
    .line 530
    goto :goto_4

    .line 531
    :pswitch_6
    const-string p1, "DEBUG_PARAM_UNKNOWN"

    .line 532
    .line 533
    invoke-virtual {v3, p1}, Landroid/util/JsonWriter;->value(Ljava/lang/String;)Landroid/util/JsonWriter;

    .line 534
    .line 535
    .line 536
    goto :goto_4

    .line 537
    :cond_1b
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endArray()Landroid/util/JsonWriter;

    .line 538
    .line 539
    .line 540
    :cond_1c
    invoke-virtual {v3}, Landroid/util/JsonWriter;->endObject()Landroid/util/JsonWriter;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 541
    .line 542
    .line 543
    :try_start_4
    invoke-virtual {v3}, Landroid/util/JsonWriter;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    .line 544
    .line 545
    .line 546
    :try_start_5
    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    .line 547
    .line 548
    .line 549
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 550
    .line 551
    .line 552
    move-result p0
    :try_end_5
    .catch Ljava/net/SocketTimeoutException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 553
    const/16 p1, 0xc8

    .line 554
    .line 555
    const-string v2, "\\A"

    .line 556
    .line 557
    if-ne p0, p1, :cond_1e

    .line 558
    .line 559
    :try_start_6
    const-string p0, "x-ump-using-header"

    .line 560
    .line 561
    invoke-virtual {v1, p0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 562
    .line 563
    .line 564
    move-result-object p0

    .line 565
    if-eqz p0, :cond_1d

    .line 566
    .line 567
    new-instance p1, Landroid/util/JsonReader;

    .line 568
    .line 569
    new-instance v0, Ljava/io/StringReader;

    .line 570
    .line 571
    invoke-direct {v0, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    invoke-direct {p1, v0}, Landroid/util/JsonReader;-><init>(Ljava/io/Reader;)V

    .line 575
    .line 576
    .line 577
    invoke-static {p1}, Ll/sft0;->a(Landroid/util/JsonReader;)Ll/sft0;

    .line 578
    .line 579
    .line 580
    move-result-object p0

    .line 581
    new-instance p1, Ljava/util/Scanner;

    .line 582
    .line 583
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 584
    .line 585
    .line 586
    move-result-object v0

    .line 587
    invoke-direct {p1, v0}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    .line 588
    .line 589
    .line 590
    invoke-virtual {p1, v2}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 591
    .line 592
    .line 593
    move-result-object p1

    .line 594
    invoke-virtual {p1}, Ljava/util/Scanner;->next()Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object p1

    .line 598
    iput-object p1, p0, Ll/sft0;->a:Ljava/lang/String;

    .line 599
    .line 600
    return-object p0

    .line 601
    :cond_1d
    new-instance p0, Ljava/io/BufferedReader;

    .line 602
    .line 603
    new-instance p1, Ljava/io/InputStreamReader;

    .line 604
    .line 605
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 606
    .line 607
    .line 608
    move-result-object v1

    .line 609
    invoke-direct {p1, v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    invoke-direct {p0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_6
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 613
    .line 614
    .line 615
    :try_start_7
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 616
    .line 617
    .line 618
    new-instance p1, Landroid/util/JsonReader;

    .line 619
    .line 620
    invoke-direct {p1, p0}, Landroid/util/JsonReader;-><init>(Ljava/io/Reader;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 621
    .line 622
    .line 623
    :try_start_8
    invoke-static {p1}, Ll/sft0;->a(Landroid/util/JsonReader;)Ll/sft0;

    .line 624
    .line 625
    .line 626
    move-result-object v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 627
    :try_start_9
    invoke-virtual {p1}, Landroid/util/JsonReader;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 628
    .line 629
    .line 630
    :try_start_a
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/net/SocketTimeoutException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    .line 631
    .line 632
    .line 633
    return-object v0

    .line 634
    :catchall_1
    move-exception p1

    .line 635
    goto :goto_6

    .line 636
    :catchall_2
    move-exception v0

    .line 637
    :try_start_b
    invoke-virtual {p1}, Landroid/util/JsonReader;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 638
    .line 639
    .line 640
    goto :goto_5

    .line 641
    :catchall_3
    move-exception p1

    .line 642
    :try_start_c
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 643
    .line 644
    .line 645
    :goto_5
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 646
    :goto_6
    :try_start_d
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 647
    .line 648
    .line 649
    goto :goto_7

    .line 650
    :catchall_4
    move-exception p0

    .line 651
    :try_start_e
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 652
    .line 653
    .line 654
    :goto_7
    throw p1

    .line 655
    :cond_1e
    new-instance p1, Ljava/util/Scanner;

    .line 656
    .line 657
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 658
    .line 659
    .line 660
    move-result-object v0

    .line 661
    invoke-direct {p1, v0}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    .line 662
    .line 663
    .line 664
    invoke-virtual {p1, v2}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 665
    .line 666
    .line 667
    move-result-object p1

    .line 668
    invoke-virtual {p1}, Ljava/util/Scanner;->next()Ljava/lang/String;

    .line 669
    .line 670
    .line 671
    move-result-object p1

    .line 672
    new-instance v0, Ljava/io/IOException;

    .line 673
    .line 674
    new-instance v1, Ljava/lang/StringBuilder;

    .line 675
    .line 676
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 677
    .line 678
    .line 679
    const-string v2, "Http error code - "

    .line 680
    .line 681
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 682
    .line 683
    .line 684
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 685
    .line 686
    .line 687
    const-string p0, ".\n"

    .line 688
    .line 689
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 690
    .line 691
    .line 692
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 693
    .line 694
    .line 695
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 696
    .line 697
    .line 698
    move-result-object p0

    .line 699
    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 700
    .line 701
    .line 702
    throw v0
    :try_end_e
    .catch Ljava/net/SocketTimeoutException; {:try_start_e .. :try_end_e} :catch_1
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_0

    .line 703
    :catchall_5
    move-exception p0

    .line 704
    goto :goto_a

    .line 705
    :goto_8
    :try_start_f
    invoke-virtual {v3}, Landroid/util/JsonWriter;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 706
    .line 707
    .line 708
    goto :goto_9

    .line 709
    :catchall_6
    move-exception p1

    .line 710
    :try_start_10
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 711
    .line 712
    .line 713
    :goto_9
    throw p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    .line 714
    :goto_a
    :try_start_11
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 715
    .line 716
    .line 717
    goto :goto_b

    .line 718
    :catchall_7
    move-exception p1

    .line 719
    :try_start_12
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 720
    .line 721
    .line 722
    :goto_b
    throw p0
    :try_end_12
    .catch Ljava/net/SocketTimeoutException; {:try_start_12 .. :try_end_12} :catch_1
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_0

    .line 723
    :catch_0
    move-exception p0

    .line 724
    new-instance p1, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 725
    .line 726
    const/4 v0, 0x2

    .line 727
    const-string v1, "Error making request."

    .line 728
    .line 729
    invoke-direct {p1, v0, v1, p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 730
    .line 731
    .line 732
    throw p1

    .line 733
    :catch_1
    move-exception p0

    .line 734
    new-instance p1, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 735
    .line 736
    const/4 v0, 0x4

    .line 737
    const-string v1, "The server timed out."

    .line 738
    .line 739
    invoke-direct {p1, v0, v1, p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 740
    .line 741
    .line 742
    throw p1

    .line 743
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
