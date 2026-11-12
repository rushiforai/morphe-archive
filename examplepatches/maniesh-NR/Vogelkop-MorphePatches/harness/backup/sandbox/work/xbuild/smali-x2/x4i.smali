.class public final Lx4i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly3i;

.field public final b:Likc;

.field public final c:Lru9;

.field public final d:Lddc;

.field public e:Ld3k;

.field public f:Z

.field public g:Z

.field public final h:Lode;


# direct methods
.method public constructor <init>(Ly3i;Likc;Lru9;Lndc;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    sget-object v1, Ln08;->a:Ln08;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lx4i;->a:Ly3i;

    iput-object p2, p0, Lx4i;->b:Likc;

    iput-object p3, p0, Lx4i;->c:Lru9;

    invoke-interface {p4}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    iput-object p1, p0, Lx4i;->d:Lddc;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lx4i;->h:Lode;

    new-instance p1, Lrmg;

    const/16 p3, 0x1a

    invoke-direct {p1, p0, p3}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw4i;

    const/4 p3, 0x0

    invoke-direct {p0, p1, p3}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p4, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Lk15;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lv4i;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lv4i;

    iget v1, v0, Lv4i;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lv4i;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lv4i;

    invoke-direct {v0, p0, p2}, Lv4i;-><init>(Lx4i;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lv4i;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lv4i;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    iget-object p1, v0, Lv4i;->t:Lk15;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p2, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_46

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p1, Lk15;->a:Ljava/lang/String;

    iput-object p1, v0, Lv4i;->t:Lk15;

    iput v3, v0, Lv4i;->w:I

    iget-object v2, p0, Lx4i;->a:Ly3i;

    invoke-interface {v2, p2, v0}, Ly3i;->f(Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_46

    return-object v1

    :cond_46
    :goto_46
    sget-object v0, Lt0i;->b:Lp0i;

    instance-of v0, p2, Lq0i;

    if-nez v0, :cond_69

    iget-object p0, p0, Lx4i;->c:Lru9;

    iget-object v0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "rewards.claimed_wallpapers"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    iget-object p1, p1, Lk15;->a:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_69
    return-object p2
.end method
