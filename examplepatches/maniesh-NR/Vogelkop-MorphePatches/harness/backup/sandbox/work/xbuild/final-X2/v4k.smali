.class public final Lv4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lile;


# instance fields
.field public a:Z

.field public final synthetic b:Lc5k;


# direct methods
.method public constructor <init>(Lc5k;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv4k;->b:Lc5k;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/core/widget/NestedScrollView;IIII)V
    .registers 14

    if-eq p3, p5, :cond_f0

    iget-object p1, p0, Lv4k;->b:Lc5k;

    iget-object p2, p1, Lc5k;->q:Lcv8;

    iget-object p2, p2, Lcv8;->p:Lt5k;

    iget-object p2, p2, Lha2;->c:Laan;

    invoke-virtual {p2}, Lcan;->d()V

    iget-object p2, p1, Lc5k;->A:Lbx8;

    iget-object p2, p2, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    const/4 v0, 0x0

    move v1, v0

    :cond_17
    :goto_17
    if-ge v1, p4, :cond_31

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lzw8;

    iget-object v2, v2, Lzw8;->b:Lxw8;

    if-eqz v2, :cond_17

    const-class v3, Lxw8;

    invoke-virtual {v3, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-virtual {v2}, Lxw8;->l()V

    goto :goto_17

    :cond_31
    invoke-virtual {p0}, Lv4k;->b()V

    iget-object p0, p1, Lc5k;->h:Lxt3;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p2}, Lxt3;->run(Ljava/lang/Object;)V

    iget-object p0, p1, Lc5k;->q:Lcv8;

    iget-object p2, p0, Lcv8;->B:Lkm5;

    iget-object p4, p2, Lkm5;->d:Ljava/lang/Object;

    check-cast p4, Lx5f;

    iget-object v1, p4, Lx5f;->d:Lzpa;

    iget-object v2, p2, Lkm5;->c:Ljava/lang/Object;

    check-cast v2, Ltsd;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const/16 v4, 0x21

    const-wide/16 v5, 0x1

    const/4 v7, 0x1

    if-nez v3, :cond_75

    if-lez p3, :cond_75

    if-nez p5, :cond_75

    iget-boolean p5, p4, Lx5f;->h:Z

    if-eqz p5, :cond_9d

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p5

    invoke-static {v1, p5}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    invoke-virtual {v1, v4, v7, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {p4, p5}, Lx5f;->U0(Lx56;)V

    goto :goto_9d

    :cond_75
    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Boolean;

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    if-eqz p5, :cond_9d

    iget-boolean p5, p2, Lkm5;->a:Z

    xor-int/2addr p5, v7

    iget-boolean v2, p2, Lkm5;->b:Z

    and-int/2addr p5, v2

    if-eqz p5, :cond_9d

    iget-boolean p5, p4, Lx5f;->h:Z

    if-eqz p5, :cond_9d

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p5

    invoke-static {v1, p5}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    invoke-virtual {v1, v4, v7, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {p4, p5}, Lx5f;->U0(Lx56;)V

    :cond_9d
    :goto_9d
    iget-boolean p4, p2, Lkm5;->a:Z

    iput-boolean p4, p2, Lkm5;->b:Z

    iget-object p0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {p0}, Lnjm;->a()Z

    iget-object p0, p1, Lc5k;->b0:Lks3;

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrmn;

    invoke-virtual {p1, p0}, Lc5k;->j(Lrmn;)V

    iget-object p0, p1, Lc5k;->H:Lz8b;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lu85;

    if-eqz p0, :cond_db

    iget-object p2, p0, Lu85;->k:Ljava/lang/Object;

    check-cast p2, Lpde;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lq85;

    iget-boolean p2, p2, Lq85;->a:Z

    if-eqz p2, :cond_d2

    iget p2, p0, Lu85;->c:I

    if-gt p3, p2, :cond_d8

    iput-boolean v0, p0, Lu85;->a:Z

    goto :goto_d8

    :cond_d2
    iget p2, p0, Lu85;->b:I

    if-le p3, p2, :cond_d8

    iput-boolean v7, p0, Lu85;->a:Z

    :cond_d8
    :goto_d8
    invoke-virtual {p0}, Lu85;->g()V

    :cond_db
    iget-object p0, p1, Lc5k;->G:Laba;

    iget-object p1, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object p2, Lz8b;->c:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    if-le p3, p1, :cond_ec

    move v0, v7

    :cond_ec
    iget-boolean p1, p0, Laba;->m:Z

    if-ne v0, p1, :cond_f1

    :cond_f0
    return-void

    :cond_f1
    iput-boolean v0, p0, Laba;->m:Z

    invoke-virtual {p0}, Laba;->d()V

    return-void
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lv4k;->b:Lc5k;

    iget-object v1, v0, Lc5k;->k:Lnue;

    iget-object v2, v0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-interface {v1}, Lnue;->getVisibility()Lize;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llue;

    invoke-virtual {v1}, Llue;->d()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    move-result v1

    if-lez v1, :cond_23

    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_24

    :cond_23
    const/4 v1, 0x0

    :cond_24
    iget-boolean v2, p0, Lv4k;->a:Z

    if-eq v1, v2, :cond_76

    iput-boolean v1, p0, Lv4k;->a:Z

    iget-object v2, v0, Lc5k;->e0:Lkze;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v2, v0, Lc5k;->x:Llv3;

    iget-boolean p0, p0, Lv4k;->a:Z

    iget-object v2, v2, Llv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v3, v2, Lcom/opera/android/BrowserActivity;->i0:Lkze;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v2, v2, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-nez v2, :cond_47

    const/4 v2, 0x0

    :cond_47
    invoke-virtual {v2, p0}, Lz43;->w(Z)V

    if-eqz v1, :cond_76

    iget-object p0, v0, Lc5k;->u:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_67

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v3

    invoke-virtual {v3, v1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object v1

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Ljf0;->e(I)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_67
    iget-object p0, v0, Lc5k;->j:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "speed_dial.enabled"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_76

    iget-object p0, v0, Lc5k;->w:Lete;

    invoke-virtual {p0}, Lete;->a()V

    :cond_76
    iget-object p0, v0, Lc5k;->K:Lh5k;

    iget-object v1, v0, Lc5k;->e:Lt8k;

    iget-object v1, v1, Lt8k;->c:Ls8k;

    sget-object v2, Ls8k;->a:Ls8k;

    if-eq v1, v2, :cond_83

    sget-object v0, Lyul;->e:Lyul;

    goto :goto_98

    :cond_83
    iget-object v0, v0, Lc5k;->i:Lbvl;

    invoke-interface {v0}, Lbvl;->getState()Lpde;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lavl;

    iget v0, v0, Lavl;->c:I

    if-nez v0, :cond_96

    sget-object v0, Lyul;->e:Lyul;

    goto :goto_98

    :cond_96
    sget-object v0, Lyul;->d:Lyul;

    :goto_98
    invoke-virtual {p0, v0}, Lh5k;->c(Lyul;)V

    return-void
.end method
