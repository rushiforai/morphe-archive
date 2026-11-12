.class public final Lr2i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly3i;

.field public final b:Likc;

.field public final c:Lru9;

.field public final d:Lndc;

.field public e:Z

.field public f:Z

.field public g:Ld3k;

.field public final h:Lkze;


# direct methods
.method public constructor <init>(Ly3i;Likc;Lru9;Lndc;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Ll08;->a:Ll08;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lr2i;->a:Ly3i;

    iput-object p2, p0, Lr2i;->b:Likc;

    iput-object p3, p0, Lr2i;->c:Lru9;

    iput-object p4, p0, Lr2i;->d:Lndc;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lr2i;->f:Z

    new-instance p1, Lkze;

    invoke-direct {p1, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lr2i;->h:Lkze;

    new-instance p1, Lrmg;

    const/16 p3, 0x14

    invoke-direct {p1, p0, p3}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/16 p3, 0x1a

    invoke-direct {p0, p1, p3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p4, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .registers 7

    iget-object p0, p0, Lr2i;->c:Lru9;

    iget-object v0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "rewards.claimed_app_icons"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_10
    :goto_10
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb2h;

    iget-object v3, v2, Lb2h;->d:La2h;

    sget-object v4, La2h;->a:La2h;

    if-ne v3, v4, :cond_10

    iget-object v2, v2, Lb2h;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_28
    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lp2i;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lp2i;

    iget v1, v0, Lp2i;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lp2i;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lp2i;

    invoke-direct {v0, p0, p2}, Lp2i;-><init>(Lr2i;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lp2i;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lp2i;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    iget-object p1, v0, Lp2i;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p2, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_44

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lp2i;->t:Ljava/lang/String;

    iput v3, v0, Lp2i;->w:I

    iget-object p2, p0, Lr2i;->a:Ly3i;

    invoke-interface {p2, p1, v0}, Ly3i;->k(Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    sget-object v0, Lt0i;->b:Lp0i;

    instance-of v0, p2, Lq0i;

    if-nez v0, :cond_65

    iget-object p0, p0, Lr2i;->c:Lru9;

    iget-object v0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "rewards.claimed_app_icons"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_65
    return-object p2
.end method

.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lq2i;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lq2i;

    iget v1, v0, Lq2i;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lq2i;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lq2i;

    invoke-direct {v0, p0, p1}, Lq2i;-><init>(Lr2i;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lq2i;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lq2i;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_58

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lr2i;->e:Z

    if-nez p1, :cond_3c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_3c
    iget-object p1, p0, Lr2i;->b:Likc;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    sget-object v2, Lm18;->b:Lm18;

    if-ne p1, v2, :cond_66

    iget-boolean p1, p0, Lr2i;->f:Z

    if-nez p1, :cond_4d

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_4d
    iput v3, v0, Lq2i;->v:I

    iget-object p1, p0, Lr2i;->a:Ly3i;

    invoke-interface {p1, v0}, Ly3i;->h(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_58

    return-object v1

    :cond_58
    :goto_58
    sget-object v0, Lt0i;->b:Lp0i;

    instance-of v0, p1, Lq0i;

    if-nez v0, :cond_63

    check-cast p1, Lkotlin/Unit;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lr2i;->f:Z

    :cond_63
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_66
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
