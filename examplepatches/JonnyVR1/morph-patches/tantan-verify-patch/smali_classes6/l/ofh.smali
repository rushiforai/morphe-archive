.class public Ll/ofh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jfh;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/bnl0;->s(Landroid/view/ViewGroup;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/nfh;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/nfh;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/view/View;

    .line 33
    .line 34
    check-cast v1, Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v1}, Ll/ux0;->j(Landroid/widget/TextView;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 45
    .line 46
    return-object p0
.end method

.method public static synthetic p(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b(Lcom/p1/mobile/android/app/Act;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ux0;->c()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    sget p0, Ll/fgc0;->u:I

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-static {}, Ll/j4h;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget p0, Ll/lbc0;->Q3:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p0, Ll/lbc0;->P3:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    sget p0, Ll/lbc0;->R3:I

    .line 16
    .line 17
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Landroid/view/MenuItem;Ll/y20;)Landroid/widget/TextView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/view/MenuItem;",
            "Ll/y20<",
            "Landroid/widget/TextView;",
            ">;)",
            "Landroid/widget/TextView;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/hdc0;->E1:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/widget/TextView;

    .line 12
    .line 13
    return-object p0
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;)Landroid/view/MenuItem;
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W1:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p2, p0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Ll/tec0;->m1:I

    .line 12
    .line 13
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x2

    .line 17
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public g(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;->g:Lv/VImage;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;->g:Lv/VImage;

    .line 13
    .line 14
    sget v0, Ll/lbc0;->g1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;->b:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;->b()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/ux0;->f()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;->e:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;->b()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/ux0;->f()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedMomentDetailToolBarView;->d:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ll/wlj;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/4 p1, 0x0

    .line 66
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/generic/RoundingParams;->q(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public h(Landroid/content/Context;Landroidx/appcompat/widget/Toolbar;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j(Lcom/p1/mobile/android/app/Act;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ux0;->c()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Landroid/view/MenuItem;Landroid/widget/TextView;Ll/x20;)V
    .locals 0

    .line 1
    new-instance p0, Ll/lfh;

    .line 2
    .line 3
    invoke-direct {p0, p4}, Ll/lfh;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p3, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const p0, 0x1020002

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Ll/mfh;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/mfh;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pendChangeActionButtonTypeface()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    sget p0, Ll/fgc0;->v:I

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;)I
    .locals 0

    .line 1
    sget p0, Ll/lbc0;->b0:I

    .line 2
    .line 3
    return p0
.end method
