.class public abstract Ln82;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final e:Lywh;

.field public final f:Luy8;

.field public final g:Ll45;

.field public final h:Z

.field public final i:Z

.field public final j:Lqre;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lywh;Lqre;Lqtm;Luy8;ZZ)V
    .registers 8

    invoke-direct {p0, p1, p4, p4}, Lr22;-><init>(Landroid/content/Context;Lqtm;Ld93;)V

    iput-object p2, p0, Ln82;->e:Lywh;

    iput-object p5, p0, Ln82;->f:Luy8;

    new-instance p2, Ll45;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p2, Ll45;->a:Ljava/lang/Object;

    iput-object p4, p2, Ll45;->b:Ljava/lang/Object;

    iput-object p3, p2, Ll45;->c:Ljava/lang/Object;

    iput-object p2, p0, Ln82;->g:Ll45;

    iput-object p3, p0, Ln82;->j:Lqre;

    iput-boolean p6, p0, Ln82;->h:Z

    iput-boolean p7, p0, Ln82;->i:Z

    return-void
.end method


# virtual methods
.method public abstract Q(Landroid/net/Uri$Builder;)V
.end method

.method public R(Lorb;)Ld5o;
    .registers 8

    const-string p0, "request_id"

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "experiments"

    invoke-virtual {p1, v0}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v0

    const-string v1, ""

    if-nez v0, :cond_12

    const/4 v0, 0x0

    goto :goto_3b

    :cond_12
    iget-object v2, v0, Lorb;->a:Lorg/json/JSONObject;

    new-instance v3, Ljava/util/HashMap;

    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :cond_21
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_37

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_21

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    :cond_37
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    :goto_3b
    invoke-static {p1, p0}, Lzjh;->b(Lorb;Ljava/lang/String;)[Lzjh;

    move-result-object v2

    const-string v3, "title"

    invoke-virtual {p1, v3, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    const-string v3, "more_id"

    invoke-virtual {p1, v3, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    const-string v3, "more_title"

    invoke-virtual {p1, v3, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    const-string v3, "preview_page_title"

    invoke-virtual {p1, v3, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    new-instance p1, Ld5o;

    invoke-direct {p1, p0, v0, v2}, Ld5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1
.end method

.method public S(Lfvh;)V
    .registers 2

    return-void
.end method

.method public abstract T(Ld5o;Ljava/lang/String;)Ljava/util/List;
.end method

.method public final U(Lm82;)V
    .registers 8

    invoke-virtual {p0}, Lr22;->c()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0, v0}, Ln82;->Q(Landroid/net/Uri$Builder;)V

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Ln82;->f:Luy8;

    if-eqz v2, :cond_53

    iget-object v2, v2, Luy8;->H:Lk5o;

    iget-boolean v3, p0, Ln82;->h:Z

    if-eqz v3, :cond_36

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ljava/util/HashMap;

    iget-object v4, v2, Lk5o;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    new-instance v4, Ljava/util/HashMap;

    iget-object v5, v2, Lk5o;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashMap;

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    new-instance v5, Lg92;

    invoke-direct {v5, v2, v1, v3, v4}, Lg92;-><init>(Lk5o;Lqre;Ljava/util/HashMap;Ljava/util/HashMap;)V

    move-object v1, v5

    goto :goto_53

    :cond_36
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/HashMap;

    iget-object v3, v2, Lk5o;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    invoke-direct {v1, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    new-instance v3, Ljava/util/HashMap;

    iget-object v4, v2, Lk5o;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    new-instance v4, Lg92;

    iget-object v5, p0, Ln82;->j:Lqre;

    invoke-direct {v4, v2, v5, v1, v3}, Lg92;-><init>(Lk5o;Lqre;Ljava/util/HashMap;Ljava/util/HashMap;)V

    move-object v1, v4

    :cond_53
    :goto_53
    new-instance v2, Ll82;

    invoke-direct {v2, p0, v0, v1}, Ll82;-><init>(Ln82;Ljava/lang/String;Lg92;)V

    const/4 v0, 0x1

    iput-boolean v0, v2, Lz7;->f:Z

    iget-boolean v1, p0, Ln82;->i:Z

    if-eqz v1, :cond_61

    iput-boolean v0, v2, Lz7;->g:Z

    :cond_61
    new-instance v0, Lk82;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lk82;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ln82;->e:Lywh;

    invoke-interface {p0, v2, v0}, Lywh;->a(Lz7;Lz4o;)V

    return-void
.end method
