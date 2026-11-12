.class public final Lrmh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzcj;

.field public b:Lp1j;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->Q0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzcj;

    iput-object p1, p0, Lrmh;->a:Lzcj;

    return-void
.end method

.method public static a(Landroid/view/View;)Lrmh;
    .registers 4

    const v0, 0x7f0a0c94

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lrmh;

    if-eqz v2, :cond_e

    check-cast v1, Lrmh;

    return-object v1

    :cond_e
    new-instance v1, Lrmh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lrmh;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    new-instance v0, Lz61;

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v0}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-object v1
.end method


# virtual methods
.method public final b(Li4d;Lb2l;Lcom/opera/api/Callback;)V
    .registers 9

    iget-object v0, p0, Lrmh;->b:Lp1j;

    if-eqz v0, :cond_8

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lp1j;->cancel(Z)Z

    :cond_8
    iget-object p1, p1, Li4d;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Intent;

    iget-object v0, p0, Lrmh;->a:Lzcj;

    invoke-virtual {v0, p1, p2}, Lzcj;->c(Landroid/content/Intent;Lb2l;)Ljava/util/ArrayList;

    move-result-object p2

    new-instance v1, Leof;

    invoke-direct {v1, p0, p2, p3}, Leof;-><init>(Lrmh;Ljava/util/ArrayList;Lcom/opera/api/Callback;)V

    invoke-static {p2}, Lzcj;->d(Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object p2

    iget-object p3, v0, Lzcj;->c:Lqie;

    iget-object v2, v0, Lzcj;->b:Lumi;

    new-instance v3, Lycj;

    const/4 v4, 0x1

    invoke-direct {v3, v0, p1, p2, v4}, Lycj;-><init>(Lzcj;Landroid/content/Intent;Ljava/util/HashMap;B)V

    invoke-interface {v2, v3}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance p2, Ltxi;

    const/4 v0, 0x3

    invoke-direct {p2, v1, v0}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, p2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p2

    invoke-virtual {p1, p2}, Lnml;->b(Lnml;)V

    new-instance p2, Loml;

    invoke-direct {p2, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    invoke-virtual {p3, p2, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    move-result-object p1

    iput-object p1, p0, Lrmh;->b:Lp1j;

    return-void
.end method
