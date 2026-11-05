.class final Le/e/a/SavedTabs227$Tab;
.super Ljava/lang/Object;
.source "SavedTabs227.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SavedTabs227;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Tab"
.end annotation


# instance fields
.field folder:I

.field id:Ljava/lang/String;

.field item:Ljava/lang/String;

.field kind:I

.field label:Ljava/lang/String;

.field mode:I

.field position:I

.field screen:Ljava/lang/String;

.field subtitle:Ljava/lang/String;

.field top:I

.field type:I

.field url:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    const-string v0, "list"

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/SavedTabs227$Tab;->mode:I

    iput v0, p0, Le/e/a/SavedTabs227$Tab;->folder:I

    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .registers 7

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    const-string v0, "list"

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const/4 v1, -0x1

    iput v1, p0, Le/e/a/SavedTabs227$Tab;->mode:I

    iput v1, p0, Le/e/a/SavedTabs227$Tab;->folder:I

    const-string v2, "id"

    iget-object v3, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    const-string v2, "label"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    const-string v2, "item"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    const-string v2, "subtitle"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    const-string v3, "playlist"

    const/4 v4, 0x2

    if-ne v2, v4, :cond_52

    move-object v0, v3

    :cond_52
    const-string v2, "screen"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v0, "playMode"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Le/e/a/SavedTabs227$Tab;->mode:I

    const-string v0, "kind"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7e

    iget v0, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    if-ne v0, v4, :cond_7e

    iput-object v3, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    :cond_7e
    const-string v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Le/e/a/SavedTabs227$Tab;->type:I

    const-string v0, "folder"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Le/e/a/SavedTabs227$Tab;->folder:I

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Le/e/a/SavedTabs227$Tab;->position:I

    const-string v0, "top"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Le/e/a/SavedTabs227$Tab;->top:I

    return-void
.end method


# virtual methods
.method json()Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 6
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "id"

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "label"

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "url"

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "item"

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "subtitle"

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "screen"

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "playMode"

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->mode:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "kind"

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "type"

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->type:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "folder"

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->folder:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "position"

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->position:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "top"

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->top:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method
