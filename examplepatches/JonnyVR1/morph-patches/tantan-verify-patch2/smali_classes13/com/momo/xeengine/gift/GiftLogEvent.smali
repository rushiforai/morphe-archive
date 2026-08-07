.class Lcom/momo/xeengine/gift/GiftLogEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;
    }
.end annotation


# static fields
.field public static final EVENT_ID_CHANGE_SOFTWARE:Ljava/lang/String; = "3"

.field public static final EVENT_ID_ENGINE_START_TIMEOUT:Ljava/lang/String; = "4"

.field public static final EVENT_ID_PLAY_FAILED:Ljava/lang/String; = "2"

.field public static final EVENT_ID_PLAY_SUCCESS:Ljava/lang/String; = "1"


# instance fields
.field private final errorCode:I

.field private final eventDesc:Ljava/lang/String;

.field private final eventEx:Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;

.field private final eventId:Ljava/lang/String;

.field private final eventStamp:J


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventId:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->errorCode:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventDesc:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    iput-wide p1, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventStamp:J

    .line 15
    .line 16
    iput-object p4, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventEx:Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;

    .line 17
    .line 18
    return-void
.end method

.method private static calculateDirectoryFileSize(Ljava/io/File;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    array-length v1, p0

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-ge v2, v1, :cond_1

    .line 15
    .line 16
    aget-object v3, p0, v2

    .line 17
    .line 18
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/io/File;->length()J

    .line 25
    .line 26
    .line 27
    move-result-wide v4

    .line 28
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    :cond_1
    return-object v0
.end method

.method private static calculatePathFileSize(Ljava/lang/String;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftLogEvent;->calculateDirectoryFileSize(Ljava/io/File;)Ljava/util/Map;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftLogEvent;->calculateSingleFileSize(Ljava/io/File;)Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_2
    return-object v1
.end method

.method private static calculateSingleFileSize(Ljava/io/File;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public static createEvent(Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;ILjava/lang/String;)Lcom/momo/xeengine/gift/GiftLogEvent;
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iput-object p0, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->name:Ljava/lang/String;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    new-instance p0, Lcom/momo/xeengine/gift/GiftLogEvent;

    .line 23
    .line 24
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/momo/xeengine/gift/GiftLogEvent;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method private static createEventEx(Lcom/momo/xeengine/gift/GiftEntity;)Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getPath()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftLogEvent;->calculatePathFileSize(Ljava/lang/String;)Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iput-object p0, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->fileSize:Ljava/util/Map;

    .line 31
    .line 32
    return-object v0
.end method

.method public static createPlayFailedEvent(Lcom/momo/xeengine/gift/GiftEntity;ILjava/lang/String;)Lcom/momo/xeengine/gift/GiftLogEvent;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftLogEvent;->createEventEx(Lcom/momo/xeengine/gift/GiftEntity;)Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/momo/xeengine/gift/GiftLogEvent;

    .line 6
    .line 7
    const-string v1, "2"

    .line 8
    .line 9
    invoke-direct {v0, v1, p1, p2, p0}, Lcom/momo/xeengine/gift/GiftLogEvent;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static createPlaySuccessEvent(Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftLogEvent;
    .locals 3

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, v0, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->result:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    :goto_0
    new-instance p1, Lcom/momo/xeengine/gift/GiftLogEvent;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v2, "1"

    .line 32
    .line 33
    invoke-direct {p1, v2, v1, p0, v0}, Lcom/momo/xeengine/gift/GiftLogEvent;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;)V

    .line 34
    .line 35
    .line 36
    return-object p1
.end method


# virtual methods
.method public getEventId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "eventId"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "errorCode"

    .line 14
    .line 15
    iget v2, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->errorCode:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventDesc:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    const-string v1, "eventDesc"

    .line 29
    .line 30
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventDesc:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    :cond_0
    const-string v1, "eventStamp"

    .line 36
    .line 37
    iget-wide v2, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventStamp:J

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftLogEvent;->eventEx:Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    const-string v1, "eventExtend"

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftLogEvent$EventEx;->toJsonObject()Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    :catch_0
    :cond_1
    return-object v0
.end method
