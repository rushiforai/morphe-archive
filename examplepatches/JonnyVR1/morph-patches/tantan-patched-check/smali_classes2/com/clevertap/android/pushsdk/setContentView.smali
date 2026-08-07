.class public final Lcom/clevertap/android/pushsdk/setContentView;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static Movie:[C = null

.field public static final onContextItemSelected:Ljava/lang/String;

.field public static final onOptionsItemSelected:I = 0x2713

.field public static final openContextMenu:Ljava/lang/String;

.field public static final registerForContextMenu:Ljava/lang/String;

.field public static final setContentView:Z = false

.field public static final unregisterForContextMenu:Ljava/lang/String;

.field private static valueOf:I = 0x0

.field private static values:C = '\u0000'

.field private static width:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 8

    invoke-static {}, Lcom/clevertap/android/pushsdk/setContentView;->unregisterForContextMenu()V

    const/4 v0, 0x0

    invoke-static {v0, v0}, Landroid/view/KeyEvent;->getDeadChar(II)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x5

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Landroid/widget/ExpandableListView;->getPackedPositionType(J)I

    move-result v4

    add-int/lit8 v4, v4, 0x7b

    int-to-byte v4, v4

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "\u0018\u0005\u0018\u0004\u3624"

    invoke-static {v1, v4, v7, v6}, Lcom/clevertap/android/pushsdk/setContentView;->setContentView(IBLjava/lang/String;[Ljava/lang/Object;)V

    aget-object v1, v6, v0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/clevertap/android/pushsdk/setContentView;->onContextItemSelected:Ljava/lang/String;

    const v1, -0xffffb6

    invoke-static {v0, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    sub-int/2addr v1, v4

    const-string v4, ""

    invoke-static {v4, v0}, Landroid/text/TextUtils;->getOffsetBefore(Ljava/lang/CharSequence;I)I

    move-result v4

    rsub-int/lit8 v4, v4, 0x36

    int-to-byte v4, v4

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "\u0001\u001c\u0008!\u000c\u001b\u0008\u000c\u001b\u0001\r\u0011\r\u001b\u0008\r\u0004\u000f\"\u0000\u0017\t\u0014\u001d\u0005\u0006\u0016\u0006\u001c\t\u0013\u0019\u0013\u0002\u0002\u0012\u000b\u0017\u0011\u0013#\u000f\u0017\t\u0016\u0006\u001c\t\u0013\u0019\u0013\u0002\u0010\u000e\u000b\u0004\u0010\u000b\u000e\u0019\u0017 \u0010\u0015\r#\u0017\u001b\u0004\u0018\u0001\u0003\u0004\u0018"

    invoke-static {v1, v4, v7, v6}, Lcom/clevertap/android/pushsdk/setContentView;->setContentView(IBLjava/lang/String;[Ljava/lang/Object;)V

    aget-object v1, v6, v0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/clevertap/android/pushsdk/setContentView;->unregisterForContextMenu:Ljava/lang/String;

    const v1, 0x1000007

    invoke-static {v0, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    add-int/2addr v4, v1

    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatDelay()I

    move-result v1

    shr-int/lit8 v1, v1, 0x10

    rsub-int/lit8 v1, v1, 0xb

    int-to-byte v1, v1

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "\u0010\u0007\u0016\u0006\u0015\u0017\u360a"

    invoke-static {v4, v1, v7, v6}, Lcom/clevertap/android/pushsdk/setContentView;->setContentView(IBLjava/lang/String;[Ljava/lang/Object;)V

    aget-object v1, v6, v0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/clevertap/android/pushsdk/setContentView;->registerForContextMenu:Ljava/lang/String;

    invoke-static {v0, v0}, Landroid/view/KeyEvent;->getDeadChar(II)I

    move-result v1

    add-int/lit8 v1, v1, 0x1d

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    cmp-long v2, v6, v2

    add-int/lit8 v2, v2, 0x48

    int-to-byte v2, v2

    new-array v3, v5, [Ljava/lang/Object;

    const-string v4, "\u0011\u001d\u0018\u0002\u0006\u0017\t\u001c\u0007\u0010\u0014\u0015\u0002\u0001\u0017\u0002\u000c\u000e\u0015#\u000c\u0005\u0004\u001f\u0014\n\u0017\u0010\u363a"

    invoke-static {v1, v2, v4, v3}, Lcom/clevertap/android/pushsdk/setContentView;->setContentView(IBLjava/lang/String;[Ljava/lang/Object;)V

    aget-object v0, v3, v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/clevertap/android/pushsdk/setContentView;->openContextMenu:Ljava/lang/String;

    sget v0, Lcom/clevertap/android/pushsdk/setContentView;->width:I

    add-int/lit8 v0, v0, 0x71

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/clevertap/android/pushsdk/setContentView;->valueOf:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    throw v0
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

.method private static setContentView(IBLjava/lang/String;[Ljava/lang/Object;)V
    .locals 10

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    :cond_0
    check-cast p2, [C

    .line 8
    .line 9
    sget-object v0, Lcom/guardsquare/dexguard/height;->Movie:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    sget-object v1, Lcom/clevertap/android/pushsdk/setContentView;->Movie:[C

    .line 13
    .line 14
    sget-char v2, Lcom/clevertap/android/pushsdk/setContentView;->values:C

    .line 15
    .line 16
    new-array v3, p0, [C

    .line 17
    .line 18
    rem-int/lit8 v4, p0, 0x2

    .line 19
    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    add-int/lit8 v4, p0, -0x1

    .line 23
    .line 24
    aget-char v5, p2, v4

    .line 25
    .line 26
    sub-int/2addr v5, p1

    .line 27
    int-to-char v5, v5

    .line 28
    aput-char v5, v3, v4

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto/16 :goto_4

    .line 33
    .line 34
    :cond_1
    move v4, p0

    .line 35
    :goto_0
    const/4 v5, 0x0

    .line 36
    const/4 v6, 0x1

    .line 37
    if-le v4, v6, :cond_5

    .line 38
    .line 39
    sput v5, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 40
    .line 41
    :goto_1
    sget v7, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 42
    .line 43
    if-ge v7, v4, :cond_5

    .line 44
    .line 45
    aget-char v7, p2, v7

    .line 46
    .line 47
    sput-char v7, Lcom/guardsquare/dexguard/height;->unregisterForContextMenu:C

    .line 48
    .line 49
    sget v7, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 50
    .line 51
    add-int/2addr v7, v6

    .line 52
    aget-char v7, p2, v7

    .line 53
    .line 54
    sput-char v7, Lcom/guardsquare/dexguard/height;->registerForContextMenu:C

    .line 55
    .line 56
    sget-char v7, Lcom/guardsquare/dexguard/height;->unregisterForContextMenu:C

    .line 57
    .line 58
    sget-char v8, Lcom/guardsquare/dexguard/height;->registerForContextMenu:C

    .line 59
    .line 60
    if-ne v7, v8, :cond_2

    .line 61
    .line 62
    sget v7, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 63
    .line 64
    sget-char v8, Lcom/guardsquare/dexguard/height;->unregisterForContextMenu:C

    .line 65
    .line 66
    sub-int/2addr v8, p1

    .line 67
    int-to-char v8, v8

    .line 68
    aput-char v8, v3, v7

    .line 69
    .line 70
    sget v7, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 71
    .line 72
    add-int/2addr v7, v6

    .line 73
    sget-char v8, Lcom/guardsquare/dexguard/height;->registerForContextMenu:C

    .line 74
    .line 75
    sub-int/2addr v8, p1

    .line 76
    int-to-char v8, v8

    .line 77
    aput-char v8, v3, v7

    .line 78
    .line 79
    goto/16 :goto_2

    .line 80
    .line 81
    :cond_2
    sget-char v7, Lcom/guardsquare/dexguard/height;->unregisterForContextMenu:C

    .line 82
    .line 83
    div-int/2addr v7, v2

    .line 84
    sput v7, Lcom/guardsquare/dexguard/height;->setContentView:I

    .line 85
    .line 86
    sget-char v7, Lcom/guardsquare/dexguard/height;->unregisterForContextMenu:C

    .line 87
    .line 88
    rem-int/2addr v7, v2

    .line 89
    sput v7, Lcom/guardsquare/dexguard/height;->onContextItemSelected:I

    .line 90
    .line 91
    sget-char v7, Lcom/guardsquare/dexguard/height;->registerForContextMenu:C

    .line 92
    .line 93
    div-int/2addr v7, v2

    .line 94
    sput v7, Lcom/guardsquare/dexguard/height;->openContextMenu:I

    .line 95
    .line 96
    sget-char v7, Lcom/guardsquare/dexguard/height;->registerForContextMenu:C

    .line 97
    .line 98
    rem-int/2addr v7, v2

    .line 99
    sput v7, Lcom/guardsquare/dexguard/height;->valueOf:I

    .line 100
    .line 101
    sget v7, Lcom/guardsquare/dexguard/height;->onContextItemSelected:I

    .line 102
    .line 103
    sget v8, Lcom/guardsquare/dexguard/height;->valueOf:I

    .line 104
    .line 105
    if-ne v7, v8, :cond_3

    .line 106
    .line 107
    sget v7, Lcom/guardsquare/dexguard/height;->setContentView:I

    .line 108
    .line 109
    add-int/2addr v7, v2

    .line 110
    sub-int/2addr v7, v6

    .line 111
    rem-int/2addr v7, v2

    .line 112
    sput v7, Lcom/guardsquare/dexguard/height;->setContentView:I

    .line 113
    .line 114
    sget v7, Lcom/guardsquare/dexguard/height;->openContextMenu:I

    .line 115
    .line 116
    add-int/2addr v7, v2

    .line 117
    sub-int/2addr v7, v6

    .line 118
    rem-int/2addr v7, v2

    .line 119
    sput v7, Lcom/guardsquare/dexguard/height;->openContextMenu:I

    .line 120
    .line 121
    sget v7, Lcom/guardsquare/dexguard/height;->setContentView:I

    .line 122
    .line 123
    mul-int/2addr v7, v2

    .line 124
    sget v8, Lcom/guardsquare/dexguard/height;->onContextItemSelected:I

    .line 125
    .line 126
    add-int/2addr v7, v8

    .line 127
    sget v8, Lcom/guardsquare/dexguard/height;->openContextMenu:I

    .line 128
    .line 129
    mul-int/2addr v8, v2

    .line 130
    sget v9, Lcom/guardsquare/dexguard/height;->valueOf:I

    .line 131
    .line 132
    add-int/2addr v8, v9

    .line 133
    sget v9, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 134
    .line 135
    aget-char v7, v1, v7

    .line 136
    .line 137
    aput-char v7, v3, v9

    .line 138
    .line 139
    add-int/lit8 v9, v9, 0x1

    .line 140
    .line 141
    aget-char v7, v1, v8

    .line 142
    .line 143
    aput-char v7, v3, v9

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_3
    sget v7, Lcom/guardsquare/dexguard/height;->setContentView:I

    .line 147
    .line 148
    sget v8, Lcom/guardsquare/dexguard/height;->openContextMenu:I

    .line 149
    .line 150
    if-ne v7, v8, :cond_4

    .line 151
    .line 152
    sget v7, Lcom/guardsquare/dexguard/height;->onContextItemSelected:I

    .line 153
    .line 154
    add-int/2addr v7, v2

    .line 155
    sub-int/2addr v7, v6

    .line 156
    rem-int/2addr v7, v2

    .line 157
    sput v7, Lcom/guardsquare/dexguard/height;->onContextItemSelected:I

    .line 158
    .line 159
    sget v7, Lcom/guardsquare/dexguard/height;->valueOf:I

    .line 160
    .line 161
    add-int/2addr v7, v2

    .line 162
    sub-int/2addr v7, v6

    .line 163
    rem-int/2addr v7, v2

    .line 164
    sput v7, Lcom/guardsquare/dexguard/height;->valueOf:I

    .line 165
    .line 166
    sget v7, Lcom/guardsquare/dexguard/height;->setContentView:I

    .line 167
    .line 168
    mul-int/2addr v7, v2

    .line 169
    sget v8, Lcom/guardsquare/dexguard/height;->onContextItemSelected:I

    .line 170
    .line 171
    add-int/2addr v7, v8

    .line 172
    sget v8, Lcom/guardsquare/dexguard/height;->openContextMenu:I

    .line 173
    .line 174
    mul-int/2addr v8, v2

    .line 175
    sget v9, Lcom/guardsquare/dexguard/height;->valueOf:I

    .line 176
    .line 177
    add-int/2addr v8, v9

    .line 178
    sget v9, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 179
    .line 180
    aget-char v7, v1, v7

    .line 181
    .line 182
    aput-char v7, v3, v9

    .line 183
    .line 184
    add-int/lit8 v9, v9, 0x1

    .line 185
    .line 186
    aget-char v7, v1, v8

    .line 187
    .line 188
    aput-char v7, v3, v9

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_4
    sget v7, Lcom/guardsquare/dexguard/height;->setContentView:I

    .line 192
    .line 193
    mul-int/2addr v7, v2

    .line 194
    sget v8, Lcom/guardsquare/dexguard/height;->valueOf:I

    .line 195
    .line 196
    add-int/2addr v7, v8

    .line 197
    sget v8, Lcom/guardsquare/dexguard/height;->openContextMenu:I

    .line 198
    .line 199
    mul-int/2addr v8, v2

    .line 200
    sget v9, Lcom/guardsquare/dexguard/height;->onContextItemSelected:I

    .line 201
    .line 202
    add-int/2addr v8, v9

    .line 203
    sget v9, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 204
    .line 205
    aget-char v7, v1, v7

    .line 206
    .line 207
    aput-char v7, v3, v9

    .line 208
    .line 209
    add-int/lit8 v9, v9, 0x1

    .line 210
    .line 211
    aget-char v7, v1, v8

    .line 212
    .line 213
    aput-char v7, v3, v9

    .line 214
    .line 215
    :goto_2
    sget v7, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 216
    .line 217
    add-int/lit8 v7, v7, 0x2

    .line 218
    .line 219
    sput v7, Lcom/guardsquare/dexguard/height;->onOptionsItemSelected:I

    .line 220
    .line 221
    goto/16 :goto_1

    .line 222
    .line 223
    :cond_5
    move p1, v5

    .line 224
    :goto_3
    if-ge p1, p0, :cond_6

    .line 225
    .line 226
    aget-char p2, v3, p1

    .line 227
    .line 228
    xor-int/lit16 p2, p2, 0x359a

    .line 229
    .line 230
    int-to-char p2, p2

    .line 231
    aput-char p2, v3, p1

    .line 232
    .line 233
    add-int/lit8 p1, p1, 0x1

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_6
    new-instance p0, Ljava/lang/String;

    .line 237
    .line 238
    invoke-direct {p0, v3}, Ljava/lang/String;-><init>([C)V

    .line 239
    .line 240
    .line 241
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    aput-object p0, p3, v5

    .line 243
    .line 244
    return-void

    .line 245
    :goto_4
    monitor-exit v0

    .line 246
    throw p0
.end method

.method public static unregisterForContextMenu()V
    .locals 1

    const/16 v0, 0x24

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/clevertap/android/pushsdk/setContentView;->Movie:[C

    const/4 v0, 0x6

    sput-char v0, Lcom/clevertap/android/pushsdk/setContentView;->values:C

    return-void

    nop

    :array_0
    .array-data 2
        0x35b4s
        0x35eas
        0x35a9s
        0x35d3s
        0x35bbs
        0x35f4s
        0x35dfs
        0x35ces
        0x35f2s
        0x35des
        0x35ffs
        0x35f9s
        0x35d5s
        0x35e8s
        0x35c8s
        0x35b7s
        0x35d4s
        0x35fes
        0x35f6s
        0x35ees
        0x35fbs
        0x35a0s
        0x35e9s
        0x35f5s
        0x35ccs
        0x35c9s
        0x35f7s
        0x35ecs
        0x35aas
        0x35abs
        0x35dds
        0x35f1s
        0x35d1s
        0x35f3s
        0x35efs
        0x35e2s
    .end array-data
.end method
