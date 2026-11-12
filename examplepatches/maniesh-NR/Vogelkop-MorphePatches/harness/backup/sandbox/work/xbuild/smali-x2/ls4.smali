.class public final Lls4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Lfs4;


# instance fields
.field public final a:Lisd;

.field public final b:Ljv1;

.field public final c:Landroid/content/Context;

.field public final d:Lks4;

.field public final e:Lpfe;

.field public final f:Ljava/lang/Object;

.field public g:Lhs4;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lfs4;

    sget-object v1, Lebb;->c:Lebb;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2, v1, v2}, Lj06;->n(JJ)Lebb;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [B

    const-string v3, ""

    invoke-direct {v0, v3, v1, v2}, Lfs4;-><init>(Ljava/lang/String;Lebb;[B)V

    sput-object v0, Lls4;->h:Lfs4;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lwjh;Lisd;Ljv1;)V
    .registers 6

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lls4;->a:Lisd;

    iput-object p4, p0, Lls4;->b:Ljv1;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lls4;->c:Landroid/content/Context;

    iget-object p1, p2, Lwjh;->d:Ljava/lang/Object;

    check-cast p1, Ljg8;

    iget-object p2, p2, Lwjh;->e:Ljava/lang/Object;

    check-cast p2, Ljg8;

    new-instance p3, Lks4;

    invoke-direct {p3, p0, p1, p2}, Lks4;-><init>(Lls4;Ljg8;Ljg8;)V

    iput-object p3, p0, Lls4;->d:Lks4;

    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    iput-object p1, p0, Lls4;->e:Lpfe;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lls4;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lqa6;Lnt5;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p2, Ljs4;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ljs4;

    iget v1, v0, Ljs4;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ljs4;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Ljs4;

    invoke-direct {v0, p0, p2}, Ljs4;-><init>(Lls4;Lnt5;)V

    :goto_18
    iget-object p2, v0, Ljs4;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ljs4;->x:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_48

    if-eq v2, v5, :cond_42

    if-eq v2, v4, :cond_3a

    if-ne v2, v3, :cond_34

    iget-object p0, v0, Ljs4;->u:Lpfe;

    :try_start_2c
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2f
    .catchall {:try_start_2c .. :try_end_2f} :catchall_31

    goto/16 :goto_de

    :catchall_31
    move-exception p1

    goto/16 :goto_f2

    :cond_34
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_3a
    iget-object p1, v0, Ljs4;->u:Lpfe;

    iget-object v2, v0, Ljs4;->t:Lqa6;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6f

    :cond_42
    iget-object p1, v0, Ljs4;->t:Lqa6;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5f

    :cond_48
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Ljs4;->t:Lqa6;

    iput v5, v0, Ljs4;->x:I

    iget-object p2, p0, Lls4;->d:Lks4;

    iget-object p2, p2, Ln1f;->b:Ljava/lang/Object;

    check-cast p2, Ld3k;

    invoke-virtual {p2, v0}, Lxob;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_5d

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_5d
    if-eq p2, v1, :cond_dc

    :goto_5f
    iput-object p1, v0, Ljs4;->t:Lqa6;

    iget-object p2, p0, Lls4;->e:Lpfe;

    iput-object p2, v0, Ljs4;->u:Lpfe;

    iput v4, v0, Ljs4;->x:I

    invoke-virtual {p2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_dc

    move-object v2, p1

    move-object p1, p2

    :goto_6f
    :try_start_6f
    iget-object p2, p0, Lls4;->g:Lhs4;

    if-eqz p2, :cond_e8

    iget-object v4, p2, Lhs4;->a:Ljava/util/LinkedHashMap;

    iget-object v5, p0, Lls4;->b:Ljv1;

    invoke-virtual {v5}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_94

    sget-object v5, Lcs4;->e:Lcs4;

    sget-object v7, Lls4;->h:Lfs4;

    invoke-virtual {v4, v5, v7}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfs4;

    iget-object v4, v4, Lfs4;->a:Ljava/lang/String;

    invoke-static {v5, v4}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v4

    goto :goto_cb

    :cond_94
    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v7

    invoke-static {v7}, Lqbd;->a(I)I

    move-result v7

    invoke-direct {v5, v7}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_ab
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_ca

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfs4;

    iget-object v7, v7, Lfs4;->a:Ljava/lang/String;

    invoke-interface {v5, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ab

    :cond_ca
    move-object v4, v5

    :goto_cb
    new-instance v5, Lis4;

    invoke-direct {v5, p0, p2, v4}, Lis4;-><init>(Lls4;Lhs4;Ljava/util/Map;)V

    iput-object v6, v0, Ljs4;->t:Lqa6;

    iput-object p1, v0, Ljs4;->u:Lpfe;

    iput v3, v0, Ljs4;->x:I

    invoke-interface {v2, v5, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_da
    .catchall {:try_start_6f .. :try_end_da} :catchall_f0

    if-ne p0, v1, :cond_dd

    :cond_dc
    return-object v1

    :cond_dd
    move-object p0, p1

    :goto_de
    invoke-virtual {p0, v6}, Lpfe;->l(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :goto_e4
    move-object v9, p1

    move-object p1, p0

    move-object p0, v9

    goto :goto_f2

    :cond_e8
    :try_start_e8
    const-string p0, "Required value was null."

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_f0
    .catchall {:try_start_e8 .. :try_end_f0} :catchall_f0

    :catchall_f0
    move-exception p0

    goto :goto_e4

    :goto_f2
    invoke-virtual {p0, v6}, Lpfe;->l(Ljava/lang/Object;)V

    throw p1
.end method

.method public final b(Lcs4;)[B
    .registers 3

    iget-object v0, p0, Lls4;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lls4;->g:Lhs4;

    if-eqz p0, :cond_14

    iget-object p0, p0, Lhs4;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfs4;

    if-eqz p0, :cond_14

    iget-object p0, p0, Lfs4;->c:[B
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_17

    goto :goto_15

    :cond_14
    const/4 p0, 0x0

    :goto_15
    monitor-exit v0

    return-object p0

    :catchall_17
    move-exception p0

    monitor-exit v0

    throw p0
.end method
