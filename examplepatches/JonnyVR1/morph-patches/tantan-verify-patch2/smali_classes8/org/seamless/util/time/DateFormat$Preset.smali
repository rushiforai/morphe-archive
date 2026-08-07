.class public final enum Lorg/seamless/util/time/DateFormat$Preset;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/util/time/DateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Preset"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/seamless/util/time/DateFormat$Preset;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum DD_MMM_YYYY:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum DD_MM_YYYY_DOT:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum DD_MM_YYYY_SLASH:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum MMM_DD_YYYY:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum MM_DD_YYYY_DOT:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum MM_DD_YYYY_SLASH:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum YYYY_DD_MM_DOT:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum YYYY_DD_MM_SLASH:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum YYYY_MMM_DD:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum YYYY_MM_DD_DOT:Lorg/seamless/util/time/DateFormat$Preset;

.field public static final enum YYYY_MM_DD_SLASH:Lorg/seamless/util/time/DateFormat$Preset;


# instance fields
.field protected dateFormat:Lorg/seamless/util/time/DateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    new-instance v0, Lorg/seamless/util/time/DateFormat$Preset;

    .line 2
    .line 3
    new-instance v1, Lorg/seamless/util/time/DateFormat;

    .line 4
    .line 5
    const-string v2, "31.12.2010"

    .line 6
    .line 7
    const-string v3, "dd.MM.yyyy"

    .line 8
    .line 9
    invoke-direct {v1, v2, v3}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v2, "DD_MM_YYYY_DOT"

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct {v0, v2, v3, v1}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lorg/seamless/util/time/DateFormat$Preset;->DD_MM_YYYY_DOT:Lorg/seamless/util/time/DateFormat$Preset;

    .line 19
    .line 20
    new-instance v1, Lorg/seamless/util/time/DateFormat$Preset;

    .line 21
    .line 22
    new-instance v2, Lorg/seamless/util/time/DateFormat;

    .line 23
    .line 24
    const-string v3, "12.31.2010"

    .line 25
    .line 26
    const-string v4, "MM.dd.yyyy"

    .line 27
    .line 28
    invoke-direct {v2, v3, v4}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v3, "MM_DD_YYYY_DOT"

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    invoke-direct {v1, v3, v4, v2}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 35
    .line 36
    .line 37
    sput-object v1, Lorg/seamless/util/time/DateFormat$Preset;->MM_DD_YYYY_DOT:Lorg/seamless/util/time/DateFormat$Preset;

    .line 38
    .line 39
    new-instance v2, Lorg/seamless/util/time/DateFormat$Preset;

    .line 40
    .line 41
    new-instance v3, Lorg/seamless/util/time/DateFormat;

    .line 42
    .line 43
    const-string v4, "2010.12.31"

    .line 44
    .line 45
    const-string v5, "yyyy.MM.dd"

    .line 46
    .line 47
    invoke-direct {v3, v4, v5}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const-string v4, "YYYY_MM_DD_DOT"

    .line 51
    .line 52
    const/4 v5, 0x2

    .line 53
    invoke-direct {v2, v4, v5, v3}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 54
    .line 55
    .line 56
    sput-object v2, Lorg/seamless/util/time/DateFormat$Preset;->YYYY_MM_DD_DOT:Lorg/seamless/util/time/DateFormat$Preset;

    .line 57
    .line 58
    new-instance v3, Lorg/seamless/util/time/DateFormat$Preset;

    .line 59
    .line 60
    new-instance v4, Lorg/seamless/util/time/DateFormat;

    .line 61
    .line 62
    const-string v5, "2010.31.12"

    .line 63
    .line 64
    const-string v6, "yyyy.dd.MM"

    .line 65
    .line 66
    invoke-direct {v4, v5, v6}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v5, "YYYY_DD_MM_DOT"

    .line 70
    .line 71
    const/4 v6, 0x3

    .line 72
    invoke-direct {v3, v5, v6, v4}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 73
    .line 74
    .line 75
    sput-object v3, Lorg/seamless/util/time/DateFormat$Preset;->YYYY_DD_MM_DOT:Lorg/seamless/util/time/DateFormat$Preset;

    .line 76
    .line 77
    new-instance v4, Lorg/seamless/util/time/DateFormat$Preset;

    .line 78
    .line 79
    new-instance v5, Lorg/seamless/util/time/DateFormat;

    .line 80
    .line 81
    const-string v6, "31/12/2010"

    .line 82
    .line 83
    const-string v7, "dd/MM/yyyy"

    .line 84
    .line 85
    invoke-direct {v5, v6, v7}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const-string v6, "DD_MM_YYYY_SLASH"

    .line 89
    .line 90
    const/4 v7, 0x4

    .line 91
    invoke-direct {v4, v6, v7, v5}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 92
    .line 93
    .line 94
    sput-object v4, Lorg/seamless/util/time/DateFormat$Preset;->DD_MM_YYYY_SLASH:Lorg/seamless/util/time/DateFormat$Preset;

    .line 95
    .line 96
    new-instance v5, Lorg/seamless/util/time/DateFormat$Preset;

    .line 97
    .line 98
    new-instance v6, Lorg/seamless/util/time/DateFormat;

    .line 99
    .line 100
    const-string v7, "12/31/2010"

    .line 101
    .line 102
    const-string v8, "MM/dd/yyyy"

    .line 103
    .line 104
    invoke-direct {v6, v7, v8}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const-string v7, "MM_DD_YYYY_SLASH"

    .line 108
    .line 109
    const/4 v8, 0x5

    .line 110
    invoke-direct {v5, v7, v8, v6}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 111
    .line 112
    .line 113
    sput-object v5, Lorg/seamless/util/time/DateFormat$Preset;->MM_DD_YYYY_SLASH:Lorg/seamless/util/time/DateFormat$Preset;

    .line 114
    .line 115
    new-instance v6, Lorg/seamless/util/time/DateFormat$Preset;

    .line 116
    .line 117
    new-instance v7, Lorg/seamless/util/time/DateFormat;

    .line 118
    .line 119
    const-string v8, "2010/12/31"

    .line 120
    .line 121
    const-string v9, "yyyy/MM/dd"

    .line 122
    .line 123
    invoke-direct {v7, v8, v9}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    const-string v8, "YYYY_MM_DD_SLASH"

    .line 127
    .line 128
    const/4 v9, 0x6

    .line 129
    invoke-direct {v6, v8, v9, v7}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 130
    .line 131
    .line 132
    sput-object v6, Lorg/seamless/util/time/DateFormat$Preset;->YYYY_MM_DD_SLASH:Lorg/seamless/util/time/DateFormat$Preset;

    .line 133
    .line 134
    new-instance v7, Lorg/seamless/util/time/DateFormat$Preset;

    .line 135
    .line 136
    new-instance v8, Lorg/seamless/util/time/DateFormat;

    .line 137
    .line 138
    const-string v9, "2010/31/12"

    .line 139
    .line 140
    const-string v10, "yyyy/dd/MM"

    .line 141
    .line 142
    invoke-direct {v8, v9, v10}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    const-string v9, "YYYY_DD_MM_SLASH"

    .line 146
    .line 147
    const/4 v10, 0x7

    .line 148
    invoke-direct {v7, v9, v10, v8}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 149
    .line 150
    .line 151
    sput-object v7, Lorg/seamless/util/time/DateFormat$Preset;->YYYY_DD_MM_SLASH:Lorg/seamless/util/time/DateFormat$Preset;

    .line 152
    .line 153
    new-instance v8, Lorg/seamless/util/time/DateFormat$Preset;

    .line 154
    .line 155
    new-instance v9, Lorg/seamless/util/time/DateFormat;

    .line 156
    .line 157
    const-string v10, "2010 Dec 31"

    .line 158
    .line 159
    const-string v11, "yyyy MMM dd"

    .line 160
    .line 161
    invoke-direct {v9, v10, v11}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    const-string v10, "YYYY_MMM_DD"

    .line 165
    .line 166
    const/16 v11, 0x8

    .line 167
    .line 168
    invoke-direct {v8, v10, v11, v9}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 169
    .line 170
    .line 171
    sput-object v8, Lorg/seamless/util/time/DateFormat$Preset;->YYYY_MMM_DD:Lorg/seamless/util/time/DateFormat$Preset;

    .line 172
    .line 173
    new-instance v9, Lorg/seamless/util/time/DateFormat$Preset;

    .line 174
    .line 175
    new-instance v10, Lorg/seamless/util/time/DateFormat;

    .line 176
    .line 177
    const-string v11, "31 Dec 2010"

    .line 178
    .line 179
    const-string v12, "dd MMM yyyy"

    .line 180
    .line 181
    invoke-direct {v10, v11, v12}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    const-string v11, "DD_MMM_YYYY"

    .line 185
    .line 186
    const/16 v12, 0x9

    .line 187
    .line 188
    invoke-direct {v9, v11, v12, v10}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 189
    .line 190
    .line 191
    sput-object v9, Lorg/seamless/util/time/DateFormat$Preset;->DD_MMM_YYYY:Lorg/seamless/util/time/DateFormat$Preset;

    .line 192
    .line 193
    new-instance v10, Lorg/seamless/util/time/DateFormat$Preset;

    .line 194
    .line 195
    new-instance v11, Lorg/seamless/util/time/DateFormat;

    .line 196
    .line 197
    const-string v12, "Dec 31 2010"

    .line 198
    .line 199
    const-string v13, "MMM dd yyyy"

    .line 200
    .line 201
    invoke-direct {v11, v12, v13}, Lorg/seamless/util/time/DateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    const-string v12, "MMM_DD_YYYY"

    .line 205
    .line 206
    const/16 v13, 0xa

    .line 207
    .line 208
    invoke-direct {v10, v12, v13, v11}, Lorg/seamless/util/time/DateFormat$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V

    .line 209
    .line 210
    .line 211
    sput-object v10, Lorg/seamless/util/time/DateFormat$Preset;->MMM_DD_YYYY:Lorg/seamless/util/time/DateFormat$Preset;

    .line 212
    .line 213
    filled-new-array/range {v0 .. v10}, [Lorg/seamless/util/time/DateFormat$Preset;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    sput-object v0, Lorg/seamless/util/time/DateFormat$Preset;->$VALUES:[Lorg/seamless/util/time/DateFormat$Preset;

    .line 218
    .line 219
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILorg/seamless/util/time/DateFormat;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/seamless/util/time/DateFormat;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/seamless/util/time/DateFormat$Preset;->dateFormat:Lorg/seamless/util/time/DateFormat;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/seamless/util/time/DateFormat$Preset;
    .locals 1

    .line 1
    const-class v0, Lorg/seamless/util/time/DateFormat$Preset;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/seamless/util/time/DateFormat$Preset;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/seamless/util/time/DateFormat$Preset;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/util/time/DateFormat$Preset;->$VALUES:[Lorg/seamless/util/time/DateFormat$Preset;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/seamless/util/time/DateFormat$Preset;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/seamless/util/time/DateFormat$Preset;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getDateFormat()Lorg/seamless/util/time/DateFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/time/DateFormat$Preset;->dateFormat:Lorg/seamless/util/time/DateFormat;

    .line 2
    .line 3
    return-object p0
.end method
