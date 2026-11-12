.class public final Lts2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqu2;


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:I

.field public final c:Liz9;

.field public final d:Li7f;

.field public final e:Lzyk;

.field public final f:Lss2;

.field public g:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;ILiz9;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lts2;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput p2, p0, Lts2;->b:I

    iput-object p3, p0, Lts2;->c:Liz9;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lts2;->d:Li7f;

    new-instance p1, Loc2;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lts2;->e:Lzyk;

    new-instance p1, Lss2;

    invoke-direct {p1, p0}, Lss2;-><init>(Lts2;)V

    iput-object p1, p0, Lts2;->f:Lss2;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lpu2;

    iget-object p0, p0, Lts2;->d:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lpu2;

    iget-object p0, p0, Lts2;->d:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final d()V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Lts2;->g:Ljava/util/ArrayList;

    iget-object v0, p0, Lts2;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbt2;

    if-eqz v1, :cond_14

    iget-object p0, p0, Lts2;->f:Lss2;

    iget-object v1, v1, Lbt2;->g:Li7f;

    invoke-virtual {v1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_14
    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbt2;

    if-eqz p0, :cond_25

    iget-object v0, p0, Lbt2;->b:Landroid/view/ViewGroup;

    iget-object p0, p0, Lbt2;->i:Lus2;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_25
    return-void
.end method

.method public final show()V
    .registers 10

    iget-object v0, p0, Lts2;->g:Ljava/util/ArrayList;

    if-eqz v0, :cond_ee

    iget-object v1, p0, Lts2;->e:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbt2;

    if-eqz v2, :cond_15

    iget-object v3, p0, Lts2;->f:Lss2;

    iget-object v2, v2, Lbt2;->g:Li7f;

    invoke-virtual {v2, v3}, Li7f;->b(Ljava/lang/Object;)Z

    :cond_15
    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbt2;

    if-eqz v1, :cond_ee

    iget-object v2, v1, Lbt2;->b:Landroid/view/ViewGroup;

    iget-object v3, v1, Lbt2;->i:Lus2;

    invoke-virtual {v2, v3}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v3, v1, Lbt2;->e:Lhp2;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, v3, Lhp2;->b:J

    iget-object v3, v1, Lbt2;->h:Lov0;

    if-nez v3, :cond_9b

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0083

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v4, 0x7f0a0394

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    if-eqz v6, :cond_89

    const v4, 0x7f0a08c0

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v7, :cond_89

    new-instance v4, Lov0;

    check-cast v3, Landroid/widget/LinearLayout;

    const/4 v8, 0x4

    invoke-direct {v4, v3, v6, v7, v8}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lou1;

    const/4 v6, 0x2

    invoke-direct {v3, v6, v5}, Lou1;-><init>(BI)V

    const/high16 v5, 0x40800000    # 4.0f

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v5, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    iget v5, v3, Lou1;->b:I

    if-eq v2, v5, :cond_7a

    iput v2, v3, Lou1;->b:I

    :cond_7a
    invoke-virtual {v7, v3}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance v2, Lat2;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v7, v2}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    iput-object v4, v1, Lbt2;->h:Lov0;

    move-object v3, v4

    goto :goto_9b

    :cond_89
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_9b
    :goto_9b
    iget-object v2, v3, Lov0;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/ImageView;

    iget-object v4, v3, Lov0;->d:Ljava/lang/Object;

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Lws2;

    iget-object v6, p0, Lts2;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v7, p0, Lts2;->b:I

    invoke-direct {v5, v1, v6, v7}, Lws2;-><init>(Lbt2;Lcom/opera/android/browser/chromium/ChromiumContent;I)V

    invoke-virtual {v5, v0}, Ldt1;->K(Ljava/util/Collection;)V

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v0, Lvs2;

    iget-object p0, p0, Lts2;->c:Liz9;

    invoke-direct {v0, v1, v7, p0}, Lvs2;-><init>(Lbt2;ILiz9;)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p0, 0x1

    if-eq v7, p0, :cond_d1

    const/4 p0, 0x3

    if-eq v7, p0, :cond_cd

    const/4 p0, 0x5

    if-eq v7, p0, :cond_c9

    const p0, 0x7f0803a1

    goto :goto_d4

    :cond_c9
    const p0, 0x7f0805ac

    goto :goto_d4

    :cond_cd
    const p0, 0x7f0805b1

    goto :goto_d4

    :cond_d1
    const p0, 0x7f08057f

    :goto_d4
    iget-object v0, v3, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, v1, Lbt2;->c:Lnak;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_ee
    return-void
.end method

.method public final w(Ljava/util/ArrayList;)V
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_a
    :goto_a
    if-ge v2, v1, :cond_1e

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lru2;

    invoke-static {v3}, Lj14;->G(Lru2;)Lru2;

    move-result-object v3

    if-eqz v3, :cond_a

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_1e
    iput-object v0, p0, Lts2;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2a

    invoke-virtual {p0}, Lts2;->d()V

    return-void

    :cond_2a
    iget-object p0, p0, Lts2;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbt2;

    if-eqz p0, :cond_47

    iget-object p0, p0, Lbt2;->h:Lov0;

    if-eqz p0, :cond_3f

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    goto :goto_40

    :cond_3f
    const/4 p0, 0x0

    :goto_40
    check-cast p0, Lws2;

    if-eqz p0, :cond_47

    invoke-virtual {p0, v0}, Ldt1;->K(Ljava/util/Collection;)V

    :cond_47
    return-void
.end method
