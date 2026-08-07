.class public Lcom/cosmos/mdlog/MDLog;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/mdlog/MDLog$LogImp;
    }
.end annotation


# static fields
.field private static DEBUG_MODE:Z = false

.field public static final LEVEL_DEBUG:I = 0x1

.field public static final LEVEL_ERROR:I = 0x5

.field public static final LEVEL_EVENT:I = 0x3

.field public static final LEVEL_FATAL:I = 0x6

.field public static final LEVEL_INFO:I = 0x2

.field public static final LEVEL_NONE:I = 0x7

.field public static final LEVEL_VERBOSE:I = 0x0

.field public static final LEVEL_WARNING:I = 0x4

.field public static final STACK_OFFSET:I = 0x4

.field private static final SYS_INFO:Ljava/lang/String;

.field private static debugLog:Lcom/cosmos/mdlog/MDLog$LogImp; = null

.field private static isOpenStackInfo:Z = false

.field private static level:I = 0x7

.field private static logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

.field private static logWrapperClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

.field public static toastSupportContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    const-string v0, "] USER:["

    .line 2
    .line 3
    const-string v1, "] TYPE:["

    .line 4
    .line 5
    const-string v2, "] TAGS:["

    .line 6
    .line 7
    const-string v3, "] PRODUCT:["

    .line 8
    .line 9
    const-string v4, "] MODEL:["

    .line 10
    .line 11
    const-string v5, "] MANUFACTURER:["

    .line 12
    .line 13
    const-string v6, "] HOST:["

    .line 14
    .line 15
    const-string v7, "] FINGERPRINT:["

    .line 16
    .line 17
    const-string v8, "] DISPLAY:["

    .line 18
    .line 19
    const-string v9, "] DEVICE:["

    .line 20
    .line 21
    const-string v10, "] BOARD:["

    .line 22
    .line 23
    const-string v11, "] VERSION.INCREMENTAL:["

    .line 24
    .line 25
    const-string v12, "] VERSION.CODENAME:["

    .line 26
    .line 27
    const-string v13, "VERSION.RELEASE:["

    .line 28
    .line 29
    new-instance v14, Lcom/cosmos/mdlog/MDLog$1;

    .line 30
    .line 31
    invoke-direct {v14}, Lcom/cosmos/mdlog/MDLog$1;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v14, Lcom/cosmos/mdlog/MDLog;->debugLog:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 35
    .line 36
    sput-object v14, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 37
    .line 38
    new-instance v14, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    :try_start_0
    new-instance v15, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v15, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v13, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v13

    .line 57
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    new-instance v13, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object v12, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v12

    .line 74
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    new-instance v12, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v12, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object v11, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v11

    .line 91
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    new-instance v11, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v11, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    sget-object v10, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v10

    .line 108
    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    new-instance v10, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object v9, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v9

    .line 125
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    new-instance v9, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v8

    .line 142
    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    new-instance v8, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    sget-object v7, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    new-instance v7, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    sget-object v6, Landroid/os/Build;->HOST:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    new-instance v6, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    sget-object v5, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    new-instance v5, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    new-instance v4, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    sget-object v3, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    new-instance v3, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sget-object v2, Landroid/os/Build;->TAGS:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    new-instance v2, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    new-instance v1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    sget-object v0, Landroid/os/Build;->USER:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    const-string v0, "]"

    .line 275
    .line 276
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 284
    .line 285
    .line 286
    goto :goto_0

    .line 287
    :catchall_0
    move-exception v0

    .line 288
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 289
    .line 290
    .line 291
    :goto_0
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    sput-object v0, Lcom/cosmos/mdlog/MDLog;->SYS_INFO:Ljava/lang/String;

    .line 296
    .line 297
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

.method public static synthetic access$000()I
    .locals 1

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    return v0
.end method

