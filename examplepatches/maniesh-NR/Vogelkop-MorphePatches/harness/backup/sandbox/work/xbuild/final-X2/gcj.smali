.class public final Lgcj;
.super Lltl;
.source "SourceFile"


# static fields
.field public static final y:Landroid/graphics/Bitmap$CompressFormat;


# instance fields
.field public final r:Ldx3;

.field public final s:Lag7;

.field public final t:Lumi;

.field public final u:Lnej;

.field public final v:Lysj;

.field public final w:Lorm;

.field public x:Lpt1;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lgcj;->y:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public constructor <init>(Ldx3;Lag7;Lumi;Lnej;Lysj;Lorm;)V
    .registers 9

    const v0, 0x7f0d0397

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    const v1, 0x7f100033

    iput v1, v0, Litl;->b:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Lgcj;->r:Ldx3;

    iput-object p2, p0, Lgcj;->s:Lag7;

    iput-object p3, p0, Lgcj;->t:Lumi;

    iput-object p4, p0, Lgcj;->u:Lnej;

    iput-object p5, p0, Lgcj;->v:Lysj;

    iput-object p6, p0, Lgcj;->w:Lorm;

    return-void
.end method


# virtual methods
.method public final G0(Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Lgcj;->x:Lpt1;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_27

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->eraseColor(I)V

    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    goto :goto_28

    :cond_27
    move-object v2, v1

    :goto_28
    if-nez v2, :cond_2e

    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_2e
    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v3, p0, Lgcj;->t:Lumi;

    invoke-direct {v0, v1, v3}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lvvf;

    const/16 v3, 0x11

    invoke-direct {v1, v2, p0, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance v0, Lvvf;

    const/16 v1, 0x12

    invoke-direct {v0, v2, p1, v1}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0a39

    const/4 v2, 0x1

    iget-object v3, p0, Lgcj;->w:Lorm;

    if-ne v0, v1, :cond_1d

    const/16 p1, 0x1b

    check-cast v3, Lx5f;

    invoke-virtual {v3, p1}, Lx5f;->S(I)V

    new-instance p1, Lecj;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lecj;-><init>(Lgcj;B)V

    invoke-virtual {p0, p1}, Lgcj;->G0(Lkotlin/jvm/functions/Function1;)V

    goto :goto_35

    :cond_1d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0a3a

    if-ne p1, v0, :cond_35

    const/16 p1, 0x1a

    check-cast v3, Lx5f;

    invoke-virtual {v3, p1}, Lx5f;->S(I)V

    new-instance p1, Lecj;

    invoke-direct {p1, p0, v2}, Lecj;-><init>(Lgcj;B)V

    invoke-virtual {p0, p1}, Lgcj;->G0(Lkotlin/jvm/functions/Function1;)V

    :cond_35
    :goto_35
    return v2
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 13

    const/16 p1, 0x19

    iget-object v0, p0, Lgcj;->w:Lorm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, p1}, Lx5f;->S(I)V

    const p1, 0x7f0a0908

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0269

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/FadingNestedScrollView;

    if-eqz v1, :cond_16e

    const v0, 0x7f0a088a

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/ImageView;

    if-eqz v4, :cond_16e

    const v0, 0x7f0a088b

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/RelativeLayout;

    if-eqz v5, :cond_16e

    move-object v3, p1

    check-cast v3, Lcom/opera/android/StatusBarDrawingFrameLayout;

    const v0, 0x7f0a0a41

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_16e

    const v0, 0x7f0a0aad

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/Spinner;

    if-eqz v7, :cond_16e

    const v0, 0x7f0a06c5

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_16e

    const v0, 0x7f0a0bba

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/Toolbar;

    if-eqz v1, :cond_16e

    new-instance v2, Lpt1;

    const/16 v9, 0x12

    invoke-direct/range {v2 .. v9}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v2, p0, Lgcj;->x:Lpt1;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_16d

    const-string v0, "share_intent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    instance-of v0, p1, Landroid/content/Intent;

    const/4 v1, 0x0

    if-eqz v0, :cond_82

    check-cast p1, Landroid/content/Intent;

    goto :goto_83

    :cond_82
    move-object p1, v1

    :goto_83
    if-eqz p1, :cond_16d

    const-string v0, "android.intent.extra.TITLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Locp;->j(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v3

    const/4 p1, 0x0

    if-eqz v0, :cond_b0

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b0

    iget-object v2, p0, Lgcj;->x:Lpt1;

    if-nez v2, :cond_9d

    move-object v2, v1

    :cond_9d
    iget-object v2, v2, Lpt1;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lgcj;->x:Lpt1;

    if-nez v2, :cond_a9

    move-object v2, v1

    :cond_a9
    iget-object v2, v2, Lpt1;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_b0
    if-eqz v3, :cond_16d

    iget-object v0, p0, Lgcj;->x:Lpt1;

    if-nez v0, :cond_b7

    move-object v0, v1

    :cond_b7
    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lgcj;->x:Lpt1;

    if-nez v0, :cond_c3

    move-object v0, v1

    :cond_c3
    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    new-instance v2, Ldkl;

    invoke-direct {v2, v3}, Ldkl;-><init>(Ljava/lang/String;)V

    new-instance v4, Lwkl;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-static {v0, v2, v4}, Lna2;->R(Landroid/widget/TextView;Lcgh;Ledf;)V

    iget-object v0, p0, Lgcj;->x:Lpt1;

    if-nez v0, :cond_d9

    move-object v0, v1

    :cond_d9
    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/Spinner;

    invoke-virtual {v0}, Lcom/opera/android/custom_views/Spinner;->a()V

    iget-object v0, p0, Lgcj;->x:Lpt1;

    if-nez v0, :cond_e5

    move-object v0, v1

    :cond_e5
    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/Spinner;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    iget-object v0, p0, Lgcj;->x:Lpt1;

    if-eqz v0, :cond_f3

    move-object v1, v0

    :cond_f3
    iget-object v0, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance v0, Lecj;

    invoke-direct {v0, p0, p1}, Lecj;-><init>(Lgcj;B)V

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const v1, 0x7f070906

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    const v1, 0x7f04076e

    const v2, 0x7f06063b

    invoke-static {v1, p2, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v5

    const v1, 0x7f0806f1

    invoke-static {v1, p2}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v2, 0x7f070905

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    new-instance v2, Lfr;

    const/16 v7, 0x13

    invoke-direct {v2, p1, p1, v7}, Lfr;-><init>(IIB)V

    new-instance p1, Lseh;

    invoke-direct {p1, v1, v2}, Lseh;-><init>(Landroid/graphics/drawable/Drawable;Lfr;)V

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const p1, 0x7f0806f0

    invoke-static {p1, p2}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-lez v4, :cond_16a

    new-instance v2, Lteh;

    invoke-direct/range {v2 .. v7}, Lteh;-><init>(Ljava/lang/String;IILjava/util/ArrayList;Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lrml;

    iget-object p0, p0, Lgcj;->t:Lumi;

    invoke-direct {p1, v2, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lbli;

    const/16 p2, 0x11

    invoke-direct {p0, p2}, Lbli;-><init>(B)V

    invoke-virtual {p1, p0}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Ltji;

    const/16 p2, 0x10

    invoke-direct {p1, v0, p2}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :cond_16a
    invoke-static {}, Lhai;->d()V

    :cond_16d
    return-void

    :cond_16e
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final z0()V
    .registers 1

    return-void
.end method
