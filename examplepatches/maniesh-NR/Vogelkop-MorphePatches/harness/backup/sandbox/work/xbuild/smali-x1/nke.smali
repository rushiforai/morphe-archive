.class public final Lnke;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Lb2l;

.field public final l:Z

.field public final m:Z

.field public final n:Z

.field public final o:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lb2l;ZZ)V
    .registers 6

    invoke-direct {p0}, Lo73;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lnke;->o:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lnke;->j:Landroid/content/Context;

    iput-object p2, p0, Lnke;->k:Lb2l;

    iput-boolean p3, p0, Lnke;->l:Z

    iput-boolean p4, p0, Lnke;->m:Z

    check-cast p2, Ld7l;

    invoke-virtual {p2}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object p1

    const/4 p2, 0x1

    if-eqz p3, :cond_2c

    check-cast p1, Liuh;

    iget-object p1, p1, Liuh;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result p1

    if-gtz p1, :cond_40

    goto :goto_3d

    :cond_2c
    check-cast p1, Liuh;

    iget-object p1, p1, Liuh;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result p3

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result p1

    sub-int/2addr p1, p2

    if-lt p3, p1, :cond_40

    :goto_3d
    iput-boolean p2, p0, Lnke;->n:Z

    return-void

    :cond_40
    const/4 p1, 0x0

    iput-boolean p1, p0, Lnke;->n:Z

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)I
    .registers 2

    const p0, 0x800003

    return p0
.end method

.method public final m(Lr9i;Landroid/view/View;)V
    .registers 13

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    iget-object p2, p0, Lnke;->k:Lb2l;

    check-cast p2, Ld7l;

    invoke-virtual {p2}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object p2

    check-cast p2, Liuh;

    iget-object v0, p2, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v1

    const/4 v2, 0x1

    move v3, v2

    :cond_18
    :goto_18
    const/4 v4, -0x1

    iget-boolean v5, p0, Lnke;->l:Z

    if-eqz v5, :cond_1f

    move v6, v4

    goto :goto_20

    :cond_1f
    move v6, v2

    :goto_20
    add-int/2addr v1, v6

    const/4 v6, 0x0

    if-ltz v1, :cond_78

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v7

    if-ge v1, v7, :cond_78

    invoke-interface {v0, v1}, Lcom/opera/android/browser/NavigationHistory;->v(I)Z

    move-result v7

    if-nez v7, :cond_18

    invoke-virtual {p2, v1}, Liuh;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v7

    invoke-interface {v7}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_47

    invoke-interface {v7}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/opera/android/browser/BrowserUtils;->getDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_5d

    :cond_47
    invoke-interface {v7}, Lcom/opera/android/browser/NavigationEntry;->getTitle()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_5c

    invoke-interface {v7}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v7}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_5d

    :cond_5c
    move-object v7, v8

    :goto_5d
    iget-object v8, p1, Litd;->f:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x2

    invoke-virtual {p1, v6, v9, v8, v7}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v6

    if-nez v5, :cond_6b

    move v4, v2

    :cond_6b
    mul-int/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lnke;->o:Ljava/util/HashMap;

    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    :cond_78
    iget-object p2, p1, Litd;->f:Ljava/util/ArrayList;

    iget-object v0, p1, Litd;->f:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    const-string v1, ""

    invoke-virtual {p1, v6, v6, p2, v1}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object p2

    const v1, 0x7f0d010e

    invoke-virtual {p2, v1}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-virtual {p2, v6}, Lptd;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const v1, 0x7f140831

    invoke-virtual {p1, v6, v6, p2, v1}, Litd;->add(IIII)Landroid/view/MenuItem;

    move-result-object p2

    const v1, 0x7f08056a

    check-cast p2, Lptd;

    invoke-virtual {p2, v1}, Lptd;->setIcon(I)Landroid/view/MenuItem;

    iget-boolean p0, p0, Lnke;->m:Z

    if-eqz p0, :cond_b9

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const p2, 0x7f140523

    invoke-virtual {p1, v6, v2, p0, p2}, Litd;->add(IIII)Landroid/view/MenuItem;

    move-result-object p0

    const p1, 0x7f0803fe

    check-cast p0, Lptd;

    invoke-virtual {p0, p1}, Lptd;->setIcon(I)Landroid/view/MenuItem;

    :cond_b9
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .registers 3

    iget-boolean v0, p0, Lnke;->n:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0, p1}, Lo73;->o(Landroid/view/View;)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 9

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const-string v1, "ACTION_DESTINATION_VIEW"

    const-string v2, "DESTINATION_VIEW_ID"

    const-string v3, "android.intent.category.LAUNCHER"

    const-string v4, "android.intent.action.MAIN"

    const/4 v5, 0x1

    iget-object v6, p0, Lnke;->j:Landroid/content/Context;

    if-nez v0, :cond_2a

    invoke-static {v6}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x2

    invoke-static {p1}, Lj7c;->f(I)B

    move-result p1

    invoke-virtual {p0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v6, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return v5

    :cond_2a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne v0, v5, :cond_54

    sget-object p0, Lwo3;->K:Lpsp;

    sget-object p1, Luo3;->d:Luo3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lpsp;->j(Luo3;)Landroid/os/Bundle;

    move-result-object p0

    invoke-static {v6}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/16 p0, 0x1f

    invoke-virtual {p1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v6, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return v5

    :cond_54
    iget-object v0, p0, Lnke;->o:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_60

    const/4 p0, 0x0

    return p0

    :cond_60
    iget-object p0, p0, Lnke;->k:Lb2l;

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    new-instance v0, Lbr;

    const/16 v1, 0x19

    invoke-direct {v0, p0, p1, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p0, p1, v0}, Ld7l;->q0(ILjava/lang/Runnable;)V

    return v5
.end method
