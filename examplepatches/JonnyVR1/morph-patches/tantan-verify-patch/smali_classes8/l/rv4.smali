.class public Ll/rv4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:J = 0xbb8L

.field public static b:J = 0x0L

.field public static c:Ljava/lang/ref/WeakReference; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Landroid/media/SoundPool; = null

.field public static e:I = -0x1

.field public static f:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sget-wide v2, Ll/rv4;->b:J

    .line 16
    .line 17
    sub-long/2addr v0, v2

    .line 18
    sget-wide v2, Ll/rv4;->a:J

    .line 19
    .line 20
    cmp-long p0, v0, v2

    .line 21
    .line 22
    if-ltz p0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/pzi0;->o()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    sput-wide v0, Ll/rv4;->b:J

    .line 29
    .line 30
    invoke-static {}, Ll/rv4;->g()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/rv4;->d:Landroid/media/SoundPool;

    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    sput v0, Ll/rv4;->e:I

    .line 6
    .line 7
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/ChatHeatActionData;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->isSuccess()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 12
    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 20
    .line 21
    if-ne p1, v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    new-instance p1, Ll/t6f;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/t6f;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1, p0, v0}, Ll/t6f;->E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getThrowable()Ljava/lang/Throwable;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/rv4;->f(Ljava/lang/Throwable;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getThrowable()Ljava/lang/Throwable;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p0, v0, p1}, Ll/rv4;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 76
    .line 77
    if-eq v0, v1, :cond_4

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 84
    .line 85
    if-eq v0, v1, :cond_4

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->INVITE:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 92
    .line 93
    if-eq v0, v1, :cond_4

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ACCEPT:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 100
    .line 101
    if-eq v0, v1, :cond_4

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->SPECIAL_REMIND:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 108
    .line 109
    if-eq v0, v1, :cond_4

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CANCEL:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 116
    .line 117
    if-ne v0, v1, :cond_9

    .line 118
    .line 119
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getThrowable()Ljava/lang/Throwable;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v0, p0}, Ll/rv4;->j(Ljava/lang/Throwable;Lcom/p1/mobile/android/app/Act;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-nez p0, :cond_9

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getThrowable()Ljava/lang/Throwable;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    instance-of p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 134
    .line 135
    if-eqz p0, :cond_8

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getThrowable()Ljava/lang/Throwable;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 142
    .line 143
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 144
    .line 145
    const v0, 0x9d93

    .line 146
    .line 147
    .line 148
    if-ne p0, v0, :cond_8

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getThrowable()Ljava/lang/Throwable;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    const-string v1, "e_private_chat_error_invited"

    .line 163
    .line 164
    if-nez v0, :cond_5

    .line 165
    .line 166
    const-string v0, "\u5bf9\u65b9\u5df2\u5411\u4f60\u53d1\u8d77\u4e13\u5c5e\u804a\u5929"

    .line 167
    .line 168
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_5

    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-nez v0, :cond_6

    .line 180
    .line 181
    const-string v0, "\u4e0d\u652f\u6301\u6b64\u529f\u80fd"

    .line 182
    .line 183
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-eqz v0, :cond_6

    .line 188
    .line 189
    const-string v1, "e_private_chat_error_no_function"

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_6
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-nez v0, :cond_7

    .line 197
    .line 198
    const-string v0, "\u7248\u672c\u8fc7\u4f4e"

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-eqz p0, :cond_7

    .line 205
    .line 206
    const-string v1, "e_private_chat_error_low_version"

    .line 207
    .line 208
    :cond_7
    :goto_1
    const-string p0, "p_chat_view"

    .line 209
    .line 210
    invoke-static {v1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->getThrowable()Ljava/lang/Throwable;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-interface {p0, p1}, Ll/r97;->d(Ljava/lang/Throwable;)V

    .line 226
    .line 227
    .line 228
    :cond_9
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "otherUserId"

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const-string p1, "otherUserID"

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    invoke-static {p0, p1, p2}, Ll/ov4;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static f(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v0, 0x9d98

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public static g()V
    .locals 4

    .line 1
    new-instance v0, Landroid/media/SoundPool$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/SoundPool$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroid/media/SoundPool$Builder;->setMaxStreams(I)Landroid/media/SoundPool$Builder;

    .line 8
    .line 9
    .line 10
    new-instance v2, Landroid/media/AudioAttributes$Builder;

    .line 11
    .line 12
    invoke-direct {v2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v3, 0x3

    .line 16
    invoke-virtual {v2, v3}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v2}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget v3, Ll/tfc0;->d:I

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v1}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    new-instance v2, Ll/rv4$a;

    .line 39
    .line 40
    invoke-direct {v2, v1}, Ll/rv4$a;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static h()V
    .locals 9

    .line 1
    sget v0, Ll/rv4;->f:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    sput v0, Ll/rv4;->f:I

    .line 6
    .line 7
    sget-object v0, Ll/rv4;->d:Landroid/media/SoundPool;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v2, Ll/rv4;->d:Landroid/media/SoundPool;

    .line 16
    .line 17
    sget v3, Ll/rv4;->e:I

    .line 18
    .line 19
    const/4 v7, 0x0

    .line 20
    const/high16 v8, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const/high16 v4, 0x3f800000    # 1.0f

    .line 23
    .line 24
    const/high16 v5, 0x3f800000    # 1.0f

    .line 25
    .line 26
    const/4 v6, 0x1

    .line 27
    invoke-virtual/range {v2 .. v8}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance v0, Landroid/media/SoundPool$Builder;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/media/SoundPool$Builder;-><init>()V

    .line 34
    .line 35
    .line 36
    const/16 v2, 0xa

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/media/SoundPool$Builder;->setMaxStreams(I)Landroid/media/SoundPool$Builder;

    .line 39
    .line 40
    .line 41
    new-instance v2, Landroid/media/AudioAttributes$Builder;

    .line 42
    .line 43
    invoke-direct {v2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x3

    .line 47
    invoke-virtual {v2, v3}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v2}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 62
    .line 63
    sget v3, Ll/tfc0;->e:I

    .line 64
    .line 65
    invoke-virtual {v0, v2, v3, v1}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    new-instance v2, Ll/rv4$b;

    .line 70
    .line 71
    invoke-direct {v2, v1}, Ll/rv4$b;-><init>(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Cn()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/cn7;->v3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->checkAndPlayAudioOnce()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    sget-object v0, Ll/rv4;->c:Ljava/lang/ref/WeakReference;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    sget-object v0, Ll/rv4;->c:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    sget-object v0, Ll/rv4;->c:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/kcg0;

    .line 60
    .line 61
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ll/cn7;->s3(Ljava/lang/String;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    new-instance v0, Ll/qv4;

    .line 77
    .line 78
    invoke-direct {v0}, Ll/qv4;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    sput-object v0, Ll/rv4;->c:Ljava/lang/ref/WeakReference;

    .line 95
    .line 96
    :cond_3
    :goto_0
    return-void
.end method

.method public static j(Ljava/lang/Throwable;Lcom/p1/mobile/android/app/Act;)Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v1, 0x9d97

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_2

    .line 13
    .line 14
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "title"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "subTitle"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    new-instance v1, Ll/th0$a;

    .line 40
    .line 41
    invoke-direct {v1, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {v1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    const-string p0, "\u77e5\u9053\u4e86"

    .line 57
    .line 58
    invoke-virtual {v1, p0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p1, Ll/pv4;

    .line 63
    .line 64
    invoke-direct {p1}, Ll/pv4;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ll/th0$a;->a()Ll/th0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/th0;->g()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    :cond_1
    const/4 p0, 0x1

    .line 78
    return p0

    .line 79
    :catch_0
    move-exception p0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    :cond_2
    const/4 p0, 0x0

    .line 84
    return p0
.end method
