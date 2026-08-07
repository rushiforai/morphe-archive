.class public Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/Toolbar$f;


# instance fields
.field protected c:Ll/c2j0;

.field protected d:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public H0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->L0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public J0()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->O0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget v0, Ll/w9c0;->h:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public K0()Landroidx/appcompat/widget/Toolbar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->d:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    return-object p0
.end method

.method public L0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->I0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->J0()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->O0()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->R0(IZ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public N0()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity$a;-><init>(Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/c2j0;->c(Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;Landroid/view/View$OnClickListener;)Ll/c2j0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/c2j0;->g()Landroidx/appcompat/widget/Toolbar;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->d:Landroidx/appcompat/widget/Toolbar;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->P0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->d:Landroidx/appcompat/widget/Toolbar;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, v0}, Ll/c2j0;->l(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public O0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public P0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public Q0()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/lpj0;->j(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public R0(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    invoke-static {p0, p1, v0}, Ll/q4g0;->e(Landroid/app/Activity;II)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->S0(Z)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p0, p1, v0}, Ll/q4g0;->e(Landroid/app/Activity;II)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->S0(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public S0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    and-int/lit16 v1, v1, -0x2001

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    or-int/lit16 v1, v1, 0x2000

    .line 21
    .line 22
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->T0(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public T0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/ej2;->m(Landroid/app/Activity;Z)Z

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p1, 0x1

    .line 9
    invoke-static {p0, p1}, Ll/ej2;->m(Landroid/app/Activity;Z)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public U0()Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;
    .locals 0

    .line 1
    return-object p0
.end method

.method public init()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->N0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setContentView(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->H0()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 0

    .line 11
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->H0()V

    .line 12
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(Landroid/view/View;)V

    .line 13
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->init()V

    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 14
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->H0()V

    .line 15
    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->init()V

    return-void
.end method

.method public setTitle(I)V
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    if-eqz v0, :cond_0

    .line 13
    invoke-virtual {v0, p1}, Ll/c2j0;->n(I)V

    .line 14
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->setTitle(I)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/c2j0;->o(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
