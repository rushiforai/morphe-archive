.class final Le/e/a/FollowFeedData$Actor;
.super Ljava/lang/Object;
.source "FollowFeedData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FollowFeedData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Actor"
.end annotation


# instance fields
.field final icon:Ljava/lang/String;

.field final id:Ljava/lang/String;

.field final name:Ljava/lang/String;

.field final type:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .registers 3

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string v0, "id"

    invoke-static {p1, v0}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FollowFeedData$Actor;->id:Ljava/lang/String;

    const-string v0, "type"

    invoke-static {p1, v0}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FollowFeedData$Actor;->type:Ljava/lang/String;

    const-string v0, "name"

    invoke-static {p1, v0}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    const-string v0, "iconUrl"

    invoke-static {p1, v0}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/FollowFeedData$Actor;->icon:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method key()Ljava/lang/String;
    .registers 3

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/FollowFeedData$Actor;->type:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FollowFeedData$Actor;->id:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object v1, p0, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    goto :goto_1e

    :cond_1c
    iget-object v1, p0, Le/e/a/FollowFeedData$Actor;->id:Ljava/lang/String;

    :goto_1e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
