.class public Lcom/sauzask/nicoid/NicoidCacheManagerActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# instance fields
.field public A:Landroid/widget/ListView;

.field public B:Landroid/app/Activity;

.field public C:Le/e/a/b0;

.field public D:Landroid/view/LayoutInflater;

.field public E:Landroid/os/Handler;

.field public F:Le/e/a/y0;

.field public G:Z

.field public H:Landroid/content/SharedPreferences;

.field public I:I

.field public J:I

.field public K:Landroidx/appcompat/app/ActionBar;

.field public L:J

.field public M:J

.field public N:Ljava/lang/String;

.field public O:Lcom/google/android/gms/ads/AdView;

.field public P:Landroid/widget/LinearLayout;

.field public Q:Landroid/view/View;

.field public R:Landroid/view/View;

.field public S:Landroid/widget/TextView;

.field public y:Landroid/view/View;

.field public z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field


# virtual methods
.method public final a(Ljava/lang/String;)Landroid/widget/Button;
    .registers 5

    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v1, 0x7f07006a

    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, v1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 7

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_8

    goto :goto_7f

    :cond_8
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_7f

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->s()V

    return v1

    :cond_17
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->P:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_7f

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->u()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_7f

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v3, 0x7f0f022a

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f022d

    invoke-virtual {p1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Le/e/a/k;

    invoke-direct {v2, p0}, Le/e/a/k;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {v0, p1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f00b3

    invoke-virtual {p1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Le/e/a/l;

    invoke-direct {v2, p0}, Le/e/a/l;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {v0, p1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return v1

    .line 2
    :cond_7f
    :goto_7f
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Le/e/a/CacheFolders;->page(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_d

    return-void

    :cond_d
    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->H:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->H:Landroid/content/SharedPreferences;

    const/4 v0, 0x0

    const-string v1, "continuous_play"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    sput-boolean p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->H:Landroid/content/SharedPreferences;

    const-string v1, "continuous_play_mode"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    sput p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->J:I

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->H:Landroid/content/SharedPreferences;

    const-string v1, "cache_sort_type"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->J:I

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->H:Landroid/content/SharedPreferences;

    const-string v1, "videolist_tap"

    const-string v2, "0"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->I:I

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->H:Landroid/content/SharedPreferences;

    const-string v1, "main_rotation"

    const-string v2, "1"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->H:Landroid/content/SharedPreferences;

    const-string v1, "cache_size"

    const-string v2, "2048"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    int-to-long v1, p1

    iput-wide v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->L:J

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    new-instance p1, Le/e/a/y0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    invoke-direct {p1, v1}, Le/e/a/y0;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->F:Le/e/a/y0;

    const-string p1, "layout_inflater"

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->D:Landroid/view/LayoutInflater;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->D:Landroid/view/LayoutInflater;

    const/4 v1, 0x0

    const v2, 0x7f0b006e

    invoke-virtual {p1, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    invoke-static {p1}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    const/4 v2, -0x1

    new-instance p1, Le/e/a/b0;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    iget v4, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->I:I

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->F:Le/e/a/y0;

    invoke-direct {p1, v2, v3, v4, v5}, Le/e/a/b0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;ILe/e/a/y0;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->C:Le/e/a/b0;

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->K:Landroidx/appcompat/app/ActionBar;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/o;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d4

    const-string p1, "\u5185\u90e8\u30e1\u30e2\u30ea"

    goto :goto_d6

    :cond_d4
    const-string p1, "SD\u30ab\u30fc\u30c9"

    :goto_d6
    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->N:Ljava/lang/String;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    const v2, 0x7f0800e5

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    .line 1
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->R:Landroid/view/View;

    const v3, 0x7f080183

    if-nez v2, :cond_118

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v4, 0x7f0b0039

    invoke-virtual {v2, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->R:Landroid/view/View;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->R:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->R:Landroid/view/View;

    const v2, 0x7f08007a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_118
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->R:Landroid/view/View;

    .line 2
    invoke-virtual {p1, v1}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->C:Le/e/a/b0;

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance p1, Landroid/widget/ArrayAdapter;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0b007a

    invoke-direct {p1, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const v1, 0x7f0b007a

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01a3

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01a7

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f0199

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f0198

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f0196

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f0197

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01ab

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01ac

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01a2

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f019e

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01a0

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f019c

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01a1

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f019d

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f019f

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01aa

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01a5

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01a9

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->R:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    invoke-virtual {v1, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$a;

    invoke-direct {p1, p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {v1, p1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->J:I

    invoke-virtual {v1, p1}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$c;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$c;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$d;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$d;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->K:Landroidx/appcompat/app/ActionBar;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01c0

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    .line 3
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v1, 0x7f0f020c

    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Le/e/a/n;

    invoke-direct {v0, p0}, Le/e/a/n;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 4
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    invoke-static {p0, p1}, Le/e/a/TabRecovery244;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    return v0

    :cond_6
    const v0, 0x7f0f0224

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const v0, 0x7f0f0201

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 1
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    const/4 v1, 0x1

    .line 2
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    invoke-static {p0, p1}, Le/e/a/BulkSelection;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-static {p0, p1}, Le/e/a/TabRecovery244;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPause()V
    .registers 2

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->O:Lcom/google/android/gms/ads/AdView;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->pause()V

    :cond_7
    invoke-super {p0}, Lcom/sauzask/nicoid/NicoidActivity;->onPause()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->F:Le/e/a/y0;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Le/e/a/y0;->a()V

    :cond_11
    return-void
.end method

.method public s()V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    const v1, 0x7f0801be

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_19

    iput-boolean v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_ba

    :cond_19
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->P:Landroid/widget/LinearLayout;

    if-nez v0, :cond_85

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    const v1, 0x7f0801bd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->P:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v1, 0x7f0f0050

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->a(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$f;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$f;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->P:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    const v1, 0x7f08019a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f001c

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->a(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    new-instance v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$g;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$g;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f001b

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->a(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    new-instance v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$h;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity$h;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_85
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->S:Landroid/widget/TextView;

    if-nez v0, :cond_b7

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->S:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0xd9c7b5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->y:Landroid/view/View;

    const v2, 0x7f0801be

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_b7
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->updateSelectionCount()V

    :goto_ba
    invoke-static/range {p0 .. p0}, Le/e/a/BulkSelection;->modeChanged(Ljava/lang/Object;)V

    return-void
.end method

.method public updateSelectionCount()V
    .registers 6

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->S:Landroid/widget/TextView;

    if-eqz v0, :cond_42

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/x1;

    const-string v4, "isselect"

    invoke-virtual {v3, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/lang/Boolean;

    if-eqz v4, :cond_b

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_b

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_2c
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u9078\u629e\u4e2d: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\u4ef6"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_42
    return-void
.end method
