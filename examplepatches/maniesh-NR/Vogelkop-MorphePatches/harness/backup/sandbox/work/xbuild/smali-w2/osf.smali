.class public final Losf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lubk;


# instance fields
.field public final a:Lumi;

.field public final b:Lpsp;

.field public final c:Lshf;

.field public final d:Lqie;

.field public final e:Lmgh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Losf;->a:Lumi;

    new-instance p2, Lpsp;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Losf;->b:Lpsp;

    new-instance p2, Lshf;

    sget-object v0, Llkk;->d:Llkk;

    invoke-direct {p2, p1, v0}, Lshf;-><init>(Landroid/content/Context;Llkk;)V

    iput-object p2, p0, Losf;->c:Lshf;

    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Losf;->d:Lqie;

    new-instance p1, Lmgh;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lmgh;-><init>(B)V

    iput-object p1, p0, Losf;->e:Lmgh;

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;)V
    .registers 5

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v0

    new-instance v1, Lyj0;

    iget-object v2, p0, Losf;->b:Lpsp;

    invoke-direct {v1, v2, v0}, Lyj0;-><init>(Lpsp;Lt56;)V

    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Losf;->e:Lmgh;

    invoke-virtual {p1, v0}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-eqz p1, :cond_17

    return-void

    :cond_17
    new-instance p1, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v1, p0, Losf;->a:Lumi;

    invoke-direct {p1, v0, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lmsf;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {p1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Losf;->d:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final i(Landroidx/fragment/app/r;)V
    .registers 2

    iget-object p0, p0, Losf;->c:Lshf;

    invoke-virtual {p0, p1}, Lshf;->N(Landroidx/fragment/app/r;)V

    return-void
.end method

.method public final m(Landroidx/fragment/app/r;)V
    .registers 2

    iget-object p0, p0, Losf;->c:Lshf;

    invoke-virtual {p0, p1}, Lshf;->f(Landroidx/fragment/app/r;)V

    return-void
.end method

.method public final n(JZ)V
    .registers 7

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Losf;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lh5f;

    invoke-direct {v1, p0, p1, p2, p3}, Lh5f;-><init>(Losf;JZ)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Losf;->d:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final setEnabled(Z)V
    .registers 2

    return-void
.end method
