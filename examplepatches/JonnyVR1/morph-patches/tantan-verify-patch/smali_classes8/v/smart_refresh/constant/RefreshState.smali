.class public final enum Lv/smart_refresh/constant/RefreshState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lv/smart_refresh/constant/RefreshState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lv/smart_refresh/constant/RefreshState;

.field public static final enum LoadFinish:Lv/smart_refresh/constant/RefreshState;

.field public static final enum LoadReleased:Lv/smart_refresh/constant/RefreshState;

.field public static final enum Loading:Lv/smart_refresh/constant/RefreshState;

.field public static final enum None:Lv/smart_refresh/constant/RefreshState;

.field public static final enum PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

.field public static final enum PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

.field public static final enum PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

.field public static final enum PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

.field public static final enum RefreshFinish:Lv/smart_refresh/constant/RefreshState;

.field public static final enum RefreshReleased:Lv/smart_refresh/constant/RefreshState;

.field public static final enum Refreshing:Lv/smart_refresh/constant/RefreshState;

.field public static final enum ReleaseToLoad:Lv/smart_refresh/constant/RefreshState;

.field public static final enum ReleaseToRefresh:Lv/smart_refresh/constant/RefreshState;

.field public static final enum ReleaseToTwoLevel:Lv/smart_refresh/constant/RefreshState;

.field public static final enum TwoLevel:Lv/smart_refresh/constant/RefreshState;

.field public static final enum TwoLevelFinish:Lv/smart_refresh/constant/RefreshState;

.field public static final enum TwoLevelReleased:Lv/smart_refresh/constant/RefreshState;


# instance fields
.field public final isDragging:Z

.field public final isFinishing:Z

.field public final isFooter:Z

.field public final isHeader:Z

.field public final isOpening:Z

.field public final isReleaseToOpening:Z

.field public final isTwoLevel:Z


