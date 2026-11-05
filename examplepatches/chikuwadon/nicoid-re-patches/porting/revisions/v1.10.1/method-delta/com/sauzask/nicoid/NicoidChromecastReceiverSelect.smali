.class public Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# instance fields
.field public A:Ld/p/n/e;

.field public B:Ld/p/n/f$a;

.field public C:Landroid/view/View;

.field public D:Ljava/util/ArrayList;
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

.field public E:Landroid/widget/ListView;

.field public F:Landroid/app/Activity;

.field public G:Le/e/a/x0;

.field public H:Landroid/view/LayoutInflater;

.field public I:Lcom/google/android/gms/ads/AdView;

.field public y:Ljava/lang/String;

.field public z:Ld/p/n/f;


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->F:Landroid/app/Activity;

    const-string p1, "layout_inflater"

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->H:Landroid/view/LayoutInflater;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->H:Landroid/view/LayoutInflater;

    const/4 v0, 0x0

    const v1, 0x7f0b006e

    invoke-virtual {p1, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->C:Landroid/view/View;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->C:Landroid/view/View;

    invoke-static {p1}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    const/4 v0, -0x1

    new-instance p1, Le/e/a/x0;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->F:Landroid/app/Activity;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->D:Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {p1, v0, v1, v2}, Le/e/a/x0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->G:Le/e/a/x0;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->C:Landroid/view/View;

    const v0, 0x7f0800e5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->E:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->E:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->G:Le/e/a/x0;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->E:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect$a;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect$a;-><init>(Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->C:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(Landroid/view/View;)V

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const-string v0, "\u7aef\u672b\u3092\u691c\u7d22\u4e2d"

    invoke-virtual {p0, v0, p1}, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    invoke-static {p0}, Ld/p/n/f;->a(Landroid/content/Context;)Ld/p/n/f;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->z:Ld/p/n/f;

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "com.google.android.gms.cast.CATEGORY_CAST"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "/"

    const-string v1, "FAB5A9D8"

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "[A-F0-9]+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "ALLOW_IPV6"

    invoke-static {p1, v0, v1}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_b8

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_99

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_99
    if-nez v0, :cond_9e

    .line 3
    sget-object p1, Ld/p/n/e;->c:Ld/p/n/e;

    goto :goto_ae

    :cond_9e
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v1, "controlCategories"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    new-instance v1, Ld/p/n/e;

    invoke-direct {v1, p1, v0}, Ld/p/n/e;-><init>(Landroid/os/Bundle;Ljava/util/List;)V

    move-object p1, v1

    .line 4
    :goto_ae
    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->A:Ld/p/n/e;

    new-instance p1, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect$b;

    invoke-direct {p1, p0}, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect$b;-><init>(Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidChromecastReceiverSelect;->B:Ld/p/n/f$a;

    return-void

    .line 5
    :cond_b8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "category must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 6
    :cond_c0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid application ID: "

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
