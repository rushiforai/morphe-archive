.class final Le/e/a/CreatorData;
.super Ljava/lang/Object;
.source "CreatorData.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static video(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 4

    .line 5
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const-string v0, "content"

    const-string v1, "video"

    const-string v2, "essential"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_f
    const/4 v2, 0x3

    if-lt v1, v2, :cond_13

    return-object p0

    :cond_13
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_1c

    return-object v2

    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method
