.class public final Lgok;
.super Lvi7;
.source "SourceFile"


# instance fields
.field public final synthetic u:Lhok;


# direct methods
.method public constructor <init>(Lhok;Lumi;IZLhok;)V
    .registers 13

    iput-object p1, p0, Lgok;->u:Lhok;

    const/16 v4, 0x1f4

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move v3, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lvi7;-><init>(Lumi;IZILns8;Z)V

    return-void
.end method


# virtual methods
.method public final h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I
    .registers 5

    instance-of v0, p2, Lfs8;

    if-eqz v0, :cond_a

    move-object v0, p2

    check-cast v0, Lfs8;

    iget-object v0, v0, Lfs8;->f:Lhq8;

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    if-eqz v0, :cond_18

    check-cast v0, Lqok;

    iget-object v0, v0, Lqok;->e:Look;

    iget-byte v0, v0, Look;->d:B

    const/4 v1, 0x3

    if-ne v0, v1, :cond_18

    const/4 p0, 0x0

    return p0

    :cond_18
    invoke-super {p0, p1, p2}, Lblb;->h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I

    move-result p0

    return p0
.end method

.method public final v(Landroidx/recyclerview/widget/i;Lti7;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lvi7;->v(Landroidx/recyclerview/widget/i;Lti7;)V

    instance-of p2, p1, Lfs8;

    if-eqz p2, :cond_c

    check-cast p1, Lfs8;

    iget-object p1, p1, Lfs8;->f:Lhq8;

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    if-eqz p1, :cond_15

    iget-object p0, p0, Lgok;->u:Lhok;

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lhok;->b0(Lhq8;Z)V

    :cond_15
    return-void
.end method
