.class Ll/xe5$g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xe5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I

.field d:I

.field e:I

.field f:I

.field g:I

.field h:I


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
    iput v0, p0, Ll/xe5$g;->a:I

    .line 6
    .line 7
    iput v0, p0, Ll/xe5$g;->b:I

    .line 8
    .line 9
    iput v0, p0, Ll/xe5$g;->c:I

    .line 10
    .line 11
    iput v0, p0, Ll/xe5$g;->d:I

    .line 12
    .line 13
    iput v0, p0, Ll/xe5$g;->e:I

    .line 14
    .line 15
    iput v0, p0, Ll/xe5$g;->f:I

    .line 16
    .line 17
    iput v0, p0, Ll/xe5$g;->g:I

    .line 18
    .line 19
    iput v0, p0, Ll/xe5$g;->h:I

    .line 20
    .line 21
    return-void
.end method

.method public synthetic constructor <init>(Ll/xe5$a;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ll/xe5$g;-><init>()V

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
    const/4 v1, 0x4

    .line 7
    :try_start_0
    new-array v2, v1, [B

    .line 8
    .line 9
    fill-array-data v2, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget v3, p0, Ll/xe5$g;->h:I

    .line 17
    .line 18
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    new-array v3, v2, [B

    .line 23
    .line 24
    fill-array-data v3, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget v4, p0, Ll/xe5$g;->a:I

    .line 32
    .line 33
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    new-array v1, v1, [B

    .line 37
    .line 38
    fill-array-data v1, :array_2

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget v3, p0, Ll/xe5$g;->g:I

    .line 46
    .line 47
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    new-array v1, v2, [B

    .line 51
    .line 52
    fill-array-data v1, :array_3

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget v3, p0, Ll/xe5$g;->b:I

    .line 60
    .line 61
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x5

    .line 65
    new-array v1, v1, [B

    .line 66
    .line 67
    fill-array-data v1, :array_4

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget v3, p0, Ll/xe5$g;->e:I

    .line 75
    .line 76
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    new-array v1, v2, [B

    .line 80
    .line 81
    fill-array-data v1, :array_5

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget v3, p0, Ll/xe5$g;->f:I

    .line 89
    .line 90
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 91
    .line 92
    .line 93
    new-array v1, v2, [B

    .line 94
    .line 95
    fill-array-data v1, :array_6

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget v3, p0, Ll/xe5$g;->c:I

    .line 103
    .line 104
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 105
    .line 106
    .line 107
    new-array v1, v2, [B

    .line 108
    .line 109
    fill-array-data v1, :array_7

    .line 110
    .line 111
    .line 112
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iget p0, p0, Ll/xe5$g;->d:I

    .line 117
    .line 118
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    return-object v0

    .line 122
    :catch_0
    move-exception p0

    .line 123
    const/16 v1, 0x8

    .line 124
    .line 125
    new-array v1, v1, [B

    .line 126
    .line 127
    fill-array-data v1, :array_8

    .line 128
    .line 129
    .line 130
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    const/16 v2, 0x1a

    .line 135
    .line 136
    new-array v2, v2, [B

    .line 137
    .line 138
    fill-array-data v2, :array_9

    .line 139
    .line 140
    .line 141
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 146
    .line 147
    .line 148
    return-object v0

    .line 149
    :array_0
    .array-data 1
        0x42t
        0x15t
        0x42t
        0x5et
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_1
    .array-data 1
        0x5dt
        0x8t
        0x52t
    .end array-data

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_2
    .array-data 1
        0x52t
        0x15t
        0x58t
        0x54t
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    :array_3
    .array-data 1
        0x5dt
        0x5t
        0x52t
    .end array-data

    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_4
    .array-data 1
        0x51t
        0x14t
        0x57t
        0x54t
        0xft
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    nop

    .line 181
    :array_5
    .array-data 1
        0x54t
        0x4t
        0x5ct
    .end array-data

    .line 182
    .line 183
    .line 184
    :array_6
    .array-data 1
        0x5ct
        0x7t
        0x52t
    .end array-data

    :array_7
    .array-data 1
        0x53t
        0xft
        0x55t
    .end array-data

    :array_8
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

    :array_9
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x77t
        0x35t
        0x7ct
        0x74t
        0x4t
        0xat
        0x5ct
        0x2ft
        0x5ft
        0x51t
        0xet
        0x46t
        0x44t
        0x9t
        0x7bt
        0x44t
        0xet
        0x8t
        0xat
        0x46t
    .end array-data
.end method
