.class public final Ltqh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lknf;


# instance fields
.field public final a:Lpde;

.field public final b:Lshf;

.field public final c:Ljava/lang/String;

.field public final d:Lcom/opera/android/browser/OperaPageRootView;

.field public final e:Landroid/widget/ScrollView;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltqh;->a:Lpde;

    iput-object p3, p0, Ltqh;->c:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 p3, 0x0

    const v0, 0x7f0d0365

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p3, 0x7f0a0269

    invoke-static {p3, p1}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ScrollView;

    iput-object p3, p0, Ltqh;->e:Landroid/widget/ScrollView;

    check-cast p1, Lcom/opera/android/browser/OperaPageRootView;

    iput-object p1, p0, Ltqh;->d:Lcom/opera/android/browser/OperaPageRootView;

    new-instance v0, Lshf;

    invoke-direct {v0, p2, p3}, Lshf;-><init>(Lpde;Landroid/widget/ScrollView;)V

    iput-object v0, p0, Ltqh;->b:Lshf;

    const p0, 0x7f0a09bc

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget-object p3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->l()Lgc7;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lgc7;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p2, Lgc7;->b:Lay;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lfc7;

    iget-object p2, p2, Lfc7;->c:Ljava/lang/String;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Lqxh;

    invoke-direct {p3, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Letg;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_cb

    const p0, 0x7f0a09e8

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Letg;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    sget-object v2, Letg;->a:Lnx1;

    invoke-virtual {v2, p3}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lctg;

    if-eqz p3, :cond_aa

    iget-object p3, p3, Lctg;->b:Ljava/lang/String;

    goto :goto_ab

    :cond_aa
    move-object p3, v1

    :goto_ab
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {v2, p3}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lctg;

    if-eqz p3, :cond_c0

    iget-object p3, p3, Lctg;->c:Ljava/lang/String;

    goto :goto_c1

    :cond_c0
    move-object p3, v1

    :goto_c1
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    :cond_cb
    const p0, 0x7f0a09b9

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget-object p3, Lhs3;->a:Ln9a;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    new-instance p3, Lqxh;

    invoke-direct {p3, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    const p0, 0x7f0a09ce

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p2, p1}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_108

    new-instance v1, Lqxh;

    invoke-direct {v1, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :cond_108
    invoke-virtual {p0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance p1, Ln42;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Ln42;-><init>(B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final B()Likc;
    .registers 1

    iget-object p0, p0, Ltqh;->a:Lpde;

    return-object p0
.end method

.method public final E()V
    .registers 1

    return-void
.end method

.method public final F()V
    .registers 1

    return-void
.end method

.method public final a()V
    .registers 1

    return-void
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final e()V
    .registers 1

    return-void
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ltqh;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getView()Lcom/opera/android/browser/OperaPageRootView;
    .registers 1

    iget-object p0, p0, Ltqh;->d:Lcom/opera/android/browser/OperaPageRootView;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 1

    const-string p0, "ReferrerPage"

    return-object p0
.end method

.method public final o()V
    .registers 2

    iget-object p0, p0, Ltqh;->e:Landroid/widget/ScrollView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/widget/ScrollView;->smoothScrollBy(II)V

    return-void
.end method

.method public final q()V
    .registers 2

    iget-object p0, p0, Ltqh;->e:Landroid/widget/ScrollView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method public final r()V
    .registers 5

    iget-object p0, p0, Ltqh;->b:Lshf;

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_25

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmnf;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lmnf;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget p0, p0, Lmnf;->b:I

    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/view/View;->setPadding(IIII)V

    :cond_25
    return-void
.end method

.method public final u()V
    .registers 1

    return-void
.end method

.method public final w()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final y()V
    .registers 1

    return-void
.end method

.method public final z()Ljava/lang/String;
    .registers 1

    const-string p0, "opera://referrer"

    return-object p0
.end method
