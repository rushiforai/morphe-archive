.class public final Lc49;
.super Li83;
.source "SourceFile"


# instance fields
.field public final z:Ldb;


# direct methods
.method public constructor <init>(Ldb;)V
    .registers 6

    const v0, 0x7f1409cd

    const v1, 0x7f0d001c

    const v2, 0x7f14007a

    const v3, 0x7f140075

    invoke-direct {p0, v0, v2, v1, v3}, Li83;-><init>(IIII)V

    iput-object p1, p0, Lc49;->z:Ldb;

    return-void
.end method


# virtual methods
.method public final G0(Landroid/view/View;)Landroid/util/Pair;
    .registers 4

    const p0, 0x7f0a086c

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_1e

    const p0, 0x7f0a0953

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v1, :cond_1e

    check-cast p1, Landroid/widget/LinearLayout;

    new-instance p0, Landroid/util/Pair;

    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :cond_1e
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final H0(Lei;)V
    .registers 5

    iget-object p0, p1, Lei;->h:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070053

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f070052

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-static {p0, v1, v0}, Lq9n;->E(Landroid/view/View;II)V

    iget-object p0, p1, Lei;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070051

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-static {p1, p0}, Lq9n;->C(ILandroid/view/View;)V

    return-void
.end method

.method public final I0()V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lc49;->z:Ldb;

    invoke-static {v0, p0, v1, v2}, Lxih;->w(Landroidx/fragment/app/w;Ldb;Lfv2;Z)V

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "base-account-onboarding-fragment"

    return-object p0
.end method
