.class public final synthetic Lg7o;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final a:Lg7o;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lg7o;

    const-string v4, "bind(Landroid/view/View;)Lcom/opera/android/databinding/WorldCupPromoCardRecommendedTeamsContentBinding;"

    const/4 v5, 0x0

    const/4 v1, 0x1

    const-class v2, La7o;

    const-string v3, "bind"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lg7o;->a:Lg7o;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Landroid/view/View;

    const p0, 0x7f0a01d2

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :cond_2c

    const p0, 0x7f0a0514

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2c

    invoke-static {v0}, Ly6o;->a(Landroid/view/View;)Ly6o;

    move-result-object p0

    const v0, 0x7f0a08c0

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_2b

    new-instance v0, La7o;

    invoke-direct {v0, p1, p0, v1}, La7o;-><init>(Landroid/view/View;Ly6o;Landroidx/recyclerview/widget/RecyclerView;)V

    return-object v0

    :cond_2b
    move p0, v0

    :cond_2c
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
