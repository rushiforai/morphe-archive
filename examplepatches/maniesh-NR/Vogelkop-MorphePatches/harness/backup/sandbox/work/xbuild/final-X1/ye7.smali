.class public final Lye7;
.super Lyvj;
.source "SourceFile"


# instance fields
.field public final b:Lvvj;


# direct methods
.method public constructor <init>(Lze7;Lvvj;)V
    .registers 3

    invoke-direct {p0, p1}, Lyvj;-><init>(Landroidx/recyclerview/widget/d;)V

    iput-object p2, p0, Lye7;->b:Lvvj;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    check-cast p1, Lxe7;

    check-cast p2, Lxe7;

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5

    check-cast p1, Lxe7;

    check-cast p2, Lxe7;

    iget-wide p0, p1, Lxe7;->a:J

    iget-wide v0, p2, Lxe7;->a:J

    cmp-long p0, p0, v0

    if-nez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 10

    check-cast p1, Lxe7;

    check-cast p2, Lxe7;

    iget-boolean v0, p1, Lxe7;->c:Z

    iget-boolean v1, p2, Lxe7;->c:Z

    iget-wide v2, p2, Lxe7;->a:J

    if-eq v0, v1, :cond_12

    if-eqz v0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, -0x1

    return p0

    :cond_12
    iget-wide v0, p1, Lxe7;->a:J

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-ltz v6, :cond_2b

    cmp-long v4, v2, v4

    if-ltz v4, :cond_2b

    iget-object p0, p0, Lye7;->b:Lvvj;

    iget-object p0, p0, Lvvj;->b:Lqw4;

    iget-object p1, p1, Lxe7;->d:Lre7;

    iget-object p2, p2, Lxe7;->d:Lre7;

    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    return p0

    :cond_2b
    invoke-static {v0, v1, v2, v3}, Lcs5;->p(JJ)I

    move-result p0

    return p0
.end method
