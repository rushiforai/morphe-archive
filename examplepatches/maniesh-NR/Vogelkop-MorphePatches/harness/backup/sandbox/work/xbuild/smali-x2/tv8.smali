.class public final Ltv8;
.super Llx8;
.source "SourceFile"


# instance fields
.field public final d:Lcom/opera/android/custom_views/PullSpinner;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 4

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a0aad

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/PullSpinner;

    iput-object p1, p0, Ltv8;->d:Lcom/opera/android/custom_views/PullSpinner;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->C(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p1, Lcom/opera/android/custom_views/PullSpinner;->e:Lz9h;

    iput v0, v1, Lz9h;->c:I

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    invoke-virtual {p1}, Lcom/opera/android/custom_views/PullSpinner;->d()V

    new-instance v0, Lpc5;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_2e

    return-void

    :cond_2e
    invoke-static {p0, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final U()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public final V(Lja2;Z)V
    .registers 3

    check-cast p1, Lsv8;

    iget p1, p1, Lsv8;->c:I

    invoke-virtual {p0, p1}, Ltv8;->e0(I)V

    return-void
.end method

.method public final Y()V
    .registers 2

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ltv8;->e0(I)V

    return-void
.end method

.method public final e0(I)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne p1, v2, :cond_7

    move v3, v1

    goto :goto_8

    :cond_7
    move v3, v0

    :goto_8
    iget-object p0, p0, Ltv8;->d:Lcom/opera/android/custom_views/PullSpinner;

    invoke-virtual {p0, v3}, Lcom/opera/android/custom_views/PullSpinner;->b(I)V

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_23

    if-eq p1, v2, :cond_1e

    if-eq p1, v1, :cond_18

    return-void

    :cond_18
    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1e
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_23
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
