.class public final Lfab;
.super Lash;
.source "SourceFile"


# instance fields
.field public final n:Ll0c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lywh;Lqre;ILz05;Luy8;Z)V
    .registers 8

    invoke-direct/range {p0 .. p7}, Lash;-><init>(Landroid/content/Context;Lywh;Lqre;ILz05;Luy8;Z)V

    iget-object p1, p5, Ld93;->a:Lyla;

    iget-object p1, p1, Lyla;->e:Ll0c;

    iput-object p1, p0, Lfab;->n:Ll0c;

    return-void
.end method


# virtual methods
.method public final Q(Landroid/net/Uri$Builder;)V
    .registers 3

    invoke-super {p0, p1}, Lash;->Q(Landroid/net/Uri$Builder;)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "request_id"

    invoke-virtual {p1, v0, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-void
.end method

.method public final R(Lorb;)Ld5o;
    .registers 43

    move-object/from16 v0, p1

    const-string v1, "result"

    invoke-virtual {v0, v1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    const-string v2, "message"

    invoke-virtual {v1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "success"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_99

    const-string v1, "request_id"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "content"

    invoke-virtual {v0, v3}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v5, 0x0

    :goto_2f
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_87

    :try_start_35
    invoke-virtual {v0, v5}, Lvpb;->c(I)Lorb;

    move-result-object v6

    sget-object v7, Llog;->h:Lir5;

    invoke-virtual {v7, v6}, Lir5;->d(Lorb;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Llog;

    new-instance v7, Lzjh;

    iget-object v8, v6, Llog;->b:Ljava/lang/String;

    iget-wide v9, v6, Llog;->f:J

    const-string v25, "insta_clip"

    const/16 v39, 0x0

    const/16 v40, 0x0

    move-wide/from16 v22, v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v24, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    move-object v9, v8

    move-object/from16 v31, v6

    invoke-direct/range {v7 .. v40}, Lzjh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lzjh;Ljava/lang/String;Lesg;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr05;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lmw7;Lh4n;Lw9h;Llog;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lxlg;Ljb8;Lnb8;)V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_84
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_84} :catch_84

    :catch_84
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    :cond_87
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Lzjh;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzjh;

    new-instance v3, Ld5o;

    invoke-direct {v3, v1, v2, v0}, Ld5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v3

    :cond_99
    const-string v0, "message != success"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v2
.end method

.method public final S(Lfvh;)V
    .registers 5

    iget-object p0, p0, Lfab;->n:Ll0c;

    if-eqz p0, :cond_1c

    iget-object v0, p0, Ll0c;->a:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "country"

    invoke-virtual {p1, v2, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Ll0c;->b:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "language"

    invoke-virtual {p1, v0, p0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1c
    return-void
.end method

.method public final V(Landroid/net/Uri$Builder;)V
    .registers 3

    const-string v0, "clip/v1/video/channel"

    invoke-virtual {p1, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    iget-object p0, p0, Ln82;->j:Lqre;

    iget-object p0, p0, Lqre;->b:Lyqe;

    iget-object p0, p0, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-void
.end method
