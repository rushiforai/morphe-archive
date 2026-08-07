.class public Ll/xe5$i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xe5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/CharSequence;

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/xe5$i;->b:I

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Ll/xe5$i;->c:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Ll/xe5$i;->d:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Ll/xe5$i;->e:Ljava/lang/CharSequence;

    .line 14
    .line 15
    iput-object v0, p0, Ll/xe5$i;->f:Ljava/lang/String;

    .line 16
    .line 17
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
    iget v3, p0, Ll/xe5$i;->b:I

    .line 17
    .line 18
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x5

    .line 22
    new-array v2, v2, [B

    .line 23
    .line 24
    fill-array-data v2, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, p0, Ll/xe5$i;->e:Ljava/lang/CharSequence;

    .line 32
    .line 33
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

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
    iget-object v2, p0, Ll/xe5$i;->c:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    const/4 v1, 0x7

    .line 51
    new-array v2, v1, [B

    .line 52
    .line 53
    fill-array-data v2, :array_3

    .line 54
    .line 55
    .line 56
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v3, p0, Ll/xe5$i;->d:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
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
    iget-object p0, p0, Ll/xe5$i;->f:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-object v0

    .line 80
    :catch_0
    move-exception p0

    .line 81
    const/16 v1, 0x8

    .line 82
    .line 83
    new-array v1, v1, [B

    .line 84
    .line 85
    fill-array-data v1, :array_5

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const/16 v2, 0x26

    .line 93
    .line 94
    new-array v2, v2, [B

    .line 95
    .line 96
    fill-array-data v2, :array_6

    .line 97
    .line 98
    .line 99
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 104
    .line 105
    .line 106
    return-object v0

    .line 107
    :array_0
    .array-data 1
        0x43t
        0xat
        0x5et
        0x43t
    .end array-data

    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    :array_1
    .array-data 1
        0x59t
        0x5t
        0x52t
        0x5et
        0x5t
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    nop

    .line 121
    :array_2
    .array-data 1
        0x59t
        0xbt
        0x42t
        0x5et
    .end array-data

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    :array_3
    .array-data 1
        0x53t
        0x7t
        0x43t
        0x45t
        0x8t
        0x3t
        0x42t
    .end array-data

    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    :array_4
    .array-data 1
        0x53t
        0x9t
        0x44t
        0x59t
        0x15t
        0x14t
        0x49t
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    :array_5
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

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    :array_6
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x2t
        0x14t
        0x55t
        0x7t
        0x45t
        0x52t
        0x41t
        0x35t
        0x59t
        0xbt
        0x75t
        0x52t
        0x15t
        0x7t
        0x59t
        0xat
        0x11t
        0x7dt
        0x32t
        0x29t
        0x7et
        0x46t
        0x7et
        0x55t
        0xbt
        0x3t
        0x53t
        0x12t
    .end array-data
.end method
