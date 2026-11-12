.class public final Lyl;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lks3;Li5o;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lyl;->c:B

    const/16 v0, 0x1c

    .line 28
    invoke-direct {p0, p2, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    .line 29
    new-instance p2, Lukf;

    invoke-direct {p2, p1}, Lukf;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lyl;->d:Ljava/lang/Object;

    .line 30
    iput-object p3, p0, Lyl;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Ltx;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lyl;->c:B

    const/16 v0, 0x1c

    invoke-direct {p0, p3, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Ljec;

    const/16 v0, 0x64

    invoke-direct {p3, v0}, Ljec;-><init>(I)V

    iput-object p3, p0, Lyl;->d:Ljava/lang/Object;

    new-instance p3, Lxl;

    invoke-direct {p3, p0, p1, p2}, Lxl;-><init>(Lyl;Landroid/content/Context;Lumi;)V

    iput-object p3, p0, Lyl;->e:Ljava/lang/Object;

    invoke-virtual {p3}, Lldk;->h()V

    return-void
.end method


# virtual methods
.method public final H0(Lorb;)V
    .registers 8

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    iget-object v1, p0, Lyl;->e:Ljava/lang/Object;

    check-cast v1, Lxl;

    invoke-virtual {v1}, Lldk;->i()V

    iget-object p0, p0, Lyl;->d:Ljava/lang/Object;

    check-cast p0, Ljec;

    iget-object v1, p0, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0}, Ljava/util/AbstractList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_70

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwl;

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    iget-wide v4, v2, Lwl;->a:J

    invoke-static {v4, v5}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v4

    const-string v5, "timestamp"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "placementId"

    iget-object v5, v2, Lwl;->b:Ljava/lang/String;

    invoke-virtual {v3, v5, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v2, Lwl;->c:Lyo;

    iget-object v4, v4, Lyo;->a:Ljava/lang/String;

    const-string v5, "provider"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "title"

    iget-object v5, v2, Lwl;->d:Ljava/lang/String;

    invoke-virtual {v3, v5, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v2, Lwl;->e:Ljava/lang/String;

    if-eqz v4, :cond_56

    const-string v5, "clickUrl"

    invoke-virtual {v3, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_56
    iget-object v2, v2, Lwl;->f:Ljava/lang/String;

    if-eqz v2, :cond_5f

    const-string v4, "responseId"

    invoke-virtual {v3, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_5f
    add-int/lit8 v1, v1, -0x1

    :try_start_61
    iget-object v2, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6a
    .catch Lorg/json/JSONException; {:try_start_61 .. :try_end_6a} :catch_6b

    goto :goto_1a

    :catch_6b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_70
    const-string p0, "adImpressions"

    invoke-virtual {p1, v0, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public final I0(Lgu9;Ljava/util/List;Ljava/lang/String;)V
    .registers 10

    iget-object p0, p0, Lyl;->e:Ljava/lang/Object;

    check-cast p0, Li5o;

    sget-object v0, Lyo;->b:Lyo;

    const-string v0, "adx"

    iget-object p1, p1, Lgu9;->t:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_71

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_26
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5f

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    sget-object v5, Lwqm;->a:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_45

    const-string v3, "opera.com"

    invoke-static {v5, v3}, Lwqm;->y(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    :cond_45
    if-eqz v3, :cond_5b

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2, p3, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_5b
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_5f
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_63
    if-ge v3, p1, :cond_85

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 v3, v3, 0x1

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2, v0}, Li5o;->j(Ljava/lang/String;Lly;)V

    goto :goto_63

    :cond_71
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_75
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_85

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2, v0}, Li5o;->j(Ljava/lang/String;Lly;)V

    goto :goto_75

    :cond_85
    return-void
.end method

.method public final k(Lyz;Ldl;)V
    .registers 6

    iget-byte v0, p0, Lyl;->c:B

    packed-switch v0, :pswitch_data_24

    invoke-super {p0, p1, p2}, Ln1;->k(Lyz;Ldl;)V

    return-void

    :pswitch_9
    instance-of v0, p1, Lgu9;

    if-eqz v0, :cond_1f

    move-object v0, p1

    check-cast v0, Lgu9;

    iget-object v1, p0, Lyl;->d:Ljava/lang/Object;

    check-cast v1, Lukf;

    const/4 v2, 0x2

    invoke-virtual {v1, v0, v2}, Lukf;->b(Lgu9;I)V

    iget-object v1, v0, Lgu9;->v:Ljava/util/List;

    const-string v2, "clickts"

    invoke-virtual {p0, v0, v1, v2}, Lyl;->I0(Lgu9;Ljava/util/List;Ljava/lang/String;)V

    :cond_1f
    invoke-super {p0, p1, p2}, Ln1;->k(Lyz;Ldl;)V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final p(Lyz;Ldl;Z)V
    .registers 14

    iget-byte v0, p0, Lyl;->c:B

    iget-object v1, p0, Lyl;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_50

    instance-of v0, p1, Lgu9;

    if-eqz v0, :cond_1b

    move-object v0, p1

    check-cast v0, Lgu9;

    check-cast v1, Lukf;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lukf;->b(Lgu9;I)V

    iget-object v1, v0, Lgu9;->u:Ljava/util/List;

    const-string v2, "impressionts"

    invoke-virtual {p0, v0, v1, v2}, Lyl;->I0(Lgu9;Ljava/util/List;Ljava/lang/String;)V

    :cond_1b
    invoke-super {p0, p1, p2, p3}, Ln1;->p(Lyz;Ldl;Z)V

    return-void

    :pswitch_1f
    invoke-super {p0, p1, p2, p3}, Ln1;->p(Lyz;Ldl;Z)V

    iget-object p0, p0, Lyl;->e:Ljava/lang/Object;

    check-cast p0, Lxl;

    invoke-virtual {p0}, Lldk;->i()V

    check-cast v1, Ljec;

    new-instance v2, Lwl;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v5, p1, Lyz;->g:Ljava/lang/String;

    iget-object v6, p1, Lyz;->i:Lyo;

    invoke-virtual {p1}, Lyz;->n()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lyz;->f()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1}, Lyz;->l()Ljava/lang/String;

    move-result-object v9

    invoke-direct/range {v2 .. v9}, Lwl;-><init>(JLjava/lang/String;Lyo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lldk;->g(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