# direct methods
.method private static synthetic $values()[Lv/smart_refresh/constant/RefreshState;
    .locals 18

    .line 1
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    sget-object v3, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 6
    .line 7
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 8
    .line 9
    sget-object v5, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 10
    .line 11
    sget-object v6, Lv/smart_refresh/constant/RefreshState;->ReleaseToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 12
    .line 13
    sget-object v7, Lv/smart_refresh/constant/RefreshState;->ReleaseToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 14
    .line 15
    sget-object v8, Lv/smart_refresh/constant/RefreshState;->ReleaseToTwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 16
    .line 17
    sget-object v9, Lv/smart_refresh/constant/RefreshState;->TwoLevelReleased:Lv/smart_refresh/constant/RefreshState;

    .line 18
    .line 19
    sget-object v10, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 20
    .line 21
    sget-object v11, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 22
    .line 23
    sget-object v12, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 24
    .line 25
    sget-object v13, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 26
    .line 27
    sget-object v14, Lv/smart_refresh/constant/RefreshState;->TwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 28
    .line 29
    sget-object v15, Lv/smart_refresh/constant/RefreshState;->RefreshFinish:Lv/smart_refresh/constant/RefreshState;

    .line 30
    .line 31
    sget-object v16, Lv/smart_refresh/constant/RefreshState;->LoadFinish:Lv/smart_refresh/constant/RefreshState;

    .line 32
    .line 33
    sget-object v17, Lv/smart_refresh/constant/RefreshState;->TwoLevelFinish:Lv/smart_refresh/constant/RefreshState;

    .line 34
    .line 35
    filled-new-array/range {v1 .. v17}, [Lv/smart_refresh/constant/RefreshState;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 18

    .line 1
    new-instance v0, Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    const/4 v8, 0x0

    .line 5
    const-string v1, "None"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, 0x0

    .line 11
    const/4 v6, 0x0

    .line 12
    invoke-direct/range {v0 .. v8}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 16
    .line 17
    new-instance v1, Lv/smart_refresh/constant/RefreshState;

    .line 18
    .line 19
    const/4 v9, 0x0

    .line 20
    const-string v2, "PullDownToRefresh"

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    const/4 v4, 0x1

    .line 24
    const/4 v5, 0x1

    .line 25
    invoke-direct/range {v1 .. v9}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 26
    .line 27
    .line 28
    sput-object v1, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 29
    .line 30
    new-instance v2, Lv/smart_refresh/constant/RefreshState;

    .line 31
    .line 32
    const/4 v10, 0x0

    .line 33
    const-string v3, "PullUpToLoad"

    .line 34
    .line 35
    const/4 v4, 0x2

    .line 36
    const/4 v5, 0x2

    .line 37
    const/4 v6, 0x1

    .line 38
    invoke-direct/range {v2 .. v10}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 39
    .line 40
    .line 41
    sput-object v2, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 42
    .line 43
    new-instance v3, Lv/smart_refresh/constant/RefreshState;

    .line 44
    .line 45
    const/4 v11, 0x0

    .line 46
    const-string v4, "PullDownCanceled"

    .line 47
    .line 48
    const/4 v5, 0x3

    .line 49
    invoke-direct/range {v3 .. v11}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 50
    .line 51
    .line 52
    sput-object v3, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 53
    .line 54
    new-instance v4, Lv/smart_refresh/constant/RefreshState;

    .line 55
    .line 56
    const/4 v12, 0x0

    .line 57
    const-string v5, "PullUpCanceled"

    .line 58
    .line 59
    const/4 v6, 0x4

    .line 60
    const/4 v7, 0x2

    .line 61
    invoke-direct/range {v4 .. v12}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 62
    .line 63
    .line 64
    sput-object v4, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 65
    .line 66
    new-instance v5, Lv/smart_refresh/constant/RefreshState;

    .line 67
    .line 68
    const/4 v13, 0x1

    .line 69
    const-string v6, "ReleaseToRefresh"

    .line 70
    .line 71
    const/4 v7, 0x5

    .line 72
    const/4 v8, 0x1

    .line 73
    const/4 v9, 0x1

    .line 74
    invoke-direct/range {v5 .. v13}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 75
    .line 76
    .line 77
    sput-object v5, Lv/smart_refresh/constant/RefreshState;->ReleaseToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 78
    .line 79
    new-instance v6, Lv/smart_refresh/constant/RefreshState;

    .line 80
    .line 81
    const/4 v13, 0x0

    .line 82
    const/4 v14, 0x1

    .line 83
    const-string v7, "ReleaseToLoad"

    .line 84
    .line 85
    const/4 v8, 0x6

    .line 86
    const/4 v9, 0x2

    .line 87
    const/4 v10, 0x1

    .line 88
    invoke-direct/range {v6 .. v14}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 89
    .line 90
    .line 91
    sput-object v6, Lv/smart_refresh/constant/RefreshState;->ReleaseToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 92
    .line 93
    new-instance v7, Lv/smart_refresh/constant/RefreshState;

    .line 94
    .line 95
    const/4 v15, 0x1

    .line 96
    const-string v8, "ReleaseToTwoLevel"

    .line 97
    .line 98
    const/4 v9, 0x7

    .line 99
    const/4 v11, 0x1

    .line 100
    invoke-direct/range {v7 .. v15}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 101
    .line 102
    .line 103
    sput-object v7, Lv/smart_refresh/constant/RefreshState;->ReleaseToTwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 104
    .line 105
    new-instance v8, Lv/smart_refresh/constant/RefreshState;

    .line 106
    .line 107
    const/16 v16, 0x0

    .line 108
    .line 109
    const-string v9, "TwoLevelReleased"

    .line 110
    .line 111
    const/16 v10, 0x8

    .line 112
    .line 113
    const/4 v14, 0x0

    .line 114
    invoke-direct/range {v8 .. v16}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 115
    .line 116
    .line 117
    sput-object v8, Lv/smart_refresh/constant/RefreshState;->TwoLevelReleased:Lv/smart_refresh/constant/RefreshState;

    .line 118
    .line 119
    new-instance v9, Lv/smart_refresh/constant/RefreshState;

    .line 120
    .line 121
    const/16 v17, 0x0

    .line 122
    .line 123
    const-string v10, "RefreshReleased"

    .line 124
    .line 125
    const/16 v11, 0x9

    .line 126
    .line 127
    const/4 v12, 0x1

    .line 128
    const/4 v15, 0x0

    .line 129
    invoke-direct/range {v9 .. v17}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 130
    .line 131
    .line 132
    sput-object v9, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 133
    .line 134
    new-instance v0, Lv/smart_refresh/constant/RefreshState;

    .line 135
    .line 136
    const/4 v7, 0x0

    .line 137
    const/4 v8, 0x0

    .line 138
    const-string v1, "LoadReleased"

    .line 139
    .line 140
    const/16 v2, 0xa

    .line 141
    .line 142
    const/4 v3, 0x2

    .line 143
    const/4 v4, 0x0

    .line 144
    const/4 v5, 0x0

    .line 145
    const/4 v6, 0x0

    .line 146
    invoke-direct/range {v0 .. v8}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 147
    .line 148
    .line 149
    sput-object v0, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 150
    .line 151
    new-instance v1, Lv/smart_refresh/constant/RefreshState;

    .line 152
    .line 153
    const/4 v9, 0x0

    .line 154
    const-string v2, "Refreshing"

    .line 155
    .line 156
    const/16 v3, 0xb

    .line 157
    .line 158
    const/4 v4, 0x1

    .line 159
    const/4 v6, 0x1

    .line 160
    invoke-direct/range {v1 .. v9}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 161
    .line 162
    .line 163
    sput-object v1, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 164
    .line 165
    new-instance v2, Lv/smart_refresh/constant/RefreshState;

    .line 166
    .line 167
    const/4 v10, 0x0

    .line 168
    const-string v3, "Loading"

    .line 169
    .line 170
    const/16 v4, 0xc

    .line 171
    .line 172
    const/4 v5, 0x2

    .line 173
    const/4 v6, 0x0

    .line 174
    const/4 v7, 0x1

    .line 175
    invoke-direct/range {v2 .. v10}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 176
    .line 177
    .line 178
    sput-object v2, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 179
    .line 180
    new-instance v3, Lv/smart_refresh/constant/RefreshState;

    .line 181
    .line 182
    const/4 v10, 0x1

    .line 183
    const/4 v11, 0x0

    .line 184
    const-string v4, "TwoLevel"

    .line 185
    .line 186
    const/16 v5, 0xd

    .line 187
    .line 188
    const/4 v6, 0x1

    .line 189
    const/4 v7, 0x0

    .line 190
    const/4 v8, 0x1

    .line 191
    invoke-direct/range {v3 .. v11}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 192
    .line 193
    .line 194
    sput-object v3, Lv/smart_refresh/constant/RefreshState;->TwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 195
    .line 196
    new-instance v4, Lv/smart_refresh/constant/RefreshState;

    .line 197
    .line 198
    const/4 v12, 0x0

    .line 199
    const-string v5, "RefreshFinish"

    .line 200
    .line 201
    const/16 v6, 0xe

    .line 202
    .line 203
    const/4 v7, 0x1

    .line 204
    const/4 v8, 0x0

    .line 205
    invoke-direct/range {v4 .. v12}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 206
    .line 207
    .line 208
    sput-object v4, Lv/smart_refresh/constant/RefreshState;->RefreshFinish:Lv/smart_refresh/constant/RefreshState;

    .line 209
    .line 210
    new-instance v5, Lv/smart_refresh/constant/RefreshState;

    .line 211
    .line 212
    const-string v6, "LoadFinish"

    .line 213
    .line 214
    const/16 v7, 0xf

    .line 215
    .line 216
    const/4 v8, 0x2

    .line 217
    const/4 v10, 0x0

    .line 218
    const/4 v11, 0x1

    .line 219
    invoke-direct/range {v5 .. v13}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 220
    .line 221
    .line 222
    sput-object v5, Lv/smart_refresh/constant/RefreshState;->LoadFinish:Lv/smart_refresh/constant/RefreshState;

    .line 223
    .line 224
    new-instance v6, Lv/smart_refresh/constant/RefreshState;

    .line 225
    .line 226
    const/4 v13, 0x1

    .line 227
    const-string v7, "TwoLevelFinish"

    .line 228
    .line 229
    const/16 v8, 0x10

    .line 230
    .line 231
    const/4 v9, 0x1

    .line 232
    const/4 v11, 0x0

    .line 233
    const/4 v12, 0x1

    .line 234
    invoke-direct/range {v6 .. v14}, Lv/smart_refresh/constant/RefreshState;-><init>(Ljava/lang/String;IIZZZZZ)V

    .line 235
    .line 236
    .line 237
    sput-object v6, Lv/smart_refresh/constant/RefreshState;->TwoLevelFinish:Lv/smart_refresh/constant/RefreshState;

    .line 238
    .line 239
    invoke-static {}, Lv/smart_refresh/constant/RefreshState;->$values()[Lv/smart_refresh/constant/RefreshState;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    sput-object v0, Lv/smart_refresh/constant/RefreshState;->$VALUES:[Lv/smart_refresh/constant/RefreshState;

    .line 244
    .line 245
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIZZZZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZZZZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    const/4 p2, 0x1

    .line 6
    if-ne p3, p2, :cond_0

    .line 7
    .line 8
    move v0, p2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, p1

    .line 11
    :goto_0
    iput-boolean v0, p0, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-ne p3, v0, :cond_1

    .line 15
    .line 16
    move p1, p2

    .line 17
    :cond_1
    iput-boolean p1, p0, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 18
    .line 19
    iput-boolean p4, p0, Lv/smart_refresh/constant/RefreshState;->isDragging:Z

    .line 20
    .line 21
    iput-boolean p5, p0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 22
    .line 23
    iput-boolean p6, p0, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 24
    .line 25
    iput-boolean p7, p0, Lv/smart_refresh/constant/RefreshState;->isTwoLevel:Z

    .line 26
    .line 27
    iput-boolean p8, p0, Lv/smart_refresh/constant/RefreshState;->isReleaseToOpening:Z

    .line 28
    .line 29
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lv/smart_refresh/constant/RefreshState;
    .locals 1

    .line 1
    const-class v0, Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv/smart_refresh/constant/RefreshState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lv/smart_refresh/constant/RefreshState;
    .locals 1

    .line 1
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->$VALUES:[Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lv/smart_refresh/constant/RefreshState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lv/smart_refresh/constant/RefreshState;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toFooter()Lv/smart_refresh/constant/RefreshState;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lv/smart_refresh/constant/RefreshState;->isTwoLevel:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lv/smart_refresh/constant/RefreshState;->values()[Lv/smart_refresh/constant/RefreshState;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    aget-object p0, v0, p0

    .line 20
    .line 21
    :cond_0
    return-object p0
.end method

.method public toHeader()Lv/smart_refresh/constant/RefreshState;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lv/smart_refresh/constant/RefreshState;->isTwoLevel:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lv/smart_refresh/constant/RefreshState;->values()[Lv/smart_refresh/constant/RefreshState;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/lit8 p0, p0, -0x1

    .line 18
    .line 19
    aget-object p0, v0, p0

    .line 20
    .line 21
    :cond_0
    return-object p0
.end method
