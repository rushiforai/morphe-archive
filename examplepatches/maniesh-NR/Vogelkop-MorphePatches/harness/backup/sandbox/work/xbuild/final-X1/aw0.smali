.class public final Law0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lyk6;

.field public final d:Lvk6;

.field public final e:Li12;

.field public final f:Ltz1;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lyk6;Lvk6;Li12;Ltz1;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Law0;->a:Landroid/content/Context;

    iput-object p2, p0, Law0;->b:Lumi;

    iput-object p3, p0, Law0;->c:Lyk6;

    iput-object p4, p0, Law0;->d:Lvk6;

    iput-object p5, p0, Law0;->e:Li12;

    iput-object p6, p0, Law0;->f:Ltz1;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;)V
    .registers 8

    iget-object v0, p0, Law0;->d:Lvk6;

    iget-object v1, v0, Lvk6;->c:Lqie;

    iget-object v2, v0, Lvk6;->b:Lumi;

    new-instance v3, Ljl4;

    const/16 v4, 0x1d

    invoke-direct {v3, v0, v4}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v2, Loml;

    invoke-direct {v2, v0}, Loml;-><init>(Lnml;)V

    const/4 v0, 0x0

    invoke-virtual {v1, v2, v0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    new-instance v1, Lvr9;

    const/4 v2, 0x3

    invoke-direct {v1, p1, v2}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    new-instance p1, La12;

    iget-object v3, p0, Law0;->a:Landroid/content/Context;

    iget-object v4, p0, Law0;->b:Lumi;

    invoke-direct {p1, v3, v4}, La12;-><init>(Landroid/content/Context;Ltcl;)V

    new-instance v3, Lv02;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Lv02;-><init>(Ljava/lang/Runnable;B)V

    new-instance v5, Ly02;

    invoke-direct {v5, p1, v4}, Ly02;-><init>(La12;B)V

    invoke-virtual {p1, v5, v3}, La12;->i(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    iget-object p1, p0, Law0;->e:Li12;

    iget-object v3, p1, Li12;->a:Lumi;

    new-instance v4, Lrml;

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v4, v5, v3}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v3, Lg12;

    const/4 v5, 0x1

    invoke-direct {v3, p1, v5}, Lg12;-><init>(Li12;B)V

    invoke-virtual {v4, v3}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v3

    new-instance v4, Lz02;

    invoke-direct {v4, v1, v5}, Lz02;-><init>(Lvr9;B)V

    invoke-virtual {v3, v4}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v3

    iget-object p1, p1, Li12;->d:Lqie;

    invoke-virtual {v3, p1}, Lplk;->m(Lqie;)Lp1j;

    iget-object p0, p0, Law0;->f:Ltz1;

    iget-object p1, p0, Ltz1;->e:Lnx5;

    new-instance v3, Lr3;

    const/4 v4, 0x4

    invoke-direct {v3, p0, v1, v0, v4}, Lr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p1, v0, v0, v3, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
