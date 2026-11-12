.class public final Ldkn;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final j:Ljava/io/File;

.field public final k:I

.field public final synthetic l:Lekn;


# direct methods
.method public constructor <init>(Lekn;Ljava/io/File;Lumi;)V
    .registers 4

    iput-object p1, p0, Ldkn;->l:Lekn;

    sget-object p1, Lngh;->a:Lr16;

    const/4 p1, 0x0

    invoke-direct {p0, p3, p1}, Lldk;-><init>(Lumi;Z)V

    iput-object p2, p0, Ldkn;->j:Ljava/io/File;

    const/4 p1, 0x2

    iput p1, p0, Ldkn;->k:I

    return-void
.end method

.method public static j(Lorb;)Ljava/util/LinkedHashMap;
    .registers 16

    const-string v0, "version"

    invoke-virtual {p0, v0}, Lorb;->g(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_b

    const/4 p0, 0x0

    return-object p0

    :cond_b
    const-string v0, "entries"

    invoke-virtual {p0, v0}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object p0

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_1d
    if-ge v2, v1, :cond_aa

    invoke-virtual {p0, v2}, Lvpb;->c(I)Lorb;

    move-result-object v3

    new-instance v4, Lckn;

    const-string v5, "image"

    invoke-virtual {v3, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Landroid/graphics/Rect;

    iget-object v7, v3, Lorb;->a:Lorg/json/JSONObject;

    const-string v8, "left"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const-string v9, "top"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    const-string v10, "right"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    const-string v11, "bottom"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-direct {v6, v8, v9, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    const-string v8, "topRatio"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    double-to-float v8, v8

    const-string v9, "bottomRatio"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v9

    double-to-float v9, v9

    const-string v10, "scaleX"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v10

    double-to-float v10, v10

    const-string v11, "pivotX"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v11

    double-to-float v11, v11

    const-string v12, "pivotY"

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v12

    double-to-float v7, v12

    move v14, v11

    move v11, v7

    move v7, v8

    move v8, v9

    move v9, v10

    move v10, v14

    invoke-direct/range {v4 .. v11}, Lckn;-><init>(Ljava/lang/String;Landroid/graphics/Rect;FFFFF)V

    new-instance v5, Lgkn;

    const-string v6, "cTop"

    invoke-virtual {v3, v6}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v6

    invoke-static {v6}, Lxgh;->z(Lvpb;)Likn;

    move-result-object v6

    const-string v7, "cLogo"

    invoke-virtual {v3, v7}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v7

    invoke-static {v7}, Lxgh;->z(Lvpb;)Likn;

    move-result-object v7

    const-string v8, "cOverall"

    invoke-virtual {v3, v8}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v8

    invoke-static {v8}, Lxgh;->z(Lvpb;)Likn;

    move-result-object v8

    const-string v9, "cBottom"

    invoke-virtual {v3, v9}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v3

    invoke-static {v3}, Lxgh;->z(Lvpb;)Likn;

    move-result-object v3

    invoke-direct {v5, v6, v7, v8, v3}, Lgkn;-><init>(Likn;Likn;Likn;Likn;)V

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1d

    :cond_aa
    return-object v0
.end method

.method public static k(Ljava/lang/Object;)Lorb;
    .registers 7

    check-cast p0, Ljava/util/Map;

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    if-eqz p0, :cond_fa

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_fa

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget-object v3, v3, Lckn;->a:Ljava/lang/String;

    const-string v4, "image"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget-object v3, v3, Lckn;->b:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    const-string v4, "left"

    invoke-virtual {v2, v3, v4}, Lorb;->n(ILjava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget-object v3, v3, Lckn;->b:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    const-string v4, "top"

    invoke-virtual {v2, v3, v4}, Lorb;->n(ILjava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget-object v3, v3, Lckn;->b:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    const-string v4, "right"

    invoke-virtual {v2, v3, v4}, Lorb;->n(ILjava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget-object v3, v3, Lckn;->b:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    const-string v4, "bottom"

    invoke-virtual {v2, v3, v4}, Lorb;->n(ILjava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget v3, v3, Lckn;->c:F

    float-to-double v3, v3

    const-string v5, "topRatio"

    invoke-virtual {v2, v5, v3, v4}, Lorb;->q(Ljava/lang/String;D)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget v3, v3, Lckn;->d:F

    float-to-double v3, v3

    const-string v5, "bottomRatio"

    invoke-virtual {v2, v5, v3, v4}, Lorb;->q(Ljava/lang/String;D)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget v3, v3, Lckn;->e:F

    float-to-double v3, v3

    const-string v5, "scaleX"

    invoke-virtual {v2, v5, v3, v4}, Lorb;->q(Ljava/lang/String;D)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget v3, v3, Lckn;->f:F

    float-to-double v3, v3

    const-string v5, "pivotX"

    invoke-virtual {v2, v5, v3, v4}, Lorb;->q(Ljava/lang/String;D)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lckn;

    iget v3, v3, Lckn;->g:F

    float-to-double v3, v3

    const-string v5, "pivotY"

    invoke-virtual {v2, v5, v3, v4}, Lorb;->q(Ljava/lang/String;D)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgkn;

    iget-object v3, v3, Lgkn;->a:Likn;

    invoke-static {v3}, Lxgh;->y(Likn;)Lvpb;

    move-result-object v3

    const-string v4, "cTop"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgkn;

    iget-object v3, v3, Lgkn;->b:Likn;

    invoke-static {v3}, Lxgh;->y(Likn;)Lvpb;

    move-result-object v3

    const-string v4, "cLogo"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgkn;

    iget-object v3, v3, Lgkn;->c:Likn;

    invoke-static {v3}, Lxgh;->y(Likn;)Lvpb;

    move-result-object v3

    const-string v4, "cOverall"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgkn;

    iget-object v1, v1, Lgkn;->d:Likn;

    invoke-static {v1}, Lxgh;->y(Likn;)Lvpb;

    move-result-object v1

    const-string v3, "cBottom"

    invoke-virtual {v2, v1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lvpb;->a(Ljava/lang/Object;)V

    goto/16 :goto_11

    :cond_fa
    new-instance p0, Lorb;

    invoke-direct {p0}, Lorb;-><init>()V

    const-string v1, "version"

    const/4 v2, 0x1

    invoke-virtual {p0, v2, v1}, Lorb;->n(ILjava/lang/String;)V

    const-string v1, "entries"

    invoke-virtual {p0, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 3

    :try_start_0
    iget-object p0, p0, Ldkn;->j:Ljava/io/File;

    invoke-static {p0}, Ls29;->h(Ljava/io/File;)[B

    move-result-object p0

    new-instance v0, Ljava/lang/String;

    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    new-instance p0, Lorb;

    invoke-direct {p0, v0}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ldkn;->j(Lorb;)Ljava/util/LinkedHashMap;

    move-result-object p0
    :try_end_16
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_16} :catch_17
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_16} :catch_17
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_16} :catch_17

    return-object p0

    :catch_17
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 3

    iget-object p0, p0, Ldkn;->j:Ljava/io/File;

    :try_start_2
    invoke-static {p1}, Ldkn;->k(Ljava/lang/Object;)Lorb;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p0, p1}, Ls29;->j(Ljava/io/File;[B)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_13} :catch_13

    :catch_13
    return-void
.end method

.method public final c()I
    .registers 1

    iget p0, p0, Ldkn;->k:I

    return p0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_2c

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lckn;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgkn;

    iget-object v2, p0, Ldkn;->l:Lekn;

    iget-object v2, v2, Lekn;->a:Lyp9;

    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c

    :cond_2c
    return-void
.end method
