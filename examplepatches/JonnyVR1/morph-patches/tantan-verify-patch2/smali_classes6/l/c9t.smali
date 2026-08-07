.class public Ll/c9t;
.super Ll/wxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<item:",
        "Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;",
        ">",
        "Ll/wxr<",
        "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
        "Titem;>;>;"
    }
.end annotation


# instance fields
.field public b:Ljava/lang/String;

.field public c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "Titem;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "Titem;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/wxr;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c9t;->c:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c9t;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Ljava/io/InputStream;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            ")",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Titem;>;"
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v1, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string p1, "meta"

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v2, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v3, p0, Ll/c9t;->b:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    const-string v4, "data"

    .line 41
    .line 42
    if-eqz v3, :cond_0

    .line 43
    .line 44
    :try_start_1
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    goto/16 :goto_2

    .line 51
    .line 52
    :cond_0
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    iget-object v4, p0, Ll/c9t;->b:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    :goto_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-nez v4, :cond_1

    .line 67
    .line 68
    new-instance v4, Lcom/google/gson/JsonParser;

    .line 69
    .line 70
    invoke-direct {v4}, Lcom/google/gson/JsonParser;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v4, v3}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-eqz v4, :cond_1

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    check-cast v4, Lcom/google/gson/JsonElement;

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    iget-object v6, p0, Ll/c9t;->c:Ljava/lang/Class;

    .line 102
    .line 103
    invoke-virtual {v5, v4, v6}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->fromJson(Lcom/google/gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    check-cast v4, Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;

    .line 108
    .line 109
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_1
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->setList(Ljava/util/List;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string v2, "pagination"

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-class v2, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 127
    .line 128
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 133
    .line 134
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setPagination(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    if-eqz p0, :cond_2

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getLinks()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->normalize(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    if-eqz p1, :cond_3

    .line 155
    .line 156
    const-string p0, "code"

    .line 157
    .line 158
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setCode(I)V

    .line 163
    .line 164
    .line 165
    const-string p0, "message"

    .line 166
    .line 167
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->setMsg(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 172
    .line 173
    .line 174
    :cond_3
    return-object v0

    .line 175
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 176
    .line 177
    .line 178
    const-string p1, "--"

    .line 179
    .line 180
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    const-string v0, "LIVE JSON PARSER ERROR"

    .line 185
    .line 186
    invoke-static {v0, p2, p1, p0}, Ll/ilw0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    const/4 p0, 0x0

    .line 190
    return-object p0
.end method

.method public d(Ljava/io/InputStream;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Titem;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c9t;->c(Ljava/io/InputStream;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic parse(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c9t;->c(Ljava/io/InputStream;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

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
    invoke-virtual {p0, p1, p2, p3}, Ll/c9t;->d(Ljava/io/InputStream;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    move-result-object p0

    return-object p0
.end method
