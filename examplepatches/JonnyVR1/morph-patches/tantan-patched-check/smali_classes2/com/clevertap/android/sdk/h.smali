.class Lcom/clevertap/android/sdk/h;
.super Lcom/clevertap/android/sdk/e;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private final c:Ll/ik2;

.field private final d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final e:Landroid/content/Context;

.field private final f:Ll/bu9;

.field private final g:Lcom/clevertap/android/sdk/Logger;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/bu9;Ll/ik2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/clevertap/android/sdk/h;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/clevertap/android/sdk/h;->b:I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/clevertap/android/sdk/h;->e:Landroid/content/Context;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/clevertap/android/sdk/h;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/clevertap/android/sdk/h;->g:Lcom/clevertap/android/sdk/Logger;

    .line 18
    .line 19
    iput-object p3, p0, Lcom/clevertap/android/sdk/h;->f:Ll/bu9;

    .line 20
    .line 21
    iput-object p4, p0, Lcom/clevertap/android/sdk/h;->c:Ll/ik2;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a(Landroid/location/Location;)Ljava/util/concurrent/Future;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/location/Location;",
            ")",
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/h;->f:Ll/bu9;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ll/bu9;->e0(Landroid/location/Location;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/clevertap/android/sdk/h;->g:Lcom/clevertap/android/sdk/Logger;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/clevertap/android/sdk/h;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v4, "Location updated ("

    .line 21
    .line 22
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, ", "

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    .line 38
    .line 39
    .line 40
    move-result-wide v5

    .line 41
    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v5, ")"

    .line 45
    .line 46
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v2, v3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/clevertap/android/sdk/h;->f:Ll/bu9;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/bu9;->F()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    invoke-static {}, Lcom/clevertap/android/sdk/CleverTapAPI;->W()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_1

    .line 69
    .line 70
    return-object v0

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/h;->b()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iget-object v2, p0, Lcom/clevertap/android/sdk/h;->f:Ll/bu9;

    .line 76
    .line 77
    invoke-virtual {v2}, Ll/bu9;->F()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    const/4 v3, 0x2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    iget v2, p0, Lcom/clevertap/android/sdk/h;->b:I

    .line 85
    .line 86
    add-int/lit8 v2, v2, 0xa

    .line 87
    .line 88
    if-le v1, v2, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Lcom/clevertap/android/sdk/h;->c:Ll/ik2;

    .line 91
    .line 92
    iget-object v2, p0, Lcom/clevertap/android/sdk/h;->e:Landroid/content/Context;

    .line 93
    .line 94
    new-instance v6, Lorg/json/JSONObject;

    .line 95
    .line 96
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v2, v6, v3}, Ll/ik2;->g(Landroid/content/Context;Lorg/json/JSONObject;I)Ljava/util/concurrent/Future;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v1}, Lcom/clevertap/android/sdk/h;->d(I)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lcom/clevertap/android/sdk/h;->g:Lcom/clevertap/android/sdk/Logger;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/clevertap/android/sdk/h;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    new-instance v2, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v3, "Queuing location ping event for geofence location ("

    .line 117
    .line 118
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    .line 122
    .line 123
    .line 124
    move-result-wide v6

    .line 125
    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    .line 132
    .line 133
    .line 134
    move-result-wide v3

    .line 135
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {v1, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-object v0

    .line 149
    :cond_2
    iget-object v2, p0, Lcom/clevertap/android/sdk/h;->f:Ll/bu9;

    .line 150
    .line 151
    invoke-virtual {v2}, Ll/bu9;->F()Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-nez v2, :cond_3

    .line 156
    .line 157
    iget v2, p0, Lcom/clevertap/android/sdk/h;->a:I

    .line 158
    .line 159
    add-int/lit8 v2, v2, 0xa

    .line 160
    .line 161
    if-le v1, v2, :cond_3

    .line 162
    .line 163
    iget-object v0, p0, Lcom/clevertap/android/sdk/h;->c:Ll/ik2;

    .line 164
    .line 165
    iget-object v2, p0, Lcom/clevertap/android/sdk/h;->e:Landroid/content/Context;

    .line 166
    .line 167
    new-instance v6, Lorg/json/JSONObject;

    .line 168
    .line 169
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v2, v6, v3}, Ll/ik2;->g(Landroid/content/Context;Lorg/json/JSONObject;I)Ljava/util/concurrent/Future;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {p0, v1}, Lcom/clevertap/android/sdk/h;->c(I)V

    .line 177
    .line 178
    .line 179
    iget-object v1, p0, Lcom/clevertap/android/sdk/h;->g:Lcom/clevertap/android/sdk/Logger;

    .line 180
    .line 181
    iget-object p0, p0, Lcom/clevertap/android/sdk/h;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    new-instance v2, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string v3, "Queuing location ping event for location ("

    .line 190
    .line 191
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    .line 195
    .line 196
    .line 197
    move-result-wide v6

    .line 198
    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    .line 205
    .line 206
    .line 207
    move-result-wide v3

    .line 208
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {v1, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    :cond_3
    return-object v0
.end method

.method public b()I
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    long-to-int p0, v0

    .line 9
    return p0
.end method

.method public c(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/clevertap/android/sdk/h;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/clevertap/android/sdk/h;->b:I

    .line 2
    .line 3
    return-void
.end method
