.class Lcom/clevertap/android/pushsdk/registerForContextMenu$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/pushsdk/registerForContextMenu;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# static fields
.field private static Movie:I = 0x0

.field private static onOptionsItemSelected:I = 0x40

.field private static valueOf:I = 0x1


# instance fields
.field final synthetic openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

.field final synthetic registerForContextMenu:J

.field final synthetic setContentView:Ljava/lang/Runnable;

.field final synthetic unregisterForContextMenu:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/lang/Runnable;JLandroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->setContentView:Ljava/lang/Runnable;

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->registerForContextMenu:J

    .line 6
    .line 7
    iput-object p5, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->unregisterForContextMenu:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private static openContextMenu(ILjava/lang/String;IIZ[Ljava/lang/Object;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :cond_0
    check-cast p1, [C

    .line 8
    .line 9
    sget-object v0, Lcom/guardsquare/dexguard/valueOf;->unregisterForContextMenu:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    new-array v1, p2, [C

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    sput v2, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 16
    .line 17
    :goto_0
    sget v3, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 18
    .line 19
    if-ge v3, p2, :cond_1

    .line 20
    .line 21
    aget-char v3, p1, v3

    .line 22
    .line 23
    sput v3, Lcom/guardsquare/dexguard/valueOf;->setContentView:I

    .line 24
    .line 25
    sget v3, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 26
    .line 27
    sget v4, Lcom/guardsquare/dexguard/valueOf;->setContentView:I

    .line 28
    .line 29
    add-int/2addr v4, p3

    .line 30
    int-to-char v4, v4

    .line 31
    aput-char v4, v1, v3

    .line 32
    .line 33
    sget v3, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 34
    .line 35
    aget-char v4, v1, v3

    .line 36
    .line 37
    sget v5, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->onOptionsItemSelected:I

    .line 38
    .line 39
    sub-int/2addr v4, v5

    .line 40
    int-to-char v4, v4

    .line 41
    aput-char v4, v1, v3

    .line 42
    .line 43
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    sput v3, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    if-lez p0, :cond_2

    .line 51
    .line 52
    sput p0, Lcom/guardsquare/dexguard/valueOf;->openContextMenu:I

    .line 53
    .line 54
    new-array p0, p2, [C

    .line 55
    .line 56
    invoke-static {v1, v2, p0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 57
    .line 58
    .line 59
    sget p1, Lcom/guardsquare/dexguard/valueOf;->openContextMenu:I

    .line 60
    .line 61
    sub-int p3, p2, p1

    .line 62
    .line 63
    invoke-static {p0, v2, v1, p3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    .line 65
    .line 66
    sget p1, Lcom/guardsquare/dexguard/valueOf;->openContextMenu:I

    .line 67
    .line 68
    sub-int p3, p2, p1

    .line 69
    .line 70
    invoke-static {p0, p1, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    .line 72
    .line 73
    :cond_2
    if-eqz p4, :cond_4

    .line 74
    .line 75
    new-array p0, p2, [C

    .line 76
    .line 77
    sput v2, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 78
    .line 79
    :goto_1
    sget p1, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 80
    .line 81
    if-ge p1, p2, :cond_3

    .line 82
    .line 83
    sub-int p3, p2, p1

    .line 84
    .line 85
    add-int/lit8 p3, p3, -0x1

    .line 86
    .line 87
    aget-char p3, v1, p3

    .line 88
    .line 89
    aput-char p3, p0, p1

    .line 90
    .line 91
    add-int/lit8 p1, p1, 0x1

    .line 92
    .line 93
    sput p1, Lcom/guardsquare/dexguard/valueOf;->registerForContextMenu:I

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    move-object v1, p0

    .line 97
    :cond_4
    new-instance p0, Ljava/lang/String;

    .line 98
    .line 99
    invoke-direct {p0, v1}, Ljava/lang/String;-><init>([C)V

    .line 100
    .line 101
    .line 102
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    aput-object p0, p5, v2

    .line 104
    .line 105
    return-void

    .line 106
    :goto_2
    monitor-exit v0

    .line 107
    throw p0
.end method


# virtual methods
.method public run()V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->valueOf:I

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x1d

    .line 6
    .line 7
    rem-int/lit16 v0, v0, 0x80

    .line 8
    .line 9
    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->Movie:I

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x1

    .line 15
    const/4 v6, 0x0

    .line 16
    :try_start_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 17
    .line 18
    .line 19
    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 20
    :try_start_1
    iget-object v0, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->setContentView:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 23
    .line 24
    .line 25
    move-result-object v8
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    :try_start_2
    iget-wide v9, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->registerForContextMenu:J

    .line 27
    .line 28
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-interface {v8, v9, v10, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    iget-object v9, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 34
    .line 35
    invoke-static {v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/Future;

    .line 36
    .line 37
    .line 38
    move-result-object v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 39
    if-nez v9, :cond_0

    .line 40
    .line 41
    :try_start_3
    invoke-interface {v7}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 46
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    :try_start_4
    iget-wide v9, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->registerForContextMenu:J

    .line 51
    .line 52
    iget-object v11, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 53
    .line 54
    invoke-static {v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->openContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)J

    .line 55
    .line 56
    .line 57
    move-result-wide v11

    .line 58
    iget-object v13, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 59
    .line 60
    invoke-static {v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onOptionsItemSelected(Lcom/clevertap/android/pushsdk/registerForContextMenu;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v13
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 64
    sub-long/2addr v11, v13

    .line 65
    sub-long/2addr v9, v11

    .line 66
    cmp-long v11, v9, v2

    .line 67
    .line 68
    if-gtz v11, :cond_2

    .line 69
    .line 70
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->valueOf:I

    .line 71
    .line 72
    add-int/lit8 v0, v0, 0x65

    .line 73
    .line 74
    rem-int/lit16 v9, v0, 0x80

    .line 75
    .line 76
    sput v9, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->Movie:I

    .line 77
    .line 78
    rem-int/lit8 v0, v0, 0x2

    .line 79
    .line 80
    iget-object v9, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 81
    .line 82
    if-nez v0, :cond_1

    .line 83
    .line 84
    :try_start_5
    invoke-static {v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/lang/Runnable;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 89
    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :catchall_0
    move-exception v0

    .line 94
    move-object v1, v0

    .line 95
    move-object v4, v7

    .line 96
    goto/16 :goto_3

    .line 97
    .line 98
    :catch_1
    move-exception v0

    .line 99
    move-object v4, v8

    .line 100
    goto/16 :goto_1

    .line 101
    .line 102
    :cond_1
    invoke-static {v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/lang/Runnable;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 107
    .line 108
    .line 109
    throw v4

    .line 110
    :cond_2
    iget-object v11, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 111
    .line 112
    invoke-static {v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/Future;

    .line 113
    .line 114
    .line 115
    move-result-object v11

    .line 116
    invoke-interface {v11, v9, v10, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    iget-object v0, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->unregisterForContextMenu:Landroid/os/Bundle;

    .line 120
    .line 121
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    .line 122
    .line 123
    .line 124
    move-result v9

    .line 125
    const/4 v10, 0x0

    .line 126
    cmpl-float v9, v9, v10

    .line 127
    .line 128
    add-int/lit8 v11, v9, 0x2

    .line 129
    .line 130
    const-string v12, "\u0006\uffff\ufffd\ufff7\u0008"

    .line 131
    .line 132
    invoke-static {v6, v6}, Landroid/widget/ExpandableListView;->getPackedPositionForChild(II)J

    .line 133
    .line 134
    .line 135
    move-result-wide v13

    .line 136
    cmp-long v9, v13, v2

    .line 137
    .line 138
    add-int/lit8 v13, v9, 0x6

    .line 139
    .line 140
    invoke-static {}, Landroid/view/KeyEvent;->getModifierMetaStateMask()I

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    int-to-byte v9, v9

    .line 145
    rsub-int v14, v9, 0xab

    .line 146
    .line 147
    new-array v9, v5, [Ljava/lang/Object;

    .line 148
    .line 149
    const/4 v15, 0x0

    .line 150
    move-object/from16 v16, v9

    .line 151
    .line 152
    invoke-static/range {v11 .. v16}, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu(ILjava/lang/String;IIZ[Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    aget-object v9, v16, v6

    .line 156
    .line 157
    check-cast v9, Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v9}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    invoke-static {}, Landroid/os/Process;->getElapsedCpuTime()J

    .line 164
    .line 165
    .line 166
    move-result-wide v11

    .line 167
    cmp-long v11, v11, v2

    .line 168
    .line 169
    add-int/lit8 v12, v11, 0x1

    .line 170
    .line 171
    const-string v13, "\ufff9\ufffe\ufffd\u000b\u0004"

    .line 172
    .line 173
    invoke-static {v6, v6}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 174
    .line 175
    .line 176
    move-result v11

    .line 177
    add-int/lit8 v14, v11, 0x5

    .line 178
    .line 179
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    .line 180
    .line 181
    .line 182
    move-result v11

    .line 183
    cmpl-float v10, v11, v10

    .line 184
    .line 185
    add-int/lit16 v15, v10, 0xa7

    .line 186
    .line 187
    new-array v10, v5, [Ljava/lang/Object;

    .line 188
    .line 189
    const/16 v16, 0x1

    .line 190
    .line 191
    move-object/from16 v17, v10

    .line 192
    .line 193
    invoke-static/range {v12 .. v17}, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu(ILjava/lang/String;IIZ[Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    aget-object v10, v17, v6

    .line 197
    .line 198
    check-cast v10, Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v10}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v10

    .line 204
    invoke-virtual {v0, v9, v10}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 212
    if-eqz v0, :cond_4

    .line 213
    .line 214
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->Movie:I

    .line 215
    .line 216
    add-int/lit8 v0, v0, 0x5f

    .line 217
    .line 218
    rem-int/lit16 v9, v0, 0x80

    .line 219
    .line 220
    sput v9, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->valueOf:I

    .line 221
    .line 222
    rem-int/lit8 v0, v0, 0x2

    .line 223
    .line 224
    iget-object v9, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 225
    .line 226
    if-eqz v0, :cond_3

    .line 227
    .line 228
    :try_start_6
    invoke-static {v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/lang/Runnable;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 233
    .line 234
    .line 235
    goto :goto_0

    .line 236
    :cond_3
    invoke-static {v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/lang/Runnable;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 241
    .line 242
    .line 243
    throw v4
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 244
    :cond_4
    :goto_0
    :try_start_7
    invoke-interface {v7}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 245
    .line 246
    .line 247
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->Movie:I

    .line 248
    .line 249
    add-int/lit8 v0, v0, 0xf

    .line 250
    .line 251
    rem-int/lit16 v0, v0, 0x80

    .line 252
    .line 253
    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->valueOf:I

    .line 254
    .line 255
    return-void

    .line 256
    :catch_2
    move-exception v0

    .line 257
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :catch_3
    move-exception v0

    .line 262
    goto :goto_1

    .line 263
    :catchall_1
    move-exception v0

    .line 264
    move-object v1, v0

    .line 265
    goto/16 :goto_3

    .line 266
    .line 267
    :catch_4
    move-exception v0

    .line 268
    move-object v7, v4

    .line 269
    :goto_1
    :try_start_8
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 270
    .line 271
    .line 272
    iget-object v0, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 273
    .line 274
    invoke-static {v0}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/lang/Runnable;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 279
    .line 280
    .line 281
    const-string v0, ""

    .line 282
    .line 283
    if-eqz v4, :cond_5

    .line 284
    .line 285
    :try_start_9
    invoke-interface {v4}, Ljava/util/concurrent/Future;->isCancelled()Z

    .line 286
    .line 287
    .line 288
    move-result v8

    .line 289
    if-nez v8, :cond_5

    .line 290
    .line 291
    invoke-static {v0, v0}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    .line 292
    .line 293
    .line 294
    move-result v8

    .line 295
    add-int/lit8 v9, v8, 0x4

    .line 296
    .line 297
    const-string v10, "\ufff6\u0007\u0005\u0000"

    .line 298
    .line 299
    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatDelay()I

    .line 300
    .line 301
    .line 302
    move-result v8

    .line 303
    shr-int/lit8 v8, v8, 0x10

    .line 304
    .line 305
    rsub-int/lit8 v11, v8, 0x4

    .line 306
    .line 307
    invoke-static {v6}, Landroid/widget/ExpandableListView;->getPackedPositionForGroup(I)J

    .line 308
    .line 309
    .line 310
    move-result-wide v12

    .line 311
    cmp-long v2, v12, v2

    .line 312
    .line 313
    rsub-int v12, v2, 0x8d

    .line 314
    .line 315
    new-array v14, v5, [Ljava/lang/Object;

    .line 316
    .line 317
    const/4 v13, 0x0

    .line 318
    invoke-static/range {v9 .. v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu(ILjava/lang/String;IIZ[Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    aget-object v2, v14, v6

    .line 322
    .line 323
    check-cast v2, Ljava/lang/String;

    .line 324
    .line 325
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    invoke-static {v6, v6, v6}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 330
    .line 331
    .line 332
    move-result v3

    .line 333
    add-int/lit8 v8, v3, 0x1c

    .line 334
    .line 335
    const-string v9, "\ufffe\u0000\u0007\u0007\u0004\t\u0002\uffbb\r\u0000\t\uffff\u0000\r\uffeb\u0010\u000e\u0003\uffef\ufffc\u000e\u0006\uffed\u0000\u000e\u0010\u0007\u000f\uffde\ufffc\t"

    .line 336
    .line 337
    invoke-static {v6, v6}, Landroid/view/View;->getDefaultSize(II)I

    .line 338
    .line 339
    .line 340
    move-result v3

    .line 341
    rsub-int/lit8 v10, v3, 0x1f

    .line 342
    .line 343
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 344
    .line 345
    .line 346
    move-result v3

    .line 347
    shr-int/lit8 v3, v3, 0x10

    .line 348
    .line 349
    add-int/lit16 v11, v3, 0xa5

    .line 350
    .line 351
    new-array v13, v5, [Ljava/lang/Object;

    .line 352
    .line 353
    const/4 v12, 0x0

    .line 354
    invoke-static/range {v8 .. v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu(ILjava/lang/String;IIZ[Ljava/lang/Object;)V

    .line 355
    .line 356
    .line 357
    aget-object v3, v13, v6

    .line 358
    .line 359
    check-cast v3, Ljava/lang/String;

    .line 360
    .line 361
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    invoke-static {v2, v3}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    invoke-interface {v4, v5}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 369
    .line 370
    .line 371
    :cond_5
    iget-object v2, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 372
    .line 373
    invoke-static {v2}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/Future;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    if-eqz v2, :cond_6

    .line 378
    .line 379
    iget-object v2, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 380
    .line 381
    invoke-static {v2}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/Future;

    .line 382
    .line 383
    .line 384
    move-result-object v2

    .line 385
    invoke-interface {v2}, Ljava/util/concurrent/Future;->isCancelled()Z

    .line 386
    .line 387
    .line 388
    move-result v2

    .line 389
    if-nez v2, :cond_6

    .line 390
    .line 391
    const/16 v2, 0x30

    .line 392
    .line 393
    invoke-static {v0, v2}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;C)I

    .line 394
    .line 395
    .line 396
    move-result v2

    .line 397
    rsub-int/lit8 v8, v2, 0x3

    .line 398
    .line 399
    const-string v9, "\ufff6\u0007\u0005\u0000"

    .line 400
    .line 401
    invoke-static {}, Landroid/view/ViewConfiguration;->getFadingEdgeLength()I

    .line 402
    .line 403
    .line 404
    move-result v2

    .line 405
    shr-int/lit8 v2, v2, 0x10

    .line 406
    .line 407
    rsub-int/lit8 v10, v2, 0x4

    .line 408
    .line 409
    invoke-static {v0}, Landroid/view/KeyEvent;->keyCodeFromString(Ljava/lang/String;)I

    .line 410
    .line 411
    .line 412
    move-result v0

    .line 413
    add-int/lit16 v11, v0, 0x8d

    .line 414
    .line 415
    new-array v13, v5, [Ljava/lang/Object;

    .line 416
    .line 417
    const/4 v12, 0x0

    .line 418
    invoke-static/range {v8 .. v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu(ILjava/lang/String;IIZ[Ljava/lang/Object;)V

    .line 419
    .line 420
    .line 421
    aget-object v0, v13, v6

    .line 422
    .line 423
    check-cast v0, Ljava/lang/String;

    .line 424
    .line 425
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    rsub-int/lit8 v8, v2, 0xf

    .line 434
    .line 435
    const-string v9, "\u0002\u0004\u000b\u000b\u0008\r\u0006\uffbf\u0005\u0014\u0013\u0014\u0011\u0004\uffd1\uffe2\u0000\r"

    .line 436
    .line 437
    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    .line 438
    .line 439
    .line 440
    move-result v2

    .line 441
    shr-int/lit8 v2, v2, 0x10

    .line 442
    .line 443
    add-int/lit8 v10, v2, 0x12

    .line 444
    .line 445
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    .line 446
    .line 447
    .line 448
    move-result v2

    .line 449
    shr-int/lit8 v2, v2, 0x8

    .line 450
    .line 451
    rsub-int v11, v2, 0xa1

    .line 452
    .line 453
    new-array v13, v5, [Ljava/lang/Object;

    .line 454
    .line 455
    const/4 v12, 0x0

    .line 456
    invoke-static/range {v8 .. v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu(ILjava/lang/String;IIZ[Ljava/lang/Object;)V

    .line 457
    .line 458
    .line 459
    aget-object v2, v13, v6

    .line 460
    .line 461
    check-cast v2, Ljava/lang/String;

    .line 462
    .line 463
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object v2

    .line 467
    invoke-static {v0, v2}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    iget-object v0, v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;->openContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 471
    .line 472
    invoke-static {v0}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/Future;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    invoke-interface {v0, v5}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 477
    .line 478
    .line 479
    :cond_6
    if-eqz v7, :cond_7

    .line 480
    .line 481
    :try_start_a
    invoke-interface {v7}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5

    .line 482
    .line 483
    .line 484
    goto :goto_2

    .line 485
    :catch_5
    move-exception v0

    .line 486
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 487
    .line 488
    .line 489
    :cond_7
    :goto_2
    return-void

    .line 490
    :goto_3
    if-eqz v4, :cond_8

    .line 491
    .line 492
    :try_start_b
    invoke-interface {v4}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6

    .line 493
    .line 494
    .line 495
    goto :goto_4

    .line 496
    :catch_6
    move-exception v0

    .line 497
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 498
    .line 499
    .line 500
    :cond_8
    :goto_4
    throw v1
.end method
