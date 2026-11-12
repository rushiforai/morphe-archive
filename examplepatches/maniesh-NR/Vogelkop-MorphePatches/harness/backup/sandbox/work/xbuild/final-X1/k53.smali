.class public final Lk53;
.super Lyvj;
.source "SourceFile"


# instance fields
.field public final b:I

.field public final synthetic c:Lxm3;


# direct methods
.method public constructor <init>(Lxm3;Lxm3;I)V
    .registers 4

    iput-object p1, p0, Lk53;->c:Lxm3;

    invoke-direct {p0, p2}, Lyvj;-><init>(Landroidx/recyclerview/widget/d;)V

    iput p3, p0, Lk53;->b:I

    return-void
.end method

.method public static e(Lqhc;Z)I
    .registers 6

    iget v0, p0, Lqhc;->b:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_2d

    const/16 v1, 0x8

    if-eq v0, v1, :cond_2d

    const/16 v1, 0x9

    if-eq v0, v1, :cond_2d

    const/4 v1, 0x3

    if-ne v0, v1, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 v2, 0x2

    const/4 v3, 0x4

    if-ne v0, v3, :cond_17

    return v2

    :cond_17
    if-ne v0, v2, :cond_1a

    return v1

    :cond_1a
    if-eqz p1, :cond_25

    iget-object p1, p0, Lqhc;->a:Lal3;

    invoke-interface {p1}, Lol3;->g()Z

    move-result p1

    if-eqz p1, :cond_25

    return v3

    :cond_25
    iget p0, p0, Lqhc;->b:I

    const/4 p1, 0x6

    if-ne p0, p1, :cond_2c

    const/4 p0, 0x5

    return p0

    :cond_2c
    return p1

    :cond_2d
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 12

    check-cast p1, Lqhc;

    check-cast p2, Lqhc;

    iget-object v0, p0, Lk53;->c:Lxm3;

    iget-object v1, v0, Lxm3;->l:Lgn3;

    invoke-virtual {p1, p2}, Lqhc;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, p1, Lqhc;->a:Lal3;

    const/4 v4, 0x0

    if-nez v2, :cond_52

    iget-object v2, v0, Lxm3;->c:Lml3;

    const/4 v5, 0x3

    const/4 v6, 0x1

    if-eqz v2, :cond_1d

    invoke-interface {v2}, Lml3;->h()Z

    move-result v2

    if-nez v2, :cond_27

    :cond_1d
    iget v2, v0, Lxm3;->i:I

    if-ne v2, v5, :cond_27

    invoke-virtual {v1}, Lgn3;->e()Z

    move-result v2

    if-eqz v2, :cond_29

    :cond_27
    move v2, v6

    goto :goto_2a

    :cond_29
    move v2, v4

    :goto_2a
    invoke-static {p1, v2}, Lk53;->e(Lqhc;Z)I

    move-result v7

    invoke-static {p2, v2}, Lk53;->e(Lqhc;Z)I

    move-result v2

    iget-object v8, p2, Lqhc;->a:Lal3;

    sub-int/2addr v7, v2

    if-eqz v7, :cond_38

    return v7

    :cond_38
    iget-object v1, v1, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget p0, p0, Lk53;->b:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eq p0, v6, :cond_ad

    const/4 v2, 0x2

    const/4 v7, -0x1

    if-eq p0, v2, :cond_80

    if-eq p0, v5, :cond_6e

    const/4 p1, 0x4

    if-eq p0, p1, :cond_60

    const/4 p1, 0x5

    if-eq p0, p1, :cond_53

    :cond_52
    return v4

    :cond_53
    invoke-interface {v3}, Lal3;->d()J

    move-result-wide p0

    invoke-interface {v8}, Lal3;->d()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0

    :cond_60
    invoke-interface {v3}, Lal3;->d()J

    move-result-wide p0

    invoke-interface {v8}, Lal3;->d()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    mul-int/2addr p0, v7

    return p0

    :cond_6e
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object p0

    invoke-virtual {p1, v1}, Lqhc;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v1}, Lqhc;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    mul-int/2addr p0, v7

    return p0

    :cond_80
    iget-object p0, v0, Lxm3;->a:Lcom/opera/android/bookmarks/h;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    iget-object p0, v0, Lxm3;->d:Lc5o;

    iget-object p1, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_9e

    iget-object p1, p0, Lc5o;->b:Ljava/lang/Object;

    check-cast p1, Lxm3;

    iget-object p1, p1, Lxm3;->c:Lml3;

    if-nez p1, :cond_98

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_9c

    :cond_98
    invoke-interface {p1}, Lml3;->i()Ljava/util/List;

    move-result-object p1

    :goto_9c
    iput-object p1, p0, Lc5o;->a:Ljava/lang/Object;

    :cond_9e
    invoke-interface {p1, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    invoke-interface {p1, v8}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ge p0, p1, :cond_a9

    return v7

    :cond_a9
    if-ne p0, p1, :cond_ac

    return v4

    :cond_ac
    return v6

    :cond_ad
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object p0

    invoke-virtual {p1, v1}, Lqhc;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v1}, Lqhc;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method