.method public static appenderClose()V
    .locals 1

    return-void

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/cosmos/mdlog/MDLog$LogImp;->appenderClose()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static appenderFlush(Z)V
    .locals 1

    return-void

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/cosmos/mdlog/MDLog$LogImp;->appenderFlush(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static clearAllWhiteList()V
    .locals 1

    return-void

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/cosmos/mdlog/MDLog$LogImp;->clearAllWhiteList()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    return-void

    const/4 v0, 0x0

    .line 102
    invoke-static {p0, p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 13

    return-void

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-gt v0, v1, :cond_4

    .line 5
    .line 6
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    const-string p2, ""

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    move-object v12, p2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move-object v12, p1

    .line 30
    :goto_1
    sget-object p1, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-interface {p1, v1, p0, v12}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    goto :goto_4

    .line 41
    :cond_2
    sget-boolean p1, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 42
    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    move-object v4, p2

    .line 64
    move-object v5, v0

    .line 65
    :goto_2
    move v6, p1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    const/4 p1, 0x0

    .line 68
    move-object v4, p2

    .line 69
    move-object v5, v4

    .line 70
    goto :goto_2

    .line 71
    :goto_3
    sget-object v2, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 72
    .line 73
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 82
    .line 83
    .line 84
    move-result-wide v8

    .line 85
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 94
    .line 95
    .line 96
    move-result-wide v10

    .line 97
    move-object v3, p0

    .line 98
    invoke-interface/range {v2 .. v12}, Lcom/cosmos/mdlog/MDLog$LogImp;->logD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_4
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    return-void

    const/4 v0, 0x0

    .line 102
    invoke-static {p0, p1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 13

    return-void

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-gt v0, v1, :cond_4

    .line 5
    .line 6
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    const-string p2, ""

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    move-object v12, p2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move-object v12, p1

    .line 30
    :goto_1
    sget-object p1, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-interface {p1, v1, p0, v12}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    goto :goto_4

    .line 41
    :cond_2
    sget-boolean p1, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 42
    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    move-object v4, p2

    .line 64
    move-object v5, v0

    .line 65
    :goto_2
    move v6, p1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    const/4 p1, 0x0

    .line 68
    move-object v4, p2

    .line 69
    move-object v5, v4

    .line 70
    goto :goto_2

    .line 71
    :goto_3
    sget-object v2, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 72
    .line 73
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 82
    .line 83
    .line 84
    move-result-wide v8

    .line 85
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 94
    .line 95
    .line 96
    move-result-wide v10

    .line 97
    move-object v3, p0

    .line 98
    invoke-interface/range {v2 .. v12}, Lcom/cosmos/mdlog/MDLog$LogImp;->logE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_4
    return-void
.end method

.method public static varargs event(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 14

    return-void

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-gt v0, v1, :cond_4

    .line 5
    .line 6
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    move-object v0, p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static/range {p1 .. p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    const-string v2, ""

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    move-object v13, v2

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move-object v13, v0

    .line 31
    :goto_1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-static/range {p1 .. p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {v0, v1, p0, p1}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    goto :goto_4

    .line 46
    :cond_2
    sget-boolean p1, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    move-object v6, v0

    .line 69
    move-object v5, v2

    .line 70
    :goto_2
    move v7, p1

    .line 71
    goto :goto_3

    .line 72
    :cond_3
    const/4 p1, 0x0

    .line 73
    move-object v5, v2

    .line 74
    move-object v6, v5

    .line 75
    goto :goto_2

    .line 76
    :goto_3
    sget-object v3, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 77
    .line 78
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 87
    .line 88
    .line 89
    move-result-wide v9

    .line 90
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 99
    .line 100
    .line 101
    move-result-wide v11

    .line 102
    move-object v4, p0

    .line 103
    invoke-interface/range {v3 .. v13}, Lcom/cosmos/mdlog/MDLog$LogImp;->logEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_4
    :goto_4
    return-void
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    return-void

    const/4 v0, 0x0

    .line 99
    invoke-static {p0, p1, v0}, Lcom/cosmos/mdlog/MDLog;->f(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs f(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 13

    return-void

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-gt v0, v1, :cond_3

    .line 5
    .line 6
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    :goto_0
    move-object v12, p1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    goto :goto_0

    .line 25
    :goto_1
    sget-object p1, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-interface {p1, v1, p0, v12}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto :goto_4

    .line 36
    :cond_1
    sget-boolean p1, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    move-object v4, p2

    .line 59
    move-object v5, v0

    .line 60
    :goto_2
    move v6, p1

    .line 61
    goto :goto_3

    .line 62
    :cond_2
    const-string p2, ""

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    move-object v4, p2

    .line 66
    move-object v5, v4

    .line 67
    goto :goto_2

    .line 68
    :goto_3
    sget-object v2, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 69
    .line 70
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 79
    .line 80
    .line 81
    move-result-wide v8

    .line 82
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 91
    .line 92
    .line 93
    move-result-wide v10

    .line 94
    move-object v3, p0

    .line 95
    invoke-interface/range {v2 .. v12}, Lcom/cosmos/mdlog/MDLog$LogImp;->logF(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_4
    return-void
.end method

.method public static getImpl()Lcom/cosmos/mdlog/MDLog$LogImp;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    return-object v0
.end method

.method private static getInvokeStack()Ljava/lang/StackTraceElement;
    .locals 9

    const/4 v0, 0x0

    return-object v0

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/cosmos/mdlog/MDLog;->logWrapperClass:Ljava/lang/Class;

    .line 10
    .line 11
    const-class v2, Lcom/cosmos/mdlog/MDLog;

    .line 12
    .line 13
    const/4 v3, 0x5

    .line 14
    const/4 v4, 0x4

    .line 15
    if-eqz v1, :cond_6

    .line 16
    .line 17
    aget-object v1, v0, v4

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    array-length v5, v0

    .line 24
    const/4 v6, 0x1

    .line 25
    sub-int/2addr v5, v6

    .line 26
    const/4 v7, 0x0

    .line 27
    if-ge v3, v5, :cond_0

    .line 28
    .line 29
    aget-object v5, v0, v3

    .line 30
    .line 31
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v5, v7

    .line 37
    :goto_0
    sget-object v8, Lcom/cosmos/mdlog/MDLog;->logWrapperClass:Ljava/lang/Class;

    .line 38
    .line 39
    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    if-nez v8, :cond_1

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v8

    .line 53
    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    aget-object v0, v0, v4

    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_1
    sget-object v1, Lcom/cosmos/mdlog/MDLog;->logWrapperClass:Ljava/lang/Class;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_2

    .line 83
    .line 84
    aget-object v0, v0, v3

    .line 85
    .line 86
    return-object v0

    .line 87
    :cond_2
    array-length v1, v0

    .line 88
    const/4 v2, 0x0

    .line 89
    :goto_1
    if-ge v4, v1, :cond_5

    .line 90
    .line 91
    sget-object v3, Lcom/cosmos/mdlog/MDLog;->logWrapperClass:Ljava/lang/Class;

    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    aget-object v5, v0, v4

    .line 98
    .line 99
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_3

    .line 108
    .line 109
    move v2, v6

    .line 110
    goto :goto_2

    .line 111
    :cond_3
    if-eqz v2, :cond_4

    .line 112
    .line 113
    aget-object v0, v0, v4

    .line 114
    .line 115
    return-object v0

    .line 116
    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_5
    return-object v7

    .line 120
    :cond_6
    aget-object v1, v0, v4

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_7

    .line 135
    .line 136
    aget-object v0, v0, v3

    .line 137
    .line 138
    return-object v0

    .line 139
    :cond_7
    aget-object v0, v0, v4

    .line 140
    .line 141
    return-object v0
.end method

.method public static getLogLevel()I
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/cosmos/mdlog/MDLog$LogImp;->getLevel()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x7

    .line 11
    return v0
.end method

.method public static getLogWrapperClass()V
    .locals 0

    return-void

    .line 1
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getLogWrapperClass()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getMdLogHook()Lcom/cosmos/mdlog/IMDLogHook;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getSysInfo()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->SYS_INFO:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getWhiteListTags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/cosmos/mdlog/MDLog$LogImp;->getWhiteListTags()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return-object v0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    return-void

    const/4 v0, 0x0

    .line 102
    invoke-static {p0, p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 13

    return-void

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-gt v0, v1, :cond_4

    .line 5
    .line 6
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    const-string p2, ""

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    move-object v12, p2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move-object v12, p1

    .line 30
    :goto_1
    sget-object p1, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-interface {p1, v1, p0, v12}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    goto :goto_4

    .line 41
    :cond_2
    sget-boolean p1, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 42
    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    move-object v4, p2

    .line 64
    move-object v5, v0

    .line 65
    :goto_2
    move v6, p1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    const/4 p1, 0x0

    .line 68
    move-object v4, p2

    .line 69
    move-object v5, v4

    .line 70
    goto :goto_2

    .line 71
    :goto_3
    sget-object v2, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 72
    .line 73
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 82
    .line 83
    .line 84
    move-result-wide v8

    .line 85
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 94
    .line 95
    .line 96
    move-result-wide v10

    .line 97
    move-object v3, p0

    .line 98
    invoke-interface/range {v2 .. v12}, Lcom/cosmos/mdlog/MDLog$LogImp;->logI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_4
    return-void
.end method

.method public static isConsoleLogOpen()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/cosmos/mdlog/MDLog$LogImp;->isLogcatOpen()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method public static isOpenStackInfo()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 2
    .line 3
    return v0
.end method

.method public static isWhiteListIntercept(Ljava/lang/String;)Z
    .locals 3

    .line 1
    sget-boolean v0, Lcom/cosmos/mdlog/MDLog;->DEBUG_MODE:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/cosmos/mdlog/MDLog$LogImp;->getWhiteListTags()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-lez v2, :cond_1

    .line 22
    .line 23
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v1
.end method

.method public static openFileWrite(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    return-void

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "mdlog_"

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-static {v2, v0, p0, p1, v1}, Lcom/cosmos/mdlog/XLogImpl;->open(ZILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-wide/32 p0, 0x4b000

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/XLogImpl;->appenderSetMaxFileSize(J)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Lcom/cosmos/mdlog/XLogImpl;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/cosmos/mdlog/XLogImpl;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->setLogImp(Lcom/cosmos/mdlog/MDLog$LogImp;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    return-void

    const/4 v0, 0x0

    .line 129
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, ""

    invoke-static {p0, p1, v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 15

    return-void

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    sget v1, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    if-gt v1, v2, :cond_4

    .line 7
    .line 8
    sget-object v1, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 9
    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_4

    .line 17
    .line 18
    const-string v1, ""

    .line 19
    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    move-object v3, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object/from16 v3, p2

    .line 25
    .line 26
    :goto_0
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    :goto_1
    sget-boolean v0, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    move-object v6, v1

    .line 56
    move-object v7, v4

    .line 57
    :goto_2
    move v8, v0

    .line 58
    goto :goto_3

    .line 59
    :cond_2
    const/4 v0, 0x0

    .line 60
    move-object v6, v1

    .line 61
    move-object v7, v6

    .line 62
    goto :goto_2

    .line 63
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, "  "

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-static/range {p1 .. p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v14

    .line 87
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    invoke-interface {v0, v2, p0, v14}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_3
    sget-object v4, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 99
    .line 100
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 101
    .line 102
    .line 103
    move-result v9

    .line 104
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 109
    .line 110
    .line 111
    move-result-wide v10

    .line 112
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 121
    .line 122
    .line 123
    move-result-wide v12

    .line 124
    move-object v5, p0

    .line 125
    invoke-interface/range {v4 .. v14}, Lcom/cosmos/mdlog/MDLog$LogImp;->logE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_4
    :goto_4
    return-void
.end method

.method public static registerWhiteList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/cosmos/mdlog/MDLog$LogImp;->registerWhiteList(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setConsoleLogOpen(Z)V
    .locals 1

    return-void

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/cosmos/mdlog/MDLog$LogImp;->setLogcatOpen(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setDebugMode()V
    .locals 1

    return-void

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/cosmos/mdlog/MDLog;->DEBUG_MODE:Z

    .line 3
    .line 4
    return-void
.end method

.method public static setLevel(I)V
    .locals 1

    return-void

    .line 1
    sput p0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lcom/cosmos/mdlog/MDLog$LogImp;->setLevel(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static setLogImp(Lcom/cosmos/mdlog/MDLog$LogImp;)V
    .locals 0

    return-void

    .line 1
    sput-object p0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 2
    .line 3
    return-void
.end method

.method public static setLogWrapperClass(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    return-void

    .line 1
    sput-object p0, Lcom/cosmos/mdlog/MDLog;->logWrapperClass:Ljava/lang/Class;

    .line 2
    .line 3
    return-void
.end method

.method public static setMdLogHook(Lcom/cosmos/mdlog/IMDLogHook;)V
    .locals 0

    return-void

    .line 1
    sput-object p0, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 2
    .line 3
    return-void
.end method

.method public static setOpenStackInfo(Z)V
    .locals 0

    return-void

    .line 1
    sput-boolean p0, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 2
    .line 3
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    return-void

    const/4 v0, 0x0

    .line 101
    invoke-static {p0, p1, v0}, Lcom/cosmos/mdlog/MDLog;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 11

    return-void

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    if-gtz v0, :cond_4

    .line 4
    .line 5
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 6
    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_4

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :goto_0
    const-string p2, ""

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    move-object v10, p2

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move-object v10, p1

    .line 29
    :goto_1
    sget-object p1, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-interface {p1, v0, p0, v10}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_2
    sget-boolean p1, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 42
    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    move v4, p1

    .line 64
    move-object v2, p2

    .line 65
    move-object v3, v0

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    move-object v2, p2

    .line 68
    move-object v3, v2

    .line 69
    move v4, v0

    .line 70
    :goto_2
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 71
    .line 72
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 81
    .line 82
    .line 83
    move-result-wide v6

    .line 84
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 93
    .line 94
    .line 95
    move-result-wide v8

    .line 96
    move-object v1, p0

    .line 97
    invoke-interface/range {v0 .. v10}, Lcom/cosmos/mdlog/MDLog$LogImp;->logV(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_4
    :goto_3
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    return-void

    const/4 v0, 0x0

    .line 102
    invoke-static {p0, p1, v0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 13

    return-void

    .line 1
    sget v0, Lcom/cosmos/mdlog/MDLog;->level:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-gt v0, v1, :cond_4

    .line 5
    .line 6
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->isWhiteListIntercept(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    const-string p2, ""

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    move-object v12, p2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move-object v12, p1

    .line 30
    :goto_1
    sget-object p1, Lcom/cosmos/mdlog/MDLog;->mdLogHook:Lcom/cosmos/mdlog/IMDLogHook;

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-interface {p1, v1, p0, v12}, Lcom/cosmos/mdlog/IMDLogHook;->onLogPrint(ILjava/lang/String;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    goto :goto_4

    .line 41
    :cond_2
    sget-boolean p1, Lcom/cosmos/mdlog/MDLog;->isOpenStackInfo:Z

    .line 42
    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/cosmos/mdlog/MDLog;->getInvokeStack()Ljava/lang/StackTraceElement;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    move-object v4, p2

    .line 64
    move-object v5, v0

    .line 65
    :goto_2
    move v6, p1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    const/4 p1, 0x0

    .line 68
    move-object v4, p2

    .line 69
    move-object v5, v4

    .line 70
    goto :goto_2

    .line 71
    :goto_3
    sget-object v2, Lcom/cosmos/mdlog/MDLog;->logImp:Lcom/cosmos/mdlog/MDLog$LogImp;

    .line 72
    .line 73
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 82
    .line 83
    .line 84
    move-result-wide v8

    .line 85
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 94
    .line 95
    .line 96
    move-result-wide v10

    .line 97
    move-object v3, p0

    .line 98
    invoke-interface/range {v2 .. v12}, Lcom/cosmos/mdlog/MDLog$LogImp;->logW(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_4
    return-void
.end method
