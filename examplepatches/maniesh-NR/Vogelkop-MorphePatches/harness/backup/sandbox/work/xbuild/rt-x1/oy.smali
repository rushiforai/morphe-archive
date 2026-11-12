.class public abstract Loy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/io/Serializable;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Li5o;ILandroid/net/Uri;Ljava/lang/String;)V
    .registers 5

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Loy;->j:Ljava/lang/Object;

    .line 52
    iput-boolean p2, p0, Loy;->a:Z

    .line 53
    iput-object p3, p0, Loy;->b:Ljava/lang/Object;

    .line 54
    iput-object p4, p0, Loy;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lysi;Lshf;Ljava/util/Locale;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loy;->b:Ljava/lang/Object;

    iput-object p2, p0, Loy;->c:Ljava/lang/Object;

    iput-object p3, p0, Loy;->d:Ljava/io/Serializable;

    new-instance p2, Lkze;

    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Loy;->e:Ljava/lang/Object;

    new-instance p2, Lh42;

    invoke-direct {p2}, Lh42;-><init>()V

    iput-object p2, p0, Loy;->f:Ljava/lang/Object;

    new-instance p3, Llwc;

    invoke-direct {p3, p0}, Llwc;-><init>(Loy;)V

    iput-object p3, p0, Loy;->g:Ljava/lang/Object;

    invoke-interface {p1}, Lysi;->m()Lekc;

    move-result-object p1

    new-instance p3, Ltji;

    const/4 v0, 0x5

    invoke-direct {p3, p0, v0}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw4i;

    invoke-direct {p0, p3, v0}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1, p0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method

