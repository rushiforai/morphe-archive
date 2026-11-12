.class public final Ls6k;
.super Lv5k;
.source "SourceFile"


# instance fields
.field public final d:Lne5;

.field public final e:Le7k;

.field public final f:Lagm;

.field public final g:Lo4b;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lfwf;Lijc;Lne5;Le7k;)V
    .registers 9

    sget-object v0, Le6k;->b:Le6k;

    const v1, 0x7f0d03bf

    const-class v2, Lo6k;

    invoke-direct {p0, v2, p3, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p4, p0, Ls6k;->d:Lne5;

    iput-object p5, p0, Ls6k;->e:Le7k;

    new-instance p5, Lagm;

    new-instance v1, Luef;

    const/4 v2, 0x5

    invoke-direct {v1, p2, p1, p0, v2}, Luef;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p5, v1}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p5, p0, Ls6k;->f:Lagm;

    new-instance p1, Lo4b;

    const/16 p5, 0x9

    invoke-direct {p1, p0, v0, p5}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, Ls6k;->g:Lo4b;

    iget-object p1, p4, Lne5;->g:Ljava/lang/Object;

    check-cast p1, Lpde;

    new-instance p4, Ln6k;

    invoke-direct {p4, p3, p0}, Ln6k;-><init>(Lijc;Ls6k;)V

    new-instance p3, Lt7d;

    const/16 p5, 0xf

    invoke-direct {p3, p4, p5}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p2, p3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p2, Lfwf;->b:Lqdc;

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    new-instance p3, Lr8h;

    const/16 p4, 0x11

    const/4 p5, 0x0

    invoke-direct {p3, p2, p0, p5, p4}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {p1, p5, p5, p3, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Ls6k;->f:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lsjm;)V
    .registers 2

    iget-boolean p1, p1, Lsjm;->a:Z

    if-nez p1, :cond_11

    iget-object p0, p0, Ls6k;->d:Lne5;

    iget-object p0, p0, Lne5;->e:Ljava/lang/Object;

    check-cast p0, Lpz6;

    iget-object p0, p0, Lpz6;->e:Lxz6;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lxz6;->b:Z

    iput-boolean p1, p0, Lxz6;->c:Z

    :cond_11
    return-void
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lo6k;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Ls6k;->g:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 1

    iget-object p0, p0, Ls6k;->d:Lne5;

    iget-object p0, p0, Lne5;->g:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv6k;

    iget-boolean p0, p0, Lv6k;->a:Z

    return p0
.end method
