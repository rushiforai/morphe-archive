.class public final synthetic Ld6o;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final a:Ld6o;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ld6o;

    const-string v4, "bind(Landroid/view/View;)Lcom/opera/android/databinding/WorldCupPromoCardGreatBritainContentBinding;"

    const/4 v5, 0x0

    const/4 v1, 0x1

    const-class v2, Lx6o;

    const-string v3, "bind"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Ld6o;->a:Ld6o;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    move-object v1, p1

    check-cast v1, Landroid/view/View;

    const p0, 0x7f0a01d2

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz p1, :cond_69

    const p0, 0x7f0a039d

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_69

    const p0, 0x7f0a039e

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_69

    const p0, 0x7f0a039f

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_69

    const p0, 0x7f0a0514

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_69

    invoke-static {p1}, Ly6o;->a(Landroid/view/View;)Ly6o;

    move-result-object v5

    const p0, 0x7f0a0922

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    move-object v6, p1

    check-cast v6, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_69

    const p0, 0x7f0a0923

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    move-object v7, p1

    check-cast v7, Landroid/widget/ImageView;

    if-eqz v7, :cond_69

    const p0, 0x7f0a0924

    invoke-static {p0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    move-object v8, p1

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v8, :cond_69

    new-instance v0, Lx6o;

    invoke-direct/range {v0 .. v8}, Lx6o;-><init>(Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Ly6o;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V

    return-object v0

    :cond_69
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

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
