.class public final Lvnj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:J

.field public static final synthetic j:I


# instance fields
.field public final a:Lumi;

.field public final b:Lp8f;

.field public final c:Lk32;

.field public final d:Lqie;

.field public final e:Ljava/util/ArrayList;

.field public f:Z

.field public g:Lfnj;

.field public h:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x5

    sget-object v1, Lun7;->f:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lvnj;->i:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 10

    new-instance v0, Lp8f;

    invoke-direct {v0, p1, p2}, Lp8f;-><init>(Landroid/content/Context;Lumi;)V

    new-instance v1, Ljlh;

    const/4 v5, 0x3

    const/4 v6, 0x2

    const-string v3, "bsi"

    const/4 v4, 0x0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Ljlh;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;IB)V

    new-instance p1, Lk32;

    const/4 v3, 0x7

    invoke-direct {p1, v2, v3}, Lk32;-><init>(Landroid/content/Context;B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lvnj;->a:Lumi;

    iput-object v0, p0, Lvnj;->b:Lp8f;

    iput-object p1, p0, Lvnj;->c:Lk32;

    new-instance p1, Lqie;

    const/16 v0, 0x13

    invoke-direct {p1, v0}, Lqie;-><init>(B)V

    iput-object p1, p0, Lvnj;->d:Lqie;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lvnj;->e:Ljava/util/ArrayList;

    new-instance v0, Lmgf;

    const/16 v2, 0x1c

    invoke-direct {v0, p0, v1, v2}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p2

    new-instance v0, Ltxi;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    invoke-virtual {p1, p0, v4}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lvnj;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_10

    iget-boolean v1, p0, Lvnj;->f:Z

    if-nez v1, :cond_10

    iget-object v1, p0, Lvnj;->g:Lfnj;

    if-nez v1, :cond_11

    :cond_10
    return-void

    :cond_11
    const/4 v1, 0x1

    iput-boolean v1, p0, Lvnj;->f:Z

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpnj;

    iget-object v1, v0, Lpnj;->a:Ljava/lang/String;

    new-instance v2, Lvvf;

    const/16 v3, 0x16

    invoke-direct {v2, p0, v0, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lvnj;->b:Lp8f;

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpne;

    iget-object v0, v0, Lpne;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Ldbh;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_46

    new-instance p0, Lgnj;

    const/16 v0, 0x194

    invoke-direct {p0, v0}, Lgnj;-><init>(I)V

    invoke-virtual {v2, p0}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_46
    iget-object v1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Lumi;

    new-instance v3, Ljbd;

    const/16 v4, 0x12

    invoke-direct {v3, p0, v0, v2, v4}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v3}, Ltcl;->a(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final b(Ljava/lang/String;Llnj;)V
    .registers 6

    iget-object v0, p0, Lvnj;->g:Lfnj;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lfnj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    new-instance p1, Lcnj;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lcnj;-><init>(Lvnj;Llnj;B)V

    invoke-virtual {p0, p1}, Lvnj;->g(Ljava/lang/Runnable;)V

    return-void

    :cond_18
    iget-object v0, p0, Lvnj;->g:Lfnj;

    if-nez v0, :cond_1d

    move-object v0, v1

    :cond_1d
    iget-object v0, v0, Lfnj;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_5a

    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_51

    iget-object v0, p0, Lvnj;->g:Lfnj;

    if-nez v0, :cond_38

    move-object v0, v1

    :cond_38
    iget-object v0, v0, Lfnj;->b:Ljava/util/LinkedHashMap;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lvnj;->g:Lfnj;

    if-eqz v0, :cond_42

    move-object v1, v0

    :cond_42
    iget-object v0, v1, Lfnj;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lenj;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, p1, v1}, Lenj;-><init>(Lvnj;Llnj;Ljava/lang/String;B)V

    invoke-virtual {p0, v0}, Lvnj;->g(Ljava/lang/Runnable;)V

    return-void

    :cond_51
    new-instance p1, Lcnj;

    const/4 v0, 0x2

    invoke-direct {p1, p0, p2, v0}, Lcnj;-><init>(Lvnj;Llnj;B)V

    invoke-virtual {p0, p1}, Lvnj;->g(Ljava/lang/Runnable;)V

    :cond_5a
    return-void
.end method

.method public final c()V
    .registers 8

    sget-object v0, Lmnj;->a:Lmnj;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lvnj;->g:Lfnj;

    if-nez v2, :cond_c

    const/4 v2, 0x0

    :cond_c
    iget-object v2, v2, Lfnj;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_36
    :goto_36
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_18

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llnj;

    iget-object v6, v5, Llnj;->a:Lmnj;

    if-ne v6, v0, :cond_36

    new-instance v6, Lkotlin/Pair;

    invoke-direct {v6, v5, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_36

    :cond_4f
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_54
    if-ge v2, v0, :cond_6a

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lkotlin/Pair;

    iget-object v4, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v3, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v3, Llnj;

    invoke-virtual {p0, v4, v3}, Lvnj;->b(Ljava/lang/String;Llnj;)V

    goto :goto_54

    :cond_6a
    return-void
.end method

.method public final d(Ljava/lang/String;Llnj;)V
    .registers 11

    iget-object v0, p0, Lvnj;->g:Lfnj;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lfnj;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_17

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    return-void

    :cond_17
    iget-object v0, p0, Lvnj;->g:Lfnj;

    if-nez v0, :cond_1c

    move-object v0, v1

    :cond_1c
    iget-object v0, v0, Lfnj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    new-instance v0, Lcnj;

    const/4 v2, 0x0

    invoke-direct {v0, p0, p2, v2}, Lcnj;-><init>(Lvnj;Llnj;B)V

    invoke-virtual {p0, v0}, Lvnj;->g(Ljava/lang/Runnable;)V

    :cond_2d
    iget-object v0, p0, Lvnj;->g:Lfnj;

    if-nez v0, :cond_32

    move-object v0, v1

    :cond_32
    iget-object v0, v0, Lfnj;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v6, v0, Ltnj;

    new-instance v2, Lis6;

    const/4 v7, 0x4

    move-object v3, p0

    move-object v5, p1

    move-object v4, p2

    invoke-direct/range {v2 .. v7}, Lis6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    iget-object p0, v3, Lvnj;->a:Lumi;

    invoke-virtual {p0, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Lvdi;

    const/4 p2, 0x3

    invoke-direct {p1, v3, v5, v4, p2}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    iget-object p1, v3, Lvnj;->d:Lqie;

    invoke-virtual {p1, p0, v1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final e(Lknj;)Ljava/lang/String;
    .registers 2

    iget-object p1, p1, Lknj;->a:Ljava/lang/String;

    iget-object p0, p0, Lvnj;->b:Lp8f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ldbh;->r(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_12

    const/4 p0, 0x0

    :cond_12
    return-object p0
.end method

.method public final f(Lknj;Lkotlin/jvm/functions/Function1;)Lifd;
    .registers 8

    invoke-virtual {p0, p1}, Lvnj;->e(Lknj;)Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lknj;->b:Llnj;

    sget-object v1, Lnnj;->a:Lnnj;

    if-nez v0, :cond_b

    return-object v1

    :cond_b
    iget-object v2, p0, Lvnj;->g:Lfnj;

    iget-object v3, p0, Lvnj;->e:Ljava/util/ArrayList;

    const/4 v4, 0x0

    if-eqz v2, :cond_44

    iget-object v2, v2, Lfnj;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lifd;

    if-eqz v2, :cond_20

    invoke-virtual {p0, p1, v0, v2}, Lvnj;->h(Llnj;Ljava/lang/String;Lifd;)V

    return-object v2

    :cond_20
    iget-object v2, p0, Lvnj;->g:Lfnj;

    if-nez v2, :cond_25

    move-object v2, v4

    :cond_25
    iget-object v2, v2, Lfnj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    iget-object p0, p0, Lvnj;->g:Lfnj;

    if-eqz p0, :cond_32

    move-object v4, p0

    :cond_32
    iget-object p0, v4, Lfnj;->a:Ljava/util/LinkedHashMap;

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1

    :cond_38
    new-instance v1, Lpnj;

    invoke-direct {v1, v0, p1, p2}, Lpnj;-><init>(Ljava/lang/String;Llnj;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lvnj;->a()V

    return-object v4

    :cond_44
    new-instance p0, Lpnj;

    invoke-direct {p0, v0, p1, p2}, Lpnj;-><init>(Ljava/lang/String;Llnj;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v4
.end method

.method public final g(Ljava/lang/Runnable;)V
    .registers 3

    iget-object v0, p0, Lvnj;->a:Lumi;

    invoke-interface {v0, p1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    iget-object p0, p0, Lvnj;->d:Lqie;

    invoke-virtual {p0, v0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final h(Llnj;Ljava/lang/String;Lifd;)V
    .registers 5

    instance-of p3, p3, Lnnj;

    if-nez p3, :cond_20

    iget-object p3, p0, Lvnj;->g:Lfnj;

    if-nez p3, :cond_9

    const/4 p3, 0x0

    :cond_9
    iget-object p3, p3, Lfnj;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p3, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Set;

    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_20

    new-instance p3, Lenj;

    const/4 v0, 0x1

    invoke-direct {p3, p0, p1, p2, v0}, Lenj;-><init>(Lvnj;Llnj;Ljava/lang/String;B)V

    invoke-virtual {p0, p3}, Lvnj;->g(Ljava/lang/Runnable;)V

    :cond_20
    return-void
.end method

.method public final i(J)Ljava/io/File;
    .registers 5

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Lvnj;->c:Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    const/16 v1, 0x10

    invoke-static {v1}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v1

    invoke-static {p1, p2, v1}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object p1

    const-string p2, "ico-"

    invoke-static {p2, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public final j(Lknj;)V
    .registers 7

    invoke-virtual {p0, p1}, Lvnj;->e(Lknj;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lknj;->b:Llnj;

    if-eqz v0, :cond_3e

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Lvvf;

    const/16 v4, 0x15

    invoke-direct {v3, p1, v2, v4}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Lvnj;->e:Ljava/util/ArrayList;

    invoke-static {p1, v3}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    iget-object v3, p0, Lvnj;->g:Lfnj;

    if-eqz v3, :cond_21

    invoke-virtual {p0, v0, v1}, Lvnj;->b(Ljava/lang/String;Llnj;)V

    goto :goto_29

    :cond_21
    new-instance p0, Lqnj;

    invoke-direct {p0, v0, v1}, Lqnj;-><init>(Ljava/lang/String;Llnj;)V

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_29
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 p1, 0x0

    :goto_2e
    if-ge p1, p0, :cond_3e

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p1, p1, 0x1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    sget-object v1, Lnnj;->a:Lnnj;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2e

    :cond_3e
    return-void
.end method

.method public final k(Llnj;)V
    .registers 6

    iget-object p0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object v0, p1, Llnj;->a:Lmnj;

    invoke-static {v0}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Llnj;->a:Lmnj;

    invoke-static {v1}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-wide v2, p1, Llnj;->b:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public final l(Ljava/lang/String;Lifd;)V
    .registers 13

    iget-object v0, p0, Lvnj;->g:Lfnj;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lfnj;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lvnj;->g:Lfnj;

    if-eqz v0, :cond_10

    move-object v1, v0

    :cond_10
    iget-object v0, v1, Lfnj;->b:Ljava/util/LinkedHashMap;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/LinkedHashSet;

    invoke-direct {v6}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v7, Ljava/util/LinkedHashSet;

    invoke-direct {v7}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v2, Lpr3;

    const/4 v9, 0x3

    move-object v5, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v2 .. v9}, Lpr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;B)V

    iget-object p0, v5, Lvnj;->e:Ljava/util/ArrayList;

    invoke-static {p0, v2}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_43

    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_4d

    :cond_43
    new-instance p0, Ljbd;

    const/16 p1, 0x11

    invoke-direct {p0, v5, v6, v7, p1}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, p0}, Lvnj;->g(Ljava/lang/Runnable;)V

    :cond_4d
    invoke-virtual {v5}, Lvnj;->a()V

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 p1, 0x0

    :goto_55
    if-ge p1, p0, :cond_63

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 p1, p1, 0x1

    check-cast p2, Lkotlin/jvm/functions/Function1;

    invoke-interface {p2, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_55

    :cond_63
    return-void
.end method

.method public final m(Lknj;)V
    .registers 4

    invoke-virtual {p0, p1}, Lvnj;->e(Lknj;)Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lknj;->b:Llnj;

    if-nez v0, :cond_9

    return-void

    :cond_9
    iget-object v1, p0, Lvnj;->g:Lfnj;

    if-eqz v1, :cond_11

    invoke-virtual {p0, v0, p1}, Lvnj;->d(Ljava/lang/String;Llnj;)V

    return-void

    :cond_11
    new-instance v1, Lsnj;

    invoke-direct {v1, v0, p1}, Lsnj;-><init>(Ljava/lang/String;Llnj;)V

    iget-object p0, p0, Lvnj;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final n(Ljava/util/Set;Ljava/util/Set;)V
    .registers 9

    iget-object v0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_9
    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llnj;

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    iget-object v3, v0, Llnj;->a:Lmnj;

    invoke-static {v3}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v3

    iget-wide v4, v0, Llnj;->b:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v3, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v3, :cond_34

    move-object v3, v1

    :cond_34
    iget-object v0, v0, Llnj;->a:Lmnj;

    invoke-static {v0}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_f

    :cond_3e
    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_44
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_86

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Llnj;

    iget-object v0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_55

    move-object v0, v1

    :cond_55
    iget-object v2, p2, Llnj;->a:Lmnj;

    invoke-static {v2}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p2, Llnj;->a:Lmnj;

    invoke-static {v3}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "=?"

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " AND icon IS NULL"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-wide v4, p2, Llnj;->b:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v2, v3, p2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_44

    :cond_86
    iget-object p1, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez p1, :cond_8b

    move-object p1, v1

    :cond_8b
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8e
    .catchall {:try_start_9 .. :try_end_8e} :catchall_97

    iget-object p0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz p0, :cond_93

    move-object v1, p0

    :cond_93
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :catchall_97
    move-exception p1

    iget-object p0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz p0, :cond_9d

    move-object v1, p0

    :cond_9d
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public final o(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/File;
    .registers 7

    iget-object v0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_9
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "origin"

    invoke-virtual {v0, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez p2, :cond_18

    move-object p2, v1

    :cond_18
    const-string v2, "icons"

    invoke-virtual {p2, v2, v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lvnj;->i(J)Ljava/io/File;

    move-result-object p2
    :try_end_22
    .catchall {:try_start_9 .. :try_end_22} :catchall_51

    :try_start_22
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    new-instance v2, Ljava/io/BufferedOutputStream;

    const/16 v3, 0x2000

    invoke-direct {v2, v0, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_2e} :catch_4c
    .catchall {:try_start_22 .. :try_end_2e} :catchall_51

    :try_start_2e
    invoke-static {p1, v2}, Ls29;->a(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_45

    :try_start_31
    invoke-interface {v2}, Ljava/io/Closeable;->close()V

    iget-object p1, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez p1, :cond_39

    move-object p1, v1

    :cond_39
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_3c} :catch_4c
    .catchall {:try_start_31 .. :try_end_3c} :catchall_51

    iget-object p0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz p0, :cond_41

    move-object v1, p0

    :cond_41
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object p2

    :catchall_45
    move-exception p1

    :try_start_46
    throw p1
    :try_end_47
    .catchall {:try_start_46 .. :try_end_47} :catchall_47

    :catchall_47
    move-exception v0

    :try_start_48
    invoke-static {v2, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_4c} :catch_4c
    .catchall {:try_start_48 .. :try_end_4c} :catchall_51

    :catch_4c
    move-exception p1

    :try_start_4d
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    throw p1
    :try_end_51
    .catchall {:try_start_4d .. :try_end_51} :catchall_51

    :catchall_51
    move-exception p1

    iget-object p0, p0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz p0, :cond_57

    move-object v1, p0

    :cond_57
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method
