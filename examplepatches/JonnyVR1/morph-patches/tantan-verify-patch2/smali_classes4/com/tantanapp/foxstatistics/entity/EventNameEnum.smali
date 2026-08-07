.class public final enum Lcom/tantanapp/foxstatistics/entity/EventNameEnum;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/foxstatistics/entity/EventNameEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum APPCRASH:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum APPEXIT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum APPQUIT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum APPSTART:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum BIZ_ORDER:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum DEFAULT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum MODULE:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum MODULE_CLICK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum MODULE_SLIDER:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum MODULE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum MODULE_VIEW_LIST:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum PAGE_DISAPPEAR:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

.field public static final enum USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 1
    new-instance v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const-string v2, "PV"

    .line 5
    .line 6
    const-string v3, "PAGE_VIEW"

    .line 7
    .line 8
    invoke-direct {v1, v3, v0, v2}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 12
    .line 13
    new-instance v2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    const-string v3, "PD"

    .line 17
    .line 18
    const-string v4, "PAGE_DISAPPEAR"

    .line 19
    .line 20
    invoke-direct {v2, v4, v0, v3}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_DISAPPEAR:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 24
    .line 25
    new-instance v3, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    const-string v4, "MC"

    .line 29
    .line 30
    const-string v5, "MODULE_CLICK"

    .line 31
    .line 32
    invoke-direct {v3, v5, v0, v4}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v3, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_CLICK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 36
    .line 37
    new-instance v4, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    const-string v5, "ME"

    .line 41
    .line 42
    const-string v6, "MODULE"

    .line 43
    .line 44
    invoke-direct {v4, v6, v0, v5}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v4, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 48
    .line 49
    new-instance v5, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 50
    .line 51
    const/4 v0, 0x4

    .line 52
    const-string v6, "MV"

    .line 53
    .line 54
    const-string v7, "MODULE_VIEW"

    .line 55
    .line 56
    invoke-direct {v5, v7, v0, v6}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 60
    .line 61
    new-instance v6, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 62
    .line 63
    const/4 v0, 0x5

    .line 64
    const-string v7, "ML"

    .line 65
    .line 66
    const-string v8, "MODULE_VIEW_LIST"

    .line 67
    .line 68
    invoke-direct {v6, v8, v0, v7}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v6, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_VIEW_LIST:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 72
    .line 73
    new-instance v7, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 74
    .line 75
    const/4 v0, 0x6

    .line 76
    const-string v8, "MS"

    .line 77
    .line 78
    const-string v9, "MODULE_SLIDER"

    .line 79
    .line 80
    invoke-direct {v7, v9, v0, v8}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v7, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->MODULE_SLIDER:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 84
    .line 85
    new-instance v8, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 86
    .line 87
    const/4 v0, 0x7

    .line 88
    const-string v9, "AS"

    .line 89
    .line 90
    const-string v10, "APPSTART"

    .line 91
    .line 92
    invoke-direct {v8, v10, v0, v9}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v8, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->APPSTART:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 96
    .line 97
    new-instance v9, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 98
    .line 99
    const/16 v0, 0x8

    .line 100
    .line 101
    const-string v10, "AQ"

    .line 102
    .line 103
    const-string v11, "APPQUIT"

    .line 104
    .line 105
    invoke-direct {v9, v11, v0, v10}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sput-object v9, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->APPQUIT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 109
    .line 110
    new-instance v10, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 111
    .line 112
    const/16 v0, 0x9

    .line 113
    .line 114
    const-string v11, "AE"

    .line 115
    .line 116
    const-string v12, "APPEXIT"

    .line 117
    .line 118
    invoke-direct {v10, v12, v0, v11}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sput-object v10, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->APPEXIT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 122
    .line 123
    new-instance v11, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 124
    .line 125
    const/16 v0, 0xa

    .line 126
    .line 127
    const-string v12, "AC"

    .line 128
    .line 129
    const-string v13, "APPCRASH"

    .line 130
    .line 131
    invoke-direct {v11, v13, v0, v12}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v11, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->APPCRASH:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 135
    .line 136
    new-instance v12, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 137
    .line 138
    const/16 v0, 0xb

    .line 139
    .line 140
    const-string v13, "BO"

    .line 141
    .line 142
    const-string v14, "BIZ_ORDER"

    .line 143
    .line 144
    invoke-direct {v12, v14, v0, v13}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sput-object v12, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_ORDER:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 148
    .line 149
    new-instance v13, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 150
    .line 151
    const/16 v0, 0xc

    .line 152
    .line 153
    const-string v14, "BP"

    .line 154
    .line 155
    const-string v15, "BIZ_PAY"

    .line 156
    .line 157
    invoke-direct {v13, v15, v0, v14}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sput-object v13, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 161
    .line 162
    new-instance v14, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 163
    .line 164
    const/16 v0, 0xd

    .line 165
    .line 166
    const-string v15, "SC"

    .line 167
    .line 168
    move-object/from16 v16, v1

    .line 169
    .line 170
    const-string v1, "SYS_CHECK"

    .line 171
    .line 172
    invoke-direct {v14, v1, v0, v15}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sput-object v14, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 176
    .line 177
    new-instance v15, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 178
    .line 179
    const/16 v0, 0xe

    .line 180
    .line 181
    const-string v1, "UBC"

    .line 182
    .line 183
    move-object/from16 v17, v2

    .line 184
    .line 185
    const-string v2, "USER_BEHAVIOR_COMPLEMENT"

    .line 186
    .line 187
    invoke-direct {v15, v2, v0, v1}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 188
    .line 189
    .line 190
    sput-object v15, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 191
    .line 192
    new-instance v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 193
    .line 194
    const/16 v1, 0xf

    .line 195
    .line 196
    const-string v2, "DF"

    .line 197
    .line 198
    move-object/from16 v18, v3

    .line 199
    .line 200
    const-string v3, "DEFAULT"

    .line 201
    .line 202
    invoke-direct {v0, v3, v1, v2}, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 203
    .line 204
    .line 205
    sput-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->DEFAULT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 206
    .line 207
    move-object/from16 v1, v16

    .line 208
    .line 209
    move-object/from16 v2, v17

    .line 210
    .line 211
    move-object/from16 v3, v18

    .line 212
    .line 213
    move-object/from16 v16, v0

    .line 214
    .line 215
    filled-new-array/range {v1 .. v16}, [Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    sput-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->$VALUES:[Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 220
    .line 221
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->name:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/foxstatistics/entity/EventNameEnum;
    .locals 1

    .line 1
    const-class v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantanapp/foxstatistics/entity/EventNameEnum;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->$VALUES:[Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
