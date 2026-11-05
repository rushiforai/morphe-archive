.class public Lcom/sauzask/nicoid/NicoidRankingActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# instance fields
.field public A:Landroid/widget/ListView;

.field public B:Landroid/app/Activity;

.field public C:Le/e/a/x0;

.field public D:Landroid/view/LayoutInflater;

.field public E:Ljava/lang/String;

.field public F:Ljava/lang/String;

.field public G:Lcom/google/android/gms/ads/AdView;

.field public H:Landroid/view/View;

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
    .registers 13

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "main_rotation"

    const-string v1, "1"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setVolumeControlStream(I)V

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->D:Landroid/view/LayoutInflater;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->D:Landroid/view/LayoutInflater;

    const/4 v1, 0x0

    const v2, 0x7f0b006e

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->y:Landroid/view/View;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->y:Landroid/view/View;

    invoke-static {v0}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    new-instance v0, Le/e/a/x0;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->z:Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v4}, Le/e/a/x0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->C:Le/e/a/x0;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->y:Landroid/view/View;

    const v2, 0x7f080040

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const/16 p1, 0x8

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->G:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    const v0, 0x7f0f00dd

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/ModernRanking;->populateCategories(Lcom/sauzask/nicoid/NicoidRankingActivity;)V

    const/4 v4, 0x1

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->y:Landroid/view/View;

    const v0, 0x7f0800e5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->A:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->A:Landroid/widget/ListView;

    .line 1
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->H:Landroid/view/View;

    if-nez v0, :cond_19f

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0b0065

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->H:Landroid/view/View;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Landroid/widget/ArrayAdapter;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v5, 0x1090008

    invoke-direct {v2, v3, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const v3, 0x7f0b007a

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v7, 0x7f0f00e0

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v7, 0x7f0f00de

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v7, 0x7f0f00e6

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v7, 0x7f0f00e1

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v7, 0x7f0f00e4

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->H:Landroid/view/View;

    const v7, 0x7f080187

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Spinner;

    invoke-virtual {v6, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v2, Le/e/a/t0;

    invoke-direct {v2, p0, v1}, Le/e/a/t0;-><init>(Lcom/sauzask/nicoid/NicoidRankingActivity;Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {v6, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    const-string v2, "ranking_sort_span"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v6, v2}, Landroid/widget/Spinner;->setSelection(I)V

    invoke-static {v2}, Le/e/a/ModernRanking;->term(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->E:Ljava/lang/String;

    new-instance v2, Landroid/widget/ArrayAdapter;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    invoke-direct {v2, v4, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v4, 0x7f0f00df

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v4, 0x7f0f00e5

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v4, 0x7f0f00e3

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->B:Landroid/app/Activity;

    const v4, 0x7f0f00e2

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->H:Landroid/view/View;

    const v4, 0x7f080188

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    const/16 v4, 0x8

    invoke-virtual {v3, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v2, Le/e/a/u0;

    invoke-direct {v2, p0, v1}, Le/e/a/u0;-><init>(Lcom/sauzask/nicoid/NicoidRankingActivity;Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {v3, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    const/4 v1, 0x0

    const-string v2, "ranking_sort_type"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/Spinner;->setSelection(I)V

    :cond_19f
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->H:Landroid/view/View;

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setHeaderDividersEnabled(Z)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->A:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->C:Le/e/a/x0;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->A:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidRankingActivity$a;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidRankingActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidRankingActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidRankingActivity;->y:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onResume()V
    .registers 1

    invoke-super {p0}, Lcom/sauzask/nicoid/NicoidActivity;->onResume()V

    invoke-static {p0}, Le/e/a/Ranking190;->resume(Landroid/app/Activity;)V

    return-void
.end method
