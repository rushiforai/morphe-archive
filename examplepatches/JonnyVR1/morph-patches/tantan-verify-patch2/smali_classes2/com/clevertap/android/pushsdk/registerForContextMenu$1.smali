.class Lcom/clevertap/android/pushsdk/registerForContextMenu$1;
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
.field private static Movie:C = '\u0000'

.field private static decodeByteArray:I = 0x1

.field private static height:C

.field private static isOpaque:I

.field private static onContextItemSelected:C

.field private static valueOf:C

.field private static values:[C

.field private static width:C


# instance fields
.field final synthetic onOptionsItemSelected:Landroid/os/Bundle;

.field final synthetic openContextMenu:Lcom/google/firebase/messaging/RemoteMessage;

.field final synthetic registerForContextMenu:Landroid/content/Intent;

.field final synthetic setContentView:Landroid/content/Context;

.field final synthetic unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x24

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->values:[C

    const/4 v0, 0x6

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->valueOf:C

    const/16 v0, 0x5a23

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->Movie:C

    const v0, 0xc34b

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->width:C

    const/16 v0, 0x4f81

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->height:C

    const/16 v0, 0x15e0

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onContextItemSelected:C

    return-void

    :array_0
    .array-data 2
        0x35d4s
        0x35b4s
        0x35f3s
        0x35ces
        0x35dcs
        0x35ecs
        0x35efs
        0x35fds
        0x35fes
        0x35f9s
        0x35f8s
        0x35d5s
        0x35d9s
        0x35e3s
        0x35f2s
        0x35cas
        0x35fbs
        0x35f7s
        0x35ees
        0x35f6s
        0x35f1s
        0x35e2s
        0x35d7s
        0x35e9s
        0x35e8s
        0x35d6s
        0x35f5s
        0x35bas
        0x35f4s
        0x35das
        0x35ffs
        0x35dbs
        0x35eas
        0x35d8s
        0x35c8s
        0x35fcs
    .end array-data
.end method

.method public constructor <init>(Lcom/clevertap/android/pushsdk/registerForContextMenu;Landroid/content/Intent;Landroid/os/Bundle;Lcom/google/firebase/messaging/RemoteMessage;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->registerForContextMenu:Landroid/content/Intent;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected:Landroid/os/Bundle;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->openContextMenu:Lcom/google/firebase/messaging/RemoteMessage;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V
    .locals 12

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    check-cast p0, [C

    .line 8
    .line 9
    sget-object v0, Lcom/guardsquare/dexguard/decodeByteArray;->setContentView:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    array-length v1, p0

    .line 13
    new-array v1, v1, [C

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    sput v2, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    .line 17
    .line 18
    const/4 v3, 0x2

    .line 19
    new-array v3, v3, [C

    .line 20
    .line 21
    :goto_0
    sget v4, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    .line 22
    .line 23
    array-length v5, p0

    .line 24
    if-ge v4, v5, :cond_2

    .line 25
    .line 26
    aget-char v5, p0, v4

    .line 27
    .line 28
    aput-char v5, v3, v2

    .line 29
    .line 30
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    aget-char v4, p0, v4

    .line 33
    .line 34
    const/4 v5, 0x1

    .line 35
    aput-char v4, v3, v5

    .line 36
    .line 37
    const v4, 0xe370

    .line 38
    .line 39
    .line 40
    move v6, v2

    .line 41
    :goto_1
    const/16 v7, 0x10

    .line 42
    .line 43
    if-ge v6, v7, :cond_1

    .line 44
    .line 45
    aget-char v7, v3, v5

    .line 46
    .line 47
    aget-char v8, v3, v2

    .line 48
    .line 49
    add-int v9, v8, v4

    .line 50
    .line 51
    shl-int/lit8 v10, v8, 0x4

    .line 52
    .line 53
    sget-char v11, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->width:C

    .line 54
    .line 55
    add-int/2addr v10, v11

    .line 56
    xor-int/2addr v9, v10

    .line 57
    ushr-int/lit8 v10, v8, 0x5

    .line 58
    .line 59
    sget-char v11, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->height:C

    .line 60
    .line 61
    add-int/2addr v10, v11

    .line 62
    xor-int/2addr v9, v10

    .line 63
    sub-int/2addr v7, v9

    .line 64
    int-to-char v7, v7

    .line 65
    aput-char v7, v3, v5

    .line 66
    .line 67
    add-int v9, v7, v4

    .line 68
    .line 69
    shl-int/lit8 v10, v7, 0x4

    .line 70
    .line 71
    sget-char v11, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onContextItemSelected:C

    .line 72
    .line 73
    add-int/2addr v10, v11

    .line 74
    xor-int/2addr v9, v10

    .line 75
    ushr-int/lit8 v7, v7, 0x5

    .line 76
    .line 77
    sget-char v10, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->Movie:C

    .line 78
    .line 79
    add-int/2addr v7, v10

    .line 80
    xor-int/2addr v7, v9

    .line 81
    sub-int/2addr v8, v7

    .line 82
    int-to-char v7, v8

    .line 83
    aput-char v7, v3, v2

    .line 84
    .line 85
    const v7, 0x9e37

    .line 86
    .line 87
    .line 88
    sub-int/2addr v4, v7

    .line 89
    add-int/lit8 v6, v6, 0x1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    goto :goto_2

    .line 94
    :cond_1
    sget v4, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    .line 95
    .line 96
    aget-char v6, v3, v2

    .line 97
    .line 98
    aput-char v6, v1, v4

    .line 99
    .line 100
    add-int/lit8 v6, v4, 0x1

    .line 101
    .line 102
    aget-char v5, v3, v5

    .line 103
    .line 104
    aput-char v5, v1, v6

    .line 105
    .line 106
    add-int/lit8 v4, v4, 0x2

    .line 107
    .line 108
    sput v4, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    new-instance p0, Ljava/lang/String;

    .line 112
    .line 113
    invoke-direct {p0, v1, v2, p1}, Ljava/lang/String;-><init>([CII)V

    .line 114
    .line 115
    .line 116
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    aput-object p0, p2, v2

    .line 118
    .line 119
    return-void

    .line 120
    :goto_2
    monitor-exit v0

    .line 121
    throw p0
.end method

.method private static setContentView(BILjava/lang/String;[Ljava/lang/Object;)V
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
    sget-object v1, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->values:[C

    .line 13
    .line 14
    sget-char v2, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->valueOf:C

    .line 15
    .line 16
    new-array v3, p1, [C

    .line 17
    .line 18
    rem-int/lit8 v4, p1, 0x2

    .line 19
    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    add-int/lit8 v4, p1, -0x1

    .line 23
    .line 24
    aget-char v5, p2, v4

    .line 25
    .line 26
    sub-int/2addr v5, p0

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
    move v4, p1

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
    sub-int/2addr v8, p0

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
    sub-int/2addr v8, p0

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
    move p0, v5

    .line 224
    :goto_3
    if-ge p0, p1, :cond_6

    .line 225
    .line 226
    aget-char p2, v3, p0

    .line 227
    .line 228
    xor-int/lit16 p2, p2, 0x359a

    .line 229
    .line 230
    int-to-char p2, p2

    .line 231
    aput-char p2, v3, p0

    .line 232
    .line 233
    add-int/lit8 p0, p0, 0x1

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


# virtual methods
.method public run()V
    .locals 14

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const/16 v1, 0x30

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;C)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    rsub-int/lit8 v2, v2, 0x35

    .line 10
    .line 11
    int-to-byte v2, v2

    .line 12
    const-wide/16 v3, 0x0

    .line 13
    .line 14
    invoke-static {v3, v4}, Landroid/widget/ExpandableListView;->getPackedPositionGroup(J)I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    rsub-int/lit8 v5, v5, 0x4

    .line 19
    .line 20
    const/4 v6, 0x1

    .line 21
    new-array v7, v6, [Ljava/lang/Object;

    .line 22
    .line 23
    const-string v8, "\u000f\u0000\u0004\u001c"

    .line 24
    .line 25
    invoke-static {v2, v5, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    aget-object v5, v7, v2

    .line 30
    .line 31
    check-cast v5, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    new-instance v7, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v2, v2}, Landroid/view/View;->getDefaultSize(II)I

    .line 43
    .line 44
    .line 45
    move-result v9

    .line 46
    add-int/lit8 v9, v9, 0x1e

    .line 47
    .line 48
    new-array v10, v6, [Ljava/lang/Object;

    .line 49
    .line 50
    const-string v11, "\u9523\u3234\u591d\ud192\u10c4\u4a08\u784d\uaac4\ue1a0\u769c\u5776\u8acb\u44b1\u0959\uf742\ua9b4\u74f2\u5b89\u5b1c\u8b80\u9db6\u8c98\uc246\uab6d\ubd82\u4352\ue7ab\u2b1f\u70aa\uab63"

    .line 51
    .line 52
    invoke-static {v11, v9, v10}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    aget-object v9, v10, v2

    .line 56
    .line 57
    check-cast v9, Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v9}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v9, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->registerForContextMenu:Landroid/content/Intent;

    .line 67
    .line 68
    invoke-virtual {v9}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 69
    .line 70
    .line 71
    move-result-object v9

    .line 72
    invoke-static {v9}, Lcom/clevertap/android/pushsdk/width;->openContextMenu(Landroid/os/Bundle;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v9

    .line 76
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-static {v5, v7}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v5, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected:Landroid/os/Bundle;

    .line 87
    .line 88
    invoke-static {v5}, Lcom/clevertap/android/sdk/CleverTapAPI;->getNotificationInfo(Landroid/os/Bundle;)Lcom/clevertap/android/sdk/pushnotification/NotificationInfo;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    iget-boolean v5, v5, Lcom/clevertap/android/sdk/pushnotification/NotificationInfo;->fromCleverTap:Z

    .line 93
    .line 94
    const/4 v7, 0x0

    .line 95
    const/4 v9, 0x0

    .line 96
    if-eqz v5, :cond_3

    .line 97
    .line 98
    sget v5, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->isOpaque:I

    .line 99
    .line 100
    add-int/lit8 v5, v5, 0x41

    .line 101
    .line 102
    rem-int/lit16 v5, v5, 0x80

    .line 103
    .line 104
    sput v5, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->decodeByteArray:I

    .line 105
    .line 106
    iget-object v5, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->openContextMenu:Lcom/google/firebase/messaging/RemoteMessage;

    .line 107
    .line 108
    iget-object v10, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView:Landroid/content/Context;

    .line 109
    .line 110
    invoke-static {v5, v10}, Lcom/clevertap/android/sdk/Utils;->isRenderFallback(Lcom/google/firebase/messaging/RemoteMessage;Landroid/content/Context;)Z

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-eqz v5, :cond_2

    .line 115
    .line 116
    :try_start_0
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 121
    .line 122
    .line 123
    move-result-wide v9

    .line 124
    cmp-long v9, v9, v3

    .line 125
    .line 126
    add-int/lit8 v9, v9, 0x32

    .line 127
    .line 128
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarFadeDuration()I

    .line 129
    .line 130
    .line 131
    move-result v10

    .line 132
    shr-int/lit8 v10, v10, 0x10

    .line 133
    .line 134
    int-to-char v10, v10

    .line 135
    invoke-static {v5, v9, v10}, Lcom/clevertap/android/pushsdk/unregisterForContextMenu;->setContentView(IIC)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    check-cast v5, Ljava/lang/Class;

    .line 140
    .line 141
    invoke-virtual {v5, v7}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-virtual {v5, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    check-cast v5, Lcom/clevertap/android/sdk/pushnotification/INotificationRenderer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 150
    .line 151
    :try_start_1
    iget-object v9, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView:Landroid/content/Context;

    .line 152
    .line 153
    iget-object v10, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected:Landroid/os/Bundle;

    .line 154
    .line 155
    invoke-static {v10}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationUtil;->getAccountIdFromNotificationBundle(Landroid/os/Bundle;)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v10

    .line 159
    invoke-static {v9, v10}, Lcom/clevertap/android/sdk/CleverTapAPI;->getGlobalInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 164
    .line 165
    .line 166
    move-result-object v10

    .line 167
    invoke-virtual {v10}, Ljava/lang/Thread;->isInterrupted()Z

    .line 168
    .line 169
    .line 170
    move-result v10

    .line 171
    if-eqz v10, :cond_0

    .line 172
    .line 173
    return-void

    .line 174
    :cond_0
    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    iget-object v10, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 178
    .line 179
    invoke-virtual {v9, v10}, Lcom/clevertap/android/sdk/CleverTapAPI;->setNotificationRenderedListener(Lcom/clevertap/android/sdk/interfaces/NotificationRenderedListener;)V

    .line 180
    .line 181
    .line 182
    const-string v10, "\ufa87\udc46\uc7fd\u5408\u80aa\uda71\uca8f\udfa5\u1344\u320d\ud1de\uf0b7\u52b1\u7d2a"

    .line 183
    .line 184
    invoke-static {v2}, Landroid/widget/ExpandableListView;->getPackedPositionForGroup(I)J

    .line 185
    .line 186
    .line 187
    move-result-wide v11

    .line 188
    cmp-long v11, v11, v3

    .line 189
    .line 190
    rsub-int/lit8 v11, v11, 0xd

    .line 191
    .line 192
    new-array v12, v6, [Ljava/lang/Object;

    .line 193
    .line 194
    invoke-static {v10, v11, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    aget-object v10, v12, v2

    .line 198
    .line 199
    check-cast v10, Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v10}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v10

    .line 205
    const/16 v11, 0x2713

    .line 206
    .line 207
    invoke-virtual {v9, v10, v11}, Lcom/clevertap/android/sdk/CleverTapAPI;->setCustomSdkVersion(Ljava/lang/String;I)V

    .line 208
    .line 209
    .line 210
    iget-object v10, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected:Landroid/os/Bundle;

    .line 211
    .line 212
    const-string v11, "\u7a23\u5f0c\uaf25\ud42d\u02a7\u08f2\u420e\u36d6\ud3d5\u5a7c"

    .line 213
    .line 214
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    .line 215
    .line 216
    .line 217
    move-result v12

    .line 218
    shr-int/lit8 v12, v12, 0x10

    .line 219
    .line 220
    rsub-int/lit8 v12, v12, 0x9

    .line 221
    .line 222
    new-array v13, v6, [Ljava/lang/Object;

    .line 223
    .line 224
    invoke-static {v11, v12, v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    aget-object v11, v13, v2

    .line 228
    .line 229
    check-cast v11, Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v11}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v11

    .line 235
    invoke-static {v3, v4}, Landroid/widget/ExpandableListView;->getPackedPositionGroup(J)I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    rsub-int/lit8 v3, v3, 0x13

    .line 240
    .line 241
    int-to-byte v3, v3

    .line 242
    invoke-static {v0, v1, v2, v2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    .line 243
    .line 244
    .line 245
    move-result v4

    .line 246
    add-int/lit8 v4, v4, 0x6

    .line 247
    .line 248
    const-string v12, "\"\u0011\u0014\u0012\u3612"

    .line 249
    .line 250
    new-array v13, v6, [Ljava/lang/Object;

    .line 251
    .line 252
    invoke-static {v3, v4, v12, v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    aget-object v3, v13, v2

    .line 256
    .line 257
    check-cast v3, Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    invoke-virtual {v10, v11, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    iget-object v3, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected:Landroid/os/Bundle;

    .line 267
    .line 268
    const-string v4, "\u5c27\u571e\u6cd8\u9c5b\u7fea\uc92d\ua4d4\uec14\u4e70\u3852"

    .line 269
    .line 270
    invoke-static {v0, v0}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    .line 271
    .line 272
    .line 273
    move-result v10

    .line 274
    rsub-int/lit8 v10, v10, 0x9

    .line 275
    .line 276
    new-array v11, v6, [Ljava/lang/Object;

    .line 277
    .line 278
    invoke-static {v4, v10, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    aget-object v4, v11, v2

    .line 282
    .line 283
    check-cast v4, Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    const-string v10, "\u9a80\u9c77\u2c39\u1f5c\u5776\u8acb\uba2b\u7362\uf132\u4b27\u788b\uabb0\ua01d\ub723\ue057\u932f\ufc69\ue1d4\ub885\u0ba3\u4117\u8d24\u5dc2\u0c49\uca8f\udfa5\u319e\u4b97"

    .line 290
    .line 291
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollDefaultDelay()I

    .line 292
    .line 293
    .line 294
    move-result v11

    .line 295
    shr-int/lit8 v11, v11, 0x10

    .line 296
    .line 297
    add-int/lit8 v11, v11, 0x1b

    .line 298
    .line 299
    new-array v12, v6, [Ljava/lang/Object;

    .line 300
    .line 301
    invoke-static {v10, v11, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 302
    .line 303
    .line 304
    aget-object v10, v12, v2

    .line 305
    .line 306
    check-cast v10, Ljava/lang/String;

    .line 307
    .line 308
    invoke-virtual {v10}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v10

    .line 312
    invoke-virtual {v3, v4, v10}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    iget-object v3, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 316
    .line 317
    iget-object v4, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView:Landroid/content/Context;

    .line 318
    .line 319
    iget-object v10, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected:Landroid/os/Bundle;

    .line 320
    .line 321
    invoke-virtual {v9, v5, v4, v10}, Lcom/clevertap/android/sdk/CleverTapAPI;->renderPushNotification(Lcom/clevertap/android/sdk/pushnotification/INotificationRenderer;Landroid/content/Context;Landroid/os/Bundle;)Ljava/util/concurrent/Future;

    .line 322
    .line 323
    .line 324
    move-result-object v4

    .line 325
    invoke-static {v3, v4}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onOptionsItemSelected(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;

    .line 326
    .line 327
    .line 328
    goto/16 :goto_1

    .line 329
    .line 330
    :catchall_0
    move-exception v3

    .line 331
    goto :goto_0

    .line 332
    :catchall_1
    move-exception v3

    .line 333
    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    if-eqz v4, :cond_1

    .line 338
    .line 339
    throw v4

    .line 340
    :cond_1
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 341
    :goto_0
    invoke-static {v2}, Landroid/view/KeyEvent;->normalizeMetaState(I)I

    .line 342
    .line 343
    .line 344
    move-result v4

    .line 345
    add-int/lit8 v4, v4, 0x36

    .line 346
    .line 347
    int-to-byte v4, v4

    .line 348
    invoke-static {v0, v1, v2, v2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    .line 349
    .line 350
    .line 351
    move-result v1

    .line 352
    rsub-int/lit8 v1, v1, 0x3

    .line 353
    .line 354
    new-array v5, v6, [Ljava/lang/Object;

    .line 355
    .line 356
    invoke-static {v4, v1, v8, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 357
    .line 358
    .line 359
    aget-object v1, v5, v2

    .line 360
    .line 361
    check-cast v1, Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    invoke-static {v0, v2, v2}, Landroid/text/TextUtils;->getCapsMode(Ljava/lang/CharSequence;II)I

    .line 368
    .line 369
    .line 370
    move-result v4

    .line 371
    rsub-int/lit8 v4, v4, 0x19

    .line 372
    .line 373
    new-array v5, v6, [Ljava/lang/Object;

    .line 374
    .line 375
    const-string v8, "\u36c8\u4bf0\u9262\ufc94\u2cde\ud147\u9e98\uba5a\u1344\u320d\ufc69\ue1d4\u94dd\uc9d5\u6dd1\uc503\uc906\u549f\u9e98\uba5a\uc9d7\u728e\u591d\ud192\ub472\uc551"

    .line 376
    .line 377
    invoke-static {v8, v4, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 378
    .line 379
    .line 380
    aget-object v4, v5, v2

    .line 381
    .line 382
    check-cast v4, Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v4

    .line 388
    invoke-static {v1, v4}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 392
    .line 393
    .line 394
    iget-object v1, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 395
    .line 396
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 397
    .line 398
    .line 399
    move-result v3

    .line 400
    add-int/lit8 v3, v3, 0x34

    .line 401
    .line 402
    int-to-byte v3, v3

    .line 403
    invoke-static {v0}, Landroid/view/KeyEvent;->keyCodeFromString(Ljava/lang/String;)I

    .line 404
    .line 405
    .line 406
    move-result v0

    .line 407
    add-int/lit8 v0, v0, 0x1f

    .line 408
    .line 409
    new-array v4, v6, [Ljava/lang/Object;

    .line 410
    .line 411
    const-string v5, "!\u0012\u0006!\u001e\u0014\u0008 \u001d\u001c\t\u0007\u001a\u0000\u0019\n\u001c\u0019\"\u0018\u0006 \u001b\u000c\u000b\u0012\u000f\u0002\u0011\u0016\u3625"

    .line 412
    .line 413
    invoke-static {v3, v0, v5, v4}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 414
    .line 415
    .line 416
    aget-object v0, v4, v2

    .line 417
    .line 418
    check-cast v0, Ljava/lang/String;

    .line 419
    .line 420
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    invoke-static {v1, v0}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    goto/16 :goto_1

    .line 428
    .line 429
    :cond_2
    invoke-static {v0, v2}, Landroid/text/TextUtils;->getOffsetBefore(Ljava/lang/CharSequence;I)I

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    add-int/lit8 v0, v0, 0x36

    .line 434
    .line 435
    int-to-byte v0, v0

    .line 436
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    .line 437
    .line 438
    .line 439
    move-result-wide v3

    .line 440
    const-wide/16 v10, -0x1

    .line 441
    .line 442
    cmp-long v1, v3, v10

    .line 443
    .line 444
    add-int/lit8 v1, v1, 0x3

    .line 445
    .line 446
    new-array v3, v6, [Ljava/lang/Object;

    .line 447
    .line 448
    invoke-static {v0, v1, v8, v3}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 449
    .line 450
    .line 451
    aget-object v0, v3, v2

    .line 452
    .line 453
    check-cast v0, Ljava/lang/String;

    .line 454
    .line 455
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 460
    .line 461
    .line 462
    move-result v1

    .line 463
    shr-int/lit8 v1, v1, 0x16

    .line 464
    .line 465
    rsub-int/lit8 v1, v1, 0x44

    .line 466
    .line 467
    int-to-byte v1, v1

    .line 468
    invoke-static {v2, v9, v9}, Landroid/util/TypedValue;->complexToFraction(IFF)F

    .line 469
    .line 470
    .line 471
    move-result v3

    .line 472
    cmpl-float v3, v3, v9

    .line 473
    .line 474
    rsub-int/lit8 v3, v3, 0x32

    .line 475
    .line 476
    new-array v4, v6, [Ljava/lang/Object;

    .line 477
    .line 478
    const-string v5, "\u0002\u0018\u0014\u0000 \u0005\n\u000f\u0014\u0000\u001b\u001d\u001a!\u0011\u000e\u0014\u0019\u000e\n\u001a\t\u0018 \u0015\u001d\u001d\u001b\u0015\u0018\u000f\u0011\u0000#\u001c\u000f\u001d!\r\u0016\u0016\u0007\u000f\n\u0015\u001a\u0012 \u0013\u0007"

    .line 479
    .line 480
    invoke-static {v1, v3, v5, v4}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 481
    .line 482
    .line 483
    aget-object v1, v4, v2

    .line 484
    .line 485
    check-cast v1, Ljava/lang/String;

    .line 486
    .line 487
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v1

    .line 491
    invoke-static {v0, v1}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    .line 493
    .line 494
    iget-object v0, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 495
    .line 496
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    shr-int/lit8 v1, v1, 0x10

    .line 501
    .line 502
    rsub-int/lit8 v1, v1, 0x19

    .line 503
    .line 504
    new-array v3, v6, [Ljava/lang/Object;

    .line 505
    .line 506
    const-string v4, "\u1537\u3b4e\u5901\ubf62\u7437\u8213\u7ce5\ue51f\u4459\ue849\u5da3\u0a41\uba2b\u7362\ua616\u300d\u41d4\u65a5\u61d7\ubd76\uc91c\uc43e\ub943\u4451\u4e70\u3852"

    .line 507
    .line 508
    invoke-static {v4, v1, v3}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 509
    .line 510
    .line 511
    aget-object v1, v3, v2

    .line 512
    .line 513
    check-cast v1, Ljava/lang/String;

    .line 514
    .line 515
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v1

    .line 519
    invoke-static {v0, v1}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    goto :goto_1

    .line 523
    :cond_3
    invoke-static {v2, v2}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 524
    .line 525
    .line 526
    move-result v0

    .line 527
    rsub-int/lit8 v0, v0, 0x36

    .line 528
    .line 529
    int-to-byte v0, v0

    .line 530
    invoke-static {v3, v4}, Landroid/widget/ExpandableListView;->getPackedPositionType(J)I

    .line 531
    .line 532
    .line 533
    move-result v1

    .line 534
    add-int/lit8 v1, v1, 0x4

    .line 535
    .line 536
    new-array v3, v6, [Ljava/lang/Object;

    .line 537
    .line 538
    invoke-static {v0, v1, v8, v3}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 539
    .line 540
    .line 541
    aget-object v0, v3, v2

    .line 542
    .line 543
    check-cast v0, Ljava/lang/String;

    .line 544
    .line 545
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object v0

    .line 549
    invoke-static {v2}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    .line 550
    .line 551
    .line 552
    move-result v1

    .line 553
    add-int/lit8 v1, v1, 0x26

    .line 554
    .line 555
    int-to-byte v1, v1

    .line 556
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    .line 557
    .line 558
    .line 559
    move-result v3

    .line 560
    cmpl-float v3, v3, v9

    .line 561
    .line 562
    rsub-int/lit8 v3, v3, 0x2c

    .line 563
    .line 564
    new-array v4, v6, [Ljava/lang/Object;

    .line 565
    .line 566
    const-string v5, "\u0002\u0018\u0014\u0000 \u0005\n\u000f\u0014\u0000\u001b\u001d\u001a!\u0011\u000e\u0014\u0019\u000e\n\u001a\u0003\u0015\u001d\u001d\u001b\u0015\u0018\u001e\u001d\u001d\u000e\u0018\u000f\u0012\u001f\u0000#\u001b\u0000\u000e\"\u35d9"

    .line 567
    .line 568
    invoke-static {v1, v3, v5, v4}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->setContentView(BILjava/lang/String;[Ljava/lang/Object;)V

    .line 569
    .line 570
    .line 571
    aget-object v1, v4, v2

    .line 572
    .line 573
    check-cast v1, Ljava/lang/String;

    .line 574
    .line 575
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 576
    .line 577
    .line 578
    move-result-object v1

    .line 579
    invoke-static {v0, v1}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    .line 581
    .line 582
    iget-object v0, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 583
    .line 584
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 585
    .line 586
    .line 587
    move-result v1

    .line 588
    shr-int/lit8 v1, v1, 0x16

    .line 589
    .line 590
    rsub-int/lit8 v1, v1, 0x1a

    .line 591
    .line 592
    new-array v3, v6, [Ljava/lang/Object;

    .line 593
    .line 594
    const-string v4, "\u578a\u4dad\u5081\u7947\u41d4\u65a5\u61d7\ubd76\u9486\u4796\ue1a0\u769c\u5d97\u8e8b\uf1c8\uc39c\ua5fe\uf71f\u37fb\u097c\uca8f\udfa5\u7235\uc363\uc0fb\u09a4"

    .line 595
    .line 596
    invoke-static {v4, v1, v3}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->onOptionsItemSelected(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 597
    .line 598
    .line 599
    aget-object v1, v3, v2

    .line 600
    .line 601
    check-cast v1, Ljava/lang/String;

    .line 602
    .line 603
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 604
    .line 605
    .line 606
    move-result-object v1

    .line 607
    invoke-static {v0, v1}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/lang/String;)V

    .line 608
    .line 609
    .line 610
    :goto_1
    iget-object p0, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 611
    .line 612
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 613
    .line 614
    .line 615
    move-result-wide v0

    .line 616
    invoke-static {p0, v0, v1}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;J)J

    .line 617
    .line 618
    .line 619
    sget p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->decodeByteArray:I

    .line 620
    .line 621
    add-int/lit8 p0, p0, 0xf

    .line 622
    .line 623
    rem-int/lit16 v0, p0, 0x80

    .line 624
    .line 625
    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;->isOpaque:I

    .line 626
    .line 627
    rem-int/lit8 p0, p0, 0x2

    .line 628
    .line 629
    if-nez p0, :cond_4

    .line 630
    .line 631
    return-void

    .line 632
    :cond_4
    throw v7
.end method
