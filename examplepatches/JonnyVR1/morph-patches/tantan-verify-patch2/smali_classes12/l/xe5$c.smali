.class Ll/xe5$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xe5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:F

.field c:I

.field d:F

.field e:Ljava/lang/String;

.field f:Ljava/lang/String;

.field g:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Ll/xe5$a;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ll/xe5$c;-><init>()V

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
    const/16 v1, 0x8

    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    :try_start_0
    new-array v2, v2, [B

    .line 10
    .line 11
    fill-array-data v2, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, p0, Ll/xe5$c;->f:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x5

    .line 24
    new-array v2, v2, [B

    .line 25
    .line 26
    fill-array-data v2, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget v3, p0, Ll/xe5$c;->b:F

    .line 34
    .line 35
    float-to-double v3, v3

    .line 36
    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x6

    .line 40
    new-array v2, v2, [B

    .line 41
    .line 42
    fill-array-data v2, :array_2

    .line 43
    .line 44
    .line 45
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Ll/xe5$c;->e:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    new-array v2, v1, [B

    .line 55
    .line 56
    fill-array-data v2, :array_3

    .line 57
    .line 58
    .line 59
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget v3, p0, Ll/xe5$c;->c:I

    .line 64
    .line 65
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 66
    .line 67
    .line 68
    new-array v2, v1, [B

    .line 69
    .line 70
    fill-array-data v2, :array_4

    .line 71
    .line 72
    .line 73
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iget v3, p0, Ll/xe5$c;->d:F

    .line 78
    .line 79
    float-to-double v3, v3

    .line 80
    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    new-array v2, v1, [B

    .line 84
    .line 85
    fill-array-data v2, :array_5

    .line 86
    .line 87
    .line 88
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v3, p0, Ll/xe5$c;->a:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    const/16 v2, 0xa

    .line 98
    .line 99
    new-array v2, v2, [B

    .line 100
    .line 101
    fill-array-data v2, :array_6

    .line 102
    .line 103
    .line 104
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iget p0, p0, Ll/xe5$c;->g:I

    .line 109
    .line 110
    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .line 112
    .line 113
    return-object v0

    .line 114
    :catch_0
    move-exception p0

    .line 115
    new-array v1, v1, [B

    .line 116
    .line 117
    fill-array-data v1, :array_7

    .line 118
    .line 119
    .line 120
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const/16 v2, 0x1a

    .line 125
    .line 126
    new-array v2, v2, [B

    .line 127
    .line 128
    fill-array-data v2, :array_8

    .line 129
    .line 130
    .line 131
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 136
    .line 137
    .line 138
    return-object v0

    .line 139
    :array_0
    .array-data 1
        0x5dt
        0x9t
        0x55t
        0x52t
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :array_1
    .array-data 1
        0x42t
        0x7t
        0x45t
        0x5et
        0xet
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    nop

    .line 153
    :array_2
    .array-data 1
        0x43t
        0x12t
        0x50t
        0x43t
        0x14t
        0x15t
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    nop

    .line 161
    :array_3
    .array-data 1
        0x52t
        0x7t
        0x45t
        0x43t
        0x4t
        0x14t
        0x49t
        0x30t
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :array_4
    .array-data 1
        0x52t
        0x7t
        0x45t
        0x43t
        0x4t
        0x14t
        0x49t
        0x32t
    .end array-data

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :array_5
    .array-data 1
        0x53t
        0x7t
        0x41t
        0x56t
        0x2t
        0xft
        0x44t
        0x1ft
    .end array-data

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :array_6
    .array-data 1
        0x53t
        0x1ft
        0x52t
        0x5bt
        0x4t
        0x25t
        0x5ft
        0x13t
        0x5ft
        0x43t
    .end array-data

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    nop

    .line 195
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

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :array_8
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x72t
        0x7t
        0x45t
        0x43t
        0x4t
        0x14t
        0x49t
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
