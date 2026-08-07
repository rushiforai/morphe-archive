.class public Ll/jsw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k5f;


# instance fields
.field public final a:Ll/r4f;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/r4f;)V
    .locals 0
    .param p1    # Ll/r4f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jsw;->a:Ll/r4f;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getPlatform()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "android"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setPlatform(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Ll/jsw;->c(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/jsw;->b(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "MainEventProcessor process done! eventType:"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventType()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 p1, 0x0

    .line 37
    new-array p1, p1, [Ljava/lang/Object;

    .line 38
    .line 39
    invoke-static {p0, p1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final b(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jsw;->a:Ll/r4f;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/r4f;->getUserInfo()Lcom/tantanapp/beatles/v2/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setUser(Lcom/tantanapp/beatles/v2/data/User;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getApp()Lcom/tantanapp/beatles/v2/data/App;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/tantanapp/beatles/v2/data/App;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/tantanapp/beatles/v2/data/App;-><init>()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Ll/jsw;->a:Ll/r4f;

    .line 22
    .line 23
    invoke-interface {v1}, Ll/r4f;->getChannel()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/v2/data/App;->setChannel(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/jsw;->a:Ll/r4f;

    .line 31
    .line 32
    invoke-interface {v1}, Ll/r4f;->d()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/v2/data/App;->setBuildType(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setApp(Lcom/tantanapp/beatles/v2/data/App;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/jsw;->a:Ll/r4f;

    .line 43
    .line 44
    invoke-interface {v0}, Ll/r4f;->a()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getDevice()Lcom/tantanapp/beatles/v2/data/Device;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    new-instance v1, Lcom/tantanapp/beatles/v2/data/Device;

    .line 61
    .line 62
    invoke-direct {v1}, Lcom/tantanapp/beatles/v2/data/Device;-><init>()V

    .line 63
    .line 64
    .line 65
    :cond_1
    invoke-virtual {v1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setId(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setDevice(Lcom/tantanapp/beatles/v2/data/Device;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    iget-object v0, p0, Ll/jsw;->a:Ll/r4f;

    .line 72
    .line 73
    invoke-interface {v0}, Ll/r4f;->g()Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setMappingFiles(Ljava/util/List;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getTransaction()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    iget-object v0, p0, Ll/jsw;->a:Ll/r4f;

    .line 91
    .line 92
    invoke-interface {v0}, Ll/r4f;->c()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setTransaction(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_3
    iget-object v0, p0, Ll/jsw;->a:Ll/r4f;

    .line 100
    .line 101
    invoke-interface {v0}, Ll/r4f;->e()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_4

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setEnvironment(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_4
    invoke-static {}, Ll/du2;->u()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    const-string v0, "staging"

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_5
    const-string v0, "prod"

    .line 125
    .line 126
    :goto_0
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setEnvironment(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :goto_1
    iget-object v0, p0, Ll/jsw;->a:Ll/r4f;

    .line 130
    .line 131
    invoke-interface {v0, p1}, Ll/r4f;->b(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ljava/util/HashMap;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    if-eqz v0, :cond_6

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_6

    .line 150
    .line 151
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    check-cast v1, Ljava/util/Map$Entry;

    .line 156
    .line 157
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    check-cast v2, Ljava/lang/String;

    .line 162
    .line 163
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    check-cast v1, Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {p1, v2, v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setTag(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_6
    iget-object p0, p0, Ll/jsw;->a:Ll/r4f;

    .line 174
    .line 175
    invoke-interface {p0, p1}, Ll/r4f;->f(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ljava/util/HashMap;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    if-eqz p0, :cond_7

    .line 180
    .line 181
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_7

    .line 194
    .line 195
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Ljava/util/Map$Entry;

    .line 200
    .line 201
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    check-cast v1, Ljava/lang/String;

    .line 206
    .line 207
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    check-cast v0, Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {p1, v1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 218
    .line 219
    .line 220
    move-result-wide v0

    .line 221
    invoke-static {v0, v1}, Ll/p8c;->f(J)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    const-string v0, "mobile_time"

    .line 226
    .line 227
    invoke-virtual {p1, v0, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    new-instance p0, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    const-string v0, ""

    .line 233
    .line 234
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 238
    .line 239
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    const-string v0, "SDK_INT"

    .line 247
    .line 248
    invoke-virtual {p1, v0, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    return-void
.end method

.method public final c(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 1

    .line 1
    new-instance p0, Lcom/tantanapp/beatles/v2/data/Sdk;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/beatles/v2/data/Sdk;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "beatles.android"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/v2/data/Sdk;->setName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "1.2.2_ttt"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/v2/data/Sdk;->setVersion(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setSdk(Lcom/tantanapp/beatles/v2/data/Sdk;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
