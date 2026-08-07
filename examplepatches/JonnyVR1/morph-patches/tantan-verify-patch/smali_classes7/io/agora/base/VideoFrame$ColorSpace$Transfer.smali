.class public final enum Lio/agora/base/VideoFrame$ColorSpace$Transfer;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame$ColorSpace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Transfer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/base/VideoFrame$ColorSpace$Transfer;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum ARIB_STD_B67:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum BT1361_ECG:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum BT2020_10:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum BT2020_12:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum BT709:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum GAMMA22:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum GAMMA28:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum IEC61966_2_1:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum IEC61966_2_4:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum LINEAR:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum LOG:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum LOG_SQRT:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum SMPTE170M:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum SMPTE240M:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum SMPTEST2084:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum SMPTEST428:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

.field public static final enum Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Transfer;


# instance fields
.field private final transfer:I


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 1
    new-instance v1, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 2
    .line 3
    const-string v0, "BT709"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v1, v0, v2, v3}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v1, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 11
    .line 12
    new-instance v2, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 13
    .line 14
    const-string v0, "Unspecified"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v2, v0, v3, v4}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 21
    .line 22
    new-instance v3, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 23
    .line 24
    const-string v0, "GAMMA22"

    .line 25
    .line 26
    const/4 v5, 0x4

    .line 27
    invoke-direct {v3, v0, v4, v5}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v3, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->GAMMA22:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 31
    .line 32
    new-instance v4, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 33
    .line 34
    const-string v0, "GAMMA28"

    .line 35
    .line 36
    const/4 v6, 0x3

    .line 37
    const/4 v7, 0x5

    .line 38
    invoke-direct {v4, v0, v6, v7}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v4, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->GAMMA28:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 42
    .line 43
    new-instance v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 44
    .line 45
    const-string v6, "SMPTE170M"

    .line 46
    .line 47
    const/4 v8, 0x6

    .line 48
    invoke-direct {v0, v6, v5, v8}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->SMPTE170M:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 52
    .line 53
    new-instance v6, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 54
    .line 55
    const-string v5, "SMPTE240M"

    .line 56
    .line 57
    const/4 v9, 0x7

    .line 58
    invoke-direct {v6, v5, v7, v9}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 59
    .line 60
    .line 61
    sput-object v6, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->SMPTE240M:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 62
    .line 63
    new-instance v7, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 64
    .line 65
    const-string v5, "LINEAR"

    .line 66
    .line 67
    const/16 v10, 0x8

    .line 68
    .line 69
    invoke-direct {v7, v5, v8, v10}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 70
    .line 71
    .line 72
    sput-object v7, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->LINEAR:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 73
    .line 74
    new-instance v8, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 75
    .line 76
    const-string v5, "LOG"

    .line 77
    .line 78
    const/16 v11, 0x9

    .line 79
    .line 80
    invoke-direct {v8, v5, v9, v11}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 81
    .line 82
    .line 83
    sput-object v8, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->LOG:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 84
    .line 85
    new-instance v9, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 86
    .line 87
    const-string v5, "LOG_SQRT"

    .line 88
    .line 89
    const/16 v12, 0xa

    .line 90
    .line 91
    invoke-direct {v9, v5, v10, v12}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 92
    .line 93
    .line 94
    sput-object v9, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->LOG_SQRT:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 95
    .line 96
    new-instance v10, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 97
    .line 98
    const-string v5, "IEC61966_2_4"

    .line 99
    .line 100
    const/16 v13, 0xb

    .line 101
    .line 102
    invoke-direct {v10, v5, v11, v13}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 103
    .line 104
    .line 105
    sput-object v10, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->IEC61966_2_4:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 106
    .line 107
    new-instance v11, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 108
    .line 109
    const-string v5, "BT1361_ECG"

    .line 110
    .line 111
    const/16 v14, 0xc

    .line 112
    .line 113
    invoke-direct {v11, v5, v12, v14}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 114
    .line 115
    .line 116
    sput-object v11, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT1361_ECG:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 117
    .line 118
    new-instance v12, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 119
    .line 120
    const-string v5, "IEC61966_2_1"

    .line 121
    .line 122
    const/16 v15, 0xd

    .line 123
    .line 124
    invoke-direct {v12, v5, v13, v15}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 125
    .line 126
    .line 127
    sput-object v12, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->IEC61966_2_1:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 128
    .line 129
    new-instance v13, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 130
    .line 131
    const-string v5, "BT2020_10"

    .line 132
    .line 133
    const/16 v15, 0xe

    .line 134
    .line 135
    invoke-direct {v13, v5, v14, v15}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 136
    .line 137
    .line 138
    sput-object v13, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT2020_10:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 139
    .line 140
    new-instance v14, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 141
    .line 142
    const-string v5, "BT2020_12"

    .line 143
    .line 144
    const/16 v15, 0xf

    .line 145
    .line 146
    move-object/from16 v18, v0

    .line 147
    .line 148
    const/16 v0, 0xd

    .line 149
    .line 150
    invoke-direct {v14, v5, v0, v15}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 151
    .line 152
    .line 153
    sput-object v14, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->BT2020_12:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 154
    .line 155
    new-instance v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 156
    .line 157
    const-string v5, "SMPTEST2084"

    .line 158
    .line 159
    const/16 v15, 0x10

    .line 160
    .line 161
    move-object/from16 v19, v1

    .line 162
    .line 163
    const/16 v1, 0xe

    .line 164
    .line 165
    invoke-direct {v0, v5, v1, v15}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 166
    .line 167
    .line 168
    sput-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->SMPTEST2084:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 169
    .line 170
    new-instance v1, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 171
    .line 172
    const-string v5, "SMPTEST428"

    .line 173
    .line 174
    const/16 v15, 0x11

    .line 175
    .line 176
    move-object/from16 v20, v0

    .line 177
    .line 178
    const/16 v0, 0xf

    .line 179
    .line 180
    invoke-direct {v1, v5, v0, v15}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 181
    .line 182
    .line 183
    sput-object v1, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->SMPTEST428:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 184
    .line 185
    new-instance v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 186
    .line 187
    const-string v5, "ARIB_STD_B67"

    .line 188
    .line 189
    const/16 v15, 0x12

    .line 190
    .line 191
    move-object/from16 v16, v1

    .line 192
    .line 193
    const/16 v1, 0x10

    .line 194
    .line 195
    invoke-direct {v0, v5, v1, v15}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;-><init>(Ljava/lang/String;II)V

    .line 196
    .line 197
    .line 198
    sput-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->ARIB_STD_B67:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 199
    .line 200
    move-object/from16 v17, v0

    .line 201
    .line 202
    move-object/from16 v5, v18

    .line 203
    .line 204
    move-object/from16 v1, v19

    .line 205
    .line 206
    move-object/from16 v15, v20

    .line 207
    .line 208
    filled-new-array/range {v1 .. v17}, [Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    sput-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->$VALUES:[Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 213
    .line 214
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
    iput p3, p0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->transfer:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/base/VideoFrame$ColorSpace$Transfer;
    .locals 1

    .line 1
    const-class v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lio/agora/base/VideoFrame$ColorSpace$Transfer;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->$VALUES:[Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lio/agora/base/VideoFrame$ColorSpace$Transfer;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getTransfer()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->transfer:I

    .line 2
    .line 3
    return p0
.end method
