.class public final Lti9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final r:J

.field public static final s:J

.field public static final synthetic t:I


# instance fields
.field public final a:Lnx5;

.field public final b:Lkng;

.field public final c:Lhnc;

.field public final d:Lode;

.field public final e:Lode;

.field public final f:Lwi9;

.field public final g:Lzi9;

.field public final h:Ldoc;

.field public final i:Lup9;

.field public final j:Ljh;

.field public final k:Lxh7;

.field public final l:Lnak;

.field public final m:Lnak;

.field public n:Z

.field public final o:Lrlh;

.field public final p:Ljdj;

.field public final q:Ljdj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1e

    sget-object v1, Lun7;->f:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lti9;->r:J

    const/16 v0, 0x3c

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lti9;->s:J

    return-void
.end method

.method public constructor <init>(Lnx5;Lkng;Lhnc;Lfs6;Lode;Lode;Lwi9;Lzi9;Ldoc;Lup9;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lti9;->a:Lnx5;

    iput-object p2, p0, Lti9;->b:Lkng;

    iput-object p3, p0, Lti9;->c:Lhnc;

    iput-object p5, p0, Lti9;->d:Lode;

    iput-object p6, p0, Lti9;->e:Lode;

    iput-object p7, p0, Lti9;->f:Lwi9;

    iput-object p8, p0, Lti9;->g:Lzi9;

    iput-object p9, p0, Lti9;->h:Ldoc;

    iput-object p10, p0, Lti9;->i:Lup9;

    new-instance p5, Ljh;

    invoke-direct {p5}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lti9;->j:Ljh;

    new-instance p5, Lxh7;

    invoke-direct {p5, p1, p4}, Lxh7;-><init>(Lnx5;Lfs6;)V

    iput-object p5, p0, Lti9;->k:Lxh7;

    sget-object p4, Ln08;->a:Ln08;

    invoke-static {p4}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p4

    iput-object p4, p0, Lti9;->l:Lnak;

    sget-object p6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p6}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p6

    iput-object p6, p0, Lti9;->m:Lnak;

    invoke-static {p4}, La26;->j(Lnak;)Lrlh;

    move-result-object p4

    iput-object p4, p0, Lti9;->o:Lrlh;

    iget-object p4, p8, Lzi9;->f:Ljdj;

    iput-object p4, p0, Lti9;->p:Ljdj;

    iget-object p4, p7, Lwi9;->f:Ljdj;

    iput-object p4, p0, Lti9;->q:Ljdj;

    iget-object p3, p3, Lhnc;->l:Ljze;

    new-instance p4, Ltu7;

    const/16 p7, 0xe

    invoke-direct {p4, p0, p7}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p7, Lcl4;

    const/16 p8, 0x15

    invoke-direct {p7, p4, p8}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p7}, Lekc;->k(Lf7f;)V

    new-instance p3, Lld9;

    const/4 p4, 0x3

    invoke-direct {p3, p0, p4}, Lld9;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p2, Lkng;->e:Lld9;

    new-instance p2, Lpi9;

    invoke-direct {p2, p0}, Lpi9;-><init>(Lti9;)V

    iget-object p3, p5, Lxh7;->b:Li7f;

    invoke-virtual {p3, p2}, Li7f;->b(Ljava/lang/Object;)Z

    new-instance p2, Lyf;

    const/4 p3, 0x0

    const/16 p4, 0x19

    invoke-direct {p2, p4, p3, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p6, p1, p2}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p1, Lqi9;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lqi9;

    iget v1, v0, Lqi9;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lqi9;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lqi9;

    invoke-direct {v0, p0, p1}, Lqi9;-><init>(Lti9;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lqi9;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lqi9;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_56

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lti9;->i:Lup9;

    iget-object p1, p1, Lup9;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsfo;

    iget-object p0, p0, Lti9;->d:Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltpc;

    if-eqz p0, :cond_4c

    iget-object p0, p0, Ltpc;->c:Ljava/lang/String;

    goto :goto_4d

    :cond_4c
    move-object p0, v3

    :goto_4d
    iput v4, v0, Lqi9;->v:I

    invoke-virtual {p1, p0, v0}, Lsfo;->a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_56

    return-object v1

    :cond_56
    :goto_56
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_9b

    check-cast p0, Ljava/util/Map;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6b
    :goto_6b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lkotlin/text/StringsKt;->k0(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    if-nez v1, :cond_85

    move-object v2, v3

    goto :goto_94

    :cond_85
    new-instance v2, Lgme;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v2, v4, v5, v0}, Lgme;-><init>(JLjava/lang/String;)V

    :goto_94
    if-eqz v2, :cond_6b

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6b

    :cond_9a
    move-object p0, p1

    :cond_9b
    sget-object p1, Lt0i;->b:Lp0i;

    return-object p0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p1, Lri9;

    if-eqz v0, :cond_14

    move-object v0, p1

    check-cast v0, Lri9;

    iget v1, v0, Lri9;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lri9;->y:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lri9;

    invoke-direct {v0, p0, p1}, Lri9;-><init>(Lti9;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p1, v6, Lri9;->w:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lri9;->y:I

    const/4 v2, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v7, 0x0

    if-eqz v1, :cond_50

    if-eq v1, v3, :cond_48

    if-eq v1, v4, :cond_3b

    if-ne v1, v2, :cond_35

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto/16 :goto_a5

    :cond_35
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :cond_3b
    iget-object p0, v6, Lri9;->v:Ljava/lang/String;

    iget-object v1, v6, Lri9;->u:Ljava/lang/String;

    iget-object v3, v6, Lri9;->t:Lsfo;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v9, v3

    move-object v3, p0

    move-object p0, v9

    goto :goto_8f

    :cond_48
    iget-object v1, v6, Lri9;->u:Ljava/lang/String;

    iget-object v3, v6, Lri9;->t:Lsfo;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_70

    :cond_50
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lti9;->i:Lup9;

    iget-object p1, p1, Lup9;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsfo;

    iput-object p1, v6, Lri9;->t:Lsfo;

    const-string v1, "ofa"

    iput-object v1, v6, Lri9;->u:Ljava/lang/String;

    iput v3, v6, Lri9;->y:I

    iget-object v3, p0, Lti9;->d:Lode;

    invoke-static {v3, v6}, Lxf8;->v(Lekc;Lnt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v0, :cond_a4

    move-object v9, v3

    move-object v3, p1

    move-object p1, v9

    :goto_70
    check-cast p1, Ltpc;

    iget-object p1, p1, Ltpc;->a:Ljava/lang/String;

    new-instance v5, Lxf;

    const/16 v8, 0xf

    invoke-direct {v5, v4, v7, v8}, Lxf;-><init>(ILmt5;B)V

    iput-object v3, v6, Lri9;->t:Lsfo;

    iput-object v1, v6, Lri9;->u:Ljava/lang/String;

    iput-object p1, v6, Lri9;->v:Ljava/lang/String;

    iput v4, v6, Lri9;->y:I

    iget-object p0, p0, Lti9;->e:Lode;

    invoke-static {p0, v5, v6}, Lxf8;->w(Lekc;Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_a4

    move-object v9, p1

    move-object p1, p0

    move-object p0, v3

    move-object v3, v9

    :goto_8f
    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    iput-object v7, v6, Lri9;->t:Lsfo;

    iput-object v7, v6, Lri9;->u:Ljava/lang/String;

    iput-object v7, v6, Lri9;->v:Ljava/lang/String;

    iput v2, v6, Lri9;->y:I

    const-string v5, "start_page"

    move-object v2, v1

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lsfo;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_a5

    :cond_a4
    return-object v0

    :cond_a5
    :goto_a5
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_bf

    check-cast p0, Lld3;

    new-instance v0, Lo7f;

    iget-object v1, p0, Lld3;->a:Ljava/lang/String;

    iget-object v2, p0, Lld3;->b:Ljava/lang/String;

    iget-object v3, p0, Lld3;->c:Ljava/lang/String;

    iget-object v4, p0, Lld3;->d:Ljava/lang/String;

    iget-object v5, p0, Lld3;->e:Ljava/lang/String;

    iget-object v6, p0, Lld3;->f:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lo7f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object p0, v0

    :cond_bf
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-nez p1, :cond_c6

    return-object p0

    :cond_c6
    return-object v7
.end method

.method public final c(JLnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p3, Lsi9;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lsi9;

    iget v1, v0, Lsi9;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lsi9;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lsi9;

    invoke-direct {v0, p0, p3}, Lsi9;-><init>(Lti9;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lsi9;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lsi9;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-wide p1, v0, Lsi9;->t:J

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_40

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iput-wide p1, v0, Lsi9;->t:J

    iput v3, v0, Lsi9;->w:I

    iget-object p0, p0, Lti9;->q:Ljdj;

    invoke-static {p0, v0}, Lcs5;->H(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_40

    return-object v1

    :cond_40
    :goto_40
    check-cast p3, Ljava/util/List;

    const/4 p0, 0x0

    if-eqz p3, :cond_6b

    check-cast p3, Ljava/lang/Iterable;

    instance-of v0, p3, Ljava/util/Collection;

    if-eqz v0, :cond_54

    move-object v0, p3

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6b

    :cond_54
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_58
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6b

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmme;

    iget-wide v0, v0, Lmme;->a:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_58

    goto :goto_6c

    :cond_6b
    move v3, p0

    :goto_6c
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
