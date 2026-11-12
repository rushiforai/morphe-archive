.class public final synthetic Lz22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lz22;->a:B

    iput-object p1, p0, Lz22;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 16

    iget-byte v0, p0, Lz22;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object p0, p0, Lz22;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_318

    check-cast p0, Lwtm;

    iget-object p1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ln2n;

    new-instance p2, Landroid/graphics/Rect;

    iget-object p3, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast p3, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result p4

    invoke-virtual {p3}, Landroid/view/View;->getRight()I

    move-result p3

    iget-object p0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-direct {p2, p4, v5, p3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object p0, p1, Ln2n;->a:Landroid/graphics/Rect;

    invoke-virtual {p0, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void

    :pswitch_39
    check-cast p0, Luuj;

    iget p1, p0, Luuj;->a:I

    iget-object p0, p0, Luuj;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    move p3, v5

    :goto_46
    if-ge p3, p2, :cond_80

    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    add-int/lit8 p3, p3, 0x1

    check-cast p4, Lwwl;

    iget-object p5, p4, Lwwl;->a:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p5}, Landroid/view/View;->getWidth()I

    move-result p6

    sub-int p6, p1, p6

    if-gez p6, :cond_5b

    move p6, v5

    :cond_5b
    div-int/2addr p6, v2

    invoke-virtual {p5}, Landroid/view/View;->getHeight()I

    move-result p7

    sub-int p7, p1, p7

    if-gez p7, :cond_65

    move p7, v5

    :cond_65
    div-int/2addr p7, v2

    iget-object p4, p4, Lwwl;->b:Landroid/graphics/Rect;

    invoke-virtual {p5}, Landroid/view/View;->getLeft()I

    move-result p8

    sub-int/2addr p8, p6

    invoke-virtual {p5}, Landroid/view/View;->getTop()I

    move-result p9

    sub-int/2addr p9, p7

    invoke-virtual {p5}, Landroid/view/View;->getRight()I

    move-result v0

    add-int/2addr v0, p6

    invoke-virtual {p5}, Landroid/view/View;->getBottom()I

    move-result p5

    add-int/2addr p5, p7

    invoke-virtual {p4, p8, p9, v0, p5}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_46

    :cond_80
    return-void

    :pswitch_81
    check-cast p0, Lv4k;

    invoke-virtual {p0}, Lv4k;->b()V

    return-void

    :pswitch_87
    check-cast p0, Luvi;

    iget-object p0, p0, Luvi;->a:Lcan;

    new-instance p1, Lmni;

    invoke-direct {p1, p0, v3}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_94
    check-cast p0, Landroidx/camera/view/PreviewView;

    sget p1, Landroidx/camera/view/PreviewView;->p:I

    sub-int/2addr p4, p2

    sub-int/2addr p8, p6

    if-ne p4, p8, :cond_a0

    sub-int/2addr p5, p3

    sub-int/2addr p9, p7

    if-eq p5, p9, :cond_a6

    :cond_a0
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->b()V

    invoke-virtual {p0, v4}, Landroidx/camera/view/PreviewView;->a(Z)V

    :cond_a6
    return-void

    :pswitch_a7
    check-cast p0, Lzig;

    iget-object p3, p0, Lzig;->a:Luig;

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p5

    invoke-virtual {p3}, Landroid/view/View;->getPaddingLeft()I

    move-result p7

    sub-int/2addr p5, p7

    invoke-virtual {p3}, Landroid/view/View;->getPaddingRight()I

    move-result p7

    sub-int/2addr p5, p7

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p7

    invoke-virtual {p3}, Landroid/view/View;->getPaddingBottom()I

    move-result p9

    sub-int/2addr p7, p9

    invoke-virtual {p3}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    sub-int/2addr p7, p3

    iget-object p3, p0, Lzig;->d:Landroid/view/ViewGroup;

    invoke-static {p3}, Lzig;->b(Landroid/view/View;)I

    move-result p9

    if-eqz p3, :cond_d9

    invoke-virtual {p3}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p3}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    add-int/2addr v1, v0

    goto :goto_da

    :cond_d9
    move v1, v5

    :goto_da
    sub-int/2addr p9, v1

    if-nez p3, :cond_df

    move v0, v5

    goto :goto_f3

    :cond_df
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_f3

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v3, v1

    add-int/2addr v0, v3

    :cond_f3
    :goto_f3
    if-eqz p3, :cond_ff

    invoke-virtual {p3}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p3}, Landroid/view/View;->getPaddingBottom()I

    move-result p3

    add-int/2addr p3, v1

    goto :goto_100

    :cond_ff
    move p3, v5

    :goto_100
    sub-int/2addr v0, p3

    iget-object p3, p0, Lzig;->j:Landroid/view/ViewGroup;

    invoke-static {p3}, Lzig;->b(Landroid/view/View;)I

    move-result p3

    iget-object v1, p0, Lzig;->l:Landroid/view/View;

    invoke-static {v1}, Lzig;->b(Landroid/view/View;)I

    move-result v1

    add-int/2addr v1, p3

    invoke-static {p9, v1}, Ljava/lang/Math;->max(II)I

    move-result p3

    iget-object p9, p0, Lzig;->e:Landroid/view/ViewGroup;

    if-nez p9, :cond_118

    move v1, v5

    goto :goto_12c

    :cond_118
    invoke-virtual {p9}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {p9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p9

    instance-of v3, p9, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v3, :cond_12c

    check-cast p9, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v3, p9, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget p9, p9, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v3, p9

    add-int/2addr v1, v3

    :cond_12c
    :goto_12c
    shl-int/2addr v1, v4

    add-int/2addr v0, v1

    if-le p5, p3, :cond_134

    if-le p7, v0, :cond_134

    move p3, v5

    goto :goto_135

    :cond_134
    move p3, v4

    :goto_135
    iget-boolean p5, p0, Lzig;->B:Z

    if-eq p5, p3, :cond_143

    iput-boolean p3, p0, Lzig;->B:Z

    new-instance p3, Lvig;

    invoke-direct {p3, p0, v4}, Lvig;-><init>(Lzig;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_143
    sub-int/2addr p4, p2

    sub-int/2addr p8, p6

    if-ne p4, p8, :cond_148

    move v4, v5

    :cond_148
    iget-boolean p2, p0, Lzig;->B:Z

    if-nez p2, :cond_156

    if-eqz v4, :cond_156

    new-instance p2, Lvig;

    invoke-direct {p2, p0, v2}, Lvig;-><init>(Lzig;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_156
    return-void

    :pswitch_157
    check-cast p0, Luig;

    iget v0, p0, Luig;->r:I

    move v1, p2

    move-object p2, p1

    iget-object p1, p0, Luig;->q:Landroid/widget/PopupWindow;

    sub-int/2addr p4, v1

    sub-int/2addr p5, p3

    sub-int/2addr p8, p6

    sub-int/2addr p9, p7

    if-ne p4, p8, :cond_167

    if-eq p5, p9, :cond_187

    :cond_167
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result p3

    if-eqz p3, :cond_187

    invoke-virtual {p0}, Luig;->r()V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getWidth()I

    move-result p3

    sub-int/2addr p0, p3

    sub-int p3, p0, v0

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getHeight()I

    move-result p0

    neg-int p0, p0

    sub-int p4, p0, v0

    const/4 p5, -0x1

    const/4 p6, -0x1

    invoke-virtual/range {p1 .. p6}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    :cond_187
    return-void

    :pswitch_188
    check-cast p0, Lrhj;

    new-instance p1, Lyqd;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_194
    check-cast p0, Lf0e;

    sget p1, Lf0e;->h:I

    invoke-virtual {p0}, Lf0e;->U()V

    return-void

    :pswitch_19c
    move-object p2, p1

    check-cast p0, Lx79;

    new-instance p1, Lld9;

    const/16 p3, 0x1b

    invoke-direct {p1, p0, p3}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :pswitch_1aa
    move v1, p2

    check-cast p0, Lota;

    if-ne v1, p6, :cond_1b1

    if-eq p3, p7, :cond_1b4

    :cond_1b1
    invoke-virtual {p0}, Lota;->b()V

    :cond_1b4
    return-void

    :pswitch_1b5
    move-object p2, p1

    check-cast p0, Lcom/opera/android/FullscreenWebActivity;

    sget-object p1, Lcom/opera/android/FullscreenWebActivity;->I:Ljava/util/HashSet;

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p1

    iget p2, p0, Lcom/opera/android/FullscreenWebActivity;->H:I

    if-eq p1, p2, :cond_1c9

    iput p1, p0, Lcom/opera/android/FullscreenWebActivity;->H:I

    iget p1, p0, Lcom/opera/android/FullscreenWebActivity;->G:I

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->d0(I)V

    :cond_1c9
    return-void

    :pswitch_1ca
    move v1, p2

    check-cast p0, Lhi7;

    sub-int/2addr p4, v1

    sub-int/2addr p5, p3

    sub-int/2addr p8, p6

    sub-int/2addr p9, p7

    iget-object p1, p0, Lhi7;->h:Landroid/graphics/Point;

    iget-object p2, p0, Lhi7;->i:Lni7;

    iget-object p3, p0, Lhi7;->e:Ligi;

    if-ne p4, p8, :cond_1db

    if-eq p5, p9, :cond_21f

    :cond_1db
    if-nez p8, :cond_1e9

    if-nez p9, :cond_1e9

    iget p3, p1, Landroid/graphics/Point;->x:I

    iget p4, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {p2, p3, p4}, Lni7;->b(II)V

    iput-object p1, p0, Lhi7;->m:Landroid/graphics/Point;

    goto :goto_21f

    :cond_1e9
    iget-object p1, p0, Lhi7;->m:Landroid/graphics/Point;

    if-eqz p1, :cond_1f5

    iget p0, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {p2, p0, p1}, Lni7;->b(II)V

    goto :goto_21f

    :cond_1f5
    iget-object p1, p3, Ligi;->e:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p4

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p5

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p6

    invoke-virtual {p2, p5, p6}, Lni7;->b(II)V

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    if-ne p2, p3, :cond_218

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    if-eq p1, p4, :cond_21f

    :cond_218
    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1, p3, p4}, Landroid/graphics/Point;-><init>(II)V

    iput-object p1, p0, Lhi7;->m:Landroid/graphics/Point;

    :cond_21f
    :goto_21f
    return-void

    :pswitch_220
    check-cast p0, Lo85;

    iget-object p1, p0, Lo85;->d:Lpde;

    iget-object p2, p0, Lo85;->a:Lp85;

    iget-object p3, p2, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p4

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    instance-of p5, p3, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz p5, :cond_237

    move-object v1, p3

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    :cond_237
    if-eqz v1, :cond_23c

    iget p3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_23d

    :cond_23c
    move p3, v5

    :goto_23d
    add-int/2addr p4, p3

    iget-object p2, p2, Lp85;->m:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-virtual {p2}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    sub-int/2addr p4, p2

    iget-object p0, p0, Lo85;->n:Ln85;

    iget-boolean p2, p0, Ln85;->e:Z

    if-eqz p2, :cond_257

    iget p2, p0, Ln85;->d:I

    iget-object p0, p0, Ln85;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    sub-int v5, p2, p0

    :cond_257
    add-int/2addr p4, v5

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_260
    move v1, p2

    move-object p2, p1

    check-cast p0, Lcom/google/android/material/carousel/CarouselLayoutManager;

    sub-int/2addr p4, v1

    sub-int/2addr p8, p6

    if-ne p4, p8, :cond_26c

    sub-int/2addr p5, p3

    sub-int/2addr p9, p7

    if-eq p5, p9, :cond_274

    :cond_26c
    new-instance p1, Llb4;

    invoke-direct {p1, p0, v3}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_274
    return-void

    :pswitch_275
    move-object p2, p1

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p1, p0, Lcom/opera/android/BrowserActivity;->H:Ljp3;

    if-nez p1, :cond_27d

    move-object p1, v1

    :cond_27d
    iget-object p1, p1, Ljp3;->d:Ljava/lang/Object;

    check-cast p1, Lrlh;

    iget-object p1, p1, Lrlh;->a:Lnak;

    invoke-virtual {p1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkp3;

    iget-object p3, p0, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    if-nez p3, :cond_28e

    move-object p3, v1

    :cond_28e
    instance-of p3, p3, Llp3;

    if-eqz p3, :cond_2aa

    iget-object p1, p1, Lkp3;->a:Lno3;

    iget-boolean p3, p1, Lno3;->a:Z

    if-nez p3, :cond_2bc

    iget-boolean p3, p1, Lno3;->b:Z

    if-nez p3, :cond_2bc

    iget-boolean p1, p1, Lno3;->c:Z

    if-nez p1, :cond_2bc

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    :goto_2a8
    sub-int/2addr p1, p2

    goto :goto_2bd

    :cond_2aa
    iget-object p1, p0, Lcom/opera/android/BrowserActivity;->D:Ljvj;

    if-nez p1, :cond_2af

    move-object p1, v1

    :cond_2af
    iget-boolean p1, p1, Ljvj;->d:Z

    if-eqz p1, :cond_2bc

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    goto :goto_2a8

    :cond_2bc
    move p1, v5

    :goto_2bd
    iget-object p2, p0, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    if-eqz p2, :cond_2c2

    move-object v1, p2

    :cond_2c2
    invoke-virtual {v1}, Lcom/opera/android/bar/BottomBar;->d()I

    move-result p2

    sub-int/2addr p1, p2

    invoke-static {v5, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object p0

    iget-object p2, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget p3, p2, Lzy4;->f:I

    if-eq p3, p1, :cond_2f8

    iput p1, p2, Lzy4;->f:I

    invoke-virtual {p2}, Lzy4;->S()V

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_2ed

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p1

    if-nez p1, :cond_2ed

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p2}, Lzy4;->Q()I

    move-result p3

    invoke-virtual {p1, p3}, Lcom/opera/android/browser/chromium/ChromiumContent;->A(I)V

    :cond_2ed
    iget p1, p2, Lzy4;->q:I

    if-ne p1, v3, :cond_2f8

    invoke-virtual {p2}, Lzy4;->R()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a(I)V

    :cond_2f8
    return-void

    :pswitch_2f9
    move-object p2, p1

    check-cast p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;

    sget-object p1, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->i:Landroid/view/animation/PathInterpolator;

    move-object p1, p2

    check-cast p1, Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result p1

    if-eqz p1, :cond_30a

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->b()V

    :cond_30a
    return-void

    :pswitch_30b
    check-cast p0, Lql2;

    invoke-virtual {p0}, Lql2;->a()V

    return-void

    :pswitch_311
    check-cast p0, Li22;

    invoke-virtual {p0}, Li22;->invoke()Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_318
    .packed-switch 0x0
        :pswitch_311
        :pswitch_30b
        :pswitch_2f9
        :pswitch_275
        :pswitch_260
        :pswitch_220
        :pswitch_1ca
        :pswitch_1b5
        :pswitch_1aa
        :pswitch_19c
        :pswitch_194
        :pswitch_188
        :pswitch_157
        :pswitch_a7
        :pswitch_94
        :pswitch_87
        :pswitch_81
        :pswitch_39
    .end packed-switch
.end method
