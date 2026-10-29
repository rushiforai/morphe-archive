.class public Lcom/sauzask/nicoid/NicoidVideoActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source ""


# instance fields
.field public t:Z

.field public u:Ljava/lang/String;

.field public v:Lcom/sauzask/nicoid/NicoidVideoFragment;

.field public w:Le/e/a/a3;


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    invoke-static {p0, p1}, Le/e/a/PlayerGestures;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    return v0

    :cond_8
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onBackPressed()V
    .registers 2

    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->leave(Ljava/lang/Object;Z)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onBackPressed()V

    :cond_a
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-static {p0}, Le/e/a/DirectBootstrap238;->prepare(Landroid/app/Activity;)V


    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    const/4 p1, 0x0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "1"

    const-string v1, "player_rotation"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    invoke-static {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->a(Landroid/app/Activity;Landroid/content/SharedPreferences;)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/ActionBar;->d()V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v1, -0x2

    invoke-virtual {p1, v1}, Landroid/view/Window;->setFormat(I)V

    invoke-static {p0}, Le/e/a/ModernShorts;->bootstrap(Landroid/app/Activity;)Z

    move-result v6

    if-eqz v6, :cond_3e

    return-void

    :cond_3e
    const p1, 0x7f0b0062

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/nico.ms/"

    const-string v3, "/www.nicovideo.jp/watch/"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->u:Ljava/lang/String;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->u:Ljava/lang/String;

    if-nez v1, :cond_5d

    const-string v2, "sm9"

    goto :goto_65

    :cond_5d
    const-string v2, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v3, "$1$2"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_65
    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->u:Ljava/lang/String;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->u:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_82

    const p1, 0x7f0f0058

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1
    invoke-static {p1, v2, p0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoActivity;->finish()V

    return-void

    :cond_82
    const-string v1, "intentselect"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "url"

    if-nez v1, :cond_b1

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz v1, :cond_b1

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez v1, :cond_b1

    sget-object v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->q0:Ljava/lang/String;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->u:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b1

    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->u:Ljava/lang/String;

    invoke-virtual {p1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, p1}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoActivity;->finish()V

    return-void

    .line 3
    :cond_b1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f040004

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f040003

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    if-nez v1, :cond_ce

    if-eqz v4, :cond_cc

    goto :goto_ce

    :cond_cc
    const/4 v0, 0x0

    goto :goto_e8

    :cond_ce
    :goto_ce
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "0"

    if-eqz v1, :cond_d7

    goto :goto_d8

    :cond_d7
    move-object v0, v5

    :goto_d8
    const-string v1, "display_mode"

    invoke-interface {v4, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 4
    :goto_e8
    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->t:Z

    const v0, 0x7f0801d2

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const-string v1, "infodata"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->u:Ljava/lang/String;

    invoke-virtual {v5, v3, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->t:Z

    const-string v6, "istablet"

    invoke-virtual {v5, v6, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const-string v6, "isinfo"

    invoke-virtual {v5, v6, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v3, "isLandscape"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    invoke-virtual {v5, v3, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v3, "isFullScreen"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    invoke-virtual {v5, v3, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_134

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    goto :goto_139

    :cond_134
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    :goto_139
    invoke-virtual {v5, v1, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v1, "title"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "playlistposition"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v5, v1, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "playposition"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v5, v1, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "isContinuousPlay"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    invoke-virtual {v5, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->i()Ld/k/a/h;

    move-result-object p1

    invoke-virtual {p1}, Ld/k/a/h;->a()Ld/k/a/o;

    move-result-object p1

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v1

    const/16 v2, 0x12

    if-gt v1, v2, :cond_17f

    new-instance v1, Le/e/a/a3;

    invoke-direct {v1}, Le/e/a/a3;-><init>()V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->w:Le/e/a/a3;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->w:Le/e/a/a3;

    invoke-virtual {v1, v5}, Landroidx/fragment/app/Fragment;->f(Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->w:Le/e/a/a3;

    goto :goto_18d

    :cond_17f
    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-direct {v1}, Lcom/sauzask/nicoid/NicoidVideoFragment;-><init>()V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->v:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->v:Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-virtual {v1, v5}, Landroidx/fragment/app/Fragment;->f(Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->v:Lcom/sauzask/nicoid/NicoidVideoFragment;

    :goto_18d
    invoke-virtual {p1, v0, v1}, Ld/k/a/o;->a(ILandroidx/fragment/app/Fragment;)Ld/k/a/o;

    invoke-virtual {p1}, Ld/k/a/o;->a()I

    invoke-static {p0}, Le/e/a/ModernShorts;->attach(Landroid/app/Activity;)V

    return-void
.end method

.method protected onDestroy()V
    .registers 2

    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->activitySave(Ljava/lang/Object;Z)V

    invoke-static {p0}, Le/e/a/PlayerGestures;->destroy(Landroid/app/Activity;)V

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    return-void
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

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoActivity$a;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoActivity;)V

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const p2, 0x7f0f00b3

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoActivity$b;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoActivity;)V

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

.method protected onPause()V
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->activitySave(Ljava/lang/Object;Z)V

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    return-void
.end method

.method protected onUserLeaveHint()V
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->leave(Ljava/lang/Object;Z)Z

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onUserLeaveHint()V

    return-void
.end method

.method public s()V
    .registers 4

    invoke-static {p0}, Le/e/a/MiniSession225;->retainNavigation(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->v:Lcom/sauzask/nicoid/NicoidVideoFragment;

    const/4 v1, 0x1

    if-eqz v0, :cond_18

    .line 1
    iget-boolean v2, v0, Landroidx/fragment/app/Fragment;->A:Z

    if-nez v2, :cond_18

    .line 2
    iput-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->T1:Z

    const/4 v2, 0x4

    iput v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n0:I

    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->j(Z)V

    .line 3
    :cond_18
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoActivity;->w:Le/e/a/a3;

    if-eqz v0, :cond_22

    .line 4
    iget-boolean v2, v0, Landroidx/fragment/app/Fragment;->A:Z

    if-nez v2, :cond_22

    .line 5
    iput-boolean v1, v0, Le/e/a/a3;->W1:Z

    :cond_22
    return-void
.end method
