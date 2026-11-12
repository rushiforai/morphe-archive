.class public final Lcom/opera/android/premium/ui/view/PremiumPricingCard;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/premium/ui/view/PremiumPricingCard;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Landroid/widget/Checkable;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final r:[I


# instance fields
.field public p:Z

.field public final q:Lrvg;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x10100a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->r:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 19
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    move-object/from16 v1, p0

    const/4 v0, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v1, v2, v3, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0d0347

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0a0140

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_f6

    const v0, 0x7f0a0149

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_f6

    const v0, 0x7f0a029f

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_f6

    const v0, 0x7f0a02a0

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_f6

    const v0, 0x7f0a02a1

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_f6

    const v0, 0x7f0a02a2

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/helper/widget/Flow;

    if-eqz v7, :cond_f6

    const v0, 0x7f0a038d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v7, :cond_f6

    const v0, 0x7f0a05e0

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_f6

    const v0, 0x7f0a05e1

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_f6

    const v0, 0x7f0a05e2

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroidx/constraintlayout/helper/widget/Flow;

    if-eqz v9, :cond_f6

    const v0, 0x7f0a05e3

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_f6

    const v0, 0x7f0a05ea

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_f6

    const v0, 0x7f0a05eb

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_f6

    const v0, 0x7f0a05ec

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    if-eqz v11, :cond_f6

    const v0, 0x7f0a05ed

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/helper/widget/Flow;

    if-eqz v12, :cond_f6

    const v0, 0x7f0a0779

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    if-eqz v13, :cond_f6

    const v0, 0x7f0a0868

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v14, :cond_f6

    const v0, 0x7f0a0869

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/Space;

    if-eqz v14, :cond_f6

    const v0, 0x7f0a089b

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/ImageView;

    if-eqz v14, :cond_f6

    const v0, 0x7f0a0bf4

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_f6

    new-instance v0, Lrvg;

    invoke-direct/range {v0 .. v15}, Lrvg;-><init>(Lcom/opera/android/premium/ui/view/PremiumPricingCard;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/constraintlayout/helper/widget/Flow;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    iput-object v0, v1, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->q:Lrvg;

    return-void

    :cond_f6
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    throw v0
.end method


# virtual methods
.method public final isChecked()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->p:Z

    return p0
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->p:Z

    if-eqz v0, :cond_11

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->r:[I

    invoke-static {p0, p1}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0

    :cond_11
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    return-object p0
.end method

.method public final setChecked(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->p:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->p:Z

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    return-void
.end method

.method public final toggle()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->p:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->setChecked(Z)V

    return-void
.end method
