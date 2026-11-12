.class public final Lrz3;
.super Ltjf;
.source "SourceFile"


# instance fields
.field public final j:Lqz3;

.field public final k:Lk11;

.field public final l:I

.field public final m:Z

.field public final n:J


# direct methods
.method public constructor <init>(Lqz3;Landroid/view/View;Lcv2;Lk11;)V
    .registers 5

    invoke-direct {p0, p2, p1, p3}, Ltjf;-><init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;)V

    iput-object p1, p0, Lrz3;->j:Lqz3;

    iput-object p4, p0, Lrz3;->k:Lk11;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 p2, 0x40c00000    # 6.0f

    invoke-static {p1, p2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    iput p1, p0, Lrz3;->l:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrz3;->m:Z

    const-wide p1, 0x7fffffffffffffffL

    iput-wide p1, p0, Lrz3;->n:J

    return-void
.end method


# virtual methods
.method public final b()I
    .registers 1

    iget p0, p0, Lrz3;->l:I

    return p0
.end method

.method public final d()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final e()Lk11;
    .registers 1

    iget-object p0, p0, Lrz3;->k:Lk11;

    return-object p0
.end method

.method public final g()Z
    .registers 1

    iget-boolean p0, p0, Lrz3;->m:Z

    return p0
.end method

.method public final h()J
    .registers 3

    iget-wide v0, p0, Lrz3;->n:J

    return-wide v0
.end method
