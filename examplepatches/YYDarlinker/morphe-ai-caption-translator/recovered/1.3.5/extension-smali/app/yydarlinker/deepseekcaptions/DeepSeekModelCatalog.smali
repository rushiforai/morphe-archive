.class final Lapp/yydarlinker/deepseekcaptions/DeepSeekModelCatalog;
.super Ljava/lang/Object;
.source "DeepSeekModelCatalog.java"


# static fields
.field private static final MAX_RESPONSE_BYTES:I = 0x200000


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static abbreviate(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    if-nez p0, :cond_5

    .line 97
    const-string p0, ""

    goto :goto_17

    :cond_5
    const/16 v0, 0xd

    const/16 v1, 0x20

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0xa

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 98
    :goto_17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x104

    if-gt v0, v1, :cond_20

    return-object p0

    :cond_20
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static fetch(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "\uff1a"

    const-string v1, "\u6a21\u578b\u5217\u8868 HTTP "

    .line 23
    const-string v2, ""

    if-nez p1, :cond_a

    move-object p1, v2

    goto :goto_e

    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 24
    :goto_e
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c8

    const/4 v3, 0x0

    .line 28
    :try_start_15
    new-instance v4, Ljava/net/URL;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelCatalog;->modelsUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_24
    .catchall {:try_start_15 .. :try_end_24} :catchall_c1

    .line 29
    :try_start_24
    const-string v3, "GET"

    invoke-virtual {v4, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v3, 0x1388

    .line 30
    invoke-virtual {v4, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v3, 0x2710

    .line 31
    invoke-virtual {v4, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v3, 0x0

    .line 32
    invoke-virtual {v4, v3}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 33
    invoke-virtual {v4, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 34
    invoke-static {v4, p0, p1}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->authenticate(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string p0, "Accept"

    const-string p1, "application/json"

    invoke-virtual {v4, p0, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    const-string p0, "User-Agent"

    const-string p1, "YYDarlinker-AICaptions/2"

    invoke-virtual {v4, p0, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0

    const/16 p1, 0x190

    if-lt p0, p1, :cond_58

    .line 40
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object p1

    goto :goto_5c

    .line 41
    :cond_58
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    :goto_5c
    if-nez p1, :cond_60

    move-object v3, v2

    goto :goto_6d

    .line 42
    :cond_60
    new-instance v3, Ljava/lang/String;

    const/high16 v5, 0x200000

    .line 43
    invoke-static {p1, v5}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient;->readFully(Ljava/io/InputStream;I)[B

    move-result-object p1

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, p1, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    :goto_6d
    const/16 p1, 0xc8

    if-lt p0, p1, :cond_8e

    const/16 p1, 0x12c

    if-lt p0, p1, :cond_76

    goto :goto_8e

    .line 53
    :cond_76
    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelCatalog;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    .line 54
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1
    :try_end_7e
    .catchall {:try_start_24 .. :try_end_7e} :catchall_be

    if-nez p1, :cond_86

    if-eqz v4, :cond_85

    .line 57
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_85
    return-object p0

    .line 54
    :cond_86
    :try_start_86
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u63a5\u53e3\u6ca1\u6709\u8fd4\u56de\u53ef\u9009\u62e9\u7684\u6a21\u578b ID"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 47
    :cond_8e
    :goto_8e
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_a3

    goto :goto_b3

    :cond_a3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelCatalog;->abbreviate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_b3
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_be
    .catchall {:try_start_86 .. :try_end_be} :catchall_be

    :catchall_be
    move-exception p0

    move-object v3, v4

    goto :goto_c2

    :catchall_c1
    move-exception p0

    :goto_c2
    if-eqz v3, :cond_c7

    .line 57
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 58
    :cond_c7
    throw p0

    .line 24
    :cond_c8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u8bf7\u5148\u586b\u5199 API Key"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static modelsUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 61
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->models(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static parse(Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 65
    const-string p0, "data"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 66
    const-string v2, "models"

    if-nez v1, :cond_13

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    :cond_13
    if-nez v1, :cond_27

    .line 68
    const-string v3, "result"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 70
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-nez v1, :cond_27

    .line 71
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    :cond_27
    if-nez v1, :cond_2c

    .line 74
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    .line 76
    :cond_2c
    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    const/4 v0, 0x0

    .line 77
    :goto_32
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_8f

    .line 78
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v2

    .line 80
    instance-of v3, v2, Lorg/json/JSONObject;

    const-string v4, ""

    if-eqz v3, :cond_61

    .line 81
    check-cast v2, Lorg/json/JSONObject;

    const-string v3, "id"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 82
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_5f

    const-string v3, "name"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    goto :goto_6b

    :cond_5f
    move-object v4, v3

    goto :goto_6b

    .line 83
    :cond_61
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_6b

    .line 84
    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 86
    :cond_6b
    :goto_6b
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_8c

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x12c

    if-gt v2, v3, :cond_8c

    const/16 v2, 0xd

    .line 87
    invoke-virtual {v4, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_8c

    const/16 v2, 0xa

    invoke-virtual {v4, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_8c

    .line 88
    invoke-interface {p0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_8c
    add-int/lit8 v0, v0, 0x1

    goto :goto_32

    .line 91
    :cond_8f
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 92
    sget-object p0, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v0
.end method
