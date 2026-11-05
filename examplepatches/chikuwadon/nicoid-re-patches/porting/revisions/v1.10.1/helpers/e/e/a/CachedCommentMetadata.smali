.class public final Le/e/a/CachedCommentMetadata;
.super Ljava/lang/Object;
.source "CachedCommentMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CachedCommentMetadata$Owner;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static begin(Lorg/json/JSONObject;Ljava/lang/Object;)V
    .registers 14

    .line 14
    :try_start_0
    const-string v0, "modernWatch"

    invoke-static {p1, v0}, Le/e/a/CachedCommentMetadata;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 15
    instance-of v0, v0, Lorg/json/JSONObject;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_8e

    const/4 v1, 0x0

    const-string v2, "begin"

    const-string v3, "e.e.a.CommentListExtras"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    if-eqz v0, :cond_2e

    .line 16
    :try_start_12
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v3, v6, [Ljava/lang/Class;

    const-class v7, Lorg/json/JSONObject;

    aput-object v7, v3, v5

    const-class v7, Ljava/lang/Object;

    aput-object v7, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p0, v2, v5

    aput-object p1, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    return-void

    .line 19
    :cond_2e
    const-string v0, "d"

    invoke-static {p1, v0}, Le/e/a/CachedCommentMetadata;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 20
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 21
    const-string v7, "video"

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "id"

    invoke-virtual {v8, v9, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v0, v7, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    .line 22
    const-string v0, "comment"

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "nvComment"

    .line 23
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "server"

    const-string v11, "https://nvcomment.nicovideo.jp"

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v9

    .line 22
    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {p1, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    .line 20
    nop

    .line 24
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v3, v6, [Ljava/lang/Class;

    const-class v7, Lorg/json/JSONObject;

    aput-object v7, v3, v5

    const-class v7, Ljava/lang/Object;

    aput-object v7, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 25
    new-array v2, v6, [Ljava/lang/Object;

    aput-object p0, v2, v5

    new-instance p0, Le/e/a/CachedCommentMetadata$Owner;

    invoke-direct {p0, p1}, Le/e/a/CachedCommentMetadata$Owner;-><init>(Lorg/json/JSONObject;)V

    aput-object p0, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_8d} :catch_8e

    .line 26
    goto :goto_96

    :catch_8e
    move-exception p0

    .line 27
    const-string p1, "nicoid-comments"

    const-string v0, "Cached comment metadata unavailable"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    :goto_96
    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_4
    if-nez v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    :try_start_8
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_14
    .catch Ljava/lang/NoSuchFieldException; {:try_start_8 .. :try_end_14} :catch_15

    return-object p0

    :catch_15
    move-exception v1

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4
.end method
