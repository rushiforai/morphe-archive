.class public final Ltmk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:J

.field public static final m:J


# instance fields
.field public final a:Lmcj;

.field public final b:Lshf;

.field public final c:Lxbf;

.field public final d:Ljava/util/Set;

.field public final e:Ldnj;

.field public final f:Lnv1;

.field public final g:Lkze;

.field public final h:Lode;

.field public final i:Ljava/util/LinkedHashSet;

.field public j:Z

.field public k:Ljava/lang/Iterable;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->g:Lun7;

    const/16 v1, 0x18

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    sput-wide v2, Ltmk;->l:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sput-wide v0, Ltmk;->m:J

    return-void
.end method

.method public constructor <init>(Lmcj;Lshf;Lxbf;Ljava/util/Set;Ldnj;Lnv1;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltmk;->a:Lmcj;

    iput-object p2, p0, Ltmk;->b:Lshf;

    iput-object p3, p0, Ltmk;->c:Lxbf;

    iput-object p4, p0, Ltmk;->d:Ljava/util/Set;

    iput-object p5, p0, Ltmk;->e:Ldnj;

    iput-object p6, p0, Ltmk;->f:Lnv1;

    new-instance p2, Lkze;

    sget-object p3, Lwvg;->k:Lwvg;

    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Ltmk;->g:Lkze;

    new-instance p2, Lode;

    invoke-direct {p2}, Lekc;-><init>()V

    iput-object p2, p0, Ltmk;->h:Lode;

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p2, p0, Ltmk;->i:Ljava/util/LinkedHashSet;

    new-instance p2, Lqlk;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lmcj;->b:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-virtual {p0, p2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;JLeof;)V
    .registers 13

    if-nez p1, :cond_c

    new-instance p0, Ldk8;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Ldk8;-><init>(I)V

    invoke-virtual {p5, p0}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :cond_c
    new-instance v6, Leof;

    const/16 v0, 0x18

    invoke-direct {v6, p0, p5, v0}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v5, p0, Ltmk;->b:Lshf;

    iget-object p0, v5, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lwth;

    new-instance v0, Lza;

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    invoke-direct/range {v0 .. v6}, Lza;-><init>(Ljava/lang/String;Ljava/lang/String;JLshf;Leof;)V

    invoke-virtual {p0, v0}, Lwth;->w(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final b(Ljava/util/List;Lnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p2, Lnmk;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lnmk;

    iget v1, v0, Lnmk;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lnmk;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lnmk;

    invoke-direct {v0, p0, p2}, Lnmk;-><init>(Ltmk;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lnmk;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lnmk;->y:I

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v11, 0x0

    if-eqz v2, :cond_4f

    if-eq v2, v6, :cond_47

    if-eq v2, v5, :cond_39

    if-ne v2, v4, :cond_33

    iget-object p0, v0, Lnmk;->t:Ljava/util/List;

    check-cast p0, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    return-object p2

    :cond_33
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_39
    iget-object p1, v0, Lnmk;->v:Ljava/util/Iterator;

    iget-object v2, v0, Lnmk;->u:Ljava/lang/String;

    iget-object v6, v0, Lnmk;->t:Ljava/util/List;

    check-cast v6, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object v9, v2

    goto/16 :goto_be

    :cond_47
    iget-object p1, v0, Lnmk;->t:Ljava/util/List;

    check-cast p1, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_79

    :cond_4f
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_5e

    new-instance p0, Lclk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_5e
    move-object p2, p1

    check-cast p2, Ljava/util/List;

    iput-object p2, v0, Lnmk;->t:Ljava/util/List;

    iput v6, v0, Lnmk;->y:I

    sget-object p2, Lbb7;->a:Lcv6;

    sget-object p2, Ls6d;->a:Ld7a;

    iget-object p2, p2, Ld7a;->e:Ld7a;

    new-instance v2, Lksl;

    const/4 v6, 0x0

    iget-object v7, p0, Ltmk;->c:Lxbf;

    invoke-direct {v2, v7, v11, v6}, Lksl;-><init>(Lxbf;Lmt5;B)V

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_f2

    :goto_79
    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_83

    new-instance p0, Lclk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_83
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->H(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v6, p1

    move-object v9, p2

    move-object p1, v2

    :cond_90
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    iget-object v8, p0, Ltmk;->b:Lshf;

    if-eqz p2, :cond_cf

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    move-object v10, p2

    check-cast v10, Ljava/lang/String;

    sget-object p2, Lenk;->a:Lenk;

    move-object p2, v6

    check-cast p2, Ljava/util/List;

    iput-object p2, v0, Lnmk;->t:Ljava/util/List;

    iput-object v9, v0, Lnmk;->u:Ljava/lang/String;

    iput-object p1, v0, Lnmk;->v:Ljava/util/Iterator;

    iput v5, v0, Lnmk;->y:I

    sget-object p2, Lbb7;->a:Lcv6;

    sget-object p2, Ls6d;->a:Ld7a;

    iget-object p2, p2, Ld7a;->e:Ld7a;

    new-instance v7, Lhnk;

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lhnk;-><init>(Lshf;Ljava/lang/String;Ljava/lang/String;Lmt5;B)V

    invoke-static {p2, v7, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_f2

    :goto_be
    check-cast p2, Lelk;

    if-eqz p2, :cond_cb

    instance-of v2, p2, Lclk;

    if-nez v2, :cond_90

    instance-of p0, p2, Ldlk;

    if-eqz p0, :cond_cb

    return-object p2

    :cond_cb
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_cf
    sget-object p0, Lenk;->a:Lenk;

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    move-object v10, p0

    check-cast v10, Ljava/lang/String;

    iput-object v11, v0, Lnmk;->t:Ljava/util/List;

    iput-object v11, v0, Lnmk;->u:Ljava/lang/String;

    iput-object v11, v0, Lnmk;->v:Ljava/util/Iterator;

    iput v4, v0, Lnmk;->y:I

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance v7, Lhnk;

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lhnk;-><init>(Lshf;Ljava/lang/String;Ljava/lang/String;Lmt5;B)V

    invoke-static {p0, v7, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_f3

    :cond_f2
    return-object v1

    :cond_f3
    return-object p0
.end method

.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p1, Lomk;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lomk;

    iget v1, v0, Lomk;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lomk;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lomk;

    invoke-direct {v0, p0, p1}, Lomk;-><init>(Ltmk;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lomk;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lomk;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_35

    if-eq v2, v5, :cond_31

    if-ne v2, v4, :cond_2b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    return-object p1

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_31
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_42

    :cond_35
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v5, v0, Lomk;->v:I

    iget-object p1, p0, Ltmk;->c:Lxbf;

    invoke-static {p1, v0}, Lw0h;->d(Lxbf;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_6c

    :goto_42
    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_4c

    new-instance p0, Lclk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_4c
    iget-object v2, p0, Ltmk;->a:Lmcj;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lmcj;->p(J)V

    iput v4, v0, Lomk;->v:I

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Ls6d;->a:Ld7a;

    iget-object v2, v2, Ld7a;->e:Ld7a;

    new-instance v4, Lr8h;

    const/16 v5, 0x18

    iget-object p0, p0, Ltmk;->b:Lshf;

    invoke-direct {v4, p0, p1, v3, v5}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v2, v4, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6d

    :cond_6c
    return-object v1

    :cond_6d
    return-object p0
.end method

.method public final d(Lprh;Lzzh;)V
    .registers 7

    if-eqz p1, :cond_50

    instance-of v0, p1, Lnrh;

    iget-object v1, p0, Ltmk;->i:Ljava/util/LinkedHashSet;

    if-eqz v0, :cond_14

    move-object v0, p1

    check-cast v0, Lnrh;

    iget-object v0, v0, Lnrh;->a:Ljava/lang/String;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ltmk;->l()V

    goto :goto_4c

    :cond_14
    instance-of v0, p1, Lorh;

    if-eqz v0, :cond_50

    move-object v0, p1

    check-cast v0, Lorh;

    iget-object v0, v0, Lorh;->a:Ljava/lang/String;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Ltmk;->a:Lmcj;

    iget-object v1, v1, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "acked_tokens"

    invoke-static {v2, v3}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_49
    const/4 v0, 0x1

    iput-boolean v0, p0, Ltmk;->j:Z

    :goto_4c
    invoke-virtual {p2, p1}, Lzzh;->run(Ljava/lang/Object;)V

    return-void

    :cond_50
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final e(Lelk;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p2, Lpmk;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lpmk;

    iget v1, v0, Lpmk;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lpmk;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lpmk;

    invoke-direct {v0, p0, p2}, Lpmk;-><init>(Ltmk;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lpmk;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lpmk;->w:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_31

    if-ne v2, v3, :cond_2b

    iget-object p1, v0, Lpmk;->t:Lelk;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_bc

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_31
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz p1, :cond_e0

    instance-of p2, p1, Lclk;

    const/4 v2, 0x0

    if-eqz p2, :cond_42

    iput-boolean v2, p0, Ltmk;->j:Z

    invoke-virtual {p0}, Ltmk;->l()V

    goto/16 :goto_dd

    :cond_42
    instance-of p2, p1, Ldlk;

    if-eqz p2, :cond_e0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object p2, p0, Ltmk;->a:Lmcj;

    iget-object v7, p2, Lmcj;->a:Ljava/lang/Object;

    check-cast v7, Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "last_response"

    invoke-interface {v7, v8, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p2, v2}, Lmcj;->o(Z)V

    move-object p2, p1

    check-cast p2, Ldlk;

    iget-object v5, p2, Ldlk;->a:Ljava/lang/String;

    invoke-static {v5}, Lb8h;->l(Ljava/lang/String;)Ls6h;

    move-result-object v5

    iget-boolean p2, p2, Ldlk;->b:Z

    if-nez p2, :cond_d6

    if-eqz v5, :cond_7f

    iget-object p2, v5, Ls6h;->a:Ljava/lang/Object;

    check-cast p2, Lcsh;

    invoke-virtual {p2}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_d6

    :cond_7f
    iget-object p2, p0, Ltmk;->f:Lnv1;

    invoke-virtual {p2}, Lnv1;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_d6

    iget-object p2, p0, Ltmk;->k:Ljava/lang/Iterable;

    if-nez p2, :cond_93

    move-object v6, v4

    goto :goto_9e

    :cond_93
    new-instance v5, Lf15;

    const/4 v6, 0x2

    invoke-direct {v5, p0, v6}, Lf15;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lzlb;

    invoke-direct {v6, p2, v5, v2}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    :goto_9e
    if-eqz v6, :cond_a5

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p2

    goto :goto_a6

    :cond_a5
    move-object p2, v4

    :goto_a6
    move-object v2, p2

    check-cast v2, Ljava/util/Collection;

    if-eqz v2, :cond_d6

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d6

    iput-object p1, v0, Lpmk;->t:Lelk;

    iput v3, v0, Lpmk;->w:I

    invoke-virtual {p0, p2, v0}, Ltmk;->k(Ljava/util/List;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_bc

    return-object v1

    :cond_bc
    :goto_bc
    check-cast p2, Lwfc;

    if-eqz p2, :cond_d2

    instance-of v0, p2, Lufc;

    if-nez v0, :cond_d6

    instance-of p1, p2, Lvfc;

    if-eqz p1, :cond_d2

    check-cast p2, Lvfc;

    iget-object p1, p2, Lvfc;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ltmk;->g(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_d2
    invoke-static {}, Lh9o;->p()V

    return-object v4

    :cond_d6
    check-cast p1, Ldlk;

    iget-object p1, p1, Ldlk;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ltmk;->g(Ljava/lang/String;)V

    :goto_dd
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_e0
    invoke-static {}, Lh9o;->p()V

    return-object v4
.end method

.method public final f()Z
    .registers 15

    iget-object v0, p0, Ltmk;->a:Lmcj;

    iget-object v1, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "last_response"

    const-wide/16 v4, -0x1

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v10, v2, v8

    const/4 v11, 0x0

    if-ltz v10, :cond_2b

    cmp-long v10, v2, v6

    if-gtz v10, :cond_2b

    sub-long v2, v6, v2

    sget-wide v12, Ltmk;->l:J

    cmp-long v2, v2, v12

    if-ltz v2, :cond_64

    :cond_2b
    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "stale"

    invoke-interface {v2, v3, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3b

    return v3

    :cond_3b
    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "last_request"

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    cmp-long v4, v1, v8

    if-ltz v4, :cond_64

    cmp-long v4, v1, v6

    if-gtz v4, :cond_64

    sub-long/2addr v6, v1

    iget-object p0, p0, Ltmk;->e:Ldnj;

    invoke-virtual {p0}, Ldnj;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    cmp-long p0, v6, v1

    if-gez p0, :cond_64

    invoke-virtual {v0, v3}, Lmcj;->o(Z)V

    return v3

    :cond_64
    return v11
.end method

.method public final g(Ljava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    iput-boolean v0, p0, Ltmk;->j:Z

    invoke-static {p1}, Lb8h;->l(Ljava/lang/String;)Ls6h;

    move-result-object v0

    if-eqz v0, :cond_4f

    iget-object v1, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v1, Lcsh;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v1

    iget-object v2, p0, Ltmk;->a:Lmcj;

    if-eqz v1, :cond_4c

    iget-object v0, v0, Ls6h;->b:Ljava/lang/Object;

    check-cast v0, Lcsh;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, v2, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "info_data"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_36

    const-string v0, ""

    :cond_36
    invoke-virtual {p0, v0}, Ltmk;->h(Ljava/lang/String;)Lwvg;

    move-result-object v0

    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Lwvg;->a()Z

    move-result v0

    if-eqz v0, :cond_4c

    new-instance v0, Leb8;

    invoke-direct {v0, v3}, Leb8;-><init>(Lek5;)V

    iget-object v1, p0, Ltmk;->h:Lode;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_4c
    invoke-virtual {v2, p1}, Lmcj;->n(Ljava/lang/String;)V

    :cond_4f
    invoke-virtual {p0}, Ltmk;->l()V

    return-void
.end method

.method public final h(Ljava/lang/String;)Lwvg;
    .registers 20

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lb8h;->l(Ljava/lang/String;)Ls6h;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return-object v2

    :cond_a
    iget-object v3, v1, Ls6h;->a:Ljava/lang/Object;

    check-cast v3, Lcsh;

    invoke-virtual {v3}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v4

    iget-object v5, v0, Ltmk;->d:Ljava/util/Set;

    const/4 v6, 0x0

    if-eqz v4, :cond_3f

    iget-object v1, v1, Ls6h;->b:Ljava/lang/Object;

    check-cast v1, Lcsh;

    invoke-virtual {v1, v6}, Lh1b;->u(I)La1b;

    move-result-object v1

    :cond_1f
    :goto_1f
    invoke-virtual {v1}, Lq4;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_63

    invoke-virtual {v1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Li7b;

    iget-object v7, v4, Li7b;->b:Ljava/lang/String;

    invoke-interface {v5, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1f

    if-eqz v2, :cond_3d

    iget-wide v7, v4, Li7b;->d:J

    iget-wide v9, v2, Li7b;->d:J

    cmp-long v7, v7, v9

    if-lez v7, :cond_1f

    :cond_3d
    move-object v2, v4

    goto :goto_1f

    :cond_3f
    invoke-virtual {v3, v6}, Lh1b;->u(I)La1b;

    move-result-object v1

    :cond_43
    :goto_43
    invoke-virtual {v1}, Lq4;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_63

    invoke-virtual {v1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Li7b;

    iget-object v7, v4, Li7b;->b:Ljava/lang/String;

    invoke-interface {v5, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_43

    if-eqz v2, :cond_61

    iget-wide v7, v4, Li7b;->c:J

    iget-wide v9, v2, Li7b;->c:J

    cmp-long v7, v7, v9

    if-lez v7, :cond_43

    :cond_61
    move-object v2, v4

    goto :goto_43

    :cond_63
    move-object v8, v2

    if-nez v8, :cond_69

    sget-object v0, Lwvg;->l:Lwvg;

    return-object v0

    :cond_69
    invoke-virtual {v3}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_75

    iget-byte v1, v8, Li7b;->e:B

    const/4 v2, 0x6

    if-eq v1, v2, :cond_75

    const/4 v6, 0x1

    :cond_75
    move v11, v6

    iget-object v1, v0, Ltmk;->a:Lmcj;

    iget-object v1, v1, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "last_extend_response"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-virtual {v0}, Ltmk;->f()Z

    move-result v16

    const/16 v17, 0x1

    sget-wide v14, Ltmk;->m:J

    invoke-static/range {v8 .. v17}, Lxvg;->x(Li7b;JZJJZZ)Lwvg;

    move-result-object v0

    return-object v0
.end method

.method public final i(Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p1, Lqmk;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lqmk;

    iget v1, v0, Lqmk;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lqmk;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lqmk;

    invoke-direct {v0, p0, p1}, Lqmk;-><init>(Ltmk;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lqmk;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lqmk;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_35

    if-eq v2, v5, :cond_31

    if-ne v2, v4, :cond_2b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_82

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_31
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_77

    :cond_35
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Ltmk;->k:Ljava/lang/Iterable;

    const/4 v2, 0x0

    if-eqz p1, :cond_48

    new-instance v3, Lf15;

    invoke-direct {v3, p0, v4}, Lf15;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lzlb;

    invoke-direct {v6, p1, v3, v2}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    move-object v3, v6

    :cond_48
    if-eqz v3, :cond_85

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_85

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    iget-object v6, p0, Ltmk;->a:Lmcj;

    if-eqz v3, :cond_68

    iput-boolean v2, p0, Ltmk;->j:Z

    const-string p1, ""

    invoke-virtual {v6, p1}, Lmcj;->n(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Lmcj;->o(Z)V

    invoke-virtual {p0}, Ltmk;->l()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v6, v2, v3}, Lmcj;->p(J)V

    iput v5, v0, Lqmk;->v:I

    invoke-virtual {p0, p1, v0}, Ltmk;->b(Ljava/util/List;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_81

    :goto_77
    check-cast p1, Lelk;

    iput v4, v0, Lqmk;->v:I

    invoke-virtual {p0, p1, v0}, Ltmk;->e(Lelk;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_82

    :cond_81
    return-object v1

    :cond_82
    :goto_82
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_85
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final j(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lrmk;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lrmk;

    iget v1, v0, Lrmk;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lrmk;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lrmk;

    invoke-direct {v0, p0, p1}, Lrmk;-><init>(Ltmk;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lrmk;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lrmk;->v:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_35

    if-eq v2, v4, :cond_31

    if-ne v2, v3, :cond_2a

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4b

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_31
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_40

    :cond_35
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v4, v0, Lrmk;->v:I

    invoke-virtual {p0, v0}, Ltmk;->c(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_4a

    :goto_40
    check-cast p1, Lelk;

    iput v3, v0, Lrmk;->v:I

    invoke-virtual {p0, p1, v0}, Ltmk;->e(Lelk;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4b

    :cond_4a
    return-object v1

    :cond_4b
    :goto_4b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final k(Ljava/util/List;Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p2, Lsmk;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lsmk;

    iget v1, v0, Lsmk;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lsmk;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lsmk;

    invoke-direct {v0, p0, p2}, Lsmk;-><init>(Ltmk;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lsmk;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lsmk;->y:I

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_4e

    if-eq v2, v6, :cond_46

    if-eq v2, v5, :cond_38

    if-ne v2, v4, :cond_32

    iget-object p0, v0, Lsmk;->t:Ljava/util/List;

    check-cast p0, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    return-object p2

    :cond_32
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_38
    iget-object p1, v0, Lsmk;->v:Ljava/util/Iterator;

    iget-object v2, v0, Lsmk;->u:Ljava/lang/String;

    iget-object v6, v0, Lsmk;->t:Ljava/util/List;

    check-cast v6, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object v8, v2

    goto/16 :goto_b4

    :cond_46
    iget-object p1, v0, Lsmk;->t:Ljava/util/List;

    check-cast p1, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_4e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_5d

    new-instance p0, Lufc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_5d
    move-object p2, p1

    check-cast p2, Ljava/util/List;

    iput-object p2, v0, Lsmk;->t:Ljava/util/List;

    iput v6, v0, Lsmk;->y:I

    iget-object p2, p0, Ltmk;->c:Lxbf;

    invoke-static {p2, v0}, Lw0h;->d(Lxbf;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_ea

    :goto_6c
    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_76

    new-instance p0, Lufc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_76
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->H(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v8, p2

    move-object p2, p1

    move-object p1, v2

    :goto_83
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    iget-object v7, p0, Ltmk;->b:Lshf;

    const/4 v10, 0x0

    if-eqz v2, :cond_c7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Ljava/lang/String;

    sget-object v2, Lenk;->a:Lenk;

    move-object v2, p2

    check-cast v2, Ljava/util/List;

    iput-object v2, v0, Lsmk;->t:Ljava/util/List;

    iput-object v8, v0, Lsmk;->u:Ljava/lang/String;

    iput-object p1, v0, Lsmk;->v:Ljava/util/Iterator;

    iput v5, v0, Lsmk;->y:I

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Ls6d;->a:Ld7a;

    iget-object v2, v2, Ld7a;->e:Ld7a;

    new-instance v6, Lhnk;

    const/4 v11, 0x1

    invoke-direct/range {v6 .. v11}, Lhnk;-><init>(Lshf;Ljava/lang/String;Ljava/lang/String;Lmt5;B)V

    invoke-static {v2, v6, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_ea

    move-object v6, p2

    move-object p2, v2

    :goto_b4
    check-cast p2, Lwfc;

    if-eqz p2, :cond_c3

    instance-of v2, p2, Lufc;

    if-eqz v2, :cond_be

    move-object p2, v6

    goto :goto_83

    :cond_be
    instance-of p0, p2, Lvfc;

    if-eqz p0, :cond_c3

    return-object p2

    :cond_c3
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_c7
    sget-object p0, Lenk;->a:Lenk;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    move-object v9, p0

    check-cast v9, Ljava/lang/String;

    iput-object v10, v0, Lsmk;->t:Ljava/util/List;

    iput-object v10, v0, Lsmk;->u:Ljava/lang/String;

    iput-object v10, v0, Lsmk;->v:Ljava/util/Iterator;

    iput v4, v0, Lsmk;->y:I

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance v6, Lhnk;

    const/4 v11, 0x1

    invoke-direct/range {v6 .. v11}, Lhnk;-><init>(Lshf;Ljava/lang/String;Ljava/lang/String;Lmt5;B)V

    invoke-static {p0, v6, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_eb

    :cond_ea
    return-object v1

    :cond_eb
    return-object p0
.end method

.method public final l()V
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Ltmk;->a:Lmcj;

    iget-object v1, v1, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    iget-object v2, v0, Ltmk;->i:Ljava/util/LinkedHashSet;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7e

    iget-boolean v2, v0, Ltmk;->j:Z

    if-nez v2, :cond_7e

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "info_data"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_29

    invoke-virtual {v0, v2}, Ltmk;->h(Ljava/lang/String;)Lwvg;

    move-result-object v2

    if-nez v2, :cond_80

    :cond_29
    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "range_start"

    const-wide/16 v4, -0x1

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    const-wide/16 v2, 0x0

    cmp-long v2, v8, v2

    if-ltz v2, :cond_7b

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "range_end"

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "range_cancelled"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    new-instance v1, Lwvg;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0}, Ltmk;->f()Z

    move-result v15

    const/16 v16, 0x1

    sget-wide v12, Ltmk;->m:J

    invoke-static/range {v6 .. v16}, Lxvg;->k(JJJJZZI)I

    move-result v14

    const/16 v18, 0x0

    const/16 v19, 0x0

    const-string v7, "unknown"

    const-wide/16 v12, -0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v6, v1

    invoke-direct/range {v6 .. v19}, Lwvg;-><init>(Ljava/lang/String;JJJILa0f;Lck8;Ljmk;Lo9g;Ljava/lang/String;)V

    move-object v2, v6

    goto :goto_80

    :cond_7b
    sget-object v2, Lwvg;->l:Lwvg;

    goto :goto_80

    :cond_7e
    sget-object v2, Lwvg;->m:Lwvg;

    :cond_80
    :goto_80
    iget-object v0, v0, Ltmk;->g:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lwvg;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8d

    return-void

    :cond_8d
    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
