.class final Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;
.super Ljava/lang/Object;
.source "FreshYouTubeCookies.java"


# static fields
.field private static final ACCEPTED:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_AGE_MS:J = 0x75300L

.field private static final USER_AGENT:Ljava/lang/String; = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36"

.field private static volatile cached:Ljava/lang/String;

.field private static volatile fetchedAt:J

.field private static lastRefreshAttempt:J

.field private static refreshing:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 16
    const-string v0, "VISITOR_PRIVACY_METADATA"

    const-string v1, "__Secure-ROLLOUT_TOKEN"

    const-string v2, "YSC"

    const-string v3, "VISITOR_INFO1_LIVE"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->ACCEPTED:Ljava/util/List;

    .line 27
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->cached:Ljava/lang/String;

    const-wide/16 v0, 0x0

    .line 28
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->fetchedAt:J

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static cached()Ljava/lang/String;
    .registers 4

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->fetchedAt:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x75300

    cmp-long v0, v0, v2

    if-gez v0, :cond_11

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->cached:Ljava/lang/String;

    return-object v0

    :cond_11
    const-string v0, ""

    return-object v0
.end method

.method private static fetch(JLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 59
    const-string v0, ""

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    const/4 v1, 0x0

    .line 62
    :try_start_6
    new-instance v2, Ljava/net/URL;

    const-string v3, "https://www.youtube.com/sw.js"

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 63
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->openWithYouTubeCronet(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v3
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_11} :catch_122
    .catchall {:try_start_6 .. :try_end_11} :catchall_11f

    if-nez v3, :cond_1a

    .line 64
    :try_start_13
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    move-object v3, v2

    :cond_1a
    if-eqz p2, :cond_1f

    .line 65
    invoke-interface {p2, v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    :cond_1f
    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 66
    const-string v2, "GET"

    invoke-virtual {v3, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 67
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 68
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v2

    invoke-virtual {v3, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v2, 0x1

    .line 69
    invoke-virtual {v3, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const/4 v2, 0x0

    .line 70
    invoke-virtual {v3, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 71
    const-string v4, "User-Agent"

    const-string v5, "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    const-string v4, "Referer"

    const-string v5, "https://www.youtube.com/"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    const-string v4, "Accept"

    const-string v5, "*/*"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    const-string v4, "Accept-Language"

    const-string v5, "en-US,en;q=0.9"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;

    invoke-direct {v4, v3, p0, p1}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;-><init>(Ljava/net/HttpURLConnection;J)V
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_5e} :catch_123
    .catchall {:try_start_13 .. :try_end_5e} :catchall_131

    .line 77
    :try_start_5e
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    .line 78
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V
    :try_end_68
    .catchall {:try_start_5e .. :try_end_68} :catchall_115

    .line 79
    :try_start_68
    invoke-virtual {v4}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->close()V

    const/16 p0, 0xc8

    if-lt v5, p0, :cond_10a

    const/16 p0, 0x12c

    if-lt v5, p0, :cond_75

    goto/16 :goto_10a

    .line 82
    :cond_75
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_86
    :goto_86
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_fb

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 84
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_86

    .line 85
    const-string v6, "set-cookie"

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a9

    goto :goto_86

    .line 86
    :cond_a9
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-nez v4, :cond_b2

    goto :goto_86

    .line 88
    :cond_b2
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_b6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_86

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-nez v5, :cond_c5

    goto :goto_b6

    .line 90
    :cond_c5
    const-string v6, ";"

    const/4 v7, 0x2

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v2

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x3d

    .line 91
    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-gtz v6, :cond_db

    goto :goto_b6

    .line 93
    :cond_db
    invoke-virtual {v5, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 94
    sget-object v7, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->ACCEPTED:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_ec

    goto :goto_b6

    .line 95
    :cond_ec
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_f7

    const-string v6, "; "

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    :cond_f7
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b6

    .line 99
    :cond_fb
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_ff
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_ff} :catch_123
    .catchall {:try_start_68 .. :try_end_ff} :catchall_131

    if-eqz v3, :cond_104

    .line 103
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_104
    if-eqz p2, :cond_109

    .line 104
    invoke-interface {p2, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    :cond_109
    return-object p0

    :cond_10a
    :goto_10a
    if-eqz v3, :cond_10f

    .line 103
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_10f
    if-eqz p2, :cond_114

    .line 104
    invoke-interface {p2, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    :cond_114
    return-object v0

    :catchall_115
    move-exception p0

    .line 76
    :try_start_116
    invoke-virtual {v4}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->close()V
    :try_end_119
    .catchall {:try_start_116 .. :try_end_119} :catchall_11a

    goto :goto_11e

    :catchall_11a
    move-exception p1

    :try_start_11b
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_11e
    throw p0
    :try_end_11f
    .catch Ljava/lang/Exception; {:try_start_11b .. :try_end_11f} :catch_123
    .catchall {:try_start_11b .. :try_end_11f} :catchall_131

    :catchall_11f
    move-exception p0

    move-object v3, v1

    goto :goto_132

    :catch_122
    move-object v3, v1

    .line 101
    :catch_123
    :try_start_123
    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V
    :try_end_126
    .catchall {:try_start_123 .. :try_end_126} :catchall_131

    if-eqz v3, :cond_12b

    .line 103
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_12b
    if-eqz p2, :cond_130

    .line 104
    invoke-interface {p2, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    :cond_130
    return-object v0

    :catchall_131
    move-exception p0

    :goto_132
    if-eqz v3, :cond_137

    .line 103
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_137
    if-eqz p2, :cond_13c

    .line 104
    invoke-interface {p2, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    .line 105
    :cond_13c
    throw p0
.end method

.method static refresh(JLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 42
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 43
    const-class v2, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;

    monitor-enter v2

    .line 44
    :try_start_7
    sget-boolean v3, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->refreshing:Z

    if-nez v3, :cond_5d

    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->lastRefreshAttempt:J

    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_21

    sub-long v3, v0, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide v5, 0x6fc23ac00L

    cmp-long v3, v3, v5

    if-gez v3, :cond_21

    goto :goto_5d

    :cond_21
    const/4 v3, 0x1

    .line 45
    sput-boolean v3, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->refreshing:Z

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->lastRefreshAttempt:J

    .line 46
    monitor-exit v2
    :try_end_27
    .catchall {:try_start_7 .. :try_end_27} :catchall_61

    const/4 v2, 0x0

    .line 48
    :try_start_28
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide v3, 0xb2d05e00L

    add-long/2addr v0, v3

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->fetch(JLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Ljava/lang/String;

    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_46

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->cached:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->fetchedAt:J

    .line 50
    :cond_46
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->cached:Ljava/lang/String;
    :try_end_48
    .catchall {:try_start_28 .. :try_end_48} :catchall_52

    .line 51
    const-class p1, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;

    monitor-enter p1

    :try_start_4b
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->refreshing:Z

    monitor-exit p1

    return-object p0

    :catchall_4f
    move-exception p0

    monitor-exit p1
    :try_end_51
    .catchall {:try_start_4b .. :try_end_51} :catchall_4f

    throw p0

    :catchall_52
    move-exception p0

    const-class p1, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;

    monitor-enter p1

    :try_start_56
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->refreshing:Z

    monitor-exit p1
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_5a

    throw p0

    :catchall_5a
    move-exception p0

    :try_start_5b
    monitor-exit p1
    :try_end_5c
    .catchall {:try_start_5b .. :try_end_5c} :catchall_5a

    throw p0

    .line 44
    :cond_5d
    :goto_5d
    :try_start_5d
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->cached:Ljava/lang/String;

    monitor-exit v2

    return-object p0

    :catchall_61
    move-exception p0

    .line 46
    monitor-exit v2
    :try_end_63
    .catchall {:try_start_5d .. :try_end_63} :catchall_61

    throw p0
.end method

.method static userAgent()Ljava/lang/String;
    .registers 1

    .line 55
    const-string v0, "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36"

    return-object v0
.end method
