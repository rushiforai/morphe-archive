.class public final Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;
    }
.end annotation


# static fields
.field public static final ADVERTISING_ID:I = 0x10

.field public static final APP_PROCESS:I = 0x40

.field public static final APP_USER_ID:I = 0x20

.field public static final DEVICE:I = 0x1

.field public static final OS_BUILD_INFO:I = 0x4

.field public static final OS_SESSION:I = 0x8

.field public static REQUIRED_PERMISSIONS:[Ljava/lang/String; = null

.field public static final SIM_CARD:I = 0x2

.field private static ʼ:I = 0x0

.field private static ʽ:I = 0x1

.field private static final ˊ:[B

.field private static final ˋ:[B

.field private static final ˎ:[Ljava/lang/String;

.field private static final ˏ:[Ljava/lang/String;

.field private static final ॱ:Ljava/util/regex/Pattern;

.field private static ᐝ:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 5
    .line 6
    const/16 v1, 0x188

    .line 7
    .line 8
    aget-byte v2, v0, v1

    .line 9
    .line 10
    int-to-byte v2, v2

    .line 11
    const/16 v3, 0x13e

    .line 12
    .line 13
    aget-byte v4, v0, v3

    .line 14
    .line 15
    neg-int v4, v4

    .line 16
    int-to-byte v4, v4

    .line 17
    const/16 v5, 0x260

    .line 18
    .line 19
    invoke-static {v2, v4, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/16 v4, 0x1b1

    .line 24
    .line 25
    aget-byte v4, v0, v4

    .line 26
    .line 27
    neg-int v4, v4

    .line 28
    int-to-byte v4, v4

    .line 29
    aget-byte v5, v0, v3

    .line 30
    .line 31
    neg-int v5, v5

    .line 32
    int-to-byte v5, v5

    .line 33
    const/16 v6, 0x10d

    .line 34
    .line 35
    invoke-static {v4, v5, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    const/16 v5, 0xde

    .line 40
    .line 41
    aget-byte v5, v0, v5

    .line 42
    .line 43
    neg-int v5, v5

    .line 44
    int-to-byte v5, v5

    .line 45
    aget-byte v3, v0, v3

    .line 46
    .line 47
    neg-int v3, v3

    .line 48
    int-to-byte v3, v3

    .line 49
    const/16 v6, 0x1fa

    .line 50
    .line 51
    invoke-static {v5, v3, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    filled-new-array {v2, v4, v3}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    sput-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->REQUIRED_PERMISSIONS:[Ljava/lang/String;

    .line 60
    .line 61
    aget-byte v2, v0, v1

    .line 62
    .line 63
    int-to-byte v2, v2

    .line 64
    sget v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ᐝ:I

    .line 65
    .line 66
    and-int/lit16 v3, v3, 0x1ee

    .line 67
    .line 68
    int-to-byte v3, v3

    .line 69
    const/16 v4, 0x214

    .line 70
    .line 71
    invoke-static {v2, v3, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const/16 v3, 0x66

    .line 76
    .line 77
    aget-byte v3, v0, v3

    .line 78
    .line 79
    neg-int v3, v3

    .line 80
    int-to-byte v3, v3

    .line 81
    shl-int/lit8 v4, v3, 0x1

    .line 82
    .line 83
    int-to-byte v4, v4

    .line 84
    const/16 v5, 0x282

    .line 85
    .line 86
    invoke-static {v3, v4, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    const/16 v4, 0x69

    .line 91
    .line 92
    aget-byte v4, v0, v4

    .line 93
    .line 94
    int-to-byte v4, v4

    .line 95
    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ᐝ:I

    .line 96
    .line 97
    and-int/lit16 v5, v5, 0x1ee

    .line 98
    .line 99
    int-to-byte v5, v5

    .line 100
    xor-int/lit16 v6, v5, 0x197

    .line 101
    .line 102
    and-int/lit16 v7, v5, 0x197

    .line 103
    .line 104
    or-int/2addr v6, v7

    .line 105
    int-to-short v6, v6

    .line 106
    invoke-static {v4, v5, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    filled-new-array {v2, v3, v4}, [Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    sput-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˎ:[Ljava/lang/String;

    .line 115
    .line 116
    aget-byte v1, v0, v1

    .line 117
    .line 118
    add-int/lit8 v1, v1, -0x1

    .line 119
    .line 120
    int-to-byte v1, v1

    .line 121
    const/16 v2, 0x8f

    .line 122
    .line 123
    aget-byte v2, v0, v2

    .line 124
    .line 125
    xor-int/lit8 v2, v2, -0x1

    .line 126
    .line 127
    rsub-int/lit8 v2, v2, -0x2

    .line 128
    .line 129
    int-to-byte v2, v2

    .line 130
    const/16 v3, 0x130

    .line 131
    .line 132
    invoke-static {v1, v2, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    sput-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ॱ:Ljava/util/regex/Pattern;

    .line 141
    .line 142
    const/16 v1, 0x1f

    .line 143
    .line 144
    aget-byte v2, v0, v1

    .line 145
    .line 146
    int-to-byte v2, v2

    .line 147
    const/16 v3, 0x10c

    .line 148
    .line 149
    aget-byte v3, v0, v3

    .line 150
    .line 151
    int-to-byte v3, v3

    .line 152
    const/16 v4, 0x10a

    .line 153
    .line 154
    invoke-static {v2, v3, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    const/16 v3, 0x30

    .line 159
    .line 160
    aget-byte v3, v0, v3

    .line 161
    .line 162
    int-to-byte v3, v3

    .line 163
    aget-byte v0, v0, v1

    .line 164
    .line 165
    int-to-byte v0, v0

    .line 166
    xor-int/lit16 v1, v0, 0xbf

    .line 167
    .line 168
    and-int/lit16 v4, v0, 0xbf

    .line 169
    .line 170
    or-int/2addr v1, v4

    .line 171
    int-to-short v1, v1

    .line 172
    invoke-static {v3, v0, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    filled-new-array {v2, v0}, [Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ:[Ljava/lang/String;

    .line 181
    .line 182
    const/4 v0, 0x0

    .line 183
    new-array v0, v0, [B

    .line 184
    .line 185
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˋ:[B

    .line 186
    .line 187
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 188
    .line 189
    xor-int/lit8 v1, v0, 0x5

    .line 190
    .line 191
    and-int/lit8 v0, v0, 0x5

    .line 192
    .line 193
    shl-int/lit8 v0, v0, 0x1

    .line 194
    .line 195
    add-int/2addr v1, v0

    .line 196
    rem-int/lit16 v0, v1, 0x80

    .line 197
    .line 198
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 199
    .line 200
    rem-int/lit8 v1, v1, 0x2

    .line 201
    .line 202
    if-nez v1, :cond_0

    .line 203
    .line 204
    return-void

    .line 205
    :cond_0
    const/4 v0, 0x0

    .line 206
    throw v0
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static generateFingerprint(Landroid/content/Context;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;
    .locals 2

    .line 1122
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    add-int/lit8 v0, v0, 0x71

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->generateFingerprint(Landroid/content/Context;I)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;

    move-result-object p0

    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    and-int/lit8 v1, v0, 0x31

    or-int/lit8 v0, v0, 0x31

    add-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method public static generateFingerprint(Landroid/content/Context;I)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;
    .locals 22

    .line 1
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    and-int/lit8 v1, p1, 0x3

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 13
    .line 14
    and-int/lit8 v3, v2, 0x47

    .line 15
    .line 16
    or-int/lit8 v2, v2, 0x47

    .line 17
    .line 18
    add-int/2addr v3, v2

    .line 19
    rem-int/lit16 v3, v3, 0x80

    .line 20
    .line 21
    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 22
    .line 23
    xor-int/lit8 v2, p1, 0x3

    .line 24
    .line 25
    or-int/2addr v1, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move/from16 v1, p1

    .line 28
    .line 29
    :goto_0
    and-int/lit8 v2, v1, 0x1

    .line 30
    .line 31
    const/16 v5, 0x3a

    .line 32
    .line 33
    const/4 v6, 0x2

    .line 34
    const/4 v7, 0x0

    .line 35
    const/4 v8, 0x1

    .line 36
    if-eqz v2, :cond_5

    .line 37
    .line 38
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 39
    .line 40
    xor-int/lit8 v9, v2, 0x15

    .line 41
    .line 42
    and-int/lit8 v2, v2, 0x15

    .line 43
    .line 44
    shl-int/2addr v2, v8

    .line 45
    add-int/2addr v9, v2

    .line 46
    rem-int/lit16 v9, v9, 0x80

    .line 47
    .line 48
    sput v9, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 49
    .line 50
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 51
    .line 52
    const/16 v9, 0x1a

    .line 53
    .line 54
    if-ge v2, v9, :cond_5

    .line 55
    .line 56
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 57
    .line 58
    add-int/lit8 v2, v2, 0x2f

    .line 59
    .line 60
    rem-int/lit16 v2, v2, 0x80

    .line 61
    .line 62
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 63
    .line 64
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ:[Ljava/lang/String;

    .line 65
    .line 66
    array-length v9, v2

    .line 67
    move v10, v7

    .line 68
    :goto_1
    if-ge v10, v9, :cond_5

    .line 69
    .line 70
    aget-object v11, v2, v10

    .line 71
    .line 72
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 73
    .line 74
    .line 75
    move-result-object v12

    .line 76
    invoke-static {v11, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;)[B

    .line 77
    .line 78
    .line 79
    move-result-object v11

    .line 80
    new-instance v12, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const/16 v13, 0x11

    .line 83
    .line 84
    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 85
    .line 86
    .line 87
    array-length v13, v11

    .line 88
    move v14, v7

    .line 89
    :goto_2
    if-ge v14, v13, :cond_3

    .line 90
    .line 91
    sget v15, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 92
    .line 93
    add-int/lit8 v15, v15, 0x45

    .line 94
    .line 95
    const/16 p0, 0x1f

    .line 96
    .line 97
    rem-int/lit16 v3, v15, 0x80

    .line 98
    .line 99
    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 100
    .line 101
    rem-int/2addr v15, v6

    .line 102
    if-nez v15, :cond_2

    .line 103
    .line 104
    aget-byte v3, v11, v14

    .line 105
    .line 106
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->length()I

    .line 107
    .line 108
    .line 109
    move-result v15

    .line 110
    if-lez v15, :cond_1

    .line 111
    .line 112
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    :cond_1
    sget-object v15, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 116
    .line 117
    aget-byte v15, v15, p0

    .line 118
    .line 119
    int-to-byte v15, v15

    .line 120
    xor-int/lit8 v16, v15, 0x52

    .line 121
    .line 122
    and-int/lit8 v17, v15, 0x52

    .line 123
    .line 124
    const/16 p1, 0x0

    .line 125
    .line 126
    or-int v4, v16, v17

    .line 127
    .line 128
    int-to-byte v4, v4

    .line 129
    sget v16, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ᐝ:I

    .line 130
    .line 131
    move/from16 v17, v5

    .line 132
    .line 133
    shl-int/lit8 v5, v16, 0x2

    .line 134
    .line 135
    int-to-short v5, v5

    .line 136
    invoke-static {v15, v4, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    and-int/lit8 v3, v14, 0x1

    .line 156
    .line 157
    or-int/lit8 v4, v14, 0x1

    .line 158
    .line 159
    add-int v14, v3, v4

    .line 160
    .line 161
    move/from16 v5, v17

    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_2
    const/16 p1, 0x0

    .line 165
    .line 166
    aget-byte v0, v11, v14

    .line 167
    .line 168
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->length()I

    .line 169
    .line 170
    .line 171
    throw p1

    .line 172
    :cond_3
    move/from16 v17, v5

    .line 173
    .line 174
    const/16 p0, 0x1f

    .line 175
    .line 176
    const/16 p1, 0x0

    .line 177
    .line 178
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    invoke-static {v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˎ(Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    if-eq v3, v8, :cond_4

    .line 187
    .line 188
    xor-int/lit8 v3, v10, 0x1

    .line 189
    .line 190
    and-int/lit8 v4, v10, 0x1

    .line 191
    .line 192
    shl-int/2addr v4, v8

    .line 193
    add-int v10, v3, v4

    .line 194
    .line 195
    move/from16 v5, v17

    .line 196
    .line 197
    goto/16 :goto_1

    .line 198
    .line 199
    :cond_4
    invoke-virtual {v0, v11}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ([B)V

    .line 200
    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_5
    move/from16 v17, v5

    .line 204
    .line 205
    const/16 p0, 0x1f

    .line 206
    .line 207
    const/16 p1, 0x0

    .line 208
    .line 209
    :goto_3
    and-int/lit8 v2, v1, 0x2

    .line 210
    .line 211
    const-class v4, Ljava/lang/String;

    .line 212
    .line 213
    const/16 v9, 0x30

    .line 214
    .line 215
    const/16 v10, 0x13e

    .line 216
    .line 217
    const/16 v11, 0xf

    .line 218
    .line 219
    if-eqz v2, :cond_7

    .line 220
    .line 221
    const/16 v2, 0x1f6

    .line 222
    .line 223
    :try_start_0
    sget-object v12, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 224
    .line 225
    aget-byte v13, v12, v17

    .line 226
    .line 227
    int-to-byte v13, v13

    .line 228
    aget-byte v14, v12, v11

    .line 229
    .line 230
    int-to-byte v14, v14

    .line 231
    aget-byte v15, v12, v10

    .line 232
    .line 233
    neg-int v15, v15

    .line 234
    int-to-short v15, v15

    .line 235
    invoke-static {v13, v14, v15}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v13

    .line 239
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Landroid/content/Context;

    .line 240
    .line 241
    .line 242
    move-result-object v14

    .line 243
    new-array v15, v8, [Ljava/lang/Class;

    .line 244
    .line 245
    aput-object v4, v15, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 246
    .line 247
    const/16 v16, 0x26

    .line 248
    .line 249
    :try_start_1
    new-array v3, v8, [Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 250
    .line 251
    const/16 v18, 0x8

    .line 252
    .line 253
    :try_start_2
    aget-byte v5, v12, v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 254
    .line 255
    int-to-byte v5, v5

    .line 256
    move/from16 v19, v7

    .line 257
    .line 258
    :try_start_3
    aget-byte v7, v12, v18

    .line 259
    .line 260
    int-to-byte v7, v7

    .line 261
    invoke-static {v5, v7, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v5

    .line 265
    aput-object v5, v3, v19

    .line 266
    .line 267
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 268
    .line 269
    .line 270
    move-result-object v5

    .line 271
    invoke-static {v13, v14, v15, v3, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    aget-byte v5, v12, v18

    .line 276
    .line 277
    int-to-byte v5, v5

    .line 278
    aget-byte v7, v12, v11

    .line 279
    .line 280
    int-to-byte v7, v7

    .line 281
    const/16 v12, 0x1c2

    .line 282
    .line 283
    invoke-static {v5, v7, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v5

    .line 287
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-static {v5, v3, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    check-cast v3, Ljava/lang/String;

    .line 296
    .line 297
    if-eqz v3, :cond_6

    .line 298
    .line 299
    invoke-static {v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(Ljava/lang/String;)Z

    .line 300
    .line 301
    .line 302
    move-result v5
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 303
    if-eqz v5, :cond_6

    .line 304
    .line 305
    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 306
    .line 307
    and-int/lit8 v7, v5, 0x23

    .line 308
    .line 309
    or-int/lit8 v5, v5, 0x23

    .line 310
    .line 311
    add-int/2addr v7, v5

    .line 312
    rem-int/lit16 v7, v7, 0x80

    .line 313
    .line 314
    sput v7, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 315
    .line 316
    :try_start_4
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    invoke-virtual {v0, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˏ([B)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 321
    .line 322
    .line 323
    goto :goto_5

    .line 324
    :catch_0
    move/from16 v19, v7

    .line 325
    .line 326
    goto :goto_5

    .line 327
    :catch_1
    move/from16 v19, v7

    .line 328
    .line 329
    :goto_4
    const/16 v18, 0x8

    .line 330
    .line 331
    goto :goto_5

    .line 332
    :catch_2
    move/from16 v19, v7

    .line 333
    .line 334
    const/16 v16, 0x26

    .line 335
    .line 336
    goto :goto_4

    .line 337
    :catch_3
    :cond_6
    :goto_5
    :try_start_5
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 338
    .line 339
    aget-byte v5, v3, v17

    .line 340
    .line 341
    int-to-byte v5, v5

    .line 342
    aget-byte v7, v3, v11

    .line 343
    .line 344
    int-to-byte v7, v7

    .line 345
    aget-byte v12, v3, v10

    .line 346
    .line 347
    neg-int v12, v12

    .line 348
    int-to-short v12, v12

    .line 349
    invoke-static {v5, v7, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Landroid/content/Context;

    .line 354
    .line 355
    .line 356
    move-result-object v7

    .line 357
    new-array v12, v8, [Ljava/lang/Class;

    .line 358
    .line 359
    aput-object v4, v12, v19

    .line 360
    .line 361
    new-array v13, v8, [Ljava/lang/Object;

    .line 362
    .line 363
    aget-byte v14, v3, v9

    .line 364
    .line 365
    int-to-byte v14, v14

    .line 366
    aget-byte v15, v3, v18

    .line 367
    .line 368
    int-to-byte v15, v15

    .line 369
    invoke-static {v14, v15, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    aput-object v2, v13, v19

    .line 374
    .line 375
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    invoke-static {v5, v7, v12, v13, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    aget-byte v5, v3, v16

    .line 384
    .line 385
    int-to-byte v5, v5

    .line 386
    aget-byte v3, v3, v11

    .line 387
    .line 388
    int-to-byte v3, v3

    .line 389
    xor-int/lit16 v7, v3, 0x169

    .line 390
    .line 391
    and-int/lit16 v12, v3, 0x169

    .line 392
    .line 393
    or-int/2addr v7, v12

    .line 394
    int-to-short v7, v7

    .line 395
    invoke-static {v5, v3, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v3

    .line 399
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 400
    .line 401
    .line 402
    move-result-object v5

    .line 403
    invoke-static {v3, v2, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object v2

    .line 407
    check-cast v2, Ljava/lang/String;

    .line 408
    .line 409
    if-eqz v2, :cond_8

    .line 410
    .line 411
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    invoke-virtual {v0, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˏ([B)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 416
    .line 417
    .line 418
    goto :goto_6

    .line 419
    :cond_7
    move/from16 v19, v7

    .line 420
    .line 421
    const/16 v16, 0x26

    .line 422
    .line 423
    const/16 v18, 0x8

    .line 424
    .line 425
    :catch_4
    :cond_8
    :goto_6
    and-int/lit8 v2, v1, 0x4

    .line 426
    .line 427
    const/16 v3, 0x3c

    .line 428
    .line 429
    const/16 v5, 0x40

    .line 430
    .line 431
    const/16 v7, 0x19

    .line 432
    .line 433
    if-eqz v2, :cond_a

    .line 434
    .line 435
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 436
    .line 437
    aget-byte v12, v2, v3

    .line 438
    .line 439
    int-to-byte v12, v12

    .line 440
    aget-byte v13, v2, v7

    .line 441
    .line 442
    int-to-byte v13, v13

    .line 443
    const/16 v14, 0x1c8

    .line 444
    .line 445
    aget-byte v14, v2, v14

    .line 446
    .line 447
    int-to-short v14, v14

    .line 448
    invoke-static {v12, v13, v14}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v12

    .line 452
    invoke-virtual {v0, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    aget-byte v12, v2, v11

    .line 456
    .line 457
    int-to-byte v12, v12

    .line 458
    aget-byte v13, v2, v7

    .line 459
    .line 460
    int-to-byte v13, v13

    .line 461
    const/16 v14, 0x1cc

    .line 462
    .line 463
    invoke-static {v12, v13, v14}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object v12

    .line 467
    invoke-virtual {v0, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    aget-byte v12, v2, v17

    .line 471
    .line 472
    int-to-byte v12, v12

    .line 473
    aget-byte v13, v2, v7

    .line 474
    .line 475
    int-to-byte v13, v13

    .line 476
    or-int/lit16 v14, v13, 0x162

    .line 477
    .line 478
    int-to-short v14, v14

    .line 479
    invoke-static {v12, v13, v14}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v12

    .line 483
    invoke-virtual {v0, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(Ljava/lang/String;)V

    .line 484
    .line 485
    .line 486
    aget-byte v12, v2, v5

    .line 487
    .line 488
    int-to-byte v12, v12

    .line 489
    aget-byte v13, v2, v7

    .line 490
    .line 491
    int-to-byte v13, v13

    .line 492
    const/16 v14, 0x1b2

    .line 493
    .line 494
    invoke-static {v12, v13, v14}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v12

    .line 498
    invoke-virtual {v0, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    aget-byte v12, v2, v5

    .line 502
    .line 503
    int-to-byte v12, v12

    .line 504
    aget-byte v13, v2, v7

    .line 505
    .line 506
    int-to-byte v13, v13

    .line 507
    const/16 v14, 0x18a

    .line 508
    .line 509
    invoke-static {v12, v13, v14}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v12

    .line 513
    invoke-virtual {v0, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    const/16 v12, 0x51

    .line 517
    .line 518
    aget-byte v12, v2, v12

    .line 519
    .line 520
    int-to-byte v12, v12

    .line 521
    aget-byte v13, v2, v7

    .line 522
    .line 523
    int-to-byte v13, v13

    .line 524
    const/16 v14, 0xa2

    .line 525
    .line 526
    invoke-static {v12, v13, v14}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 527
    .line 528
    .line 529
    move-result-object v12

    .line 530
    invoke-virtual {v0, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(Ljava/lang/String;)V

    .line 531
    .line 532
    .line 533
    :try_start_6
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Landroid/content/Context;

    .line 534
    .line 535
    .line 536
    move-result-object v12

    .line 537
    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 538
    .line 539
    .line 540
    move-result-object v12

    .line 541
    aget-byte v13, v2, v7

    .line 542
    .line 543
    int-to-byte v13, v13

    .line 544
    aget-byte v14, v2, v11

    .line 545
    .line 546
    int-to-byte v14, v14

    .line 547
    const/16 v15, 0x1aa

    .line 548
    .line 549
    invoke-static {v13, v14, v15}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v13

    .line 553
    const/16 v14, 0x6d

    .line 554
    .line 555
    aget-byte v14, v2, v14

    .line 556
    .line 557
    sub-int/2addr v14, v8

    .line 558
    int-to-byte v14, v14

    .line 559
    aget-byte v15, v2, v10
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 560
    .line 561
    neg-int v15, v15

    .line 562
    int-to-byte v15, v15

    .line 563
    move/from16 v17, v3

    .line 564
    .line 565
    const/16 v3, 0x73

    .line 566
    .line 567
    :try_start_7
    invoke-static {v14, v15, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v3

    .line 571
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 572
    .line 573
    .line 574
    move-result-object v3

    .line 575
    new-array v14, v6, [Ljava/lang/Class;

    .line 576
    .line 577
    const/16 v15, 0x22

    .line 578
    .line 579
    aget-byte v15, v2, v15
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 580
    .line 581
    int-to-byte v15, v15

    .line 582
    move/from16 v20, v5

    .line 583
    .line 584
    :try_start_8
    aget-byte v5, v2, v10
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    .line 585
    .line 586
    neg-int v5, v5

    .line 587
    int-to-byte v5, v5

    .line 588
    move/from16 v21, v7

    .line 589
    .line 590
    const/16 v7, 0xec

    .line 591
    .line 592
    :try_start_9
    invoke-static {v15, v5, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v5

    .line 596
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 597
    .line 598
    .line 599
    move-result-object v5

    .line 600
    aput-object v5, v14, v19

    .line 601
    .line 602
    aput-object v4, v14, v8

    .line 603
    .line 604
    new-array v4, v6, [Ljava/lang/Object;

    .line 605
    .line 606
    aput-object v12, v4, v19

    .line 607
    .line 608
    const/16 v5, 0x9

    .line 609
    .line 610
    aget-byte v5, v2, v5

    .line 611
    .line 612
    int-to-byte v5, v5

    .line 613
    aget-byte v2, v2, v10

    .line 614
    .line 615
    neg-int v2, v2

    .line 616
    int-to-byte v2, v2

    .line 617
    const/16 v7, 0x244

    .line 618
    .line 619
    invoke-static {v5, v2, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 620
    .line 621
    .line 622
    move-result-object v2

    .line 623
    aput-object v2, v4, v8

    .line 624
    .line 625
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 626
    .line 627
    .line 628
    move-result-object v2

    .line 629
    invoke-static {v13, v3, v14, v4, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v2

    .line 633
    check-cast v2, Ljava/lang/String;

    .line 634
    .line 635
    if-eqz v2, :cond_9

    .line 636
    .line 637
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 638
    .line 639
    .line 640
    move-result-object v2

    .line 641
    invoke-virtual {v0, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˏ([B)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    .line 642
    .line 643
    .line 644
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 645
    .line 646
    or-int/lit8 v3, v2, 0x63

    .line 647
    .line 648
    shl-int/2addr v3, v8

    .line 649
    xor-int/lit8 v2, v2, 0x63

    .line 650
    .line 651
    sub-int/2addr v3, v2

    .line 652
    rem-int/lit16 v3, v3, 0x80

    .line 653
    .line 654
    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 655
    .line 656
    :cond_9
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 657
    .line 658
    xor-int/lit8 v3, v2, 0x79

    .line 659
    .line 660
    and-int/lit8 v2, v2, 0x79

    .line 661
    .line 662
    shl-int/2addr v2, v8

    .line 663
    add-int/2addr v3, v2

    .line 664
    rem-int/lit16 v3, v3, 0x80

    .line 665
    .line 666
    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 667
    .line 668
    goto :goto_7

    .line 669
    :catch_5
    :cond_a
    move/from16 v17, v3

    .line 670
    .line 671
    :catch_6
    move/from16 v20, v5

    .line 672
    .line 673
    :catch_7
    move/from16 v21, v7

    .line 674
    .line 675
    :catch_8
    :goto_7
    and-int/lit8 v2, v1, 0x8

    .line 676
    .line 677
    if-eqz v2, :cond_c

    .line 678
    .line 679
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 680
    .line 681
    or-int/lit8 v3, v2, 0x2d

    .line 682
    .line 683
    shl-int/2addr v3, v8

    .line 684
    xor-int/lit8 v2, v2, 0x2d

    .line 685
    .line 686
    sub-int/2addr v3, v2

    .line 687
    rem-int/lit16 v2, v3, 0x80

    .line 688
    .line 689
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 690
    .line 691
    rem-int/2addr v3, v6

    .line 692
    if-eqz v3, :cond_b

    .line 693
    .line 694
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 695
    .line 696
    const/16 v3, 0x55

    .line 697
    .line 698
    aget-byte v3, v2, v3

    .line 699
    .line 700
    int-to-byte v3, v3

    .line 701
    const/16 v4, 0x70

    .line 702
    .line 703
    aget-byte v2, v2, v4

    .line 704
    .line 705
    int-to-byte v2, v2

    .line 706
    const/16 v4, 0x7287

    .line 707
    .line 708
    :goto_8
    invoke-static {v3, v2, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 709
    .line 710
    .line 711
    move-result-object v2

    .line 712
    invoke-virtual {v0, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(Ljava/lang/String;)V

    .line 713
    .line 714
    .line 715
    goto :goto_9

    .line 716
    :cond_b
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 717
    .line 718
    aget-byte v3, v2, v11

    .line 719
    .line 720
    int-to-byte v3, v3

    .line 721
    aget-byte v2, v2, v21

    .line 722
    .line 723
    int-to-byte v2, v2

    .line 724
    const/16 v4, 0x151

    .line 725
    .line 726
    goto :goto_8

    .line 727
    :cond_c
    :goto_9
    and-int/lit8 v2, v1, 0x10

    .line 728
    .line 729
    if-eqz v2, :cond_d

    .line 730
    .line 731
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 732
    .line 733
    add-int/lit8 v2, v2, 0x3

    .line 734
    .line 735
    rem-int/lit16 v2, v2, 0x80

    .line 736
    .line 737
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 738
    .line 739
    :try_start_a
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Landroid/content/Context;

    .line 740
    .line 741
    .line 742
    move-result-object v2

    .line 743
    invoke-static {v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˎ(Landroid/content/Context;)Ljava/lang/String;

    .line 744
    .line 745
    .line 746
    move-result-object v2

    .line 747
    if-eqz v2, :cond_d

    .line 748
    .line 749
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 750
    .line 751
    .line 752
    move-result-object v2

    .line 753
    invoke-virtual {v0, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ([B)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    .line 754
    .line 755
    .line 756
    :catch_9
    :cond_d
    and-int/lit8 v2, v1, 0x20

    .line 757
    .line 758
    if-eqz v2, :cond_11

    .line 759
    .line 760
    const/16 v2, 0x6f

    .line 761
    .line 762
    const/16 v3, 0x69

    .line 763
    .line 764
    :try_start_b
    sget-object v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 765
    .line 766
    aget-byte v5, v4, v18

    .line 767
    .line 768
    int-to-byte v5, v5

    .line 769
    aget-byte v7, v4, v11

    .line 770
    .line 771
    int-to-byte v7, v7

    .line 772
    or-int/lit16 v12, v7, 0x226

    .line 773
    .line 774
    int-to-short v12, v12

    .line 775
    invoke-static {v5, v7, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 776
    .line 777
    .line 778
    move-result-object v5

    .line 779
    const/16 v7, 0xbc

    .line 780
    .line 781
    aget-byte v7, v4, v7

    .line 782
    .line 783
    neg-int v7, v7

    .line 784
    int-to-byte v7, v7

    .line 785
    aget-byte v12, v4, v3

    .line 786
    .line 787
    int-to-byte v12, v12

    .line 788
    const/16 v13, 0x12

    .line 789
    .line 790
    aget-byte v13, v4, v13

    .line 791
    .line 792
    int-to-short v13, v13

    .line 793
    invoke-static {v7, v12, v13}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object v7

    .line 797
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 798
    .line 799
    .line 800
    move-result-object v7

    .line 801
    new-array v12, v8, [Ljava/lang/Class;

    .line 802
    .line 803
    aget-byte v13, v4, v17

    .line 804
    .line 805
    int-to-byte v13, v13

    .line 806
    aget-byte v14, v4, v10

    .line 807
    .line 808
    neg-int v14, v14

    .line 809
    int-to-byte v14, v14

    .line 810
    aget-byte v15, v4, p0

    .line 811
    .line 812
    int-to-short v15, v15

    .line 813
    invoke-static {v13, v14, v15}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 814
    .line 815
    .line 816
    move-result-object v13

    .line 817
    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 818
    .line 819
    .line 820
    move-result-object v13

    .line 821
    aput-object v13, v12, v19

    .line 822
    .line 823
    new-array v13, v8, [Ljava/lang/Object;

    .line 824
    .line 825
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Landroid/content/Context;

    .line 826
    .line 827
    .line 828
    move-result-object v14

    .line 829
    aput-object v14, v13, v19

    .line 830
    .line 831
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 832
    .line 833
    .line 834
    move-result-object v14

    .line 835
    invoke-static {v5, v7, v12, v13, v14}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 836
    .line 837
    .line 838
    move-result-object v5

    .line 839
    aget-byte v7, v4, v9

    .line 840
    .line 841
    int-to-byte v7, v7

    .line 842
    aget-byte v4, v4, v11

    .line 843
    .line 844
    int-to-byte v4, v4

    .line 845
    invoke-static {v7, v4, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 846
    .line 847
    .line 848
    move-result-object v4

    .line 849
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 850
    .line 851
    .line 852
    move-result-object v7

    .line 853
    invoke-static {v4, v5, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 854
    .line 855
    .line 856
    move-result-object v4

    .line 857
    check-cast v4, Ljava/lang/String;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_a

    .line 858
    .line 859
    if-eqz v4, :cond_f

    .line 860
    .line 861
    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 862
    .line 863
    add-int/lit8 v5, v5, 0x57

    .line 864
    .line 865
    rem-int/lit16 v7, v5, 0x80

    .line 866
    .line 867
    sput v7, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 868
    .line 869
    rem-int/2addr v5, v6

    .line 870
    if-nez v5, :cond_e

    .line 871
    .line 872
    :try_start_c
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    .line 873
    .line 874
    .line 875
    move-result-object v4

    .line 876
    invoke-virtual {v0, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ([B)V

    .line 877
    .line 878
    .line 879
    goto :goto_a

    .line 880
    :cond_e
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    .line 881
    .line 882
    .line 883
    move-result-object v4

    .line 884
    invoke-virtual {v0, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ([B)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_a

    .line 885
    .line 886
    .line 887
    :try_start_d
    throw p1
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 888
    :catchall_0
    move-exception v0

    .line 889
    throw v0

    .line 890
    :catch_a
    :cond_f
    :goto_a
    :try_start_e
    sget-object v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 891
    .line 892
    aget-byte v5, v4, v18

    .line 893
    .line 894
    int-to-byte v5, v5

    .line 895
    aget-byte v7, v4, v11

    .line 896
    .line 897
    int-to-byte v7, v7

    .line 898
    or-int/lit16 v12, v7, 0x226

    .line 899
    .line 900
    int-to-short v12, v12

    .line 901
    invoke-static {v5, v7, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 902
    .line 903
    .line 904
    move-result-object v5

    .line 905
    const/16 v7, 0x13b

    .line 906
    .line 907
    aget-byte v7, v4, v7

    .line 908
    .line 909
    int-to-byte v7, v7

    .line 910
    aget-byte v3, v4, v3

    .line 911
    .line 912
    int-to-byte v3, v3

    .line 913
    const/16 v12, 0xc3

    .line 914
    .line 915
    invoke-static {v7, v3, v12}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 916
    .line 917
    .line 918
    move-result-object v3

    .line 919
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 920
    .line 921
    .line 922
    move-result-object v3

    .line 923
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 924
    .line 925
    .line 926
    move-result-object v7

    .line 927
    invoke-static {v5, v3, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 928
    .line 929
    .line 930
    move-result-object v3

    .line 931
    aget-byte v5, v4, v9

    .line 932
    .line 933
    int-to-byte v5, v5

    .line 934
    aget-byte v4, v4, v11

    .line 935
    .line 936
    int-to-byte v4, v4

    .line 937
    invoke-static {v5, v4, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 938
    .line 939
    .line 940
    move-result-object v2

    .line 941
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 942
    .line 943
    .line 944
    move-result-object v4

    .line 945
    invoke-static {v2, v3, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 946
    .line 947
    .line 948
    move-result-object v2

    .line 949
    check-cast v2, Ljava/lang/String;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_b

    .line 950
    .line 951
    if-eqz v2, :cond_11

    .line 952
    .line 953
    sget v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 954
    .line 955
    xor-int/lit8 v4, v3, 0x7

    .line 956
    .line 957
    and-int/lit8 v3, v3, 0x7

    .line 958
    .line 959
    shl-int/2addr v3, v8

    .line 960
    add-int/2addr v4, v3

    .line 961
    rem-int/lit16 v3, v4, 0x80

    .line 962
    .line 963
    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 964
    .line 965
    rem-int/2addr v4, v6

    .line 966
    if-nez v4, :cond_10

    .line 967
    .line 968
    :try_start_f
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 969
    .line 970
    .line 971
    move-result-object v2

    .line 972
    invoke-virtual {v0, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ([B)V

    .line 973
    .line 974
    .line 975
    goto :goto_b

    .line 976
    :cond_10
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 977
    .line 978
    .line 979
    move-result-object v2

    .line 980
    invoke-virtual {v0, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ([B)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_b

    .line 981
    .line 982
    .line 983
    :try_start_10
    throw p1
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_b
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 984
    :catchall_1
    move-exception v0

    .line 985
    throw v0

    .line 986
    :catch_b
    :cond_11
    :goto_b
    and-int/lit8 v1, v1, 0x40

    .line 987
    .line 988
    if-eqz v1, :cond_12

    .line 989
    .line 990
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 991
    .line 992
    and-int/lit8 v2, v1, 0x2b

    .line 993
    .line 994
    or-int/lit8 v1, v1, 0x2b

    .line 995
    .line 996
    add-int/2addr v2, v1

    .line 997
    rem-int/lit16 v2, v2, 0x80

    .line 998
    .line 999
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 1000
    .line 1001
    const/16 v1, 0xae

    .line 1002
    .line 1003
    const/16 v2, 0x185

    .line 1004
    .line 1005
    :try_start_11
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 1006
    .line 1007
    aget-byte v4, v3, v9

    .line 1008
    .line 1009
    int-to-byte v4, v4

    .line 1010
    aget-byte v5, v3, v2

    .line 1011
    .line 1012
    int-to-byte v5, v5

    .line 1013
    or-int/lit8 v7, v5, 0x61

    .line 1014
    .line 1015
    int-to-short v7, v7

    .line 1016
    invoke-static {v4, v5, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 1017
    .line 1018
    .line 1019
    move-result-object v4

    .line 1020
    aget-byte v5, v3, v16

    .line 1021
    .line 1022
    int-to-byte v5, v5

    .line 1023
    aget-byte v3, v3, v10

    .line 1024
    .line 1025
    neg-int v3, v3

    .line 1026
    int-to-byte v3, v3

    .line 1027
    invoke-static {v5, v3, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 1028
    .line 1029
    .line 1030
    move-result-object v3

    .line 1031
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v3

    .line 1035
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 1036
    .line 1037
    .line 1038
    move-result-object v5

    .line 1039
    invoke-static {v4, v3, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 1040
    .line 1041
    .line 1042
    move-result-object v3

    .line 1043
    check-cast v3, Ljava/lang/Integer;

    .line 1044
    .line 1045
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 1046
    .line 1047
    .line 1048
    move-result v3

    .line 1049
    invoke-virtual {v0, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ(I)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_c

    .line 1050
    .line 1051
    .line 1052
    :catch_c
    :try_start_12
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 1053
    .line 1054
    aget-byte v4, v3, v9

    .line 1055
    .line 1056
    int-to-byte v4, v4

    .line 1057
    aget-byte v2, v3, v2

    .line 1058
    .line 1059
    int-to-byte v2, v2

    .line 1060
    const/16 v5, 0x240

    .line 1061
    .line 1062
    invoke-static {v4, v2, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v2

    .line 1066
    aget-byte v4, v3, v16

    .line 1067
    .line 1068
    int-to-byte v4, v4

    .line 1069
    aget-byte v3, v3, v10

    .line 1070
    .line 1071
    neg-int v3, v3

    .line 1072
    int-to-byte v3, v3

    .line 1073
    invoke-static {v4, v3, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 1074
    .line 1075
    .line 1076
    move-result-object v1

    .line 1077
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v1

    .line 1081
    invoke-static {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 1082
    .line 1083
    .line 1084
    move-result-object v3

    .line 1085
    invoke-static {v2, v1, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v1

    .line 1089
    check-cast v1, Ljava/lang/Integer;

    .line 1090
    .line 1091
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 1092
    .line 1093
    .line 1094
    move-result v1

    .line 1095
    invoke-virtual {v0, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ(I)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_d

    .line 1096
    .line 1097
    .line 1098
    :catch_d
    :cond_12
    invoke-virtual {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ()Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;

    .line 1099
    .line 1100
    .line 1101
    move-result-object v0

    .line 1102
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 1103
    .line 1104
    xor-int/lit8 v2, v1, 0x4b

    .line 1105
    .line 1106
    and-int/lit8 v1, v1, 0x4b

    .line 1107
    .line 1108
    shl-int/2addr v1, v8

    .line 1109
    add-int/2addr v2, v1

    .line 1110
    rem-int/lit16 v1, v2, 0x80

    .line 1111
    .line 1112
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 1113
    .line 1114
    rem-int/2addr v2, v6

    .line 1115
    if-eqz v2, :cond_13

    .line 1116
    .line 1117
    const/16 v1, 0x34

    .line 1118
    .line 1119
    div-int/lit8 v1, v1, 0x0

    .line 1120
    .line 1121
    :cond_13
    return-object v0
.end method

.method private static ˊ()V
    .locals 4

    const/16 v0, 0x2ad

    new-array v1, v0, [B

    const-string v2, "cc\u00fcw\u00f4\u000b\u00f3\u0004\u0007\u00067\u00cc\u00f5\u0002\u00fb\u0010\u00f8\u00fbG\u00ec\u00d5\u0002\u00fb\u0010\u00ee\u0005\u0003\u00f2\"\u00db\u0007\u0000\u0010\u00f9\u001b\u00ef\u00f4\u00fd\u000e\u0007\u00ff\u0003\u00f2(\u00ed\u00ff#\u00de\u0001\u00f3\u000e\u00f3\u0001\u0004B\u00bf\u00ff\u0004\u000c\u00f0\u0013\u00f0G\u00c2\r\u00f4\u00fa\u0010\u0006\u00ff\u00f0\u0000\u0004\u000e\u00f4\u00f5\u0003@\u00c8\u00f9\u0001\t\u00fc\u00088\u00ce\u00f4\u000b\u00f3\u0004\u0007\u00067\u00c8\u00fb\u00fbF\u00c6\u0001\u00067\u00e6\u00dc\u00fc\u0000\u0014\u00f4\u000c\u00ff\u001d\u0006\u00f5*\u00e8\u0006\u0003\u00f2,\u00e6\u00f4\u000b\u00f3\u0004\u0007\u00067\u00bf\u00ff\u0004\u00fa\u000e\u0006\u0000\u00f4E\u00dc\u00ef\u00f2\u0001\u000c\u00fc\u0008\u00f5P\u00d2\u00ef\u0003\u00ef\u0004\u000e\u00ff\u00f9\u000b\u0001\u00f7\u000b\u0001\u00f7\u000b\u0001\u00f7\u000b\u0001\u00f7\u000b\u0001\u0004B\u00cd\u00ee\r\u00fe\t7\u00c7\u00fa\u00fd\u0000\u00f4\u000b\u00f3\u0004\u0007\u00067\u00c0\u00fdF\u00df\u00df\u0004\r\u00ff\u00f3\u0001\u000c\u000c\u00f4?\u00f5\u0003@\u00c8\u00f9\u0001\t\u00fc\u00088\u00c9\u00fe\u00f8\u000e\u0004\u0002\u00ef\u000f8\u00c6\u0001\u00067\u00e9\u00de\u00f8\u000e\u0004\u0002\u00ef\u000f\u001d\u00dc\u00fc\u0000\u0014\u00f4\u000c\u00ff\u001d\u00e6\u00f4\u000b\u00f3\u0004\u0007\u00067\u00cc\u00f5\u0002\u00fb\u0010\u00f8\u00fbG\u00ec\u00d5\u0002\u00fb\u0010\u00f8\u00fb#\u00ee\u00f3\u0005\u0004\u00f7\u0012\u00f4\u00f2\r9\u00f4\u000b\u00f3\u0004\u0007\u00067\u00bf\u000c\u00f4\u0006\u0005\u00f7\u0001\u000b\u00fb\u0002A\u00ee\u00ff\u0001\u00ff\u00f3\u0001\u00f5\t\u000f\u0004\u00fe\u00eb\r\u0000\u0014\u00ee\u0010\u00ce,\u0004\u00f5\u00d95\u00c8&\u0015\u00e8\u00ea\u00e3J\u00b6D\u0012\u00afG\u00b9#,\u0004\u00f5\u00d95\u00c8&\u0015\u00e8\u00ea\u00e3J\u00b6\u0004B\u00bd\u00fe\u0008\u00fb\u000c\u00fd\t8\u00c9\u00fe\u00f8\u0000\u0000\u0013\u00f4\u0001\u00fc\u00f6\u00ff\u00bb\u0004B\u00bf\u00ff\u0004\u000c\u00f0\u0013\u00f0G\u00c2\u00ff\u000c\u0000\u00fa\u000f\u0004\u00fe\u0003\u00f2\"\u00eb\u00fd\u001b\u00ef\u00f4\n\t\u00f6\u001f\u00da\t\u000c\u00fe\u00f4\u0004B\u00cd\u00f4\u000f\u00f0\u000f7\u00bf\u0005\u000c\u00ee\u000f\u00f8\u00fe\u0006\u0003\u00f22\u00d5\u0002\u0001\n\u0003\u00f0\u000c\u00fb\u0002&\u00dc\t\u00f8\u0003\u00f2\"\u00e0\u0003\n\u00fc\u0008\u0004B\u00bf\u00ff\u0004\u000c\u00f0\u0013\u00f0G\u00cb\u0000\u00f0\u000e\u0007\u00ff\u0003\u00f21\u00e0\u00f0\u000e\u0007\u00ff\u001d\u00e6\u0004B\u00cd\u00ee\r\u00fe\t7\u00c9\u00fe\u00fc\u0008\u0003\u00f4\u0003\u00ff\n\u00fc\u00fb\u00bd\u00fb\u0007E\u00cd\u00f8\u000c\u00ef\u0001E\u00c3\u0001\u000b\u0005\u00f8\u00fa\u00fd\u0000F\u00c3\u0001\u000b3\t\u00fa\u0002\n\u00f4\u000b\u00f3\u0004\u0007\u00067\u00bf\u000c\u00f4\u0006\u0005\u00f7\u0001\u000b\u00fb\u0002A\u00e6\u00fc\u00fb\u0010\u00f4\u0005\n\u00f2\u00bd\u00fb\u0007E\u00cd\u00f8\u000c\u00ef\u0001E\u00ce\u00f7\u00fe\r\u00f9=\u00c3\u0001\u000b\u0002\u00f7\u0002<\u0002\u00cc\u0000\u00f0\u000e\u0007\u00ff7\u00cd\u00fb\u0006\u0003\u00f2,\u00dc\u00fc\u0000\u0014\u00f4\u000c\u00ff\u00f5%\u00ed\u0006\u00f4\u000b\u00f3\u0004\u0007\u0006\u0006\u00f7\u0006\u0003\u00f2\'\u00ea\u00f2\u00fe\t\u00fe\u0008#\u00dc\u00fb\u0010\u00f4\r\u0006\u00ff\u00ff\u00f3\u00f4\u000b\u00f3\u0004\u0007\u00067\u00bf\u000c\u00f4\u0006\u0005\u00f7\u0001\u000b\u00fb\u0002A\u00dd\u000e\u0005\u00fe\u00e6\u0010\t\u00fa\u0002\n\u00e7\r\u0000\u0014\u00ee\u0010\u00bd\u00fb\u0007E\u00cd\u00f8\u000c\u00ef\u0001E\u00bd\u0011\u00f1\u000b\u000b\u00f8\u00fa\u00fd\u0000F\u00c8\u00fa\u00fd\u0000E\u0002\u00bb\u0008\u0006\u00f9\u00fd\u0011\u0007\u00f2\u00fa\t\u000c\u00fe\u00f4"

    const-string v3, "ISO-8859-1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    const/16 v0, 0x59

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ᐝ:I

    return-void
.end method

.method private static ˎ(Ljava/lang/String;)Z
    .locals 4

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 2
    .line 3
    xor-int/lit8 v1, v0, 0x61

    .line 4
    .line 5
    and-int/lit8 v0, v0, 0x61

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    rem-int/lit16 v0, v1, 0x80

    .line 11
    .line 12
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 13
    .line 14
    rem-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/16 v2, 0x11

    .line 31
    .line 32
    if-eq v1, v2, :cond_1

    .line 33
    .line 34
    :goto_0
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 35
    .line 36
    add-int/lit8 p0, p0, 0x39

    .line 37
    .line 38
    rem-int/lit16 p0, p0, 0x80

    .line 39
    .line 40
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 41
    .line 42
    return v0

    .line 43
    :cond_1
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    .line 44
    .line 45
    const/16 v2, 0x40

    .line 46
    .line 47
    aget-byte v2, v1, v2

    .line 48
    .line 49
    int-to-byte v2, v2

    .line 50
    const/16 v3, 0x12

    .line 51
    .line 52
    aget-byte v1, v1, v3

    .line 53
    .line 54
    int-to-byte v1, v1

    .line 55
    const/16 v3, 0x92

    .line 56
    .line 57
    invoke-static {v2, v1, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 68
    .line 69
    or-int/lit8 v1, p0, 0x71

    .line 70
    .line 71
    shl-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    xor-int/lit8 p0, p0, 0x71

    .line 74
    .line 75
    sub-int/2addr v1, p0

    .line 76
    rem-int/lit16 v1, v1, 0x80

    .line 77
    .line 78
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 79
    .line 80
    return v0

    .line 81
    :cond_2
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ॱ:Ljava/util/regex/Pattern;

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 92
    .line 93
    and-int/lit8 v1, v0, 0x39

    .line 94
    .line 95
    or-int/lit8 v0, v0, 0x39

    .line 96
    .line 97
    add-int/2addr v1, v0

    .line 98
    rem-int/lit16 v0, v1, 0x80

    .line 99
    .line 100
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 101
    .line 102
    rem-int/lit8 v1, v1, 0x2

    .line 103
    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    return p0

    .line 107
    :cond_3
    const/4 p0, 0x0

    .line 108
    throw p0
.end method

.method private static ˏ(IBS)Ljava/lang/String;
    .locals 7

    .line 193
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    add-int/lit8 p0, p0, 0x4

    rsub-int/lit8 p1, p1, 0x77

    add-int/lit8 p2, p2, 0x4

    new-array v1, p0, [B

    const/4 v2, 0x0

    if-nez v0, :cond_1

    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    add-int/lit8 p1, p1, 0x2b

    rem-int/lit16 v3, p1, 0x80

    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    move p1, p0

    move-object v3, v0

    move v5, v2

    move v0, p2

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    throw p0

    :cond_1
    move v3, v2

    :goto_0
    int-to-byte v4, p1

    add-int/lit8 v5, v3, 0x1

    aput-byte v4, v1, v3

    if-ne v5, p0, :cond_2

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    aget-byte v3, v0, p2

    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    add-int/lit8 v4, v4, 0x47

    rem-int/lit16 v4, v4, 0x80

    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    move-object v6, v0

    move v0, p2

    move p2, v3

    move-object v3, v6

    :goto_1
    sub-int/2addr p1, p2

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, v0, 0x1

    move-object v0, v3

    move v3, v5

    goto :goto_0
.end method

.method private static ˏ(Ljava/lang/String;)Z
    .locals 9

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 2
    .line 3
    or-int/lit8 v1, v0, 0x3d

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    shl-int/2addr v1, v2

    .line 7
    xor-int/lit8 v0, v0, 0x3d

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    rem-int/lit16 v0, v1, 0x80

    .line 11
    .line 12
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 13
    .line 14
    rem-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    move v3, v2

    .line 24
    :goto_0
    move v4, v3

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    move v3, v0

    .line 31
    goto :goto_0

    .line 32
    :goto_1
    if-lez v1, :cond_5

    .line 33
    .line 34
    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 35
    .line 36
    or-int/lit8 v6, v5, 0x7d

    .line 37
    .line 38
    shl-int/2addr v6, v2

    .line 39
    xor-int/lit8 v5, v5, 0x7d

    .line 40
    .line 41
    sub-int/2addr v6, v5

    .line 42
    rem-int/lit16 v5, v6, 0x80

    .line 43
    .line 44
    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 45
    .line 46
    rem-int/lit8 v6, v6, 0x2

    .line 47
    .line 48
    if-nez v6, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0, v1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v4, :cond_3

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    xor-int/lit8 v5, v1, -0x1

    .line 62
    .line 63
    shl-int/lit8 v6, v1, 0x1

    .line 64
    .line 65
    add-int/2addr v5, v6

    .line 66
    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-eqz v4, :cond_3

    .line 75
    .line 76
    :goto_2
    shl-int/2addr v5, v2

    .line 77
    div-int/lit8 v6, v5, 0xa

    .line 78
    .line 79
    if-eqz v6, :cond_3

    .line 80
    .line 81
    sget v7, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 82
    .line 83
    or-int/lit8 v8, v7, 0x37

    .line 84
    .line 85
    shl-int/2addr v8, v2

    .line 86
    xor-int/lit8 v7, v7, 0x37

    .line 87
    .line 88
    sub-int/2addr v8, v7

    .line 89
    rem-int/lit16 v7, v8, 0x80

    .line 90
    .line 91
    sput v7, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 92
    .line 93
    rem-int/lit8 v8, v8, 0x2

    .line 94
    .line 95
    if-nez v8, :cond_2

    .line 96
    .line 97
    rem-int/lit8 v6, v5, 0x7f

    .line 98
    .line 99
    mul-int/lit8 v5, v5, 0xc

    .line 100
    .line 101
    shl-int v5, v6, v5

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_2
    rem-int/lit8 v5, v5, 0xa

    .line 105
    .line 106
    add-int/2addr v5, v6

    .line 107
    :cond_3
    :goto_3
    if-nez v4, :cond_4

    .line 108
    .line 109
    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 110
    .line 111
    xor-int/lit8 v6, v4, 0x4f

    .line 112
    .line 113
    and-int/lit8 v4, v4, 0x4f

    .line 114
    .line 115
    shl-int/2addr v4, v2

    .line 116
    add-int/2addr v6, v4

    .line 117
    rem-int/lit16 v6, v6, 0x80

    .line 118
    .line 119
    sput v6, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 120
    .line 121
    move v4, v2

    .line 122
    goto :goto_4

    .line 123
    :cond_4
    move v4, v0

    .line 124
    :goto_4
    not-int v5, v5

    .line 125
    sub-int/2addr v3, v5

    .line 126
    sub-int/2addr v3, v2

    .line 127
    not-int v1, v1

    .line 128
    rsub-int/lit8 v1, v1, -0x2

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_5
    rem-int/lit8 v3, v3, 0xa

    .line 132
    .line 133
    if-nez v3, :cond_7

    .line 134
    .line 135
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 136
    .line 137
    or-int/lit8 v0, p0, 0x13

    .line 138
    .line 139
    shl-int/2addr v0, v2

    .line 140
    xor-int/lit8 p0, p0, 0x13

    .line 141
    .line 142
    sub-int/2addr v0, p0

    .line 143
    rem-int/lit16 v0, v0, 0x80

    .line 144
    .line 145
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 146
    .line 147
    add-int/lit8 v0, v0, 0xf

    .line 148
    .line 149
    rem-int/lit16 p0, v0, 0x80

    .line 150
    .line 151
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 152
    .line 153
    rem-int/lit8 v0, v0, 0x2

    .line 154
    .line 155
    if-nez v0, :cond_6

    .line 156
    .line 157
    return v2

    .line 158
    :cond_6
    const/4 p0, 0x0

    .line 159
    throw p0

    .line 160
    :cond_7
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 161
    .line 162
    and-int/lit8 v1, p0, 0x5f

    .line 163
    .line 164
    or-int/lit8 p0, p0, 0x5f

    .line 165
    .line 166
    add-int/2addr v1, p0

    .line 167
    rem-int/lit16 p0, v1, 0x80

    .line 168
    .line 169
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    .line 170
    .line 171
    rem-int/lit8 v1, v1, 0x2

    .line 172
    .line 173
    if-nez v1, :cond_8

    .line 174
    .line 175
    const/16 p0, 0x39

    .line 176
    .line 177
    div-int/2addr p0, v0

    .line 178
    :cond_8
    return v0
.end method

.method private static ˏ(Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;)[B
    .locals 3

    .line 179
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    xor-int/lit8 v1, v0, 0x6d

    and-int/lit8 v0, v0, 0x6d

    shl-int/lit8 v0, v0, 0x1

    add-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    .line 180
    :try_start_0
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˊ:[B

    const/16 v1, 0xf

    aget-byte v0, v0, v1

    int-to-byte v0, v0

    int-to-byte v1, v0

    const/16 v2, 0x24d

    invoke-static {v0, v1, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˏ(IBS)Ljava/lang/String;

    move-result-object v0

    const-class v1, Ljava/net/NetworkInterface;

    .line 181
    invoke-static {v0, v1, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Enumeration;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    and-int/lit8 v1, v0, 0x1f

    or-int/lit8 v0, v0, 0x1f

    add-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    :cond_0
    :goto_0
    if-eqz p1, :cond_5

    .line 183
    :try_start_1
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v0, :cond_5

    .line 184
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    and-int/lit8 v1, v0, 0x51

    or-int/lit8 v0, v0, 0x51

    add-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v0, 0x0

    if-nez v1, :cond_4

    .line 185
    :try_start_2
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;

    if-eqz v1, :cond_0

    if-eqz p0, :cond_1

    .line 186
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 187
    :cond_1
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getHardwareAddress()[B

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v1, :cond_3

    .line 188
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    xor-int/lit8 p1, p0, 0x6f

    and-int/lit8 p0, p0, 0x6f

    shl-int/lit8 p0, p0, 0x1

    add-int/2addr p1, p0

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    and-int/lit8 p0, p1, 0x3d

    or-int/lit8 p1, p1, 0x3d

    add-int/2addr p0, p1

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_2

    return-object v1

    :cond_2
    throw v0

    :cond_3
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʼ:I

    xor-int/lit8 v1, v0, 0x5

    and-int/lit8 v0, v0, 0x5

    shl-int/lit8 v0, v0, 0x1

    add-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ʽ:I

    goto :goto_0

    .line 189
    :cond_4
    :try_start_3
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/net/NetworkInterface;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 190
    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p0

    .line 191
    throw p0

    .line 192
    :catch_0
    :cond_5
    sget-object p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;->ˋ:[B

    return-object p0
.end method
