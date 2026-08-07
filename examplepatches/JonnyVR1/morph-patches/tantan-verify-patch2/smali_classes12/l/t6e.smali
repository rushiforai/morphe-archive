.class public Ll/t6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mm/mmfile/IMMFileUploader;


# static fields
.field private static final c:Ll/rg50;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/rg50$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/x1c;->a()Ll/o6e;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-wide/16 v1, 0xf

    .line 15
    .line 16
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-wide/16 v1, 0x5

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, Ll/t6e;->c:Ll/rg50;

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/t6e;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Ll/t6e;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private a(Ljava/io/File;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/t6e;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/t6e;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "deviceId"

    .line 24
    .line 25
    iget-object v3, p0, Ll/t6e;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    const-string v2, "appId"

    .line 31
    .line 32
    iget-object p0, p0, Ll/t6e;->b:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const-string p0, "timestamp"

    .line 38
    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    invoke-virtual {v0, p0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    const/16 p0, 0x10

    .line 47
    .line 48
    invoke-static {p0}, Ll/zje;->g(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {v2}, Ll/zje;->a([B)[B

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {v2}, Ll/qe2;->b([B)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {}, Ll/zje;->d()Ll/zje;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v3, v0, p0}, Ll/zje;->c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    new-instance v0, Ll/ku10$a;

    .line 77
    .line 78
    const-string v3, "---------------------------7da2137580612"

    .line 79
    .line 80
    invoke-direct {v0, v3}, Ll/ku10$a;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sget-object v3, Ll/ku10;->j:Ll/e7y;

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Ll/ku10$a;->f(Ll/e7y;)Ll/ku10$a;

    .line 86
    .line 87
    .line 88
    const-string v3, "application/octet-stream"

    .line 89
    .line 90
    invoke-static {v3}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    const-string v4, "msc"

    .line 95
    .line 96
    invoke-virtual {v0, v4, v2}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v2, "mzip"

    .line 101
    .line 102
    invoke-virtual {v0, v2, p0}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v3, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/io/File;)Ll/z1d0;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    const-string v2, "logFile"

    .line 115
    .line 116
    invoke-virtual {p0, v2, v0, p1}, Ll/ku10$a;->b(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ll/ku10$a;->e()Ll/ku10;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    new-instance p1, Ll/x1d0$a;

    .line 125
    .line 126
    invoke-direct {p1}, Ll/x1d0$a;-><init>()V

    .line 127
    .line 128
    .line 129
    const-string v0, "https://cosmos-api.immomo.com/v2/log/client/upload"

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    sget-object p1, Ll/t6e;->c:Ll/rg50;

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0}, Ll/i5d0;->I()Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_0

    .line 158
    .line 159
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ll/k5d0;->bytes()[B

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    new-instance p1, Ljava/lang/String;

    .line 168
    .line 169
    const-string v0, "UTF-8"

    .line 170
    .line 171
    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    new-instance p0, Lorg/json/JSONObject;

    .line 175
    .line 176
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    const-string p1, "ec"

    .line 180
    .line 181
    const/4 v0, -0x1

    .line 182
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-nez p0, :cond_0

    .line 187
    .line 188
    const/4 p0, 0x1

    .line 189
    return p0

    .line 190
    :cond_0
    return v1
.end method


# virtual methods
.method public upload(Ljava/io/File;)Z
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Ll/t6e;->a(Ljava/io/File;)Z

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method
