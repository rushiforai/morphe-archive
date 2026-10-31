.class public Lcom/sauzask/nicoid/NicoidNicorepoActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# instance fields
.field public A:Landroid/widget/ListView;

.field public B:Landroid/app/Activity;

.field public C:Le/e/a/m0;

.field public D:Landroid/view/LayoutInflater;

.field public E:Lorg/apache/http/client/CookieStore;

.field public F:Landroid/os/Handler;

.field public G:Le/e/a/y0;

.field public H:Z

.field public I:Z

.field public J:Ljava/lang/String;

.field public K:Landroid/content/SharedPreferences;

.field public L:I

.field public M:I

.field public N:[Ljava/lang/String;

.field public O:Landroidx/appcompat/app/ActionBar;

.field public P:Lcom/google/android/gms/ads/AdView;

.field public Q:Landroid/view/View;

.field public y:Landroid/view/View;

.field public z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 7

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->K:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->K:Landroid/content/SharedPreferences;

    const-string v0, "main_rotation"

    const-string v1, "1"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->K:Landroid/content/SharedPreferences;

    const-string v1, "videolist_tap"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->M:I

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    new-instance v0, Le/e/a/y0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le/e/a/y0;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->G:Le/e/a/y0;

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->D:Landroid/view/LayoutInflater;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->D:Landroid/view/LayoutInflater;

    const v1, 0x7f0b006e

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    invoke-static {v0}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    new-instance v0, Le/e/a/m0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    iget v2, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->M:I

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->z:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->G:Le/e/a/y0;

    invoke-direct {v0, v1, v2, v3, v4}, Le/e/a/m0;-><init>(Landroid/content/Context;ILjava/util/ArrayList;Le/e/a/y0;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->C:Le/e/a/m0;

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    invoke-static {v0}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->O:Landroidx/appcompat/app/ActionBar;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    const v1, 0x7f0800e5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->s()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->C:Le/e/a/m0;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidNicorepoActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity$b;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidNicorepoActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->L:I

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v3, 0x7f0f00a9

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f00af

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f00b2

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f00ab

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, p1

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v0, 0x7f0f00ad

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x4

    aput-object p1, v1, v0

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->O:Landroidx/appcompat/app/ActionBar;

    iget v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->L:I

    aget-object v0, v1, v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->t()V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 3

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->menu(Landroid/app/Activity;Landroid/view/Menu;)Z

    move-result v0

    invoke-static {p0, p1}, Le/e/a/TabRecovery244;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    return v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .registers 3

    const/4 v0, 0x1

    return v0
.end method

.method public final t()V
    .registers 1

    invoke-static {p0}, Le/e/a/FollowFeed;->load(Landroid/app/Activity;)V

    return-void
.end method
