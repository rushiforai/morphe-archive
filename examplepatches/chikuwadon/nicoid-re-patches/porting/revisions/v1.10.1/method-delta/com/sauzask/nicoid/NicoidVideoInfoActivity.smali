.class public Lcom/sauzask/nicoid/NicoidVideoInfoActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""

# interfaces
.implements Le/e/a/l3/l;


# instance fields
.field public A:Z

.field public B:Z

.field public C:I

.field public D:Le/e/a/n0;

.field public E:Ljava/lang/String;

.field public F:Ljava/lang/String;

.field public G:Le/e/a/d0;

.field public H:Le/e/a/b1;

.field public I:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

.field public J:Landroid/os/Handler;

.field public K:Landroid/os/Bundle;

.field public L:Landroid/app/Activity;

.field public M:Landroid/widget/Button;

.field public N:Landroidx/appcompat/app/ActionBar;

.field public O:I

.field public P:Z

.field public Q:Lcom/google/android/gms/ads/AdView;

.field public R:Landroid/widget/SeekBar;

.field public S:Landroid/widget/TextView;

.field public T:Landroid/widget/TextView;

.field public U:Z

.field public V:Z

.field public W:Le/e/a/l3/h;

.field public X:Z

.field public y:Landroid/widget/LinearLayout;

