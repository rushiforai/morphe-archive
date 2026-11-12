.class public final Lx0a;
.super Lhi7;
.source "SourceFile"


# static fields
.field public static x:Landroid/graphics/Point;


# instance fields
.field public final v:Lqim;

.field public final w:Ltu7;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v0

    const/4 v1, 0x1

    const v2, 0x7fffffff

    if-ne v0, v1, :cond_15

    new-instance v0, Landroid/graphics/Point;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_1a

    :cond_15
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, v2, v2}, Landroid/graphics/Point;-><init>(II)V

    :goto_1a
    sput-object v0, Lx0a;->x:Landroid/graphics/Point;

    return-void
.end method

.method public constructor <init>(Lzh7;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Lqim;Lkze;Ltu7;)V
    .registers 20

    sget-object v1, Lyh7;->b:Lyh7;

    invoke-virtual/range {p3 .. p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    move-object/from16 v4, p3

    invoke-static {v0, v4}, Lor2;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lor2;

    move-result-object v2

    iget-object v3, v2, Lor2;->f:Ljava/lang/Object;

    move-object v7, v3

    check-cast v7, Landroid/widget/FrameLayout;

    const v3, 0x7f0d01ff

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v7, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v0, :cond_53

    move-object v9, v0

    check-cast v9, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    new-instance v5, Ligi;

    iget-object v0, v2, Lor2;->c:Landroid/view/View;

    move-object v6, v0

    check-cast v6, Landroid/widget/FrameLayout;

    iget-object v0, v2, Lor2;->b:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Landroid/view/View;

    iget-object v0, v2, Lor2;->d:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Landroid/view/View;

    iget-object v0, v2, Lor2;->e:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Landroid/widget/ImageView;

    const/16 v12, 0x14

    invoke-direct/range {v5 .. v12}, Ligi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v8, Lx0a;->x:Landroid/graphics/Point;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v0 .. v8}, Lhi7;-><init>(Lyh7;Lzh7;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Ligi;Lqim;Lkze;Landroid/graphics/Point;)V

    iput-object v6, p0, Lx0a;->v:Lqim;

    move-object/from16 p1, p6

    iput-object p1, p0, Lx0a;->w:Ltu7;

    return-void

    :cond_53
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final c(Lei7;)V
    .registers 4

    iget-object v0, p0, Lhi7;->e:Ligi;

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lhi7;->d:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object p0, p0, Lx0a;->w:Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lx0a;->v:Lqim;

    iget-object v0, v0, Lqim;->e:Lysj;

    new-instance v1, Lw0a;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lw0a;-><init>(B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    invoke-super {p0}, Lhi7;->e()V

    return-void
.end method

.method public final g(Landroid/graphics/Point;)V
    .registers 2

    sput-object p1, Lx0a;->x:Landroid/graphics/Point;

    return-void
.end method
