.class Ll/xe5$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xe5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I

.field d:I

.field e:I

.field f:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/xe5$d;->a:I

    .line 6
    .line 7
    iput v0, p0, Ll/xe5$d;->b:I

    .line 8
    .line 9
    iput v0, p0, Ll/xe5$d;->c:I

    .line 10
    .line 11
    iput v0, p0, Ll/xe5$d;->d:I

    .line 12
    .line 13
    iput v0, p0, Ll/xe5$d;->e:I

    .line 14
    .line 15
    iput v0, p0, Ll/xe5$d;->f:I

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Ll/xe5$a;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ll/xe5$d;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Lorg/json/JSONObject;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xa

    .line 7
    .line 8
    const/16 v2, 0x8

    .line 9
    .line 10
    :try_start_0
    new-array v1, v1, [B

    .line 11
    .line 12
    fill-array-data v1, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v3, p0, Ll/xe5$d;->a:I

    .line 20
    .line 21
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const/16 v1, 0x9

    .line 25
    .line 26
    new-array v3, v1, [B

    .line 27
    .line 28
    fill-array-data v3, :array_1

    .line 29
    .line 30
    .line 31
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget v4, p0, Ll/xe5$d;->b:I

    .line 36
    .line 37
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    const/16 v3, 0xe

    .line 41
    .line 42
    new-array v3, v3, [B

    .line 43
    .line 44
    fill-array-data v3, :array_2

    .line 45
    .line 46
    .line 47
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget v4, p0, Ll/xe5$d;->c:I

    .line 52
    .line 53
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    new-array v3, v2, [B

    .line 57
    .line 58
    fill-array-data v3, :array_3

    .line 59
    .line 60
    .line 61
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget v4, p0, Ll/xe5$d;->d:I

    .line 66
    .line 67
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    new-array v1, v1, [B

    .line 71
    .line 72
    fill-array-data v1, :array_4

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget v3, p0, Ll/xe5$d;->e:I

    .line 80
    .line 81
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 82
    .line 83
    .line 84
    const/4 v1, 0x3

    .line 85
    new-array v1, v1, [B

    .line 86
    .line 87
    fill-array-data v1, :array_5

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iget p0, p0, Ll/xe5$d;->f:I

    .line 95
    .line 96
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    .line 99
    return-object v0

    .line 100
    :catch_0
    move-exception p0

    .line 101
    new-array v1, v2, [B

    .line 102
    .line 103
    fill-array-data v1, :array_6

    .line 104
    .line 105
    .line 106
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const/16 v2, 0x1b

    .line 111
    .line 112
    new-array v2, v2, [B

    .line 113
    .line 114
    fill-array-data v2, :array_7

    .line 115
    .line 116
    .line 117
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    .line 123
    .line 124
    return-object v0

    .line 125
    :array_0
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x40t
        0xet
        0x14t
        0x5bt
        0x39t
        0x58t
        0x53t
    .end array-data

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    nop

    .line 135
    :array_1
    .array-data 1
        0x43t
        0x1ft
        0x42t
        0x43t
        0x4t
        0xbt
        0x6ft
        0xft
        0x55t
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    nop

    .line 145
    :array_2
    .array-data 1
        0x52t
        0x7t
        0x42t
        0x52t
        0x12t
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
        0x39t
        0x59t
        0x2t
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    nop

    .line 157
    :array_3
    .array-data 1
        0x5ct
        0x7t
        0x45t
        0x5et
        0x15t
        0x13t
        0x54t
        0x3t
    .end array-data

    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_4
    .array-data 1
        0x5ct
        0x9t
        0x5ft
        0x50t
        0x8t
        0x12t
        0x45t
        0x2t
        0x54t
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    nop

    .line 175
    :array_5
    .array-data 1
        0x54t
        0x4t
        0x5ct
    .end array-data

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_6
    .array-data 1
        0x7dt
        0x2bt
        0x75t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
    .end array-data

    .line 182
    .line 183
    .line 184
    :array_7
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x73t
        0x22t
        0x7ct
        0x76t
        0x22t
        0x3t
        0x5ct
        0xat
        0x78t
        0x59t
        0x7t
        0x9t
        0x10t
        0x12t
        0x5et
        0x7dt
        0x12t
        0x9t
        0x5et
        0x5ct
        0x11t
    .end array-data
.end method