.method public static synthetic k(Loy;Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 5

    const v0, 0x7f140082

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Loy;->j(Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;II)V

    return-void
.end method


# virtual methods
.method public final a()Ltn;
    .registers 13

    iget-object v0, p0, Loy;->g:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_a

    const-string v0, "com.opera.android"

    iput-object v0, p0, Loy;->g:Ljava/lang/Object;

    :cond_a
    move-object v2, v0

    iget-object v0, p0, Loy;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, "unknown"

    if-nez v0, :cond_17

    iput-object v1, p0, Loy;->f:Ljava/lang/Object;

    move-object v4, v1

    goto :goto_18

    :cond_17
    move-object v4, v0

    :goto_18
    iget-object v0, p0, Loy;->i:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_22

    iput-object v1, p0, Loy;->i:Ljava/lang/Object;

    move-object v5, v1

    goto :goto_23

    :cond_22
    move-object v5, v0

    :goto_23
    new-instance v0, Ltn;

    iget-object v1, p0, Loy;->j:Ljava/lang/Object;

    check-cast v1, Li5o;

    iget-object v1, v1, Li5o;->e:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Lumi;

    iget-object v1, p0, Loy;->b:Ljava/lang/Object;

    move-object v11, v1

    check-cast v11, Landroid/net/Uri;

    new-instance v1, Lcy;

    iget-boolean v3, p0, Loy;->a:Z

    iget-object v6, p0, Loy;->d:Ljava/io/Serializable;

    check-cast v6, Ljava/lang/String;

    iget-object v7, p0, Loy;->e:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v8, p0, Loy;->h:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object p0, p0, Loy;->c:Ljava/lang/Object;

    move-object v9, p0

    check-cast v9, Ljava/lang/String;

    invoke-direct/range {v1 .. v9}, Lcy;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v10, v0, Ltn;->b:Ljava/lang/Object;

    invoke-virtual {v11}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x0

    :try_start_55
    new-instance v3, Lrma;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Lrma;-><init>(B)V

    invoke-virtual {v3, p0, v2}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v3}, Lrma;->d()Lhra;

    move-result-object v2
    :try_end_62
    .catch Ljava/lang/IllegalArgumentException; {:try_start_55 .. :try_end_62} :catch_62

    :catch_62
    iput-object v2, v0, Ltn;->c:Ljava/lang/Object;

    iput-object v1, v0, Ltn;->d:Ljava/lang/Object;

    return-object v0
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Loy;->i:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ActionBarSearchView;

    iget-object p0, p0, Loy;->h:Ljava/lang/Object;

    check-cast p0, Landroid/view/MenuItem;

    if-eqz v0, :cond_25

    if-eqz p0, :cond_25

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    invoke-interface {p0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    :cond_25
    return-void
.end method

.method public final c()Z
    .registers 3

    iget-object v0, p0, Loy;->h:Ljava/lang/Object;

    check-cast v0, Landroid/view/MenuItem;

    if-eqz v0, :cond_17

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_17

    iget-object p0, p0, Loy;->h:Ljava/lang/Object;

    check-cast p0, Landroid/view/MenuItem;

    if-eqz p0, :cond_16

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    :cond_16
    return v1

    :cond_17
    const/4 p0, 0x0

    return p0
.end method

.method public d(Ljava/lang/Object;)Ljava/util/List;
    .registers 2

    check-cast p1, Lst;

    sget-object p0, Ll08;->a:Ll08;

    return-object p0
.end method

.method public final e()Z
    .registers 1

    iget-object p0, p0, Loy;->e:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public f()V
    .registers 3

    invoke-virtual {p0}, Loy;->e()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Loy;->e:Ljava/lang/Object;

    check-cast v0, Lkze;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Loy;->j:Ljava/lang/Object;

    check-cast v0, Lj1c;

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Loy;->e()Z

    move-result v1

    invoke-virtual {v0, v1}, Lj1c;->h(Z)V

    :cond_1d
    invoke-virtual {p0}, Loy;->l()V

    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Loy;->d:Ljava/io/Serializable;

    check-cast v0, Ljava/util/Locale;

    if-eqz p1, :cond_1e

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1e

    new-instance v1, Lesi;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lesi;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    goto :goto_1f

    :cond_1e
    const/4 v1, 0x0

    :goto_1f
    iget-object p1, p0, Loy;->c:Ljava/lang/Object;

    check-cast p1, Lshf;

    if-eqz v1, :cond_37

    iget-object v0, p1, Lshf;->a:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Lesi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    iget-boolean v0, p0, Loy;->a:Z

    if-nez v0, :cond_37

    const/4 v0, 0x1

    iput-boolean v0, p0, Loy;->a:Z

    invoke-virtual {p0}, Loy;->h()V

    :cond_37
    invoke-virtual {p1, v1}, Lshf;->S(Ljava/lang/Object;)V

    invoke-virtual {p0}, Loy;->l()V

    return-void
.end method

.method public abstract h()V
.end method

.method public final i(Lj1c;)V
    .registers 2

    iput-object p1, p0, Loy;->j:Ljava/lang/Object;

    invoke-virtual {p0}, Loy;->e()Z

    move-result p0

    if-eqz p0, :cond_e

    if-eqz p1, :cond_e

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Lj1c;->h(Z)V

    :cond_e
    return-void
.end method

.method public final j(Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 7

    if-nez p1, :cond_3

    return-void

    :cond_3
    iput-object p1, p0, Loy;->h:Ljava/lang/Object;

    new-instance v0, Lz73;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lz73;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/ActionBarSearchView;

    iput-object p1, p0, Loy;->i:Ljava/lang/Object;

    if-eqz p1, :cond_1b

    invoke-virtual {p1, p4}, Landroidx/appcompat/widget/SearchView;->setInputType(I)V

    :cond_1b
    iget-object p1, p0, Loy;->i:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz p1, :cond_2a

    new-instance p4, Lfm3;

    const/4 v0, 0x1

    invoke-direct {p4, p0, v0}, Lfm3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p4}, Lcom/opera/android/custom_views/ActionBarSearchView;->setActionViewObserver(Landroid/view/CollapsibleActionView;)V

    :cond_2a
    iget-object p1, p0, Loy;->i:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz p1, :cond_3b

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-virtual {p4, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    :cond_3b
    new-instance p1, Lem3;

    invoke-direct {p1, p0, v1}, Lem3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    return-void
.end method

.method public final l()V
    .registers 4

    iget-object v0, p0, Loy;->b:Ljava/lang/Object;

    check-cast v0, Lysi;

    invoke-virtual {p0}, Loy;->e()Z

    move-result v1

    if-eqz v1, :cond_16

    iget-object v1, p0, Loy;->c:Ljava/lang/Object;

    check-cast v1, Lshf;

    invoke-virtual {v1}, Lshf;->q()V

    iget-object v1, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Lesi;

    goto :goto_17

    :cond_16
    const/4 v1, 0x0

    :goto_17
    invoke-interface {v0, v1}, Lysi;->g(Lesi;)V

    invoke-interface {v0}, Lysi;->m()Lekc;

    move-result-object v2

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-nez v2, :cond_28

    sget-object v2, Ll08;->a:Ll08;

    :cond_28
    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0}, Lysi;->i()Z

    move-result v0

    if-eqz v0, :cond_44

    if-eqz v1, :cond_44

    iget-object p0, p0, Loy;->g:Ljava/lang/Object;

    check-cast p0, Llwc;

    iput-object v1, p0, Llwc;->b:Ljava/lang/Object;

    iput-object v2, p0, Llwc;->c:Ljava/lang/Object;

    iget-object v0, v1, Lesi;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void

    :cond_44
    iget-object p0, p0, Loy;->f:Ljava/lang/Object;

    check-cast p0, Lh42;

    invoke-virtual {p0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
