.class public final enum Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum ADD_TAG:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum ADD_TAG_FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum AFTER_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum AFTER_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum BEFORE_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum BEFORE_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum FINISH_CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum FINISH_PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum IDLE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum UPLOADING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

.field public static final enum UPLOAD_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;


# instance fields
.field desc:Ljava/lang/String;

.field isLoading:Z

.field isSuccess:Z


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;
    .locals 17

    .line 1
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->IDLE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    sget-object v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    sget-object v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 6
    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    sget-object v5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 10
    .line 11
    sget-object v6, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->BEFORE_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 12
    .line 13
    sget-object v7, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->BEFORE_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 14
    .line 15
    sget-object v8, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOADING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 16
    .line 17
    sget-object v9, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOAD_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 18
    .line 19
    sget-object v10, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->AFTER_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 20
    .line 21
    sget-object v11, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->AFTER_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 22
    .line 23
    sget-object v12, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->ADD_TAG:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 24
    .line 25
    sget-object v13, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->ADD_TAG_FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 26
    .line 27
    sget-object v14, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 28
    .line 29
    sget-object v15, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 30
    .line 31
    sget-object v16, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 32
    .line 33
    filled-new-array/range {v1 .. v16}, [Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/4 v5, 0x1

    .line 5
    const-string v1, "IDLE"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const-string v3, "\u521d\u59cb\u5316\u72b6\u6001"

    .line 9
    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->IDLE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v6, 0x1

    .line 19
    const-string v2, "PICK"

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    const-string v4, "\u9009\u62e9\u7167\u7247\u4e2d"

    .line 23
    .line 24
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 25
    .line 26
    .line 27
    sput-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 28
    .line 29
    new-instance v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 30
    .line 31
    const/4 v6, 0x0

    .line 32
    const/4 v7, 0x1

    .line 33
    const-string v3, "CROP"

    .line 34
    .line 35
    const/4 v4, 0x2

    .line 36
    const-string v5, "\u88c1\u526a\u7167\u7247"

    .line 37
    .line 38
    invoke-direct/range {v2 .. v7}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 39
    .line 40
    .line 41
    sput-object v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 42
    .line 43
    new-instance v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 44
    .line 45
    const/4 v7, 0x0

    .line 46
    const/4 v8, 0x1

    .line 47
    const-string v4, "FINISH_CROP"

    .line 48
    .line 49
    const/4 v5, 0x3

    .line 50
    const-string v6, "\u88c1\u526a\u7167\u7247\u5b8c\u6210"

    .line 51
    .line 52
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 53
    .line 54
    .line 55
    sput-object v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 56
    .line 57
    new-instance v4, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 58
    .line 59
    const/4 v9, 0x1

    .line 60
    const-string v5, "FINISH_PICK"

    .line 61
    .line 62
    const/4 v6, 0x4

    .line 63
    const-string v7, "\u9009\u62e9\u7167\u5b8c\u6210"

    .line 64
    .line 65
    invoke-direct/range {v4 .. v9}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 66
    .line 67
    .line 68
    sput-object v4, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 69
    .line 70
    new-instance v5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 71
    .line 72
    const/4 v10, 0x1

    .line 73
    const-string v6, "BEFORE_CHECKING"

    .line 74
    .line 75
    const/4 v7, 0x5

    .line 76
    const-string v8, "\u4e0a\u4f20\u524d\u68c0\u6d4b"

    .line 77
    .line 78
    invoke-direct/range {v5 .. v10}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 79
    .line 80
    .line 81
    sput-object v5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->BEFORE_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 82
    .line 83
    new-instance v6, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 84
    .line 85
    const/4 v11, 0x1

    .line 86
    const-string v7, "BEFORE_DONE"

    .line 87
    .line 88
    const/4 v8, 0x6

    .line 89
    const-string v9, "\u4e0a\u4f20\u524d\u68c0\u6d4b\u5b8c\u6210"

    .line 90
    .line 91
    invoke-direct/range {v6 .. v11}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 92
    .line 93
    .line 94
    sput-object v6, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->BEFORE_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 95
    .line 96
    new-instance v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 97
    .line 98
    const/4 v4, 0x1

    .line 99
    const/4 v5, 0x1

    .line 100
    const-string v1, "UPLOADING"

    .line 101
    .line 102
    const/4 v2, 0x7

    .line 103
    const-string v3, "\u4e0a\u4f20\u4e2d"

    .line 104
    .line 105
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOADING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 109
    .line 110
    new-instance v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 111
    .line 112
    const/4 v6, 0x1

    .line 113
    const-string v2, "UPLOAD_DONE"

    .line 114
    .line 115
    const/16 v3, 0x8

    .line 116
    .line 117
    const-string v4, "\u4e0a\u4f20\u6210\u529f"

    .line 118
    .line 119
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 120
    .line 121
    .line 122
    sput-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOAD_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 123
    .line 124
    new-instance v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 125
    .line 126
    const/4 v7, 0x1

    .line 127
    const-string v3, "AFTER_CHECKING"

    .line 128
    .line 129
    const/16 v4, 0x9

    .line 130
    .line 131
    const-string v5, "\u4e0a\u4f20\u540e\u68c0\u6d4b"

    .line 132
    .line 133
    invoke-direct/range {v2 .. v7}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 134
    .line 135
    .line 136
    sput-object v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->AFTER_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 137
    .line 138
    new-instance v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 139
    .line 140
    const/4 v8, 0x1

    .line 141
    const-string v4, "AFTER_DONE"

    .line 142
    .line 143
    const/16 v5, 0xa

    .line 144
    .line 145
    const-string v6, "\u4e0a\u4f20\u540e\u68c0\u6d4b\u5b8c\u6210"

    .line 146
    .line 147
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 148
    .line 149
    .line 150
    sput-object v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->AFTER_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 151
    .line 152
    new-instance v4, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 153
    .line 154
    const/4 v9, 0x1

    .line 155
    const-string v5, "ADD_TAG"

    .line 156
    .line 157
    const/16 v6, 0xb

    .line 158
    .line 159
    const-string v7, "\u9009\u62e9\u6807\u7b7e"

    .line 160
    .line 161
    invoke-direct/range {v4 .. v9}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 162
    .line 163
    .line 164
    sput-object v4, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->ADD_TAG:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 165
    .line 166
    new-instance v5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 167
    .line 168
    const-string v6, "ADD_TAG_FINISH"

    .line 169
    .line 170
    const/16 v7, 0xc

    .line 171
    .line 172
    const-string v8, "\u9009\u62e9\u6807\u7b7e\u5b8c\u6210"

    .line 173
    .line 174
    invoke-direct/range {v5 .. v10}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 175
    .line 176
    .line 177
    sput-object v5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->ADD_TAG_FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 178
    .line 179
    new-instance v6, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 180
    .line 181
    const/4 v10, 0x0

    .line 182
    const-string v7, "FINISH"

    .line 183
    .line 184
    const/16 v8, 0xd

    .line 185
    .line 186
    const-string v9, "\u4e0a\u4f20\u7ed3\u675f"

    .line 187
    .line 188
    invoke-direct/range {v6 .. v11}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 189
    .line 190
    .line 191
    sput-object v6, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 192
    .line 193
    new-instance v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 194
    .line 195
    const/4 v4, 0x0

    .line 196
    const/4 v5, 0x0

    .line 197
    const-string v1, "FAIL"

    .line 198
    .line 199
    const/16 v2, 0xe

    .line 200
    .line 201
    const-string v3, "\u4e0a\u4f20\u5931\u8d25"

    .line 202
    .line 203
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 204
    .line 205
    .line 206
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 207
    .line 208
    new-instance v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 209
    .line 210
    const/4 v6, 0x1

    .line 211
    const-string v2, "CANCEL"

    .line 212
    .line 213
    const/16 v3, 0xf

    .line 214
    .line 215
    const-string v4, "\u4e0a\u4f20\u53d6\u6d88"

    .line 216
    .line 217
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;-><init>(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 218
    .line 219
    .line 220
    sput-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 221
    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->$values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->$VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 227
    .line 228
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->desc:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading:Z

    .line 7
    .line 8
    iput-boolean p5, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isSuccess:Z

    .line 9
    .line 10
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->$VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->desc:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSuccess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isSuccess:Z

    .line 2
    .line 3
    return p0
.end method
