.class public Lcom/sauzask/nicoid/NicoidVideoListActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# static fields
.field public static I:Z

.field public static J:I


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ljava/lang/String;

.field public C:Ljava/lang/String;

.field public D:I

.field public E:I

.field public F:Lcom/sauzask/nicoid/NicoidVideoListFragment;

.field public G:Landroid/content/SharedPreferences;

.field public H:Lcom/google/android/gms/ads/AdView;

.field public y:Landroid/widget/LinearLayout;

.field public z:Landroid/widget/RelativeLayout;


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 11

    const/4 p1, 0x0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->G:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->G:Landroid/content/SharedPreferences;

    const-string v0, "main_rotation"

    const-string v1, "1"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    const p1, 0x7f0b0036

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->G:Landroid/content/SharedPreferences;

    const/4 v0, 0x0

    const-string v1, "continuous_play"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    sput-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->G:Landroid/content/SharedPreferences;

    const-string v1, "continuous_play_mode"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    sput p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->J:I

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->A:Ljava/lang/String;

    const-string v1, "type"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->E:I

    const-string v0, "name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->B:Ljava/lang/String;

    const-string v2, "item"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->C:Ljava/lang/String;

    const-string v3, "folderid"

    const/4 v4, -0x1

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->D:I

    const-string v4, "subtitle"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const v5, 0x7f080040

    invoke-virtual {p0, v5}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->y:Landroid/widget/LinearLayout;

    const v5, 0x7f0801d2

    invoke-virtual {p0, v5}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    const v6, 0x7f0801d5

    invoke-virtual {p0, v6}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    const v6, 0x7f0801d6

    invoke-virtual {p0, v6}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/RelativeLayout;

    iput-object v6, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->z:Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->z:Landroid/widget/RelativeLayout;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->A:Ljava/lang/String;

    const-string v8, "url"

    invoke-virtual {v6, v8, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget v7, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->E:I

    invoke-virtual {v6, v1, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget v1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->D:I

    invoke-virtual {v6, v3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v6, v4, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->B:Ljava/lang/String;

    const-string v1, ""

    if-nez p1, :cond_d1

    move-object p1, v1

    :cond_d1
    invoke-virtual {v6, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->C:Ljava/lang/String;

    if-nez p1, :cond_d9

    move-object p1, v1

    :cond_d9
    invoke-virtual {v6, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-direct {p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;-><init>()V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->F:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->F:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-virtual {p1, v6}, Landroidx/fragment/app/Fragment;->f(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->i()Ld/k/a/h;

    move-result-object p1

    invoke-virtual {p1}, Ld/k/a/h;->a()Ld/k/a/o;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->F:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-virtual {p1, v5, v0}, Ld/k/a/o;->a(ILandroidx/fragment/app/Fragment;)Ld/k/a/o;

    invoke-virtual {p1}, Ld/k/a/o;->b()I

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 7

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->A:Ljava/lang/String;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_26

    const-string v3, "https://nvapi.nicovideo.jp/v1/search/video\\?(tag|keyword)=([^&]+)&([^$]+)"

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    const v0, 0x7f0f0118

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v0, v2, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 1
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    const v3, 0x7f070020

    .line 2
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    :cond_26
    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->E:I

    const/4 v3, 0x4

    const v4, 0x7f0f020a

    if-ne v0, v3, :cond_3a

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v2, v4, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_6d

    :cond_3a
    const/16 v3, 0x8

    if-ne v0, v3, :cond_4d

    const v0, 0x7f0f020b

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v0, v2, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_6d

    :cond_4d
    const/4 v3, 0x5

    if-ne v0, v3, :cond_52

    const/4 v0, 0x1

    goto :goto_53

    :cond_52
    const/4 v0, 0x0

    :goto_53
    iget v3, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->E:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_5b

    const/4 v3, 0x1

    goto :goto_5c

    :cond_5b
    const/4 v3, 0x0

    :goto_5c
    or-int/2addr v0, v3

    if-eqz v0, :cond_6d

    const v0, 0x7f0f0224

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v2, v1, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_6d
    :goto_6d
    const v0, 0x7f0f0201

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v0, v2, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 3
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 4
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    invoke-static {p0, p1}, Le/e/a/BulkSelection;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    invoke-static {p0, p1}, Le/e/a/ListActions;->adjustHistoryMenu(Ljava/lang/Object;Landroid/view/Menu;)V

    invoke-static {p0, p1}, Le/e/a/TabRecovery244;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 9

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0f00b3

    const v2, 0x7f0f022d

    const v3, 0x7f0f0209

    const-string v4, "android.intent.action.VIEW"

    const/4 v5, 0x1

    sparse-switch v0, :sswitch_data_f8

    goto/16 :goto_f3

    :sswitch_15
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->F:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    if-eqz v0, :cond_f3

    .line 1
    iget-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    invoke-virtual {v4}, Le/e/a/b0;->a()I

    move-result v4

    if-eqz v4, :cond_f3

    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v4, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v6, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v3, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v3, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/d2;

    invoke-direct {v3, v0}, Le/e/a/d2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v4, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v2, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/e2;

    invoke-direct {v2, v0}, Le/e/a/e2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v4, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    goto/16 :goto_f3

    .line 2
    :sswitch_59
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->F:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    if-eqz v0, :cond_f3

    .line 3
    iget-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    invoke-virtual {v4}, Le/e/a/b0;->a()I

    move-result v4

    if-eqz v4, :cond_f3

    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v4, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v6, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v3, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v3, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/f2;

    invoke-direct {v3, v0}, Le/e/a/f2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v4, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-virtual {v2, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/h2;

    invoke-direct {v2, v0}, Le/e/a/h2;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V

    invoke-virtual {v4, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    goto :goto_f3

    .line 4
    :sswitch_9c
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->G:Landroid/content/SharedPreferences;

    sget v1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->J:I

    invoke-static {p0, v0, v1}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/SharedPreferences;I)V

    goto :goto_f3

    :sswitch_a4
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    xor-int/2addr v0, v5

    sput-boolean v0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->G:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "continuous_play"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_f3

    :sswitch_bd
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->A:Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_f3

    :sswitch_c3
    :try_start_c3
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->A:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v0, 0x0

    invoke-static {v1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_c3 .. :try_end_d6} :catch_f3

    goto :goto_f3

    :sswitch_d7
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidSetting"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_f3

    :sswitch_ec
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListActivity;->F:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    if-eqz v0, :cond_f3

    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Y()V

    :catch_f3
    :cond_f3
    :goto_f3
    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :sswitch_data_f8
    .sparse-switch
        0x1 -> :sswitch_ec
        0x2 -> :sswitch_d7
        0x3 -> :sswitch_c3
        0x7f0f0118 -> :sswitch_bd
        0x7f0f0201 -> :sswitch_a4
        0x7f0f0202 -> :sswitch_9c
        0x7f0f020a -> :sswitch_59
        0x7f0f020b -> :sswitch_15
    .end sparse-switch
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2

    invoke-static {p0}, Le/e/a/MultiTabs227;->beforeSave(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
