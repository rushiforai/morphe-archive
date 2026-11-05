.class public Lcom/sauzask/nicoid/NicoidMylistGroupActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""

# interfaces
.implements Le/e/a/l3/k;


# instance fields
.field public A:Landroid/widget/ListView;

.field public B:Landroid/app/Activity;

.field public C:Le/e/a/x0;

.field public D:Le/e/a/i2;

.field public E:Landroid/view/LayoutInflater;

.field public F:Lcom/google/android/gms/ads/AdView;

.field public G:Landroid/view/View;

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

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->B:Landroid/app/Activity;

    const-string p1, "layout_inflater"

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->E:Landroid/view/LayoutInflater;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->E:Landroid/view/LayoutInflater;

    const/4 v0, 0x0

    const v1, 0x7f0b006e

    invoke-virtual {p1, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->y:Landroid/view/View;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->y:Landroid/view/View;

    invoke-static {p1}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    new-instance p1, Le/e/a/x0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->B:Landroid/app/Activity;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->z:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-direct {p1, v1, v2, v3}, Le/e/a/x0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->C:Le/e/a/x0;

    new-instance p1, Le/e/a/i2;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->B:Landroid/app/Activity;

    invoke-direct {p1, v0, v1}, Le/e/a/i2;-><init>(Le/e/a/b0;Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->D:Le/e/a/i2;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->D:Le/e/a/i2;

    .line 1
    iput-object p0, p1, Le/e/a/i2;->d:Le/e/a/l3/k;

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f009b

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->y:Landroid/view/View;

    const v1, 0x7f0800e5

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->A:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->A:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->C:Le/e/a/x0;

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$a;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->D:Le/e/a/i2;

    invoke-virtual {p1, v3, v0, v0}, Le/e/a/i2;->a(ILjava/util/ArrayList;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->y:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method
