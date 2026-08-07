.class public Ll/d9t;
.super Ll/wxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
        ">",
        "Ll/wxr<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public b:Ljava/lang/String;

.field public c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 9
    invoke-direct {p0}, Ll/wxr;-><init>()V

    .line 10
    iput-object p1, p0, Ll/d9t;->c:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/wxr;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d9t;->c:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object p2, p0, Ll/d9t;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Ljava/io/InputStream;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/INetParser;->STRING_PARSER:Lcom/tantanapp/common/data/INetParser;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Lcom/tantanapp/common/data/INetParser;->parse(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wxr;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "meta"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v1, p0, Ll/d9t;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    const-string v2, "data"

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    :try_start_1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v4, p0, Ll/d9t;->c:Ljava/lang/Class;

    .line 43
    .line 44
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v4, p0, Ll/d9t;->b:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iget-object v4, p0, Ll/d9t;->c:Ljava/lang/Class;

    .line 68
    .line 69
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 74
    .line 75
    :goto_0
    if-nez v1, :cond_1

    .line 76
    .line 77
    iget-object v1, p0, Ll/d9t;->c:Ljava/lang/Class;

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 84
    .line 85
    :cond_1
    if-eqz p1, :cond_2

    .line 86
    .line 87
    const-string v3, "code"

    .line 88
    .line 89
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setCode(I)V

    .line 94
    .line 95
    .line 96
    const-string v3, "message"

    .line 97
    .line 98
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setMsg(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    iget-object p0, p0, Ll/d9t;->c:Ljava/lang/Class;

    .line 106
    .line 107
    const-class p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 108
    .line 109
    if-ne p0, p1, :cond_3

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setData(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-string p1, "pagination"

    .line 123
    .line 124
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    const-class v0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 129
    .line 130
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 135
    .line 136
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setPagination(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    if-eqz p0, :cond_4

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getLinks()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->normalize(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 154
    .line 155
    .line 156
    :cond_4
    return-object v1

    .line 157
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 158
    .line 159
    .line 160
    const-string p1, "---"

    .line 161
    .line 162
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    const-string v0, "LIVE JSON PARSER ERROR"

    .line 167
    .line 168
    invoke-static {v0, p2, p1, p0}, Ll/ilw0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    const/4 p0, 0x0

    .line 172
    return-object p0
.end method

.method public d(Ljava/io/InputStream;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d9t;->c(Ljava/io/InputStream;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;Ljava/io/OutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setData(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Ljava/io/OutputStream;->write([B)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public bridge synthetic parse(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d9t;->c(Ljava/io/InputStream;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic parse(Ljava/io/InputStream;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/d9t;->d(Ljava/io/InputStream;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    move-result-object p0

    return-object p0
.end method
