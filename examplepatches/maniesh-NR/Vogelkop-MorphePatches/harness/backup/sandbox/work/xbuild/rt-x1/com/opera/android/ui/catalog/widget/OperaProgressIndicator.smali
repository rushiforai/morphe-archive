.class public final Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "catalog"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final p:Lov0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d0318

    invoke-virtual {p2, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {p0}, Lov0;->g(Landroid/view/View;)Lov0;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;->p:Lov0;

    const p2, 0x7f0809af

    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    const p2, 0x7f0402f2

    invoke-static {p2, p1}, Lj7h;->l(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method


# virtual methods
.method public final r(F)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;->p:Lov0;

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/constraintlayout/widget/Guideline;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Ljo5;

    iget-boolean v1, p0, Landroidx/constraintlayout/widget/Guideline;->a:Z

    if-eqz v1, :cond_17

    iget v1, v0, Ljo5;->c:F

    cmpl-float v1, v1, p1

    if-nez v1, :cond_17

    return-void

    :cond_17
    iput p1, v0, Ljo5;->c:F

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