.field public z:Z


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 6

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3a

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    const v0, 0x7f0f0025

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    .line 4
    invoke-static {p1, v1, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 5
    :cond_3a
    sget-object v0, Le/e/a/o2;->w:Ljava/lang/String;

    if-nez v0, :cond_40

    const-string v0, ""

    :cond_40
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    const v0, 0x7f0f0029

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    .line 6
    invoke-static {p1, v1, v0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 7
    :cond_55
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    const v3, 0x7f0f00d6

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    const v3, 0x7f0f022d

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$c;

    invoke-direct {v3, p0, p1}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$c;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    const v2, 0x7f0f00b3

    invoke-virtual {p1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$d;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$d;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v0, p1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public a(Z)V
    .registers 2

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->aLegacy223(Z)V

    invoke-static {p0}, Le/e/a/InfoPlayback223;->afterPolicy(Ljava/lang/Object;)V

    return-void
.end method

.method public aLegacy223(Z)V
    .registers 8

    const v0, 0x7f080073

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    const v1, 0x7f080161

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const v1, 0x7f08015b

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->B:Z

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->I:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    if-eqz v4, :cond_3c

    iget-boolean v5, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->B:Z

    .line 1
    iput-boolean v5, v4, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->k0:Z

    iget-object v4, v4, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->m0:Landroid/widget/LinearLayout;

    if-nez v4, :cond_33

    goto :goto_3c

    :cond_33
    if-eqz v5, :cond_37

    const/4 v5, 0x0

    goto :goto_39

    :cond_37
    const/16 v5, 0x8

    :goto_39
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_3c
    :goto_3c
    if-nez p1, :cond_57

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    iput-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->U:Z

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->W:Le/e/a/l3/h;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->M:Landroid/widget/Button;

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    return-void

    :cond_57
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->M:Landroid/widget/Button;

    invoke-virtual {p1, v3}, Landroid/widget/Button;->setVisibility(I)V

    const p1, 0x7f08015d

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->S:Landroid/widget/TextView;

    const p1, 0x7f080085

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->T:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->S:Landroid/widget/TextView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->T:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance p1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;

    invoke-direct {p1, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->a(Le/e/a/l3/i;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->h0:Le/e/a/n0;

    if-eqz p1, :cond_10d

    iget-boolean v0, p1, Le/e/a/n0;->c:Z

    if-eqz v0, :cond_10d

    .line 3
    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    const p1, 0x7f0801da

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    const v0, 0x7f08014c

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f08015f

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    invoke-virtual {v4}, Le/e/a/n0;->c()Z

    move-result v4

    if-eqz v4, :cond_b9

    const v4, 0x7f070195

    goto :goto_bc

    :cond_b9
    const v4, 0x7f070196

    :goto_bc
    invoke-static {p1, v4}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    new-instance v4, Le/e/a/t1;

    invoke-direct {v4, p0, p1}, Le/e/a/t1;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;Landroid/widget/Button;)V

    invoke-virtual {p1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->j0:Z

    if-eqz p1, :cond_cc

    const/4 v2, 0x0

    :cond_cc
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    new-instance p1, Le/e/a/u1;

    invoke-direct {p1, p0}, Le/e/a/u1;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Le/e/a/v1;

    invoke-direct {p1, p0}, Le/e/a/v1;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f08017d

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->R:Landroid/widget/SeekBar;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->D:Le/e/a/n0;

    invoke-virtual {p1}, Le/e/a/n0;->b()I

    move-result p1

    iput p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->C:I

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->R:Landroid/widget/SeekBar;

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->C:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->R:Landroid/widget/SeekBar;

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->C:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->R:Landroid/widget/SeekBar;

    new-instance v0, Le/e/a/w1;

    invoke-direct {v0, p0}, Le/e/a/w1;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    :cond_10d
    return-void
.end method

.method public final b(Ljava/lang/String;)Landroid/widget/Button;
    .registers 5

    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0701a7

    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->commentTextColor(Landroid/view/View;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->button(Landroid/widget/Button;)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, v1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 14

    const/4 p1, 0x0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const v0, 0x7f1000a2

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "main_rotation"

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    const v1, 0x7f0b0074

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(I)V

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/v0;->e(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->z:Z

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->A:Z

    new-instance v1, Le/e/a/b1;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-direct {v1, v2}, Le/e/a/b1;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->H:Le/e/a/b1;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->H:Le/e/a/b1;

    .line 1
    iput-object p0, v1, Le/e/a/b1;->c:Le/e/a/l3/l;

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/nico.ms/"

    const-string v4, "/www.nicovideo.jp/watch/"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    if-nez v2, :cond_6c

    const-string v3, "sm9"

    goto :goto_74

    :cond_6c
    const-string v3, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v4, "$1$2"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_74
    iput-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_91

    const p1, 0x7f0f0058

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3
    invoke-static {p1, v3, p0}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_91
    sget-boolean v2, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    const/4 v4, 0x1

    if-eqz v2, :cond_a8

    const-string v2, "isContinuousPlay"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_a8

    const-string v2, "playlistposition"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->O:I

    iput-boolean v4, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->P:Z

    :cond_a8
    const v1, 0x7f080040

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-static {p0, v1, v0}, Le/e/a/v0;->a(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/content/SharedPreferences;)Lcom/google/android/gms/ads/AdView;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->Q:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    invoke-static {v0}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->N:Landroidx/appcompat/app/ActionBar;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->N:Landroidx/appcompat/app/ActionBar;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    const v0, 0x7f0801be

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const v0, 0x7f0801bd

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f0f0054

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->b(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->M:Landroid/widget/Button;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->M:Landroid/widget/Button;

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$f;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$f;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->M:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->M:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const v1, 0x7f0f01f7

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->b(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$g;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    const-string v5, ".mp4"

    invoke-static {v2, v3, v5}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    new-instance v1, Le/e/a/d0;

    invoke-direct {v1, p0}, Le/e/a/d0;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->G:Le/e/a/d0;

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->G:Le/e/a/d0;

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    const/4 v7, 0x0

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->z:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->A:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual/range {v5 .. v11}, Le/e/a/d0;->a(Ljava/lang/String;Le/e/a/v;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Z)V

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz v0, :cond_181

    sget-object v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->q0:Ljava/lang/String;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_181

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->s0:Landroid/os/Bundle;

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v0, :cond_181

    invoke-virtual {p0, v4}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->a(Z)V

    :cond_181
    if-eqz p1, :cond_195

    const-string v0, "cookie"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_195

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->G:Le/e/a/d0;

    .line 5
    iput-object p1, v1, Le/e/a/d0;->l:Landroid/os/Bundle;

    invoke-static {v0}, Le/e/a/v0;->b(Ljava/lang/String;)Lorg/apache/http/client/CookieStore;

    move-result-object p1

    iput-object p1, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    .line 6
    :cond_195
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->G:Le/e/a/d0;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$h;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$h;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    .line 7
    iput-object v0, p1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const p1, 0x7f0801d2

    .line 8
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->y:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->y:Landroid/widget/LinearLayout;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$i;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$i;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 9

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const-string v1, "isBackgroundPlay"

    const-string v2, "url"

    const/4 v3, 0x2

    const-string v4, "android.intent.action.VIEW"

    const/4 v5, 0x0

    const/4 v6, 0x1

    sparse-switch v0, :sswitch_data_142

    goto/16 :goto_13c

    :sswitch_12
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->K:Landroid/os/Bundle;

    if-nez v0, :cond_18

    goto/16 :goto_13c

    :cond_18
    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    const-class v4, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-static {v1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {p0, v5}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->a(Z)V

    goto/16 :goto_13c

    :sswitch_33
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->a(Ljava/lang/String;)V

    goto/16 :goto_13c

    :sswitch_3a
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->u()V

    goto/16 :goto_13c

    :sswitch_3f
    :try_start_3f
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->F:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " https://nico.ms/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " #nicoid #"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_7a} :catch_13c

    goto :goto_c3

    :sswitch_7b
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->K:Landroid/os/Bundle;

    if-nez v0, :cond_81

    goto/16 :goto_13c

    :cond_81
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->B:Z

    if-eqz v0, :cond_87

    goto/16 :goto_13c

    :cond_87
    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    const-class v4, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v1, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-static {v1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {p0, v6}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->a(Z)V

    goto/16 :goto_13c

    :sswitch_a2
    :try_start_a2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v0, 0x0

    invoke-static {v1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    :goto_c3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_c6
    .catch Ljava/lang/Exception; {:try_start_a2 .. :try_end_c6} :catch_13c

    goto :goto_13c

    :sswitch_c7
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->s()V

    goto :goto_13c

    :sswitch_cb
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const v2, 0x7f0f01af

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v5

    const-string v4, "URL"

    aput-object v4, v1, v6

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " + URL"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$e;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$e;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    goto :goto_13c

    :sswitch_10c
    const-string v0, "http://flapi.nicovideo.jp/api/getrelation?video="

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->E:Ljava/lang/String;

    const-string v2, "subtitle"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "type"

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v0, "com.sauzask.nicoid.hls"

    const-string v2, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :catch_13c
    :goto_13c
    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    nop

    :sswitch_data_142
    .sparse-switch
        0x7f0f00c3 -> :sswitch_10c
        0x7f0f00cd -> :sswitch_cb
        0x7f0f00ce -> :sswitch_c7
        0x7f0f00cf -> :sswitch_a2
        0x7f0f00d0 -> :sswitch_7b
        0x7f0f00d2 -> :sswitch_3f
        0x7f0f00d3 -> :sswitch_3a
        0x7f0f00d5 -> :sswitch_33
        0x7f0f00d7 -> :sswitch_12
    .end sparse-switch
.end method

.method public u()V
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->G:Le/e/a/d0;

    iget-object v0, v0, Le/e/a/d0;->z:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->A:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1d

    const v0, 0x7f0f00c1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    .line 1
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_1d
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->z:Z

    if-nez v0, :cond_2e

    const v0, 0x7f0f00c0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    .line 3
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 4
    :cond_2e
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0f00c4

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const v2, 0x7f0f00c5

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$a;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const v2, 0x7f0f002d

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$b;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Landroid/view/Window;->setFlags(II)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
