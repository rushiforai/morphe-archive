.class final Le/e/a/ContentFilterId193$Rule;
.super Ljava/lang/Object;
.source "ContentFilterId193.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ContentFilterId193;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Rule"
.end annotation


# instance fields
.field final category:I

.field final emptyName:Z

.field final enabled:Z

.field final id:Ljava/lang/String;

.field final name:Le/e/a/ContentFilterRules$Rule;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .registers 6

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "category"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Le/e/a/ContentFilterId193$Rule;->category:I

    iget v0, p0, Le/e/a/ContentFilterId193$Rule;->category:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    const-string v0, "userId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d

    :cond_1b
    const-string v0, ""

    :goto_1d
    iput-object v0, p0, Le/e/a/ContentFilterId193$Rule;->id:Ljava/lang/String;

    const-string v0, "value"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    iput-boolean v2, p0, Le/e/a/ContentFilterId193$Rule;->emptyName:Z

    const-string v2, "enabled"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Le/e/a/ContentFilterId193$Rule;->enabled:Z

    new-instance v1, Le/e/a/ContentFilterRules$Rule;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "mode"

    const-string v3, "partial"

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-boolean v2, p0, Le/e/a/ContentFilterId193$Rule;->enabled:Z

    invoke-direct {v1, v0, p1, v2}, Le/e/a/ContentFilterRules$Rule;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v1, p0, Le/e/a/ContentFilterId193$Rule;->name:Le/e/a/ContentFilterRules$Rule;

    return-void
.end method
