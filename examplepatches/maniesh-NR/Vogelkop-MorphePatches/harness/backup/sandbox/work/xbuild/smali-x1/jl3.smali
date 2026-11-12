.class public Ljl3;
.super Lll3;
.source "SourceFile"


# instance fields
.field public final b:Li53;

.field public final c:Z

.field public final d:Lqm3;


# direct methods
.method public constructor <init>(Lml3;Li53;Z)V
    .registers 4

    invoke-direct {p0, p1}, Lll3;-><init>(Lal3;)V

    iput-object p2, p0, Ljl3;->b:Li53;

    iput-boolean p3, p0, Ljl3;->c:Z

    check-cast p2, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p2

    invoke-static {p1, p2}, Lqm3;->a(Lml3;Lcom/opera/android/bookmarks/c;)Lqm3;

    move-result-object p1

    iput-object p1, p0, Ljl3;->d:Lqm3;

    return-void
.end method


# virtual methods
.method public a(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 5

    iget-object p0, p0, Lll3;->a:Lal3;

    check-cast p0, Lml3;

    new-instance v0, Lsa2;

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lsa2;-><init>(BZ)V

    invoke-interface {p0, v0}, Lal3;->c(Lzk3;)Z

    iget p0, v0, Lsa2;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f12000e

    invoke-virtual {p1, v1, p0, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3

    iget-object v0, p0, Lll3;->a:Lal3;

    check-cast v0, Lml3;

    invoke-interface {v0}, Lol3;->b()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_13

    invoke-virtual {p0}, Ljl3;->e()I

    move-result p0

    invoke-static {p0, p1}, Lalo;->A(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_13
    invoke-static {p1, v0}, Lalo;->z(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public c(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lll3;->a:Lal3;

    check-cast p0, Lml3;

    invoke-static {p0, p1}, Lalo;->J(Lml3;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public e()I
    .registers 1

    const p0, 0x7f08055a

    return p0
.end method

.method public final f()Ljl3;
    .registers 7

    iget-object v0, p0, Ljl3;->b:Li53;

    move-object v1, v0

    check-cast v1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    iget-object v3, p0, Lll3;->a:Lal3;

    invoke-interface {v3, v2}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v2

    const/4 v3, 0x1

    if-nez v2, :cond_38

    iget-object p0, p0, Ljl3;->d:Lqm3;

    iget-object p0, p0, Lqm3;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkkj;

    iget-wide v4, v2, Ljkj;->a:J

    invoke-virtual {v1, v4, v5, v3}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v2

    instance-of v4, v2, Lml3;

    if-eqz v4, :cond_1a

    check-cast v2, Lml3;

    goto :goto_38

    :cond_33
    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    move-object v2, p0

    :cond_38
    :goto_38
    new-instance p0, Ljl3;

    invoke-direct {p0, v2, v0, v3}, Ljl3;-><init>(Lml3;Li53;Z)V

    return-object p0
.end method
