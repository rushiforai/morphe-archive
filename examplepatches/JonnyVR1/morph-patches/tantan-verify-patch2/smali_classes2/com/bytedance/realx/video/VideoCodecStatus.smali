.class public final enum Lcom/bytedance/realx/video/VideoCodecStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/VideoCodecStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum ERR_PARAMETER:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum ERR_SIZE:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum LEVEL_EXCEEDED:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum MEDIACODEC_EXCEPTION:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum MEDIACODEC_OUT_OF_RESOLUTION:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum MEMORY:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum NO_OUTPUT:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum OK:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum OVERLOAD:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum TIMEOUT:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum UNINITIALIZED:Lcom/bytedance/realx/video/VideoCodecStatus;

.field public static final enum USING_INTERNAL_SURFACE:Lcom/bytedance/realx/video/VideoCodecStatus;


# instance fields
.field private final number:I


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 2
    .line 3
    const-string v1, "OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 12
    .line 13
    const-string v2, "ERR_PARAMETER"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const/16 v4, 0xbb9

    .line 17
    .line 18
    invoke-direct {v1, v2, v3, v4}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->ERR_PARAMETER:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 22
    .line 23
    new-instance v2, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 24
    .line 25
    const-string v3, "ERR_SIZE"

    .line 26
    .line 27
    const/4 v5, 0x2

    .line 28
    invoke-direct {v2, v3, v5, v4}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/bytedance/realx/video/VideoCodecStatus;->ERR_SIZE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 32
    .line 33
    new-instance v3, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 34
    .line 35
    const-string v5, "LEVEL_EXCEEDED"

    .line 36
    .line 37
    const/4 v6, 0x3

    .line 38
    invoke-direct {v3, v5, v6, v4}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/bytedance/realx/video/VideoCodecStatus;->LEVEL_EXCEEDED:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 42
    .line 43
    new-instance v4, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 44
    .line 45
    const/4 v5, 0x4

    .line 46
    const/16 v6, 0xfa2

    .line 47
    .line 48
    const-string v7, "UNINITIALIZED"

    .line 49
    .line 50
    invoke-direct {v4, v7, v5, v6}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Lcom/bytedance/realx/video/VideoCodecStatus;->UNINITIALIZED:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 54
    .line 55
    new-instance v5, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 56
    .line 57
    const-string v6, "MEMORY"

    .line 58
    .line 59
    const/4 v7, 0x5

    .line 60
    const/16 v8, 0xfa3

    .line 61
    .line 62
    invoke-direct {v5, v6, v7, v8}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 63
    .line 64
    .line 65
    sput-object v5, Lcom/bytedance/realx/video/VideoCodecStatus;->MEMORY:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 66
    .line 67
    new-instance v6, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 68
    .line 69
    const-string v7, "ERROR"

    .line 70
    .line 71
    const/4 v9, 0x6

    .line 72
    invoke-direct {v6, v7, v9, v8}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    sput-object v6, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 76
    .line 77
    new-instance v7, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 78
    .line 79
    const/4 v8, 0x7

    .line 80
    const/16 v9, 0xfa7

    .line 81
    .line 82
    const-string v10, "TIMEOUT"

    .line 83
    .line 84
    invoke-direct {v7, v10, v8, v9}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 85
    .line 86
    .line 87
    sput-object v7, Lcom/bytedance/realx/video/VideoCodecStatus;->TIMEOUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 88
    .line 89
    new-instance v8, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 90
    .line 91
    const-string v9, "NO_OUTPUT"

    .line 92
    .line 93
    const/16 v10, 0x8

    .line 94
    .line 95
    const/16 v11, 0x7d2

    .line 96
    .line 97
    invoke-direct {v8, v9, v10, v11}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 98
    .line 99
    .line 100
    sput-object v8, Lcom/bytedance/realx/video/VideoCodecStatus;->NO_OUTPUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 101
    .line 102
    new-instance v9, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 103
    .line 104
    const/16 v10, 0x9

    .line 105
    .line 106
    const/16 v12, 0xfa9

    .line 107
    .line 108
    const-string v13, "FALLBACK_SOFTWARE"

    .line 109
    .line 110
    invoke-direct {v9, v13, v10, v12}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 111
    .line 112
    .line 113
    sput-object v9, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 114
    .line 115
    new-instance v10, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 116
    .line 117
    const/16 v12, 0xa

    .line 118
    .line 119
    const/16 v13, 0x7d6

    .line 120
    .line 121
    const-string v14, "MEDIACODEC_EXCEPTION"

    .line 122
    .line 123
    invoke-direct {v10, v14, v12, v13}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 124
    .line 125
    .line 126
    sput-object v10, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_EXCEPTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 127
    .line 128
    new-instance v12, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 129
    .line 130
    const/16 v13, 0xb

    .line 131
    .line 132
    const/16 v14, 0x7d7

    .line 133
    .line 134
    const-string v15, "USING_INTERNAL_SURFACE"

    .line 135
    .line 136
    invoke-direct {v12, v15, v13, v14}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 137
    .line 138
    .line 139
    sput-object v12, Lcom/bytedance/realx/video/VideoCodecStatus;->USING_INTERNAL_SURFACE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 140
    .line 141
    move-object v13, v12

    .line 142
    new-instance v12, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 143
    .line 144
    const/16 v14, 0xc

    .line 145
    .line 146
    const/16 v15, 0xfa5

    .line 147
    .line 148
    const-string v11, "OVERLOAD"

    .line 149
    .line 150
    invoke-direct {v12, v11, v14, v15}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 151
    .line 152
    .line 153
    sput-object v12, Lcom/bytedance/realx/video/VideoCodecStatus;->OVERLOAD:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 154
    .line 155
    move-object v11, v13

    .line 156
    new-instance v13, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 157
    .line 158
    const/16 v14, 0xd

    .line 159
    .line 160
    const/16 v15, 0x7d8

    .line 161
    .line 162
    move-object/from16 v16, v0

    .line 163
    .line 164
    const-string v0, "MEDIACODEC_OUT_OF_RESOLUTION"

    .line 165
    .line 166
    invoke-direct {v13, v0, v14, v15}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 167
    .line 168
    .line 169
    sput-object v13, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_OUT_OF_RESOLUTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 170
    .line 171
    new-instance v14, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 172
    .line 173
    const-string v0, "DROP_DECODED_FRAME"

    .line 174
    .line 175
    const/16 v15, 0xe

    .line 176
    .line 177
    move-object/from16 v17, v1

    .line 178
    .line 179
    const/16 v1, 0x7d2

    .line 180
    .line 181
    invoke-direct {v14, v0, v15, v1}, Lcom/bytedance/realx/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 182
    .line 183
    .line 184
    sput-object v14, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 185
    .line 186
    move-object/from16 v0, v16

    .line 187
    .line 188
    move-object/from16 v1, v17

    .line 189
    .line 190
    filled-new-array/range {v0 .. v14}, [Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    sput-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->$VALUES:[Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 195
    .line 196
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/bytedance/realx/video/VideoCodecStatus;->number:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->$VALUES:[Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/VideoCodecStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/VideoCodecStatus;->number:I

    .line 2
    .line 3
    return p0
.end method
