.class public final Le/e/a/ContentFilter$Rules;
.super Ljava/lang/Object;
.source "ContentFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ContentFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Rules"
.end annotation


# instance fields
.field final names:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/ContentFilterRules$Rule;",
            ">;"
        }
    .end annotation
.end field

.field final snapshot:Ljava/lang/String;

.field final words:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/ContentFilterRules$Rule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 11

    .line 9
    const-string v0, "value"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/ContentFilter$Rules;->words:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/ContentFilter$Rules;->names:Ljava/util/ArrayList;

    iput-object p1, p0, Le/e/a/ContentFilter$Rules;->snapshot:Ljava/lang/String;

    :try_start_15
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    :goto_1b
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt p1, v2, :cond_22

    goto :goto_61

    :cond_22
    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_5d

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_30} :catch_60

    if-eqz v3, :cond_33

    goto :goto_5d

    :cond_33
    :try_start_33
    const-string v3, "category"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_3e

    iget-object v3, p0, Le/e/a/ContentFilter$Rules;->words:Ljava/util/ArrayList;

    goto :goto_40

    :cond_3e
    iget-object v3, p0, Le/e/a/ContentFilter$Rules;->names:Ljava/util/ArrayList;

    :goto_40
    new-instance v4, Le/e/a/ContentFilterRules$Rule;

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "mode"

    const-string v7, "partial"

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "enabled"

    const/4 v8, 0x1

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-direct {v4, v5, v6, v2}, Le/e/a/ContentFilterRules$Rule;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5b
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_33 .. :try_end_5b} :catch_5c
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_5b} :catch_60

    goto :goto_5d

    :catch_5c
    move-exception v2

    :cond_5d
    :goto_5d
    add-int/lit8 p1, p1, 0x1

    goto :goto_1b

    :catch_60
    move-exception p1

    :goto_61
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .line 9
    invoke-static {p1, p2}, Le/e/a/ContentFilter$Rules;->legacy(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Le/e/a/ContentFilter$Rules;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static legacy(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    .line 9
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    const/4 v3, 0x2

    if-lt v2, v3, :cond_b

    :goto_a
    goto :goto_36

    :cond_b
    if-nez v2, :cond_f

    move-object v3, p0

    goto :goto_10

    :cond_f
    move-object v3, p1

    :goto_10
    :try_start_10
    invoke-static {v3}, Le/e/a/ContentFilterRules;->keywords(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_16
    if-lt v5, v4, :cond_1b

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_1b
    aget-object v6, v3, v5

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "category"

    invoke-virtual {v7, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "value"

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_31} :catch_34

    add-int/lit8 v5, v5, 0x1

    goto :goto_16

    :catch_34
    move-exception p0

    goto :goto_a

    :goto_36
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public blocked(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6

    .line 9
    iget-object v0, p0, Le/e/a/ContentFilter$Rules;->words:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_28

    iget-object p1, p0, Le/e/a/ContentFilter$Rules;->names:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_1b

    const/4 p1, 0x0

    return p1

    :cond_1b
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/ContentFilterRules$Rule;

    invoke-virtual {p1, p2}, Le/e/a/ContentFilterRules$Rule;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_13

    return v2

    :cond_28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ContentFilterRules$Rule;

    invoke-virtual {v1, p1}, Le/e/a/ContentFilterRules$Rule;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    return v2
.end method

.method empty()Z
    .registers 2

    .line 9
    iget-object v0, p0, Le/e/a/ContentFilter$Rules;->words:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Le/e/a/ContentFilter$Rules;->names:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    return v0

    :cond_12
    const/4 v0, 0x0

    return v0
.end method
