.class public Ll/alb0;
.super Ll/p95;
.source "SourceFile"


# instance fields
.field private final b:Ll/ch2;

.field private final c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final d:Landroid/content/Context;

.field private final e:Lcom/clevertap/android/sdk/Logger;

.field private final f:Ll/w36;

.field private final g:Ll/bj2;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/bj2;Ll/ch2;Ll/w36;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p95;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/alb0;->d:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/alb0;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 13
    .line 14
    iput-object p3, p0, Ll/alb0;->g:Ll/bj2;

    .line 15
    .line 16
    iput-object p4, p0, Ll/alb0;->b:Ll/ch2;

    .line 17
    .line 18
    iput-object p5, p0, Ll/alb0;->f:Ll/w36;

    .line 19
    .line 20
    return-void
.end method

.method private b(Lorg/json/JSONArray;)V
    .locals 8

    .line 1
    const-string v0, "wzrk_ttl"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-ge v1, v2, :cond_4

    .line 9
    .line 10
    new-instance v2, Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    invoke-virtual {v2, v0, v4, v5}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-eqz v5, :cond_1

    .line 41
    .line 42
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-virtual {v2, v5, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-virtual {v2}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    const-string v5, "wzrk_pid"

    .line 63
    .line 64
    if-nez v4, :cond_3

    .line 65
    .line 66
    :try_start_1
    iget-object v4, p0, Ll/alb0;->g:Ll/bj2;

    .line 67
    .line 68
    iget-object v6, p0, Ll/alb0;->d:Landroid/content/Context;

    .line 69
    .line 70
    invoke-interface {v4, v6}, Ll/bj2;->c(Landroid/content/Context;)Ll/h1c;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-virtual {v4, v6}, Ll/h1c;->n(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-nez v4, :cond_3

    .line 83
    .line 84
    iget-object v3, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 85
    .line 86
    const-string v4, "Creating Push Notification locally"

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object v3, p0, Ll/alb0;->b:Ll/ch2;

    .line 92
    .line 93
    invoke-virtual {v3}, Ll/ch2;->o()Ll/vw3;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    if-eqz v3, :cond_2

    .line 98
    .line 99
    iget-object v3, p0, Ll/alb0;->b:Ll/ch2;

    .line 100
    .line 101
    invoke-virtual {v3}, Ll/ch2;->o()Ll/vw3;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-interface {v3, v2}, Ll/vw3;->a(Landroid/os/Bundle;)V

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_2
    invoke-static {}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;->d()Ll/oz40;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    iget-object v4, p0, Ll/alb0;->d:Landroid/content/Context;

    .line 114
    .line 115
    sget-object v5, Ll/gmb0;->a:Ll/kob0;

    .line 116
    .line 117
    invoke-virtual {v5}, Ll/kob0;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-interface {v3, v4, v2, v5}, Ll/oz40;->a(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_3
    iget-object v2, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 126
    .line 127
    iget-object v4, p0, Ll/alb0;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 128
    .line 129
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    new-instance v6, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v7, "Push Notification already shown, ignoring local notification :"

    .line 139
    .line 140
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {v2, v4, v3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 155
    .line 156
    .line 157
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_4
    return-void

    .line 162
    :catch_0
    iget-object p1, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 163
    .line 164
    iget-object p0, p0, Ll/alb0;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    const-string v0, "Error parsing push notification JSON"

    .line 171
    .line 172
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;)V
    .locals 5

    .line 1
    const-string p2, "pf"

    .line 2
    .line 3
    const-string v0, "pushamp_notifs"

    .line 4
    .line 5
    const-string v1, "Error handling ping frequency in response : "

    .line 6
    .line 7
    iget-object v2, p0, Ll/alb0;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isAnalyticsOnly()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 16
    .line 17
    iget-object p0, p0, Ll/alb0;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p2, "CleverTap instance is configured to analytics only, not processing push amp response"

    .line 24
    .line 25
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    :try_start_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_5

    .line 34
    .line 35
    iget-object v2, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 36
    .line 37
    iget-object v3, p0, Ll/alb0;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "Processing pushamp messages..."

    .line 44
    .line 45
    invoke-virtual {v2, v3, v4}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v0, "list"

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-lez v2, :cond_1

    .line 63
    .line 64
    iget-object v2, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 65
    .line 66
    iget-object v3, p0, Ll/alb0;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 67
    .line 68
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    const-string v4, "Handling Push payload locally"

    .line 73
    .line 74
    invoke-virtual {v2, v3, v4}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0, v0}, Ll/alb0;->b(Lorg/json/JSONArray;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    :try_start_1
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    iget-object v0, p0, Ll/alb0;->f:Ll/w36;

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/w36;->j()Ll/cob0;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0, p3, p2}, Ll/cob0;->Y(Landroid/content/Context;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :catchall_0
    move-exception p2

    .line 101
    :try_start_2
    iget-object v0, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 102
    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {v0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    :goto_0
    const-string p2, "ack"

    .line 123
    .line 124
    const/4 v0, 0x0

    .line 125
    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 126
    .line 127
    .line 128
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 129
    iget-object p2, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 130
    .line 131
    if-eqz p1, :cond_4

    .line 132
    .line 133
    :try_start_3
    const-string p1, "Received ACK - true"

    .line 134
    .line 135
    invoke-virtual {p2, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/alb0;->g:Ll/bj2;

    .line 139
    .line 140
    invoke-interface {p1, p3}, Ll/bj2;->c(Landroid/content/Context;)Ll/h1c;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Ll/h1c;->q()[Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {p1}, Ll/lw3;->f([Ljava/lang/String;)Lorg/json/JSONArray;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    new-array v1, p2, [Ljava/lang/String;

    .line 157
    .line 158
    :goto_1
    if-ge v0, p2, :cond_3

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    aput-object v2, v1, v0

    .line 165
    .line 166
    add-int/lit8 v0, v0, 0x1

    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_3
    iget-object p1, p0, Ll/alb0;->e:Lcom/clevertap/android/sdk/Logger;

    .line 170
    .line 171
    const-string p2, "Updating RTL values..."

    .line 172
    .line 173
    invoke-virtual {p1, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object p0, p0, Ll/alb0;->g:Ll/bj2;

    .line 177
    .line 178
    invoke-interface {p0, p3}, Ll/bj2;->c(Landroid/content/Context;)Ll/h1c;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0, v1}, Ll/h1c;->R([Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_4
    const-string p0, "Received ACK - false"

    .line 187
    .line 188
    invoke-virtual {p2, p0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 189
    .line 190
    .line 191
    :catchall_1
    :cond_5
    :goto_2
    return-void
.end method
