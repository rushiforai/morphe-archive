.class public abstract Lej8;
.super Lase;
.source "SourceFile"


# instance fields
.field public final w:Ljava/lang/String;

.field public final x:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V
    .registers 8

    invoke-direct/range {p0 .. p6}, Lase;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lej8;->x:Ljava/util/ArrayList;

    const-string p1, "news_header_title"

    invoke-virtual {p4, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_71

    iput-object p2, p0, Lej8;->w:Ljava/lang/String;

    const-string p1, ""

    const-string p2, "news_digest_articles"

    invoke-virtual {p4, p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const/4 p4, 0x0

    if-nez p3, :cond_54

    :try_start_27
    new-instance p3, Lorg/json/JSONArray;

    invoke-direct {p3, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    move p1, p4

    :goto_2d
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result p5

    if-ge p1, p5, :cond_54

    const/4 p5, 0x3

    if-ge p1, p5, :cond_54

    invoke-virtual {p3, p1}, Lorg/json/JSONArray;->isNull(I)Z

    move-result p5

    if-nez p5, :cond_49

    iget-object p5, p0, Lej8;->x:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p6

    invoke-static {p6}, Ldj8;->a(Lorg/json/JSONObject;)Ldj8;

    move-result-object p6

    invoke-virtual {p5, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_49
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_49} :catch_4c

    :cond_49
    add-int/lit8 p1, p1, 0x1

    goto :goto_2d

    :catch_4c
    move-exception v0

    move-object p0, v0

    new-instance p1, Ldjb;

    invoke-direct {p1, p2, p0}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p1

    :cond_54
    iget-object p1, p0, Lwbh;->k:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_70

    iget-object p1, p0, Lej8;->x:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_70

    iget-object p1, p0, Lej8;->x:Ljava/util/ArrayList;

    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldj8;

    iget-object p1, p1, Ldj8;->a:Ljava/lang/String;

    iput-object p1, p0, Lwbh;->k:Ljava/lang/String;

    :cond_70
    return-void

    :cond_71
    new-instance p0, Ldjb;

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final k()Li16;
    .registers 4

    invoke-virtual {p0}, Lase;->d()Lua7;

    move-result-object v0

    invoke-virtual {p0}, Lej8;->z()Landroid/widget/RemoteViews;

    move-result-object p0

    new-instance v1, Li16;

    iget-object v2, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Ll1f;

    iput-object p0, v2, Ll1f;->C:Landroid/widget/RemoteViews;

    invoke-virtual {v2}, Ll1f;->b()Landroid/app/Notification;

    move-result-object p0

    iget-object v0, v0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lcm;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v0, v2}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1
.end method

.method public abstract z()Landroid/widget/RemoteViews;
.end method
