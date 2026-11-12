.class public abstract Lywa;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008&\u0018\u00002\u00020\u00012\u00020\u0002B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lywa;",
        "Landroidx/fragment/app/Fragment;",
        "",
        "<init>",
        "()V",
        "image-editor"
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
.field public static final synthetic g:[Lxtb;


# instance fields
.field public final a:Lqs2;

.field public b:Landroid/graphics/PointF;

.field public final c:Lzyk;

.field public final d:Lzyk;

.field public final e:Lxt2;

.field public final f:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lywa;

    const-string v2, "views"

    const-string v3, "getViews()Lcom/opera/hype/image/editor/databinding/HypeIeFragmentBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lywa;->g:[Lxtb;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    const v0, 0x7f0d020e

    invoke-direct {p0, v0}, Landroidx/fragment/app/Fragment;-><init>(I)V

    new-instance v0, Lbli;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lbli;-><init>(B)V

    new-instance v2, Lqwa;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lqwa;-><init>(Lywa;B)V

    new-instance v3, Lqs2;

    invoke-direct {v3, v0, v2}, Lqs2;-><init>(Lbli;Lqwa;)V

    iput-object v3, p0, Lywa;->a:Lqs2;

    new-instance v0, Lqwa;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Lqwa;-><init>(Lywa;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lywa;->c:Lzyk;

    new-instance v0, Lqwa;

    invoke-direct {v0, p0, v1}, Lqwa;-><init>(Lywa;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lywa;->d:Lzyk;

    new-instance v0, Lxt2;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lxt2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lywa;->e:Lxt2;

    new-instance v0, Lqwa;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lqwa;-><init>(Lywa;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lywa;->f:Lzyk;

    return-void
.end method


# virtual methods
.method public abstract f0()Llxa;
.end method

.method public final g0()Llxa;
    .registers 1

    iget-object p0, p0, Lywa;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llxa;

    return-object p0
.end method

.method public final h0()Lora;
    .registers 3

    sget-object v0, Lywa;->g:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lywa;->a:Lqs2;

    invoke-virtual {p0}, Lqs2;->d()V

    iget-object p0, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast p0, Lora;

    return-object p0
.end method

.method public final i0(Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p1, Luwa;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Luwa;

    iget v1, v0, Luwa;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Luwa;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Luwa;

    invoke-direct {v0, p0, p1}, Luwa;-><init>(Lywa;Lnt5;)V

    :goto_18
    iget-object p1, v0, Luwa;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Luwa;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_39

    if-eq v2, v5, :cond_35

    if-ne v2, v4, :cond_2f

    iget-object p0, v0, Luwa;->t:Lcom/opera/hype/image/editor/EditImage;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_bf

    :cond_2f
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_35
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_76

    :cond_39
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p1

    iget-object p1, p1, Llxa;->d:Lqie;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lyne;->b:Ldeg;

    sget-object v2, Lquk;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object v2

    iget-object v2, v2, Llxa;->e:Landroid/net/Uri;

    invoke-virtual {p1, v2}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object v2

    iput-boolean v5, v2, Ldwh;->d:Z

    invoke-virtual {v2}, Ldwh;->b()V

    iget v7, v2, Ldwh;->f:I

    if-nez v7, :cond_d5

    iget-object v7, v2, Ldwh;->j:Landroid/graphics/drawable/ShapeDrawable;

    if-nez v7, :cond_cf

    iput-boolean v3, v2, Ldwh;->e:Z

    iput-boolean v5, v2, Ldwh;->c:Z

    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object v7

    iget-object v7, v7, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    iget-object v7, v7, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object v7, v7, Lean;->a:Lydb;

    iput v5, v0, Luwa;->w:I

    invoke-static {v2, p1, v7, v0}, Lquk;->b(Ldwh;Ldeg;Landroid/widget/ImageView;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_bb

    :goto_76
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_91

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    const-string p1, "Couldn\'t open the image"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_91
    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p1}, Lcom/opera/hype/image/editor/EditImage;->d()Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_a0

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_a0
    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p0

    iget-object p0, p0, Llxa;->d:Lqie;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    sget-object p0, Lbb7;->a:Lcv6;

    new-instance v5, Lbz1;

    const/16 v7, 0xe

    invoke-direct {v5, v7, v6, v2}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Luwa;->t:Lcom/opera/hype/image/editor/EditImage;

    iput v4, v0, Luwa;->w:I

    invoke-static {p0, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_bc

    :cond_bb
    return-object v1

    :cond_bc
    move-object v8, p1

    move-object p1, p0

    move-object p0, v8

    :goto_bf
    check-cast p1, Landroid/graphics/Bitmap;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->o:Lqk3;

    iget-object p0, p0, Lqk3;->c:Lfz2;

    sget-object v0, Lqk3;->d:[Lxtb;

    aget-object v0, v0, v3

    invoke-virtual {p0, v0, p1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_cf
    const-string p0, "Placeholder image already set."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_d5
    const-string p0, "Placeholder resource already set."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6
.end method

.method public final j0(Lnsl;)V
    .registers 4

    if-eqz p1, :cond_5

    iget-boolean p1, p1, Lnsl;->b:Z

    goto :goto_6

    :cond_5
    const/4 p1, 0x0

    :goto_6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_40

    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object p0

    iget-object p0, p0, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWindowInsetsController()Landroid/view/WindowInsetsController;

    move-result-object p0

    if-eqz p0, :cond_3f

    if-eqz p1, :cond_2d

    const/4 p1, 0x2

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result p1

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->hide(I)V

    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result p1

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->hide(I)V

    return-void

    :cond_2d
    const/4 p1, 0x1

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result p1

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->show(I)V

    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result p1

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->show(I)V

    :cond_3f
    return-void

    :cond_40
    if-eqz p1, :cond_45

    const/16 p1, 0x1b06

    goto :goto_47

    :cond_45
    const/16 p1, 0x300

    :goto_47
    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object p0

    iget-object p0, p0, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    invoke-virtual {p1}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p1

    iget-object v0, p0, Lywa;->e:Lxt2;

    invoke-virtual {p1, p0, v0}, Lkcf;->a(Lndc;Lgcf;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    iget-object p0, p0, Lywa;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbz0;

    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    :cond_14
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-super/range {p0 .. p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const v2, 0x7f0a0041

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Landroid/widget/ImageView;

    if-eqz v6, :cond_3f6

    const v2, 0x7f0a0055

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroid/widget/ImageView;

    if-eqz v7, :cond_3f6

    const v2, 0x7f0a0056

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Landroid/widget/ViewSwitcher;

    if-eqz v8, :cond_3f6

    const v2, 0x7f0a023f

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0240

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0243

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0244

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a024b

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a024c

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a024d

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0366

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lcom/opera/hype/image/editor/EditImage;

    if-eqz v9, :cond_3f6

    const v2, 0x7f0a0531

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Landroid/widget/ImageView;

    if-eqz v10, :cond_3f6

    const v2, 0x7f0a0532

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Landroid/widget/ImageView;

    if-eqz v11, :cond_3f6

    const v2, 0x7f0a0533

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    if-eqz v12, :cond_3f6

    const v2, 0x7f0a04f5

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Landroid/widget/ProgressBar;

    if-eqz v13, :cond_3f6

    const v2, 0x7f0a0a63

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Landroid/widget/LinearLayout;

    if-eqz v14, :cond_3f6

    const v2, 0x7f0a0a64

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Landroid/widget/LinearLayout;

    if-eqz v15, :cond_3f6

    const v2, 0x7f0a0b74

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Landroid/widget/ImageView;

    if-eqz v16, :cond_3f6

    const v2, 0x7f0a0b75

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v17, v3

    check-cast v17, Landroid/widget/ImageView;

    if-eqz v17, :cond_3f6

    const v2, 0x7f0a0b76

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v18, v3

    check-cast v18, Landroid/widget/ImageView;

    if-eqz v18, :cond_3f6

    const v2, 0x7f0a0b77

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v19, v3

    check-cast v19, Landroid/widget/ImageView;

    if-eqz v19, :cond_3f6

    const v2, 0x7f0a0b78

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v20

    if-eqz v20, :cond_3f6

    const v2, 0x7f0a0bb4

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0bb5

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0bb6

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0bb7

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0bb8

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    const v2, 0x7f0a0bb9

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_3f6

    new-instance v4, Lora;

    move-object v5, v1

    check-cast v5, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v4 .. v20}, Lora;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/ViewSwitcher;Lcom/opera/hype/image/editor/EditImage;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/view/View;Landroid/widget/ProgressBar;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/view/View;)V

    sget-object v1, Lywa;->g:[Lxtb;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-object v1, v0, Lywa;->a:Lqs2;

    invoke-virtual {v1}, Lqs2;->d()V

    invoke-virtual {v1, v4}, Lqs2;->e(Lora;)V

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Llxa;->n:Lnak;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v3

    iget-object v3, v3, Llxa;->m:Lnak;

    new-instance v4, Lkm4;

    const/4 v5, 0x6

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6, v0}, Lkm4;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v5, Lya9;

    invoke-direct {v5, v1, v3, v4, v2}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    invoke-static {v5, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v1

    iget-object v1, v1, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v3, Lbm8;

    const/16 v4, 0x14

    invoke-direct {v3, v0, v4}, Lbm8;-><init>(Ljava/lang/Object;B)V

    sget-object v4, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v1, v3}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v1

    iget-object v1, v1, Lora;->b:Landroid/widget/ImageView;

    new-instance v3, Lrwa;

    invoke-direct {v3, v0, v2}, Lrwa;-><init>(Lywa;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v1

    iget-object v1, v1, Lora;->c:Landroid/widget/ImageView;

    new-instance v3, Lrwa;

    const/4 v4, 0x1

    invoke-direct {v3, v0, v4}, Lrwa;-><init>(Lywa;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v1

    iget-object v1, v1, Lora;->d:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v3

    iget-object v3, v3, Lora;->c:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v3

    iget-object v3, v3, Lora;->d:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v5

    iget-object v5, v5, Lora;->i:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v5

    iget-object v5, v5, Llxa;->l:Lnak;

    new-instance v7, Lxwa;

    invoke-direct {v7, v0, v1, v3, v6}, Lxwa;-><init>(Lywa;IILmt5;)V

    new-instance v1, Lz99;

    const/4 v3, 0x2

    invoke-direct {v1, v5, v7, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v5

    invoke-static {v5}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v5

    invoke-static {v1, v5}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Llxa;->m:Lnak;

    new-instance v5, Lwwa;

    invoke-direct {v5, v0, v6, v4}, Lwwa;-><init>(Lywa;Lmt5;B)V

    new-instance v7, Lz99;

    invoke-direct {v7, v1, v5, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    invoke-static {v7, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v1

    iget-object v1, v1, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    new-instance v5, Lqq6;

    const/16 v7, 0x13

    invoke-direct {v5, v0, v7}, Lqq6;-><init>(Ljava/lang/Object;B)V

    iput-object v5, v1, Lcom/opera/hype/image/editor/EditImage;->m:Lqq6;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v5

    iget-object v5, v5, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    new-instance v7, Lge5;

    const/16 v8, 0x19

    invoke-direct {v7, v0, v1, v8}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v7, v5, Lcom/opera/hype/image/editor/EditImage;->r:Ltam;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v1

    iget-object v1, v1, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v5

    iget-object v5, v5, Llxa;->t:Ldya;

    invoke-virtual {v1, v5}, Lcom/opera/hype/image/editor/EditImage;->k(Ldya;)V

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Llxa;->f:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_247
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_26c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnsl;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v7

    iget-object v7, v7, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget v8, v5, Lnsl;->a:I

    invoke-static {v7, v8}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    new-instance v8, Ljf7;

    const/16 v9, 0xc

    invoke-direct {v8, v0, v5, v9}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_247

    :cond_26c
    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Llxa;->j:Lmcj;

    iget-object v1, v1, Lmcj;->b:Ljava/lang/Object;

    check-cast v1, Lf99;

    new-instance v5, Lvwa;

    invoke-direct {v5, v0, v6, v2}, Lvwa;-><init>(Lywa;Lmt5;B)V

    new-instance v7, Lz99;

    invoke-direct {v7, v1, v5, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    invoke-static {v7, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Llxa;->i:Li16;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v5

    iget-object v5, v5, Lora;->g:Landroid/widget/ImageView;

    new-instance v7, Lswa;

    invoke-direct {v7, v1, v2}, Lswa;-><init>(Li16;B)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v5

    iget-object v5, v5, Lora;->f:Landroid/widget/ImageView;

    new-instance v7, Lswa;

    invoke-direct {v7, v1, v4}, Lswa;-><init>(Li16;B)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v1, Li16;->c:Ljava/lang/Object;

    check-cast v1, Lnak;

    new-instance v5, Lvwa;

    invoke-direct {v5, v0, v6, v4}, Lvwa;-><init>(Lywa;Lmt5;B)V

    new-instance v7, Lz99;

    invoke-direct {v7, v1, v5, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    invoke-static {v7, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    new-instance v1, Lshf;

    invoke-virtual {v0}, Lywa;->h0()Lora;

    move-result-object v5

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v7

    iget-object v7, v7, Llxa;->k:Ld7h;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v8

    invoke-static {v8}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v8

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v5, v1, Lshf;->a:Ljava/lang/Object;

    iput-object v7, v1, Lshf;->b:Ljava/lang/Object;

    iget-object v5, v5, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iput-object v5, v1, Lshf;->c:Ljava/lang/Object;

    sget-object v5, Ln8g;->h:Lh58;

    invoke-static {v5, v5}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v5

    :goto_2ef
    invoke-virtual {v5}, Lw4;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_327

    invoke-virtual {v5}, Lw4;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ln8g;

    iget-object v9, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v9, Lora;

    iget-object v9, v9, Lora;->j:Landroid/widget/LinearLayout;

    iget v10, v7, Ln8g;->a:I

    sget-object v11, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v9, v10}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    iget-object v10, v1, Lshf;->c:Ljava/lang/Object;

    check-cast v10, Landroid/content/Context;

    iget v11, v7, Ln8g;->b:I

    invoke-virtual {v10, v11}, Landroid/content/Context;->getColor(I)I

    move-result v10

    invoke-virtual {v9}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v11, v10}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    new-instance v10, Lj5g;

    const/16 v11, 0xe

    invoke-direct {v10, v1, v7, v11}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2ef

    :cond_327
    iget-object v5, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v5, Lora;

    iget-object v5, v5, Lora;->n:Landroid/widget/ImageView;

    new-instance v7, Ltij;

    invoke-direct {v7, v1, v2}, Ltij;-><init>(Lshf;B)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v5, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v5, Lora;

    iget-object v5, v5, Lora;->l:Landroid/widget/ImageView;

    new-instance v7, Ltij;

    invoke-direct {v7, v1, v4}, Ltij;-><init>(Lshf;B)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v4, Lora;

    iget-object v4, v4, Lora;->m:Landroid/widget/ImageView;

    new-instance v5, Ltij;

    invoke-direct {v5, v1, v3}, Ltij;-><init>(Lshf;B)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v4, Lora;

    iget-object v4, v4, Lora;->o:Landroid/widget/ImageView;

    new-instance v5, Ltij;

    const/4 v7, 0x3

    invoke-direct {v5, v1, v7}, Ltij;-><init>(Lshf;B)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, v1, Lshf;->b:Ljava/lang/Object;

    check-cast v4, Ld7h;

    iget-object v4, v4, Ld7h;->c:Ljava/lang/Object;

    check-cast v4, Lcw;

    new-instance v5, Ludj;

    invoke-direct {v5, v3, v6, v1}, Ludj;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v1, Lz99;

    invoke-direct {v1, v4, v5, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-static {v1, v8}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    if-eqz p2, :cond_387

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    const-string v4, "hy7"

    invoke-virtual {v1, v4}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_387

    check-cast v1, Lhy7;

    iput-object v0, v1, Lhy7;->a:Lywa;

    :cond_387
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    new-instance v4, Lwwa;

    invoke-direct {v4, v0, v6, v2}, Lwwa;-><init>(Lywa;Lmt5;B)V

    invoke-static {v1, v6, v6, v4, v7}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Llxa;->p:Lnak;

    new-instance v2, Lvwa;

    invoke-direct {v2, v0, v6, v3}, Lvwa;-><init>(Lywa;Lmt5;B)V

    new-instance v4, Lz99;

    invoke-direct {v4, v1, v2, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    invoke-static {v4, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Llxa;->n:Lnak;

    new-instance v2, Lvwa;

    invoke-direct {v2, v0, v6, v7}, Lvwa;-><init>(Lywa;Lmt5;B)V

    new-instance v4, Lz99;

    invoke-direct {v4, v1, v2, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    invoke-static {v4, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v1

    iget-object v1, v1, Lx7n;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v4, Ltwa;

    invoke-direct {v4, v0}, Ltwa;-><init>(Lywa;)V

    new-instance v5, Lvcc;

    sget-object v8, Lqcc;->a:Lqcc;

    invoke-direct {v5, v1, v2, v4}, Lvcc;-><init>(Ljava/util/ArrayList;Lndc;Ltwa;)V

    if-nez p2, :cond_3f5

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-static {v1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    new-instance v2, Lwwa;

    invoke-direct {v2, v0, v6, v3}, Lwwa;-><init>(Lywa;Lmt5;B)V

    invoke-static {v1, v6, v6, v2, v7}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_3f5
    return-void

    :cond_3f6
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
