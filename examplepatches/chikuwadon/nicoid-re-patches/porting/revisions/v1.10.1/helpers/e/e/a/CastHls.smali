.class final Le/e/a/CastHls;
.super Ljava/lang/Object;
.source "CastHls.java"


# static fields
.field private static final URI_ATTRIBUTE:Ljava/util/regex/Pattern;


# instance fields
.field final cookie:Ljava/lang/String;

.field final prefix:Ljava/lang/String;

.field private final reverse:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final routes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    const-string v0, "([,:])URI=\"([^\"]*)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/CastHls;->URI_ATTRIBUTE:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "cookie"    # Ljava/lang/String;

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/cast/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/CastHls;->prefix:Ljava/lang/String;

    .line 16
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/CastHls;->routes:Ljava/util/Map;

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/CastHls;->reverse:Ljava/util/Map;

    .line 18
    if-nez p1, :cond_39

    const-string v0, ""

    goto :goto_43

    :cond_39
    const-string v0, ";"

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    :goto_43
    iput-object v0, p0, Le/e/a/CastHls;->cookie:Ljava/lang/String;

    return-void
.end method

.method static deliveryHost(Ljava/net/URL;)Z
    .registers 3
    .param p0, "url"    # Ljava/net/URL;

    .line 38
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "host":Ljava/lang/String;
    const-string v1, "domand.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    const-string v1, ".domand.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 v1, 0x0

    goto :goto_1e

    :cond_1d
    :goto_1d
    const/4 v1, 0x1

    :goto_1e
    return v1
.end method

.method private rewriteUri(Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "base"    # Ljava/net/URL;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    const-string v0, "data:"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p2

    .line 44
    :cond_9
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1, p2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Le/e/a/CastHls;->route(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static validate(Ljava/net/URL;)V
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1d

    .line 36
    return-void

    .line 35
    :cond_1d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsupported HLS URL"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method declared-synchronized clear()V
    .registers 2

    monitor-enter p0

    .line 32
    :try_start_1
    iget-object v0, p0, Le/e/a/CastHls;->routes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Le/e/a/CastHls;->reverse:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    monitor-exit p0

    return-void

    .line 32
    .end local p0    # "this":Le/e/a/CastHls;
    :catchall_d
    move-exception v0

    :try_start_e
    monitor-exit p0
    :try_end_f
    .catchall {:try_start_e .. :try_end_f} :catchall_d

    throw v0
.end method

.method cookieFor(Ljava/net/URL;)Ljava/lang/String;
    .registers 4
    .param p1, "url"    # Ljava/net/URL;

    .line 41
    invoke-static {p1}, Le/e/a/CastHls;->deliveryHost(Ljava/net/URL;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Le/e/a/CastHls;->cookie:Ljava/lang/String;

    const-string v1, "domand_bid="

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Le/e/a/CastHls;->cookie:Ljava/lang/String;

    goto :goto_15

    :cond_13
    const-string v0, ""

    :goto_15
    return-object v0
.end method

.method declared-synchronized lookup(Ljava/lang/String;)Ljava/net/URL;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    monitor-enter p0

    .line 31
    :try_start_1
    iget-object v0, p0, Le/e/a/CastHls;->routes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URL;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    .line 31
    .end local p0    # "this":Le/e/a/CastHls;
    .end local p1    # "path":Ljava/lang/String;
    :catchall_b
    move-exception p1

    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_b

    throw p1
.end method

.method rewrite(Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p1, "base"    # Ljava/net/URL;
    .param p2, "playlist"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    const-string v0, "\ufeff"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_d

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 48
    :cond_d
    const-string v0, "#EXTM3U"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9b

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v0, "result":Ljava/lang/StringBuilder;
    const-string v2, "\\r?\\n"

    const/4 v3, -0x1

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_23
    if-ge v4, v3, :cond_96

    aget-object v5, v2, v4

    .line 51
    .local v5, "line":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_45

    const-string v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_45

    .line 52
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1, v6}, Le/e/a/CastHls;->rewriteUri(Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8e

    .line 54
    :cond_45
    sget-object v6, Le/e/a/CastHls;->URI_ATTRIBUTE:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 55
    .local v6, "matcher":Ljava/util/regex/Matcher;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 56
    .local v7, "changed":Ljava/lang/StringBuffer;
    :goto_50
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_88

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    invoke-virtual {v6, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "URI=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x2

    invoke-virtual {v6, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, p1, v9}, Le/e/a/CastHls;->rewriteUri(Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 56
    invoke-static {v8}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_50

    .line 58
    :cond_88
    invoke-virtual {v6, v7}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuilder;

    .line 60
    .end local v6    # "matcher":Ljava/util/regex/Matcher;
    .end local v7    # "changed":Ljava/lang/StringBuffer;
    :goto_8e
    const/16 v6, 0xa

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    .end local v5    # "line":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_23

    .line 62
    :cond_96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 48
    .end local v0    # "result":Ljava/lang/StringBuilder;
    :cond_9b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid HLS playlist"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method declared-synchronized route(Ljava/net/URL;)Ljava/lang/String;
    .registers 8
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 20
    :try_start_1
    invoke-static {p1}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    .line 21
    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v0

    .line 22
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Le/e/a/CastHls;->reverse:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_82

    .line 23
    .local v1, "existing":Ljava/lang/String;
    if-eqz v1, :cond_14

    monitor-exit p0

    return-object v1

    .line 24
    :cond_14
    :try_start_14
    iget-object v2, p0, Le/e/a/CastHls;->routes:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    const/16 v3, 0x4e20

    if-ge v2, v3, :cond_7a

    .line 25
    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 26
    .local v2, "path":Ljava/lang/String;
    const-string v3, ".m3u8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2d

    const-string v3, ".m3u8"

    goto :goto_50

    .end local p0    # "this":Le/e/a/CastHls;
    :cond_2d
    const-string v3, ".mp4"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_38

    const-string v3, ".mp4"

    goto :goto_50

    .line 27
    :cond_38
    const-string v3, ".m4s"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_43

    const-string v3, ".m4s"

    goto :goto_50

    :cond_43
    const-string v3, ".ts"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4e

    const-string v3, ".ts"

    goto :goto_50

    :cond_4e
    const-string v3, ".bin"

    :goto_50
    nop

    .line 28
    .local v3, "extension":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Le/e/a/CastHls;->prefix:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Le/e/a/CastHls;->routes:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 29
    .local v4, "key":Ljava/lang/String;
    iget-object v5, p0, Le/e/a/CastHls;->routes:Ljava/util/Map;

    invoke-interface {v5, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v5, p0, Le/e/a/CastHls;->reverse:Ljava/util/Map;

    invoke-interface {v5, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_78
    .catchall {:try_start_14 .. :try_end_78} :catchall_82

    monitor-exit p0

    return-object v4

    .line 24
    .end local v2    # "path":Ljava/lang/String;
    .end local v3    # "extension":Ljava/lang/String;
    .end local v4    # "key":Ljava/lang/String;
    :cond_7a
    :try_start_7a
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Too many HLS resources"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 19
    .end local v0    # "value":Ljava/lang/String;
    .end local v1    # "existing":Ljava/lang/String;
    .end local p1    # "url":Ljava/net/URL;
    :catchall_82
    move-exception p1

    monitor-exit p0
    :try_end_84
    .catchall {:try_start_7a .. :try_end_84} :catchall_82

    throw p1
.end method
