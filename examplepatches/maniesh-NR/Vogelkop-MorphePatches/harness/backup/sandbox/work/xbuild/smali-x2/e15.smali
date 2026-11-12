.class public final Le15;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le15;->a:Ljava/lang/String;

    iput-object p2, p0, Le15;->b:Ljava/lang/String;

    iput-object p3, p0, Le15;->c:Ljava/lang/String;

    iput-object p4, p0, Le15;->d:Ljava/lang/String;

    return-void
.end method

.method public static a(Lvpb;Z)Ljava/util/List;
    .registers 11

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_c
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_42

    :try_start_12
    invoke-virtual {p0, v2}, Lvpb;->c(I)Lorb;

    move-result-object v3

    const-string v4, ""

    const-string v5, "city_id"

    invoke-virtual {v3, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "display_name"

    invoke-virtual {v3, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz p1, :cond_2d

    const-string v7, "state_name"

    invoke-virtual {v3, v7, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_2e

    :cond_2d
    move-object v7, v4

    :goto_2e
    const-string v8, "zip_code"

    invoke-virtual {v3, v8, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le15;

    invoke-direct {v4, v5, v6, v7, v3}, Le15;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3c
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_3c} :catch_3f

    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :catch_3f
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_42
    return-object v0
.end method
