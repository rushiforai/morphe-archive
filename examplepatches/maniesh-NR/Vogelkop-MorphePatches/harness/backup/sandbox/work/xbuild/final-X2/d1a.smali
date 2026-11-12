.class public final Ld1a;
.super Lh6e;
.source "SourceFile"


# instance fields
.field public final synthetic d:Lf1a;


# direct methods
.method public constructor <init>(Lf1a;Lpqk;)V
    .registers 3

    iput-object p1, p0, Ld1a;->d:Lf1a;

    const/4 p1, 0x1

    invoke-direct {p0, p2, p1}, Lh6e;-><init>(Lpqk;I)V

    return-void
.end method


# virtual methods
.method public final g(Lvpb;IZ)Ldri;
    .registers 16

    const-string v0, ""

    iget-object p1, p1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object p2

    const/4 v1, 0x0

    if-nez p2, :cond_12

    move-object v2, v1

    goto :goto_17

    :cond_12
    new-instance v2, Lvpb;

    invoke-direct {v2, p2}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    :goto_17
    if-eqz v2, :cond_a7

    iget-object p2, v2, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_21
    if-ge v4, v2, :cond_a7

    invoke-virtual {p2, v4, v3}, Lorg/json/JSONArray;->optInt(II)I

    move-result v5

    const/16 v6, 0x2f

    if-ne v5, v6, :cond_a3

    :try_start_2b
    new-instance p2, Lorb;

    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {p2, p1}, Lorb;-><init>(Lorg/json/JSONObject;)V

    const-string p1, "c"

    invoke-virtual {p2, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string p1, "h"

    invoke-virtual {p2, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v2, Laik;->a:[Ljava/lang/String;

    invoke-static {p1, v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    const-string p1, "b"

    invoke-virtual {p2, p1, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    const-string p1, "f"

    invoke-virtual {p2, p1, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string p1, "j"

    invoke-virtual {p2, p1, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_69
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2b .. :try_end_69} :catch_a7
    .catch Lorg/json/JSONException; {:try_start_2b .. :try_end_69} :catch_a7

    if-nez v0, :cond_74

    :try_start_6b
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1
    :try_end_73
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6b .. :try_end_73} :catch_74
    .catch Lorg/json/JSONException; {:try_start_6b .. :try_end_73} :catch_a7

    goto :goto_75

    :catch_74
    :cond_74
    move-object p1, v1

    :goto_75
    :try_start_75
    const-string v0, "zp"

    invoke-virtual {p2, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p2

    invoke-virtual {p0, v5, p2, p3}, Ld1a;->h(Ljava/lang/String;Lorb;Z)Ljava/lang/String;

    move-result-object v8

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_87

    if-eqz p1, :cond_a7

    :cond_87
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_93

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_a7

    :cond_93
    if-eqz v8, :cond_a7

    if-eqz p1, :cond_9b

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    :cond_9b
    move v10, v3

    new-instance v4, Ldri;

    const/4 v9, 0x1

    invoke-direct/range {v4 .. v11}, Ldri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    :try_end_a2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_75 .. :try_end_a2} :catch_a7
    .catch Lorg/json/JSONException; {:try_start_75 .. :try_end_a2} :catch_a7

    return-object v4

    :cond_a3
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_21

    :catch_a7
    :cond_a7
    return-object v1
.end method

.method public final h(Ljava/lang/String;Lorb;Z)Ljava/lang/String;
    .registers 5

    if-eqz p3, :cond_5

    sget-object p3, Lp6l;->b:Lp6l;

    goto :goto_7

    :cond_5
    sget-object p3, Lp6l;->a:Lp6l;

    :goto_7
    iget-object p0, p0, Ld1a;->d:Lf1a;

    const/4 v0, 0x5

    invoke-virtual {p0, v0, p3, p1}, Lf1a;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    iget-object p1, p2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    :goto_1c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_38

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-static {p3}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, v0, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1c

    :cond_38
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
