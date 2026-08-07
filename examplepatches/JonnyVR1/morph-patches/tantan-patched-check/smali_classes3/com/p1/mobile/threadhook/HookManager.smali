.class public Lcom/p1/mobile/threadhook/HookManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/threadhook/HookManager$HookFailedException;,
        Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/threadhook/HookManager;

.field private static final TAG:Ljava/lang/String; = "Matrix.HookManager"


# instance fields
.field private volatile mEnableDebug:Z

.field private volatile mHasNativeInitialized:Z

.field private mInitializeGuard:[B

.field private mNativeLibLoader:Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;

.field private final mPendingHooks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/p1/mobile/threadhook/AbsHook;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/threadhook/HookManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/threadhook/HookManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/threadhook/HookManager;->INSTANCE:Lcom/p1/mobile/threadhook/HookManager;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mHasNativeInitialized:Z

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mInitializeGuard:[B

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mEnableDebug:Z

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mNativeLibLoader:Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;

    .line 23
    .line 24
    return-void
.end method

.method private commitHooksLocked()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/threadhook/HookManager$HookFailedException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_2

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/threadhook/AbsHook;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/threadhook/AbsHook;->getNativeLibraryName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/p1/mobile/threadhook/HookManager;->mNativeLibLoader:Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;

    .line 34
    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    invoke-interface {v4, v3}, Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;->loadLibrary(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    :try_start_2
    const-string v3, "Matrix.HookManager"

    .line 46
    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v5, "Fail to load native library for %s, skip next steps."

    .line 53
    .line 54
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    sget-object v3, Lcom/p1/mobile/threadhook/AbsHook$Status;->COMMIT_FAIL_ON_LOAD_LIB:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Lcom/p1/mobile/threadhook/AbsHook;->setStatus(Lcom/p1/mobile/threadhook/AbsHook$Status;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_1
    move-exception p0

    .line 82
    goto/16 :goto_3

    .line 83
    .line 84
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 85
    .line 86
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_5

    .line 95
    .line 96
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    check-cast v2, Lcom/p1/mobile/threadhook/AbsHook;

    .line 101
    .line 102
    invoke-virtual {v2}, Lcom/p1/mobile/threadhook/AbsHook;->getStatus()Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    sget-object v4, Lcom/p1/mobile/threadhook/AbsHook$Status;->UNCOMMIT:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 107
    .line 108
    if-eq v3, v4, :cond_4

    .line 109
    .line 110
    const-string v3, "Matrix.HookManager"

    .line 111
    .line 112
    new-instance v4, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v5, "%s has failed steps before, skip calling onConfigure on it."

    .line 118
    .line 119
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    invoke-virtual {v2}, Lcom/p1/mobile/threadhook/AbsHook;->onConfigure()Z

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    if-nez v3, :cond_3

    .line 146
    .line 147
    const-string v3, "Matrix.HookManager"

    .line 148
    .line 149
    new-instance v4, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v5, "Fail to configure %s, skip next steps"

    .line 155
    .line 156
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    sget-object v3, Lcom/p1/mobile/threadhook/AbsHook$Status;->COMMIT_FAIL_ON_CONFIGURE:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 178
    .line 179
    invoke-virtual {v2, v3}, Lcom/p1/mobile/threadhook/AbsHook;->setStatus(Lcom/p1/mobile/threadhook/AbsHook$Status;)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 184
    .line 185
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    if-eqz v2, :cond_8

    .line 194
    .line 195
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    check-cast v2, Lcom/p1/mobile/threadhook/AbsHook;

    .line 200
    .line 201
    invoke-virtual {v2}, Lcom/p1/mobile/threadhook/AbsHook;->getStatus()Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    sget-object v4, Lcom/p1/mobile/threadhook/AbsHook$Status;->UNCOMMIT:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 206
    .line 207
    if-eq v3, v4, :cond_6

    .line 208
    .line 209
    const-string v3, "Matrix.HookManager"

    .line 210
    .line 211
    new-instance v4, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    const-string v5, "%s has failed steps before, skip calling onHook on it."

    .line 217
    .line 218
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_6
    iget-boolean v3, p0, Lcom/p1/mobile/threadhook/HookManager;->mEnableDebug:Z

    .line 241
    .line 242
    invoke-virtual {v2, v3}, Lcom/p1/mobile/threadhook/AbsHook;->onHook(Z)Z

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    if-eqz v3, :cond_7

    .line 247
    .line 248
    sget-object v3, Lcom/p1/mobile/threadhook/AbsHook$Status;->COMMIT_SUCCESS:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 249
    .line 250
    invoke-virtual {v2, v3}, Lcom/p1/mobile/threadhook/AbsHook;->setStatus(Lcom/p1/mobile/threadhook/AbsHook$Status;)V

    .line 251
    .line 252
    .line 253
    goto :goto_2

    .line 254
    :cond_7
    const-string v3, "Matrix.HookManager"

    .line 255
    .line 256
    new-instance v4, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 259
    .line 260
    .line 261
    const-string v5, "Fail to do hook in %s."

    .line 262
    .line 263
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    .line 283
    .line 284
    sget-object v3, Lcom/p1/mobile/threadhook/AbsHook$Status;->COMMIT_FAIL_ON_HOOK:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 285
    .line 286
    invoke-virtual {v2, v3}, Lcom/p1/mobile/threadhook/AbsHook;->setStatus(Lcom/p1/mobile/threadhook/AbsHook$Status;)V

    .line 287
    .line 288
    .line 289
    goto :goto_2

    .line 290
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 291
    .line 292
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 293
    .line 294
    .line 295
    monitor-exit v0

    .line 296
    return-void

    .line 297
    :goto_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 298
    throw p0
.end method

.method private native doFinalInitializeNative(Z)V
.end method

.method private native doPreHookInitializeNative(Z)Z
.end method

.method public static getStack()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

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
    invoke-static {v0}, Lcom/p1/mobile/threadhook/HookManager;->stackTraceToString([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method private static stackTraceToString([Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .locals 6

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    array-length v1, p0

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_2

    .line 14
    .line 15
    aget-object v3, p0, v2

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    const-string v5, "java.lang.Thread"

    .line 22
    .line 23
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 v3, 0x3b

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method


# virtual methods
.method public addHook(Lcom/p1/mobile/threadhook/AbsHook;)Lcom/p1/mobile/threadhook/HookManager;
    .locals 2
    .param p1    # Lcom/p1/mobile/threadhook/AbsHook;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/threadhook/AbsHook;->getStatus()Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/threadhook/AbsHook$Status;->COMMIT_SUCCESS:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 15
    .line 16
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-object p0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0

    .line 24
    :cond_0
    return-object p0
.end method

.method public clearHooks()Lcom/p1/mobile/threadhook/HookManager;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-object p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public commitHooks()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/threadhook/HookManager$HookFailedException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/threadhook/HookManager;->mInitializeGuard:[B

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 5
    .line 6
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    :try_start_1
    iget-object v2, p0, Lcom/p1/mobile/threadhook/HookManager;->mPendingHooks:Ljava/util/Set;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 16
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_4

    .line 20
    :catchall_1
    move-exception p0

    .line 21
    goto :goto_3

    .line 22
    :cond_0
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 23
    :try_start_4
    iget-boolean v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mHasNativeInitialized:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 24
    .line 25
    if-nez v1, :cond_3

    .line 26
    .line 27
    :try_start_5
    iget-object v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mNativeLibLoader:Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    const-string v2, "matrix-hookcommon"

    .line 32
    .line 33
    invoke-interface {v1, v2}, Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;->loadLibrary(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_2
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const-string v1, "matrix-hookcommon"

    .line 40
    .line 41
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 42
    .line 43
    .line 44
    :goto_0
    :try_start_6
    iget-boolean v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mEnableDebug:Z

    .line 45
    .line 46
    invoke-direct {p0, v1}, Lcom/p1/mobile/threadhook/HookManager;->doPreHookInitializeNative(Z)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/threadhook/HookManager;->commitHooksLocked()V

    .line 53
    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mEnableDebug:Z

    .line 56
    .line 57
    invoke-direct {p0, v1}, Lcom/p1/mobile/threadhook/HookManager;->doFinalInitializeNative(Z)V

    .line 58
    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    iput-boolean v1, p0, Lcom/p1/mobile/threadhook/HookManager;->mHasNativeInitialized:Z

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    new-instance p0, Lcom/p1/mobile/threadhook/HookManager$HookFailedException;

    .line 65
    .line 66
    const-string v1, "Fail to do hook common pre-hook initialize."

    .line 67
    .line 68
    invoke-direct {p0, v1}, Lcom/p1/mobile/threadhook/HookManager$HookFailedException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0

    .line 72
    :goto_1
    const-string v1, "Matrix.HookManager"

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    monitor-exit v0

    .line 82
    return-void

    .line 83
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/threadhook/HookManager;->commitHooksLocked()V

    .line 84
    .line 85
    .line 86
    :goto_2
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 87
    return-void

    .line 88
    :goto_3
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 89
    :try_start_8
    throw p0

    .line 90
    :goto_4
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 91
    throw p0
.end method

.method public setEnableDebug(Z)Lcom/p1/mobile/threadhook/HookManager;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/threadhook/HookManager;->mEnableDebug:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setNativeLibraryLoader(Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;)Lcom/p1/mobile/threadhook/HookManager;
    .locals 0
    .param p1    # Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/threadhook/HookManager;->mNativeLibLoader:Lcom/p1/mobile/threadhook/HookManager$NativeLibraryLoader;

    .line 2
    .line 3
    return-object p0
.end method
