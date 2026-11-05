.class public final Le/e/a/GuestWatch;
.super Ljava/lang/Object;
.source "GuestWatch.java"


# static fields
.field private static final failures:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 11
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/GuestWatch;->failures:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static api(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "e.e.a.d0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const-class v1, Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v1, v3, v5

    const/4 v6, 0x2

    aput-object v1, v3, v6

    const/4 v7, 0x3

    aput-object v1, v3, v7

    const-string v1, "request"

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 31
    new-instance v1, Lorg/json/JSONObject;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v8, "https://www.nicovideo.jp/api/watch/"

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "/"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?actionTrackId=AAAAAAAAAA_"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v3, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v4

    aput-object p1, v2, v5

    const/4 p0, 0x0

    aput-object p0, v2, v6

    aput-object p0, v2, v7

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 32
    const-string p1, "meta"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Watch: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " status="

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_73

    goto :goto_79

    :cond_73
    const-string p2, "status"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    :goto_79
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " error="

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_84

    goto :goto_8a

    :cond_84
    const-string p0, "errorCode"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_8a
    invoke-static {p0}, Le/e/a/GuestWatch;->code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " reason="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Le/e/a/GuestWatch;->reason(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/GuestWatch;->code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-object v1
.end method

.method static code(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_b

    .line 19
    const-string v0, "[A-Z0-9_]{1,64}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_d

    :cond_b
    const-string p0, "unknown"

    :goto_d
    return-object p0
.end method

.method public static hasFailure(Ljava/lang/Object;)Z
    .registers 2

    .line 12
    sget-object v0, Le/e/a/GuestWatch;->failures:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static loginRequired(ZLorg/json/JSONObject;)Z
    .registers 2

    if-nez p0, :cond_10

    .line 18
    const-string p0, "HARMFUL_VIDEO"

    invoke-static {p1}, Le/e/a/GuestWatch;->reason(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method private static notice(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 9

    .line 14
    :try_start_0
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "notice"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    const-string v4, "e.e.a.d0"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    aput-object p1, v1, v6

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_2b

    goto :goto_30

    .line 15
    :catch_2b
    const-string p0, "Watch notice unavailable"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    :goto_30
    return-void
.end method

.method static reason(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 2

    .line 17
    const-string v0, "data"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_b

    const-string p0, ""

    goto :goto_11

    :cond_b
    const-string v0, "reasonCode"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_11
    return-object p0
.end method

.method static result(Ljava/lang/Object;ZLorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    const-string v0, "meta"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_9

    goto :goto_1a

    :cond_9
    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_1a

    .line 22
    const-string p0, "data"

    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 23
    :cond_1a
    :goto_1a
    invoke-static {p1, p2}, Le/e/a/GuestWatch;->loginRequired(ZLorg/json/JSONObject;)Z

    move-result p1

    if-eqz p1, :cond_33

    .line 24
    const-string p1, "\u3053\u306e\u52d5\u753b\u306e\u8996\u8074\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object p2, Le/e/a/GuestWatch;->failures:Ljava/util/Map;

    invoke-interface {p2, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, p1}, Le/e/a/GuestWatch;->notice(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    const-string p0, "Watch: guest video requires login"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    :cond_33
    const/4 p0, 0x0

    return-object p0
.end method

.method public static watch(Ljava/lang/Object;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 6

    .line 36
    sget-object v0, Le/e/a/GuestWatch;->failures:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    if-eqz p1, :cond_70

    .line 37
    const-string v1, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_11

    goto :goto_70

    .line 39
    :cond_11
    :try_start_11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "N"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, p0, v2, v3}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    .line 40
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "n"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_36} :catch_56

    if-eqz v1, :cond_4b

    .line 41
    :try_start_38
    const-string v2, "v3"

    invoke-static {p0, p1, v2}, Le/e/a/GuestWatch;->api(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {p0, v3, v2}, Le/e/a/GuestWatch;->result(Ljava/lang/Object;ZLorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_43} :catch_46

    if-eqz v2, :cond_4b

    return-object v2

    :catch_46
    :try_start_46
    const-string v2, "Watch: authenticated request unavailable"

    invoke-static {v2}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 42
    :cond_4b
    const-string v2, "v3_guest"

    invoke-static {p0, p1, v2}, Le/e/a/GuestWatch;->api(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p0, v1, p1}, Le/e/a/GuestWatch;->result(Ljava/lang/Object;ZLorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_55} :catch_56

    return-object p0

    :catch_56
    move-exception p0

    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Watch: request failed="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    :cond_70
    :goto_70
    return-object v0
.end method
