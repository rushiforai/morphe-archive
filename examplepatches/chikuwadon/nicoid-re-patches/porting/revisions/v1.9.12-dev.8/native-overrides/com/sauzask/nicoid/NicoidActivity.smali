.class public Lcom/sauzask/nicoid/NicoidActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source ""


# instance fields
.field public t:Landroidx/appcompat/app/ActionBar;

.field public u:Landroidx/drawerlayout/widget/DrawerLayout;

.field public v:Ld/b/k/a;

.field public w:Z

.field public x:Z


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    invoke-static {p0, p1}, Le/e/a/TabGestures228;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_7

    return v0

    :cond_7
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x1

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->v:Ld/b/k/a;

    if-eqz p1, :cond_17

    .line 1
    iget-boolean v0, p1, Ld/b/k/a;->g:Z

    if-nez v0, :cond_14

    invoke-virtual {p1}, Ld/b/k/a;->a()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p1, Ld/b/k/a;->e:Landroid/graphics/drawable/Drawable;

    :cond_14
    invoke-virtual {p1}, Ld/b/k/a;->b()V

    :cond_17
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->a(Landroid/app/Activity;Landroid/content/SharedPreferences;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 5

    const v0, 0x7f0f0118

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_23

    const v1, 0x7f0f0119

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v2, v1, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x1

    .line 1
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    const v1, 0x7f070020

    .line 2
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    :cond_23
    invoke-static {p0, p1}, Le/e/a/TabRecovery244;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    const v0, 0x7f0f0120

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-static {p0, p1}, Le/e/a/Ranking190;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .registers 5

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_40

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const p2, 0x7f0f001e

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const p2, 0x7f0f022d

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Lcom/sauzask/nicoid/NicoidActivity$b;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidActivity;)V

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const p2, 0x7f0f00b3

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Lcom/sauzask/nicoid/NicoidActivity$c;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidActivity$c;-><init>(Lcom/sauzask/nicoid/NicoidActivity;)V

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return p2

    :cond_40
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onNewIntent(Landroid/content/Intent;)V

    invoke-static {p0, p1}, Le/e/a/TabRoutes228;->newIntent(Landroid/app/Activity;Landroid/content/Intent;)V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidActivity;->v:Ld/b/k/a;

    if-eqz v0, :cond_c

    invoke-virtual {v0, p1}, Ld/b/k/a;->a(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p1, 0x1

    return p1

    :cond_c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0f0119

    if-eq v0, v1, :cond_2d

    const v1, 0x7f0f0120

    if-eq v0, v1, :cond_1b

    goto :goto_31

    :cond_1b
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidSetting"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_31

    :cond_2d
    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;[I)V

    :goto_31
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPostCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onPostCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->v:Ld/b/k/a;

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ld/b/k/a;->b()V

    :cond_a
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 8

    invoke-static {p0, p1}, Le/e/a/TabRoutes228;->content(Landroid/app/Activity;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidActivity;->w:Z

    if-nez v0, :cond_8b

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f0b0021

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0800dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-super {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(Landroid/view/View;)V

    const p1, 0x7f0800f2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    invoke-static {p0, p1}, Lcom/sauzask/nicoid/NicoidTopActivity;->a(Landroid/content/Context;Landroid/widget/ListView;)Landroid/widget/ListView;

    const p1, 0x7f080084

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->u:Landroidx/drawerlayout/widget/DrawerLayout;

    new-instance p1, Lcom/sauzask/nicoid/NicoidActivity$a;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidActivity;->u:Landroidx/drawerlayout/widget/DrawerLayout;

    const v4, 0x7f0700a1

    const v5, 0x7f0f0036

    move-object v0, p1

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidActivity;Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;II)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->v:Ld/b/k/a;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->v:Ld/b/k/a;

    .line 1
    iget-boolean v0, p1, Ld/b/k/a;->f:Z

    const/4 v1, 0x1

    if-eq v1, v0, :cond_71

    iget-object v0, p1, Ld/b/k/a;->c:Ld/b/m/a/d;

    iget-object v2, p1, Ld/b/k/a;->b:Landroidx/drawerlayout/widget/DrawerLayout;

    const v3, 0x800003

    invoke-virtual {v2, v3}, Landroidx/drawerlayout/widget/DrawerLayout;->e(I)Z

    move-result v2

    if-eqz v2, :cond_6a

    iget v2, p1, Ld/b/k/a;->i:I

    goto :goto_6c

    :cond_6a
    iget v2, p1, Ld/b/k/a;->h:I

    :goto_6c
    invoke-virtual {p1, v0, v2}, Ld/b/k/a;->a(Landroid/graphics/drawable/Drawable;I)V

    iput-boolean v1, p1, Ld/b/k/a;->f:Z

    .line 2
    :cond_71
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->u:Landroidx/drawerlayout/widget/DrawerLayout;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidActivity;->v:Ld/b/k/a;

    invoke-virtual {p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerListener(Landroidx/drawerlayout/widget/DrawerLayout$d;)V

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->t:Landroidx/appcompat/app/ActionBar;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->t:Landroidx/appcompat/app/ActionBar;

    invoke-virtual {p1, v1}, Landroidx/appcompat/app/ActionBar;->c(Z)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidActivity;->t:Landroidx/appcompat/app/ActionBar;

    invoke-virtual {p1, v1}, Landroidx/appcompat/app/ActionBar;->d(Z)V

    :cond_8b
    return-void
.end method
