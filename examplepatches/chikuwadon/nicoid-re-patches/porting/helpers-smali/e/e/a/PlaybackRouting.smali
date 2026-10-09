.class public final Le/e/a/PlaybackRouting;
.super Ljava/lang/Object;
.source "PlaybackRouting.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isPopupActive()Z
    .registers 4

    .line 13
    :try_start_0
    const-string v0, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 14
    .local v0, "service":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "o0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    const-string v3, "p0"

    .line 15
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    .line 14
    invoke-static {v1, v2}, Le/e/a/PlaybackRouting;->shouldRoutePopup(ZZ)Z

    move-result v1
    :try_end_1f
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_1f} :catch_20

    return v1

    .line 16
    .end local v0    # "service":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_20
    move-exception v0

    .line 17
    .local v0, "ignored":Ljava/lang/ReflectiveOperationException;
    const/4 v1, 0x0

    return v1
.end method

.method public static sameMediaBinding(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/String;)Z
    .registers 8
    .param p0, "owner"    # Ljava/lang/Object;
    .param p1, "popup"    # Z
    .param p2, "player"    # Ljava/lang/Object;
    .param p3, "video"    # Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    if-eqz p0, :cond_3a

    if-eqz p2, :cond_3a

    if-nez p3, :cond_8

    goto :goto_3a

    .line 25
    :cond_8
    :try_start_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_11

    const-string v2, "e"

    goto :goto_13

    :cond_11
    const-string v2, "a0"

    :goto_13
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 26
    .local v1, "currentPlayer":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eqz p1, :cond_24

    const-string v3, "f"

    goto :goto_26

    :cond_24
    const-string v3, "b0"

    :goto_26
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 27
    .local v2, "currentVideo":Ljava/lang/Object;
    if-ne p2, v1, :cond_37

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_34
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_8 .. :try_end_34} :catch_38

    if-eqz v3, :cond_37

    const/4 v0, 0x1

    :cond_37
    return v0

    .line 28
    .end local v1    # "currentPlayer":Ljava/lang/Object;
    .end local v2    # "currentVideo":Ljava/lang/Object;
    :catch_38
    move-exception v1

    .line 29
    .local v1, "ignored":Ljava/lang/ReflectiveOperationException;
    return v0

    .line 23
    .end local v1    # "ignored":Ljava/lang/ReflectiveOperationException;
    :cond_3a
    :goto_3a
    return v0
.end method

.method public static shouldRoutePopup(ZZ)Z
    .registers 3
    .param p0, "running"    # Z
    .param p1, "background"    # Z

    .line 8
    if-eqz p0, :cond_6

    if-nez p1, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method
