.class public final Ly6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final b:Lcom/opera/android/custom_views/StylingImageButton;

.field public final c:Landroid/widget/ImageView;

.field public final d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

.field public final e:Lcom/opera/android/ui/catalog/widget/OperaTextView;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageButton;Landroid/widget/ImageView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly6o;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Ly6o;->b:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p3, p0, Ly6o;->c:Landroid/widget/ImageView;

    iput-object p4, p0, Ly6o;->d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iput-object p5, p0, Ly6o;->e:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    return-void
.end method

.method public static a(Landroid/view/View;)Ly6o;
    .registers 9

    const v0, 0x7f0a0231

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v4, :cond_39

    const v0, 0x7f0a0322

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/ImageView;

    if-eqz v5, :cond_39

    const v0, 0x7f0a06b5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v6, :cond_39

    const v0, 0x7f0a06c5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v7, :cond_39

    new-instance v2, Ly6o;

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v2 .. v7}, Ly6o;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageButton;Landroid/widget/ImageView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V

    return-object v2

    :cond_39
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Ly6o;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
