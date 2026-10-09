.class final Le/e/a/FollowFeedData$Item;
.super Ljava/lang/Object;
.source "FollowFeedData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FollowFeedData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Item"
.end annotation


# instance fields
.field final actor:Ljava/lang/String;

.field final author:Le/e/a/FollowFeedData$Actor;

.field final date:Ljava/lang/String;

.field final duration:I

.field final id:Ljava/lang/String;

.field final key:Ljava/lang/String;

.field final kind:Ljava/lang/String;

.field final label:Ljava/lang/String;

.field final message:Ljava/lang/String;

.field final shortVideo:Z

.field final subMessage:Ljava/lang/String;

.field final thumbnail:Ljava/lang/String;

.field final time:J

.field final title:Ljava/lang/String;

.field final upload:Z


# direct methods
.method constructor <init>(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .registers 9

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-string v0, "message"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "text"

    invoke-static {v0, v1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FollowFeedData$Item;->message:Ljava/lang/String;

    const-string v0, "subMessage"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0, v1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FollowFeedData$Item;->subMessage:Ljava/lang/String;

    const-string v0, "label"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0, v1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FollowFeedData$Item;->label:Ljava/lang/String;

    .line 21
    const-string v0, "id"

    invoke-static {p2, v0}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    const-string v1, "title"

    invoke-static {p2, v1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3f

    iget-object v1, p0, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    :cond_3f
    iput-object v1, p0, Le/e/a/FollowFeedData$Item;->title:Ljava/lang/String;

    .line 22
    const-string v1, "thumbnailUrl"

    invoke-static {p1, v1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le/e/a/FollowFeedData$Item;->thumbnail:Ljava/lang/String;

    new-instance v1, Le/e/a/FollowFeedData$Actor;

    const-string v2, "actor"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2}, Le/e/a/FollowFeedData$Actor;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    iget-object v1, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    iget-object v1, v1, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    iput-object v1, p0, Le/e/a/FollowFeedData$Item;->actor:Ljava/lang/String;

    .line 23
    const-string v1, "createdAt"

    invoke-static {p1, v1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le/e/a/FollowFeedData$Item;->date:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/FollowFeedData$Item;->date:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/FollowFeedData;->timestamp(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Le/e/a/FollowFeedData$Item;->time:J

    const-string v1, "kind"

    invoke-static {p1, v1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le/e/a/FollowFeedData$Item;->kind:Ljava/lang/String;

    .line 24
    iget-object v1, p0, Le/e/a/FollowFeedData$Item;->kind:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 25
    iget-object v2, p0, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    const-string v3, "ss"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_9e

    const-string v2, "type"

    invoke-static {p2, v2}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "short"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9e

    const/4 v2, 0x0

    goto :goto_9f

    :cond_9e
    const/4 v2, 0x1

    :goto_9f
    iput-boolean v2, p0, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    .line 26
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_c8

    const-string v2, "upload"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c8

    const-string v2, "post"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c8

    const-string v2, "publish"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c8

    const-string v2, "create"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c8

    const/4 v3, 0x0

    :cond_c8
    iput-boolean v3, p0, Le/e/a/FollowFeedData$Item;->upload:Z

    .line 27
    const-string v1, "video"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "duration"

    if-nez v1, :cond_d9

    invoke-virtual {p2, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    goto :goto_dd

    :cond_d9
    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    :goto_dd
    invoke-static {v4, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Le/e/a/FollowFeedData$Item;->duration:I

    .line 28
    invoke-static {p1, v0}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_120

    new-instance p1, Ljava/lang/StringBuilder;

    iget-object p2, p0, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "|"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/FollowFeedData$Item;->kind:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/FollowFeedData$Item;->date:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    invoke-virtual {p2}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_120
    iput-object p1, p0, Le/e/a/FollowFeedData$Item;->key:Ljava/lang/String;

    .line 30
    return-void
.end method


# virtual methods
.method matches(ILjava/lang/String;)Z
    .registers 4

    .line 32
    if-eqz p2, :cond_e

    iget-object v0, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    invoke-virtual {v0}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_26

    .line 33
    :cond_e
    const/4 p2, 0x3

    const/4 v0, 0x1

    if-eq p1, p2, :cond_28

    iget-boolean p2, p0, Le/e/a/FollowFeedData$Item;->upload:Z

    if-eqz p2, :cond_26

    if-eqz p1, :cond_28

    if-ne p1, v0, :cond_1e

    iget-boolean p2, p0, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    if-eqz p2, :cond_28

    :cond_1e
    const/4 p2, 0x2

    if-ne p1, p2, :cond_26

    iget-boolean p1, p0, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    if-eqz p1, :cond_26

    goto :goto_28

    .line 32
    :cond_26
    const/4 p1, 0x0

    return p1

    :cond_28
    :goto_28
    return v0
.end method
