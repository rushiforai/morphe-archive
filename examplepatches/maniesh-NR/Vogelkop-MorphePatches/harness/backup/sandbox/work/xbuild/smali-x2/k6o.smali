.class public final synthetic Lk6o;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final a:Lk6o;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lk6o;

    const-string v4, "bind(Landroid/view/View;)Lcom/opera/android/databinding/WorldCupPromoCardHomeTeamContentBinding;"

    const/4 v5, 0x0

    const/4 v1, 0x1

    const-class v2, Lz6o;

    const-string v3, "bind"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lk6o;->a:Lk6o;

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

    if-eqz v0, :cond_2b

    const p0, 0x7f0a04c2

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_2b

    const p0, 0x7f0a0514

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2b

    invoke-static {v1}, Ly6o;->a(Landroid/view/View;)Ly6o;

    move-result-object p0

    new-instance v1, Lz6o;

    invoke-direct {v1, p1, v0, p0}, Lz6o;-><init>(Landroid/view/View;Lcom/google/android/material/button/MaterialButton;Ly6o;)V

    return-object v1

    :cond_2b
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
