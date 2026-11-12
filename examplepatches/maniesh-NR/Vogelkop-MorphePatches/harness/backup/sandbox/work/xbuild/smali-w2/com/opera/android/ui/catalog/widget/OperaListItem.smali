.class public Lcom/opera/android/ui/catalog/widget/OperaListItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0017\u0018\u00002\u00020\u00012\u00020\u0002:\u0004\u0003\u0004\u0005\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/opera/android/ui/catalog/widget/OperaListItem;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Landroid/widget/Checkable;",
        "bpd",
        "vlf",
        "i41",
        "uup",
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


# static fields
.field public static final synthetic C:I


# instance fields
.field public final A:Lbpd;

.field public final B:Ldmf;

.field public final p:Lpt1;

.field public q:I

.field public final r:Lzvd;

.field public final s:Lhm3;

.field public t:Landroid/view/View$OnClickListener;

.field public u:Lvlf;

.field public final v:Ljava/lang/Integer;

.field public w:Li41;

.field public x:Luup;

.field public final y:Z

.field public z:Lpxh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 800
    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 15

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d030e

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a038d

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/Barrier;

    const/4 v3, 0x0

    if-eqz v2, :cond_30d

    const v1, 0x7f0a0390

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroid/widget/FrameLayout;

    if-eqz v6, :cond_30d

    const v1, 0x7f0a0391

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_30d

    const v1, 0x7f0a0393

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v2, :cond_30d

    const v1, 0x7f0a0ac7

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v2, :cond_30d

    const v1, 0x7f0a0aca

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/widget/FrameLayout;

    if-eqz v8, :cond_30d

    const v1, 0x7f0a0acb

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v2, :cond_30d

    const v1, 0x7f0a0af4

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v9, :cond_30d

    const v1, 0x7f0a06c5

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v10, :cond_30d

    new-instance v4, Lpt1;

    move-object v5, p0

    invoke-direct/range {v4 .. v10}, Lpt1;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Landroid/widget/FrameLayout;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V

    iput-object v4, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->p:Lpt1;

    invoke-static {p1}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p0

    invoke-static {p0, p1}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object p0

    sget-object v1, Lgpj;->a:Lgpj;

    invoke-virtual {p0}, Lgpj;->d()Z

    move-result p0

    sget-object v1, Lamf;->l:Lamf;

    const/16 v2, 0xa

    const/4 v4, 0x2

    if-eqz p0, :cond_9a

    move p0, v2

    goto :goto_9b

    :cond_9a
    move p0, v4

    :goto_9b
    iput p0, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    new-instance p0, Lzvd;

    const/4 v6, 0x7

    invoke-direct {p0, v5, v6}, Lzvd;-><init>(Ljava/lang/Object;B)V

    iput-object p0, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r:Lzvd;

    new-instance p0, Lhm3;

    invoke-direct {p0, v5, v4}, Lhm3;-><init>(Ljava/lang/Object;B)V

    iput-object p0, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->s:Lhm3;

    iput-object v1, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    sget-object p0, Lrlf;->h:Lrlf;

    iput-object p0, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    new-instance v6, Lbpd;

    const/16 v7, 0x1c

    invoke-direct {v6, v7, v5, v10, v0}, Lbpd;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v6, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A:Lbpd;

    new-instance v6, Ldmf;

    invoke-direct {v6, v5, v9}, Ldmf;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V

    iput-object v6, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    sget-object v6, Lohh;->b:[I

    invoke-virtual {p1, p2, v6, v0, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    const/4 p3, 0x1

    if-eqz p2, :cond_da

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    const v6, 0x7f040846

    if-eq p2, v6, :cond_da

    iput-boolean p3, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y:Z

    :cond_da
    const/4 p2, 0x5

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    const/4 v7, 0x4

    const/4 v8, 0x3

    if-eqz v6, :cond_111

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    if-eq v6, p3, :cond_109

    if-eq v6, v4, :cond_103

    if-eq v6, v8, :cond_fd

    if-eq v6, v7, :cond_f7

    if-ne v6, p2, :cond_10e

    new-instance p0, Lqlf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    goto :goto_10e

    :cond_f7
    new-instance p0, Ltlf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    goto :goto_10e

    :cond_fd
    new-instance p0, Lslf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    goto :goto_10e

    :cond_103
    new-instance p0, Lolf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    goto :goto_10e

    :cond_109
    new-instance p0, Lplf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :cond_10e
    :goto_10e
    invoke-virtual {v5, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y(Luup;)V

    :cond_111
    const/16 p0, 0xc

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_144

    invoke-virtual {p1, p0, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    if-eq p0, p3, :cond_13f

    if-eq p0, v4, :cond_139

    if-eq p0, v8, :cond_133

    if-eq p0, v7, :cond_12d

    if-ne p0, p2, :cond_141

    new-instance v1, Lbmf;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_141

    :cond_12d
    new-instance v1, Lwlf;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_141

    :cond_133
    new-instance v1, Lzlf;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_141

    :cond_139
    new-instance v1, Lylf;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_141

    :cond_13f
    sget-object v1, Lxlf;->l:Lxlf;

    :cond_141
    :goto_141
    invoke-virtual {v5, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B(Li41;)V

    :cond_144
    invoke-virtual {p1, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p0

    if-eqz p0, :cond_151

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p0

    invoke-virtual {v5, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    :cond_151
    invoke-virtual {p1, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p0

    if-eqz p0, :cond_163

    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p0

    new-instance p2, Llxh;

    invoke-direct {p2, p0}, Llxh;-><init>(I)V

    invoke-virtual {v5, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v(Lb8h;)V

    :cond_163
    invoke-virtual {p1, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p0

    const-string p2, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    if-eqz p0, :cond_195

    invoke-virtual {p1, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p0

    iget-object p3, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v1, p3, Lplf;

    if-nez v1, :cond_176

    move-object p3, v3

    :cond_176
    check-cast p3, Lplf;

    if-eqz p3, :cond_195

    iget-object p3, p3, Lplf;->h:Limf;

    if-nez p3, :cond_17f

    move-object p3, v3

    :cond_17f
    iget-object p3, p3, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_191

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    invoke-virtual {p3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_195

    :cond_191
    invoke-static {p2}, Lt3p;->q(Ljava/lang/String;)V

    throw v3

    :cond_195
    :goto_195
    invoke-virtual {p1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p0

    if-eqz p0, :cond_1ab

    invoke-virtual {p1, v7}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_1a7

    new-instance p3, Lexh;

    invoke-direct {p3, p0}, Lexh;-><init>(Landroid/content/res/ColorStateList;)V

    goto :goto_1a8

    :cond_1a7
    move-object p3, v3

    :goto_1a8
    invoke-virtual {v5, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x(Lcxh;)V

    :cond_1ab
    const/4 p0, 0x6

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_1be

    invoke-virtual {p1, p0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p0

    new-instance p3, Llxh;

    invoke-direct {p3, p0}, Llxh;-><init>(I)V

    invoke-virtual {v5, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    :cond_1be
    const/16 p0, 0x9

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_1f0

    invoke-virtual {p1, p0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p0

    iget-object p3, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v1, p3, Lylf;

    if-nez v1, :cond_1d1

    move-object p3, v3

    :cond_1d1
    check-cast p3, Lylf;

    if-eqz p3, :cond_1f0

    iget-object p3, p3, Lylf;->l:Limf;

    if-nez p3, :cond_1da

    move-object p3, v3

    :cond_1da
    iget-object p3, p3, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_1ec

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    invoke-virtual {p3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1f0

    :cond_1ec
    invoke-static {p2}, Lt3p;->q(Ljava/lang/String;)V

    throw v3

    :cond_1f0
    :goto_1f0
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p0

    if-eqz p0, :cond_206

    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_202

    new-instance p3, Lexh;

    invoke-direct {p3, p0}, Lexh;-><init>(Landroid/content/res/ColorStateList;)V

    goto :goto_203

    :cond_202
    move-object p3, v3

    :goto_203
    invoke-virtual {v5, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A(Lexh;)V

    :cond_206
    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_237

    invoke-virtual {p1, p0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p0

    iget-object p3, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v1, p3, Lylf;

    if-nez v1, :cond_219

    move-object p3, v3

    :cond_219
    check-cast p3, Lylf;

    if-eqz p3, :cond_237

    iget-object p3, p3, Lylf;->l:Limf;

    if-nez p3, :cond_222

    move-object p3, v3

    :cond_222
    iget-object p3, p3, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_233

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {p3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_237

    :cond_233
    invoke-static {p2}, Lt3p;->q(Ljava/lang/String;)V

    throw v3

    :cond_237
    :goto_237
    const/16 p0, 0xb

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    const/16 v1, 0x11

    if-eqz p3, :cond_265

    invoke-virtual {p1, p0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    iput-object p3, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v:Ljava/lang/Integer;

    iget-object p3, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    invoke-virtual {p3}, Li41;->D()Landroid/view/View;

    move-result-object p3

    if-eqz p3, :cond_265

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    if-eqz v2, :cond_261

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    iput p0, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_265

    :cond_261
    invoke-static {p2}, Lt3p;->q(Ljava/lang/String;)V

    throw v3

    :cond_265
    :goto_265
    const/16 p0, 0xd

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_27d

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_279

    new-instance p2, Lqxh;

    invoke-direct {p2, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_27a

    :cond_279
    move-object p2, v3

    :goto_27a
    invoke-virtual {v5, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    :cond_27d
    const/16 p0, 0xe

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    const p3, 0x7fffffff

    if-eqz p2, :cond_28f

    invoke-virtual {p1, p0, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p0

    invoke-virtual {v9, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_28f
    const/16 p0, 0xf

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_29e

    invoke-virtual {p1, p0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p0

    invoke-virtual {v9, p0}, Landroid/widget/TextView;->setTextAppearance(I)V

    :cond_29e
    const/16 p0, 0x10

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_2b4

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_2b4

    new-instance p2, Lexh;

    invoke-direct {p2, p0}, Lexh;-><init>(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v5, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->D(Lcxh;)V

    :cond_2b4
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p0

    if-eqz p0, :cond_2c8

    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2c5

    new-instance v3, Lqxh;

    invoke-direct {v3, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :cond_2c5
    invoke-virtual {v5, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    :cond_2c8
    const/16 p0, 0x12

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_2d7

    invoke-virtual {p1, p0, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p0

    invoke-virtual {v10, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_2d7
    const/16 p0, 0x13

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_2e6

    invoke-virtual {p1, p0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p0

    invoke-virtual {v10, p0}, Landroid/widget/TextView;->setTextAppearance(I)V

    :cond_2e6
    const/16 p0, 0x14

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_304

    invoke-virtual {p1, p0}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_304

    new-instance p2, Lexh;

    invoke-direct {p2, p0}, Lexh;-><init>(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v10, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_304
    iget p0, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    invoke-virtual {v5, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->G(I)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :cond_30d
    move-object v5, p0

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v3
.end method

.method public static H(Lcom/opera/android/ui/catalog/widget/OperaListItem;III)V
    .registers 6

    and-int/lit8 v0, p3, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move p1, v1

    :cond_6
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_b

    move p2, v1

    :cond_b
    iget p3, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    not-int p2, p2

    and-int/2addr p2, p3

    or-int/2addr p2, p1

    iput p2, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    if-eq p3, p2, :cond_17

    invoke-virtual {p0, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->G(I)V

    :cond_17
    return-void
.end method

.method public static varargs r(I[I)Z
    .registers 6

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_3
    if-ge v2, v0, :cond_e

    aget v3, p1, v2

    and-int/2addr v3, p0

    if-nez v3, :cond_b

    return v1

    :cond_b
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_e
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final A(Lexh;)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v0, p0, Lylf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object p0, v1

    :cond_8
    check-cast p0, Lylf;

    if-eqz p0, :cond_27

    iget-object p0, p0, Lylf;->l:Limf;

    if-nez p0, :cond_12

    move-object v0, v1

    goto :goto_13

    :cond_12
    move-object v0, p0

    :goto_13
    iget-object v0, v0, Limf;->c:Landroid/widget/ImageView;

    if-eqz p1, :cond_24

    if-eqz p0, :cond_1a

    move-object v1, p0

    :cond_1a
    iget-object p0, v1, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_24
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_27
    return-void
.end method

.method public final B(Li41;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    return-void

    :cond_11
    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->p:Lpt1;

    iget-object v1, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Li41;->F(Landroid/view/ViewGroup;)V

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v:Ljava/lang/Integer;

    if-eqz v0, :cond_45

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p1}, Li41;->D()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_45

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    if-eqz v2, :cond_3f

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_45

    :cond_3f
    const-string p0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_45
    :goto_45
    invoke-virtual {p1}, Li41;->A()I

    move-result v0

    iget v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    and-int/lit8 v2, v1, -0x3

    or-int/2addr v2, v0

    iput v2, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    if-eq v1, v2, :cond_55

    invoke-virtual {p0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->G(I)V

    :cond_55
    instance-of v0, p1, Lcmf;

    if-eqz v0, :cond_64

    check-cast p1, Lcmf;

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->s:Lhm3;

    invoke-virtual {p1}, Lcmf;->t0()Landroid/widget/CompoundButton;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_64
    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->J()V

    return-void
.end method

.method public final C(Lpxh;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    invoke-virtual {p0, p1}, Ldmf;->V(Lpxh;)V

    return-void
.end method

.method public final D(Lcxh;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    iget-object v0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object p0, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final E(Lpxh;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A:Lbpd;

    invoke-virtual {p0, p1}, Lbpd;->V(Lpxh;)V

    return-void
.end method

.method public final F()V
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_28

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f040846

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_29

    :cond_28
    const/4 v0, 0x0

    :goto_29
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public G(I)V
    .registers 6

    const/4 v0, 0x1

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-static {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r(I[I)Z

    move-result v0

    const/16 v1, 0x8

    if-eqz v0, :cond_27

    filled-new-array {v1}, [I

    move-result-object v0

    invoke-static {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r(I[I)Z

    move-result v0

    if-eqz v0, :cond_1f

    new-instance v0, Lixh;

    const/high16 v2, 0x42800000    # 64.0f

    invoke-direct {v0, v2}, Lixh;-><init>(F)V

    goto :goto_2e

    :cond_1f
    new-instance v0, Lixh;

    const/high16 v2, 0x42900000    # 72.0f

    invoke-direct {v0, v2}, Lixh;-><init>(F)V

    goto :goto_2e

    :cond_27
    new-instance v0, Lixh;

    const/high16 v2, 0x42600000    # 56.0f

    invoke-direct {v0, v2}, Lixh;-><init>(F)V

    :goto_2e
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->e:I

    if-eq v0, v2, :cond_3f

    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->e:I

    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    :cond_3f
    const/4 v0, 0x2

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-static {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r(I[I)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_5e

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f0702af

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result v3

    invoke-virtual {p0, v0, v2, v3, v2}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_65

    :cond_5e
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result v0

    invoke-virtual {p0, v2, v2, v0, v2}, Landroid/view/View;->setPaddingRelative(IIII)V

    :goto_65
    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->p:Lpt1;

    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    const/4 v3, 0x4

    filled-new-array {v3}, [I

    move-result-object v3

    invoke-static {p1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r(I[I)Z

    move-result p1

    if-eqz p1, :cond_77

    move v1, v2

    :cond_77
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u()V

    return-void
.end method

.method public final I(Z)V
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v2, v1, Lcmf;

    const/16 v7, 0x1e

    const/16 v6, 0x40

    const-class v5, Ljava/lang/CharSequence;

    const v4, 0x7f0a0b56

    const v9, 0x7f140f24

    const v10, 0x7f1412ea

    const v11, 0x7f1412eb

    const v12, 0x7f14128d

    const v13, 0x7f1412ed

    const v14, 0x7f140425

    const/4 v15, 0x0

    const-string v3, ""

    if-eqz v2, :cond_7e

    instance-of v2, v1, Lwlf;

    if-eqz v2, :cond_46

    if-eqz p1, :cond_35

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v14}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3d

    :cond_35
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_3d
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_68

    :cond_46
    instance-of v1, v1, Lbmf;

    if-eqz v1, :cond_66

    if-eqz p1, :cond_55

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_5d

    :cond_55
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_5d
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_68

    :cond_66
    move-object v1, v3

    move-object v2, v15

    :goto_68
    sget-object v8, Lr5n;->a:Ljava/util/WeakHashMap;

    move-object v8, v3

    new-instance v3, Ld5n;

    move-object/from16 v16, v8

    const/4 v8, 0x1

    move-object/from16 v9, v16

    invoke-direct/range {v3 .. v8}, Ld5n;-><init>(ILjava/lang/Class;IIB)V

    invoke-virtual {v3, v0, v1}, Ld5n;->a(Landroid/view/View;Ljava/lang/Object;)V

    sget-object v1, Ls8;->g:Ls8;

    invoke-static {v0, v1, v2, v15}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    goto :goto_7f

    :cond_7e
    move-object v9, v3

    :goto_7f
    iget-object v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v1, v1, Lulf;

    if-eqz v1, :cond_12a

    iget v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    const/4 v2, 0x4

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-static {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r(I[I)Z

    move-result v1

    if-eqz v1, :cond_9e

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    new-instance v3, Ld5n;

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Ld5n;-><init>(ILjava/lang/Class;IIB)V

    invoke-virtual {v3, v0, v9}, Ld5n;->a(Landroid/view/View;Ljava/lang/Object;)V

    return-void

    :cond_9e
    iget-object v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    if-eqz v1, :cond_119

    instance-of v2, v1, Ltlf;

    if-eqz v2, :cond_c8

    if-eqz p1, :cond_b2

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_b0
    move-object v3, v1

    goto :goto_bb

    :cond_b2
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_b0

    :goto_bb
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f14128e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_c6
    move-object v9, v3

    goto :goto_11a

    :cond_c8
    instance-of v2, v1, Lolf;

    if-eqz v2, :cond_f4

    if-eqz p1, :cond_e3

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f14128f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v14}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_e1
    move-object v3, v2

    goto :goto_c6

    :cond_e3
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_e1

    :cond_f4
    instance-of v1, v1, Lslf;

    if-eqz v1, :cond_119

    if-eqz p1, :cond_104

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_102
    move-object v3, v1

    goto :goto_10d

    :cond_104
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_102

    :goto_10d
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f140f24

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_c6

    :cond_119
    move-object v1, v15

    :goto_11a
    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    new-instance v3, Ld5n;

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Ld5n;-><init>(ILjava/lang/Class;IIB)V

    invoke-virtual {v3, v0, v9}, Ld5n;->a(Landroid/view/View;Ljava/lang/Object;)V

    sget-object v2, Ls8;->g:Ls8;

    invoke-static {v0, v2, v1, v15}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    :cond_12a
    return-void
.end method

.method public final J()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v0, v0, Lcmf;

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v0, v0, Lulf;

    if-nez v0, :cond_e

    const/4 v0, 0x0

    goto :goto_f

    :cond_e
    const/4 v0, 0x1

    :goto_f
    iget-object v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t:Landroid/view/View$OnClickListener;

    iget-object v2, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r:Lzvd;

    if-nez v0, :cond_1c

    if-ne v1, v2, :cond_21

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_1c
    if-nez v1, :cond_21

    invoke-virtual {p0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_21
    return-void
.end method

.method public final isChecked()Z
    .registers 4

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v1, v0, Lcmf;

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    check-cast v0, Lcmf;

    goto :goto_b

    :cond_a
    move-object v0, v2

    :goto_b
    const/4 v1, 0x1

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Lcmf;->isChecked()Z

    move-result v0

    if-eq v0, v1, :cond_25

    :cond_14
    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v0, p0, Lulf;

    if-eqz v0, :cond_1d

    move-object v2, p0

    check-cast v2, Lulf;

    :cond_1d
    if-eqz v2, :cond_26

    invoke-virtual {v2}, Lulf;->isChecked()Z

    move-result p0

    if-ne p0, v1, :cond_26

    :cond_25
    return v1

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-static {v0, p1}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object p1

    sget-object v0, Lgpj;->a:Lgpj;

    invoke-virtual {p1}, Lgpj;->d()Z

    move-result p1

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p1, :cond_23

    const/4 p1, 0x2

    invoke-static {p0, v1, v0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->H(Lcom/opera/android/ui/catalog/widget/OperaListItem;III)V

    return-void

    :cond_23
    const/4 p1, 0x1

    invoke-static {p0, v0, v1, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->H(Lcom/opera/android/ui/catalog/widget/OperaListItem;III)V

    return-void
.end method

.method public final s()V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t:Landroid/view/View$OnClickListener;

    iget-object v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r:Lzvd;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_c

    if-eqz v0, :cond_c

    move v0, v2

    goto :goto_d

    :cond_c
    move v0, v3

    :goto_d
    iget-object v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    invoke-virtual {v1}, Luup;->J()Z

    move-result v1

    const/4 v4, 0x4

    if-eqz v1, :cond_1d

    if-eqz v0, :cond_1d

    const/4 v0, 0x2

    invoke-static {p0, v4, v3, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->H(Lcom/opera/android/ui/catalog/widget/OperaListItem;III)V

    return-void

    :cond_1d
    invoke-static {p0, v3, v4, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->H(Lcom/opera/android/ui/catalog/widget/OperaListItem;III)V

    return-void
.end method

.method public final setChecked(Z)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v1, v0, Lcmf;

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    check-cast v0, Lcmf;

    goto :goto_b

    :cond_a
    move-object v0, v2

    :goto_b
    if-eqz v0, :cond_10

    invoke-virtual {v0, p1}, Lcmf;->setChecked(Z)V

    :cond_10
    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v1, v0, Lulf;

    if-eqz v1, :cond_19

    move-object v2, v0

    check-cast v2, Lulf;

    :cond_19
    if-eqz v2, :cond_1e

    invoke-virtual {v2, p1}, Lulf;->setChecked(Z)V

    :cond_1e
    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->I(Z)V

    return-void
.end method

.method public final setEnabled(Z)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    invoke-virtual {v0}, Li41;->D()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    :cond_e
    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    invoke-virtual {p0, p1}, Luup;->H(Z)V

    return-void
.end method

.method public final setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t:Landroid/view/View$OnClickListener;

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->F()V

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->s()V

    return-void
.end method

.method public final t(Z)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iput-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->I(Z)V

    return-void
.end method

.method public final toggle()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v1, v0, Lcmf;

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    check-cast v0, Lcmf;

    goto :goto_b

    :cond_a
    move-object v0, v2

    :goto_b
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcmf;->toggle()V

    :cond_10
    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v0, p0, Lulf;

    if-eqz v0, :cond_19

    move-object v2, p0

    check-cast v2, Lulf;

    :cond_19
    if-eqz v2, :cond_1e

    invoke-virtual {v2}, Lulf;->toggle()V

    :cond_1e
    return-void
.end method

.method public final u()V
    .registers 5

    iget v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->q:I

    const/4 v1, 0x4

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->r(I[I)Z

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v1, v0, Lqlf;

    if-nez v1, :cond_18

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Luup;->I(Z)V

    goto :goto_5e

    :cond_18
    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Luup;->I(Z)V

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    iget-object v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z:Lpxh;

    iget-object v2, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->p:Lpt1;

    if-nez v1, :cond_34

    iget-object v1, v2, Lpt1;->c:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v3, Lqxh;

    invoke-direct {v3, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object v1, v3

    :cond_34
    invoke-virtual {v0, v1}, Luup;->G(Lpxh;)V

    iget-object v0, v2, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    iget-object v1, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :goto_5e
    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    invoke-virtual {p0}, Li41;->g0()V

    return-void
.end method

.method public final v(Lb8h;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v0, p0, Lplf;

    if-nez v0, :cond_7

    const/4 p0, 0x0

    :cond_7
    check-cast p0, Lplf;

    if-eqz p0, :cond_e

    invoke-virtual {p0, p1}, Lplf;->O(Lb8h;)V

    :cond_e
    return-void
.end method

.method public final w(Landroid/view/View$OnClickListener;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v1, v0, Lplf;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    move-object v0, v2

    :cond_8
    check-cast v0, Lplf;

    if-eqz v0, :cond_19

    iget-object v0, v0, Lplf;->h:Limf;

    if-eqz v0, :cond_11

    move-object v2, v0

    :cond_11
    iget-object v0, v2, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->s()V

    :cond_19
    return-void
.end method

.method public final x(Lcxh;)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    instance-of v0, p0, Lplf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object p0, v1

    :cond_8
    check-cast p0, Lplf;

    if-eqz p0, :cond_27

    iget-object p0, p0, Lplf;->h:Limf;

    if-eqz p0, :cond_12

    move-object v0, p0

    goto :goto_13

    :cond_12
    move-object v0, v1

    :goto_13
    iget-object v0, v0, Limf;->c:Landroid/widget/ImageView;

    if-eqz p1, :cond_24

    if-eqz p0, :cond_1a

    move-object v1, p0

    :cond_1a
    iget-object p0, v1, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_24
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_27
    return-void
.end method

.method public final y(Luup;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    return-void

    :cond_11
    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x:Luup;

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->p:Lpt1;

    iget-object v1, v0, Lpt1;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Luup;->v(Landroid/view/ViewGroup;)V

    instance-of v0, p1, Lulf;

    if-eqz v0, :cond_32

    check-cast p1, Lulf;

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->s:Lhm3;

    invoke-virtual {p1}, Lulf;->O()Landroid/widget/CompoundButton;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_32
    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->J()V

    return-void
.end method

.method public final z(Lb8h;)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w:Li41;

    instance-of v0, p0, Lylf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object p0, v1

    :cond_8
    check-cast p0, Lylf;

    if-eqz p0, :cond_25

    iget-object p0, p0, Lylf;->l:Limf;

    if-nez p0, :cond_12

    move-object v0, v1

    goto :goto_13

    :cond_12
    move-object v0, p0

    :goto_13
    iget-object v0, v0, Limf;->c:Landroid/widget/ImageView;

    if-eqz p0, :cond_18

    move-object v1, p0

    :cond_18
    iget-object p0, v1, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_25
    return-void
.end method
