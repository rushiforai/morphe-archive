.class Ll/xe5$j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xe5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "j"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I

.field d:I

.field e:I

.field f:I

.field g:I


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
    iput v0, p0, Ll/xe5$j;->a:I

    .line 6
    .line 7
    iput v0, p0, Ll/xe5$j;->b:I

    .line 8
    .line 9
    iput v0, p0, Ll/xe5$j;->c:I

    .line 10
    .line 11
    iput v0, p0, Ll/xe5$j;->d:I

    .line 12
    .line 13
    iput v0, p0, Ll/xe5$j;->e:I

    .line 14
    .line 15
    iput v0, p0, Ll/xe5$j;->f:I

    .line 16
    .line 17
    iput v0, p0, Ll/xe5$j;->g:I

    .line 18
    .line 19
    return-void
.end method

.method public synthetic constructor <init>(Ll/xe5$a;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ll/xe5$j;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Lorg/json/JSONObject;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x3

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
    iget v3, p0, Ll/xe5$j;->a:I

    .line 17
    .line 18
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    new-array v2, v1, [B

    .line 22
    .line 23
    fill-array-data v2, :array_1

    .line 24
    .line 25
    .line 26
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget v3, p0, Ll/xe5$j;->b:I

    .line 31
    .line 32
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    new-array v2, v1, [B

    .line 36
    .line 37
    fill-array-data v2, :array_2

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget v3, p0, Ll/xe5$j;->c:I

    .line 45
    .line 46
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    new-array v2, v1, [B

    .line 50
    .line 51
    fill-array-data v2, :array_3

    .line 52
    .line 53
    .line 54
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget v3, p0, Ll/xe5$j;->d:I

    .line 59
    .line 60
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 61
    .line 62
    .line 63
    new-array v2, v1, [B

    .line 64
    .line 65
    fill-array-data v2, :array_4

    .line 66
    .line 67
    .line 68
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget v3, p0, Ll/xe5$j;->e:I

    .line 73
    .line 74
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    const/4 v2, 0x6

    .line 78
    new-array v2, v2, [B

    .line 79
    .line 80
    fill-array-data v2, :array_5

    .line 81
    .line 82
    .line 83
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iget v3, p0, Ll/xe5$j;->f:I

    .line 88
    .line 89
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    new-array v1, v1, [B

    .line 93
    .line 94
    fill-array-data v1, :array_6

    .line 95
    .line 96
    .line 97
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget p0, p0, Ll/xe5$j;->g:I

    .line 102
    .line 103
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .line 105
    .line 106
    return-object v0

    .line 107
    :catch_0
    move-exception p0

    .line 108
    const/16 v1, 0x8

    .line 109
    .line 110
    new-array v1, v1, [B

    .line 111
    .line 112
    fill-array-data v1, :array_7

    .line 113
    .line 114
    .line 115
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const/16 v2, 0x1c

    .line 120
    .line 121
    new-array v2, v2, [B

    .line 122
    .line 123
    fill-array-data v2, :array_8

    .line 124
    .line 125
    .line 126
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .line 132
    .line 133
    return-object v0

    .line 134
    nop

    .line 135
    :array_0
    .array-data 1
        0x5dt
        0x8t
        0x52t
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    :array_1
    .array-data 1
        0x5dt
        0x5t
        0x52t
    .end array-data

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_2
    .array-data 1
        0x5ct
        0x7t
        0x52t
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_3
    .array-data 1
        0x53t
        0xft
        0x55t
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    :array_4
    .array-data 1
        0x40t
        0x15t
        0x52t
    .end array-data

    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_5
    .array-data 1
        0x45t
        0x7t
        0x43t
        0x51t
        0x2t
        0x8t
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    nop

    .line 173
    :array_6
    .array-data 1
        0x54t
        0x4t
        0x5ct
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    :array_7
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

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    :array_8
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x67t
        0x25t
        0x75t
        0x7at
        0x20t
        0x25t
        0x55t
        0xat
        0x5dt
        0x7et
        0xft
        0x0t
        0x5ft
        0x46t
        0x45t
        0x58t
        0x2bt
        0x15t
        0x5ft
        0x8t
        0xbt
        0x17t
    .end array-data
.end method
