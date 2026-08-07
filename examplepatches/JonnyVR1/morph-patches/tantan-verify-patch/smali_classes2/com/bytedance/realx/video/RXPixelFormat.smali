.class public final enum Lcom/bytedance/realx/video/RXPixelFormat;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/RXPixelFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kArgb:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kBgra:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kI420:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kIYUV:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kMJPEG:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kNative:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kNv12:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kNv21:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kRGB565:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kRgb:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kRgb24:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kRgba:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kTexture2D:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kTextureOES:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kUYVY:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kUnknown:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kYUY2:Lcom/bytedance/realx/video/RXPixelFormat;

.field public static final enum kYV12:Lcom/bytedance/realx/video/RXPixelFormat;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 20

    .line 1
    new-instance v1, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 2
    .line 3
    const-string v0, "kUnknown"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v0, v2, v2}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/bytedance/realx/video/RXPixelFormat;->kUnknown:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 10
    .line 11
    new-instance v2, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 12
    .line 13
    const-string v0, "kArgb"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v2, v0, v3, v3}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v2, Lcom/bytedance/realx/video/RXPixelFormat;->kArgb:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 20
    .line 21
    new-instance v3, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 22
    .line 23
    const-string v0, "kBgra"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v3, v0, v4, v4}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v3, Lcom/bytedance/realx/video/RXPixelFormat;->kBgra:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 30
    .line 31
    new-instance v4, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 32
    .line 33
    const-string v0, "kRgba"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v4, v0, v5, v5}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v4, Lcom/bytedance/realx/video/RXPixelFormat;->kRgba:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 40
    .line 41
    new-instance v5, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 42
    .line 43
    const-string v0, "kRgb24"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v5, v0, v6, v6}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v5, Lcom/bytedance/realx/video/RXPixelFormat;->kRgb24:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 50
    .line 51
    new-instance v6, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 52
    .line 53
    const-string v0, "kI420"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v6, v0, v7, v7}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v6, Lcom/bytedance/realx/video/RXPixelFormat;->kI420:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 60
    .line 61
    new-instance v7, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 62
    .line 63
    const-string v0, "kNv12"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v7, v0, v8, v8}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v7, Lcom/bytedance/realx/video/RXPixelFormat;->kNv12:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 70
    .line 71
    new-instance v8, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 72
    .line 73
    const-string v0, "kNv21"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v8, v0, v9, v9}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v8, Lcom/bytedance/realx/video/RXPixelFormat;->kNv21:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 80
    .line 81
    new-instance v9, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 82
    .line 83
    const-string v0, "kRgb"

    .line 84
    .line 85
    const/16 v10, 0x8

    .line 86
    .line 87
    invoke-direct {v9, v0, v10, v10}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v9, Lcom/bytedance/realx/video/RXPixelFormat;->kRgb:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 91
    .line 92
    new-instance v10, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 93
    .line 94
    const-string v0, "kNative"

    .line 95
    .line 96
    const/16 v11, 0x9

    .line 97
    .line 98
    invoke-direct {v10, v0, v11, v11}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v10, Lcom/bytedance/realx/video/RXPixelFormat;->kNative:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 102
    .line 103
    new-instance v11, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 104
    .line 105
    const-string v0, "kIYUV"

    .line 106
    .line 107
    const/16 v12, 0xa

    .line 108
    .line 109
    invoke-direct {v11, v0, v12, v12}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    sput-object v11, Lcom/bytedance/realx/video/RXPixelFormat;->kIYUV:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 113
    .line 114
    new-instance v12, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 115
    .line 116
    const-string v0, "kYUY2"

    .line 117
    .line 118
    const/16 v13, 0xb

    .line 119
    .line 120
    invoke-direct {v12, v0, v13, v13}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    sput-object v12, Lcom/bytedance/realx/video/RXPixelFormat;->kYUY2:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 124
    .line 125
    new-instance v13, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 126
    .line 127
    const-string v0, "kYV12"

    .line 128
    .line 129
    const/16 v14, 0xc

    .line 130
    .line 131
    invoke-direct {v13, v0, v14, v14}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 132
    .line 133
    .line 134
    sput-object v13, Lcom/bytedance/realx/video/RXPixelFormat;->kYV12:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 135
    .line 136
    new-instance v14, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 137
    .line 138
    const-string v0, "kUYVY"

    .line 139
    .line 140
    const/16 v15, 0xd

    .line 141
    .line 142
    invoke-direct {v14, v0, v15, v15}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 143
    .line 144
    .line 145
    sput-object v14, Lcom/bytedance/realx/video/RXPixelFormat;->kUYVY:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 146
    .line 147
    new-instance v15, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 148
    .line 149
    const-string v0, "kRGB565"

    .line 150
    .line 151
    move-object/from16 v16, v1

    .line 152
    .line 153
    const/16 v1, 0xe

    .line 154
    .line 155
    invoke-direct {v15, v0, v1, v1}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 156
    .line 157
    .line 158
    sput-object v15, Lcom/bytedance/realx/video/RXPixelFormat;->kRGB565:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 159
    .line 160
    new-instance v0, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 161
    .line 162
    const-string v1, "kMJPEG"

    .line 163
    .line 164
    move-object/from16 v17, v2

    .line 165
    .line 166
    const/16 v2, 0xf

    .line 167
    .line 168
    invoke-direct {v0, v1, v2, v2}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 169
    .line 170
    .line 171
    sput-object v0, Lcom/bytedance/realx/video/RXPixelFormat;->kMJPEG:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 172
    .line 173
    new-instance v1, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 174
    .line 175
    const-string v2, "kTexture2D"

    .line 176
    .line 177
    move-object/from16 v18, v0

    .line 178
    .line 179
    const/16 v0, 0x10

    .line 180
    .line 181
    invoke-direct {v1, v2, v0, v0}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 182
    .line 183
    .line 184
    sput-object v1, Lcom/bytedance/realx/video/RXPixelFormat;->kTexture2D:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 185
    .line 186
    new-instance v0, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 187
    .line 188
    const-string v2, "kTextureOES"

    .line 189
    .line 190
    move-object/from16 v19, v1

    .line 191
    .line 192
    const/16 v1, 0x11

    .line 193
    .line 194
    invoke-direct {v0, v2, v1, v1}, Lcom/bytedance/realx/video/RXPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 195
    .line 196
    .line 197
    sput-object v0, Lcom/bytedance/realx/video/RXPixelFormat;->kTextureOES:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 198
    .line 199
    move-object/from16 v1, v16

    .line 200
    .line 201
    move-object/from16 v2, v17

    .line 202
    .line 203
    move-object/from16 v16, v18

    .line 204
    .line 205
    move-object/from16 v17, v19

    .line 206
    .line 207
    move-object/from16 v18, v0

    .line 208
    .line 209
    filled-new-array/range {v1 .. v18}, [Lcom/bytedance/realx/video/RXPixelFormat;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    sput-object v0, Lcom/bytedance/realx/video/RXPixelFormat;->$VALUES:[Lcom/bytedance/realx/video/RXPixelFormat;

    .line 214
    .line 215
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
    iput p3, p0, Lcom/bytedance/realx/video/RXPixelFormat;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const/16 v0, 0xde1

    .line 2
    .line 3
    if-eq p0, v0, :cond_3

    .line 4
    .line 5
    const v0, 0x8d65

    .line 6
    .line 7
    .line 8
    if-eq p0, v0, :cond_2

    .line 9
    .line 10
    invoke-static {}, Lcom/bytedance/realx/video/RXPixelFormat;->values()[Lcom/bytedance/realx/video/RXPixelFormat;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    array-length v1, v0

    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    if-ge v2, v1, :cond_1

    .line 17
    .line 18
    aget-object v3, v0, v2

    .line 19
    .line 20
    invoke-virtual {v3}, Lcom/bytedance/realx/video/RXPixelFormat;->value()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-ne v4, p0, :cond_0

    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :cond_2
    sget-object p0, Lcom/bytedance/realx/video/RXPixelFormat;->kTextureOES:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    sget-object p0, Lcom/bytedance/realx/video/RXPixelFormat;->kTexture2D:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 36
    .line 37
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/video/RXPixelFormat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/RXPixelFormat;->$VALUES:[Lcom/bytedance/realx/video/RXPixelFormat;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/RXPixelFormat;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/RXPixelFormat;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/RXPixelFormat$1;->$SwitchMap$com$bytedance$realx$video$RXPixelFormat:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "kUnknown"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "kTextureOES"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "kTexture2D"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "kMJPEG"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "kRGB565"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "kUYVY"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "kYV12"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "kYUY2"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_7
    const-string p0, "kIYUV"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_8
    const-string p0, "kNative"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_9
    const-string p0, "kRgb"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_a
    const-string p0, "kNv21"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_b
    const-string p0, "kNv12"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_c
    const-string p0, "kI420"

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_d
    const-string p0, "kRgba"

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_e
    const-string p0, "kBgra"

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_f
    const-string p0, "kArgb"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public value()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/RXPixelFormat;->value:I

    .line 2
    .line 3
    return p0
.end method
