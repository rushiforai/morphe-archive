.class public final Le/e/a/LikeState219;
.super Ljava/lang/Object;
.source "LikeState219.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 8

    if-eqz p0, :cond_4

    if-eqz p1, :cond_4

    .line 9
    const-string v0, "nicoid_like_known"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Le/e/a/LikeState219;->readBoolean(Landroid/os/Bundle;Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_4

    .line 10
    const-string v2, "video"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 11
    const-string v3, "viewer"

    const/4 v4, 0x0

    if-nez v2, :cond_0

    move-object v2, v4

    goto :goto_0

    :cond_0
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 12
    :goto_0
    const-string v5, "like"

    if-nez v2, :cond_1

    move-object v2, v4

    goto :goto_1

    :cond_1
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    :goto_1
    if-nez v2, :cond_3

    .line 14
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 15
    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    :cond_2
    move-object v2, v4

    :cond_3
    if-eqz v2, :cond_4

    .line 17
    const-string p0, "isLiked"

    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 18
    const-string v3, "nicoid_liked"

    invoke-virtual {v2, p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    invoke-virtual {p1, v3, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const/4 p0, 0x1

    .line 19
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_4
    return-void
.end method

.method public static readBoolean(Landroid/os/Bundle;Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/LikeState219;->readBoolean(Landroid/os/Bundle;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static readBoolean(Landroid/os/Bundle;Ljava/lang/String;Z)Z
    .registers 6

    if-eqz p0, :cond_2

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_0
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_2

    check-cast v0, Ljava/lang/String;

    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {p0, p1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return v2

    :cond_2
    return p2
.end method

.method public static restoreCacheValueRC2(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "nicoid_liked"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "nicoid_like_known"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {p0, p1}, Le/e/a/LikeState219;->readBoolean(Landroid/os/Bundle;Ljava/lang/String;)Z

    :cond_1
    return-void
.end method
