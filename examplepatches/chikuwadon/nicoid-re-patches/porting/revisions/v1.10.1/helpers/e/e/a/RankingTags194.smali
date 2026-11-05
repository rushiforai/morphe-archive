.class final Le/e/a/RankingTags194;
.super Ljava/lang/Object;
.source "RankingTags194.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/RankingTags194$Entry;
    }
.end annotation


# static fields
.field static final CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/RankingTags194$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 6
    new-instance v0, Le/e/a/RankingTags194$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x80

    invoke-direct {v0, v3, v1, v2}, Le/e/a/RankingTags194$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/RankingTags194;->CACHE:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static parse([B)Lorg/json/JSONArray;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string p0, "UTF-8"

    invoke-interface {v0, v1, p0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    const/4 v3, -0x1

    const/4 v4, -0x1

    :goto_1f
    const/4 v5, 0x1

    if-ne v1, v5, :cond_2d

    if-eqz v2, :cond_25

    return-object p0

    :cond_25
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Video metadata unavailable"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2d
    const/4 v5, 0x2

    if-ne v1, v5, :cond_9a

    const-string v1, "nicovideo_thumb_response"

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v5, 0x0

    if-eqz v1, :cond_49

    const-string v1, "status"

    invoke-interface {v0, v5, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ok"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    :cond_49
    const-string v1, "tags"

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_67

    const-string v1, "domain"

    invoke-interface {v0, v5, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v6, "jp"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_67

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v4

    :cond_67
    if-lez v4, :cond_a4

    const-string v1, "tag"

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a4

    const-string v1, "lock"

    invoke-interface {v0, v5, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "1"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "name"

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "isLocked"

    invoke-virtual {v5, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_a4

    :cond_9a
    const/4 v5, 0x3

    if-ne v1, v5, :cond_a4

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v1

    if-ne v1, v4, :cond_a4

    const/4 v4, -0x1

    :cond_a4
    :goto_a4
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto/16 :goto_1f
.end method

.method static tags(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 7
    sget-object v0, Le/e/a/RankingTags194;->CACHE:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/RankingTags194;->CACHE:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/RankingTags194$Entry;

    if-eqz v1, :cond_1f

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, v1, Le/e/a/RankingTags194$Entry;->time:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x493e0

    cmp-long v6, v2, v4

    if-gez v6, :cond_1f

    iget-object p0, v1, Le/e/a/RankingTags194$Entry;->tags:Lorg/json/JSONArray;

    monitor-exit v0

    return-object p0

    :cond_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_66

    .line 8
    :try_start_20
    invoke-static {p0, p1}, Le/e/a/RankingTags194;->thumb(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object p1
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_24} :catch_25

    goto :goto_46

    :catch_25
    move-exception v0

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_60

    invoke-static {p0, p1}, Le/e/a/VideoMetadata192;->watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "tag"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_58

    const-string v1, "items"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_58

    const-string v0, "items"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 9
    :goto_46
    sget-object v1, Le/e/a/RankingTags194;->CACHE:Ljava/util/Map;

    monitor-enter v1

    :try_start_49
    sget-object v0, Le/e/a/RankingTags194;->CACHE:Ljava/util/Map;

    new-instance v2, Le/e/a/RankingTags194$Entry;

    invoke-direct {v2, p1}, Le/e/a/RankingTags194$Entry;-><init>(Lorg/json/JSONArray;)V

    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1

    return-object p1

    :catchall_55
    move-exception p0

    monitor-exit v1
    :try_end_57
    .catchall {:try_start_49 .. :try_end_57} :catchall_55

    throw p0

    .line 8
    :cond_58
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Missing ranking tags"

    invoke-direct {p0, p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_60
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0

    .line 7
    :catchall_66
    move-exception p0

    :try_start_67
    monitor-exit v0
    :try_end_68
    .catchall {:try_start_67 .. :try_end_68} :catchall_66

    throw p0
.end method

.method static thumb(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    const-string v0, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c3

    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://ext.nicovideo.jp/api/getthumbinfo/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v0

    if-eqz v0, :cond_bd

    const/16 v0, 0x1770

    :try_start_2a
    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v0, "User-Agent"

    const-string v1, "nicoid Re"

    invoke-virtual {p0, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_9c

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_44
    .catchall {:try_start_2a .. :try_end_44} :catchall_b5

    const/4 v1, 0x0

    :try_start_45
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_49
    .catchall {:try_start_45 .. :try_end_49} :catchall_92

    const/16 v3, 0x1000

    :try_start_4b
    new-array v3, v3, [B

    :goto_4d
    invoke-virtual {v2, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4
    :try_end_51
    .catchall {:try_start_4b .. :try_end_51} :catchall_8a

    const/4 v5, -0x1

    if-ne v4, v5, :cond_68

    if-eqz v2, :cond_59

    :try_start_56
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_92

    :cond_59
    :try_start_59
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-static {v0}, Le/e/a/RankingTags194;->parse([B)Lorg/json/JSONArray;

    move-result-object v0
    :try_end_61
    .catchall {:try_start_59 .. :try_end_61} :catchall_b5

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :cond_68
    :try_start_68
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v5

    if-nez v5, :cond_84

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v4

    const/high16 v6, 0x40000

    if-gt v5, v6, :cond_7c

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_4d

    :cond_7c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Oversized tag metadata"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_83
    throw v0

    :cond_84
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V
    :try_end_89
    .catchall {:try_start_68 .. :try_end_89} :catchall_8a

    goto :goto_83

    :catchall_8a
    move-exception v0

    move-object v1, v0

    if-eqz v2, :cond_91

    :try_start_8e
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_91
    throw v1
    :try_end_92
    .catchall {:try_start_8e .. :try_end_92} :catchall_92

    :catchall_92
    move-exception v0

    if-eqz v1, :cond_9b

    if-eq v1, v0, :cond_9a

    :try_start_97
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9a
    move-object v0, v1

    :cond_9b
    :goto_9b
    throw v0

    :cond_9c
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Tag metadata HTTP "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_b4
    .catchall {:try_start_97 .. :try_end_b4} :catchall_b5

    goto :goto_9b

    :catchall_b5
    move-exception v0

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0

    :cond_bd
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0

    :cond_c3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid video ID"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
