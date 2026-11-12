.class public final Lc5l;
.super Lk56;
.source "SourceFile"


# instance fields
.field public final t:Landroidx/recyclerview/widget/RecyclerView;

.field public u:Z

.field public v:Z

.field public final w:Ljava/util/LinkedHashSet;

.field public final x:Lpde;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    invoke-direct {p0}, Lk56;-><init>()V

    iput-object p1, p0, Lc5l;->t:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lc5l;->w:Ljava/util/LinkedHashSet;

    new-instance p1, Lpde;

    sget-object v0, Lv08;->a:Lv08;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lc5l;->x:Lpde;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lxkj;->g:Z

    sget-object p1, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    iput-object p1, p0, Lk56;->h:Landroid/view/animation/BaseInterpolator;

    const-wide/16 v0, 0x78

    iput-wide v0, p0, Landroidx/recyclerview/widget/e;->c:J

    iput-wide v0, p0, Landroidx/recyclerview/widget/e;->d:J

    const-wide/16 v0, 0xfa

    iput-wide v0, p0, Landroidx/recyclerview/widget/e;->e:J

    const/16 p1, 0xfa

    iput-short p1, p0, Landroidx/recyclerview/widget/e;->f:S

    return-void
.end method


# virtual methods
.method public final A(J)J
    .registers 3

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public final k(Landroidx/recyclerview/widget/i;)Z
    .registers 4

    iget-boolean v0, p0, Lc5l;->u:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1c

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    iget-boolean p1, p0, Lc5l;->v:Z

    if-nez p1, :cond_1a

    iput-boolean v1, p0, Lc5l;->v:Z

    new-instance p1, Lqlk;

    const/16 v0, 0x1a

    invoke-direct {p1, p0, v0}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lc5l;->t:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    invoke-super {p0, p1}, Lk56;->k(Landroidx/recyclerview/widget/i;)Z

    return v1
.end method

.method public final m(Landroidx/recyclerview/widget/i;IIII)Z
    .registers 8

    iget-object v0, p0, Lc5l;->w:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lc5l;->x:Lpde;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-super/range {p0 .. p5}, Lk56;->m(Landroidx/recyclerview/widget/i;IIII)Z

    move-result p0

    return p0
.end method

.method public final q(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-object v0, p0, Lc5l;->w:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lc5l;->x:Lpde;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final z(JJJ)J
    .registers 7

    invoke-static {p3, p4, p5, p6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p3

    add-long/2addr p3, p1

    const-wide/16 p0, 0x2

    div-long/2addr p3, p0

    return-wide p3
.end method
