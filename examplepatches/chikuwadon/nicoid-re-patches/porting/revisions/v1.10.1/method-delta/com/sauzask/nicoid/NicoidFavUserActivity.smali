.class public Lcom/sauzask/nicoid/NicoidFavUserActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""

# interfaces
.implements Le/e/a/l3/l;


# instance fields
.field public A:Landroid/widget/ListView;

.field public B:Landroid/app/Activity;

.field public C:Le/e/a/z;

.field public D:Landroid/view/LayoutInflater;

.field public E:Lorg/apache/http/client/CookieStore;

.field public F:Landroid/os/Handler;

.field public G:Le/e/a/y0;

.field public H:Z

.field public I:Z

.field public J:I

.field public K:Landroid/content/SharedPreferences;

.field public L:Landroidx/appcompat/app/ActionBar;

.field public M:Le/e/a/b1;

.field public N:Lcom/google/android/gms/ads/AdView;

.field public O:Landroid/view/View;

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
    .registers 6

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->K:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->K:Landroid/content/SharedPreferences;

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

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    new-instance p1, Le/e/a/y0;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    invoke-direct {p1, v0}, Le/e/a/y0;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->G:Le/e/a/y0;

    const-string p1, "layout_inflater"

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->D:Landroid/view/LayoutInflater;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->D:Landroid/view/LayoutInflater;

    const/4 v0, 0x0

    const v1, 0x7f0b006e

    invoke-virtual {p1, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->y:Landroid/view/View;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->y:Landroid/view/View;

    invoke-static {p1}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    new-instance p1, Le/e/a/z;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->z:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->G:Le/e/a/y0;

    invoke-direct {p1, v1, v2, v3}, Le/e/a/z;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Le/e/a/y0;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->C:Le/e/a/z;

    new-instance p1, Le/e/a/b1;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    invoke-direct {p1, v1}, Le/e/a/b1;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->M:Le/e/a/b1;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->M:Le/e/a/b1;

    .line 1
    iput-object p0, p1, Le/e/a/b1;->c:Le/e/a/l3/l;

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->L:Landroidx/appcompat/app/ActionBar;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->y:Landroid/view/View;

    const v1, 0x7f0800e5

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->A:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->A:Landroid/widget/ListView;

    .line 3
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->O:Landroid/view/View;

    if-nez v1, :cond_9c

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0b0038

    invoke-virtual {v1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->O:Landroid/view/View;

    :cond_9c
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->O:Landroid/view/View;

    .line 4
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->A:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->C:Le/e/a/z;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-static {p0}, Le/e/a/CreatorPage;->following(Landroid/app/Activity;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->A:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidFavUserActivity$a;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidFavUserActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidFavUserActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->A:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidFavUserActivity$b;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidFavUserActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidFavUserActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->A:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidFavUserActivity$c;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidFavUserActivity$c;-><init>(Lcom/sauzask/nicoid/NicoidFavUserActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->L:Landroidx/appcompat/app/ActionBar;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    const v1, 0x7f0f0053

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->H:Z

    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Le/e/a/y;

    invoke-direct {v0, p0}, Le/e/a/y;-><init>(Lcom/sauzask/nicoid/NicoidFavUserActivity;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 6
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity;->y:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method
