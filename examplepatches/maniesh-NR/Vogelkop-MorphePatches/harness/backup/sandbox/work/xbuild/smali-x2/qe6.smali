.class public final Lqe6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw7e;
.implements Lgm6;
.implements Lzun;
.implements Lori;
.implements Lrr9;
.implements Lf94;
.implements Lph;
.implements Led2;
.implements Lvga;
.implements Ljz4;
.implements Lelf;
.implements Lbn;
.implements Ld05;
.implements Lhti;
.implements Lraj;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lqe6;->a:B

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lj06;

    const/4 v1, 0x1

    .line 23
    invoke-direct {v0, v1}, Lj06;-><init>(B)V

    .line 24
    iput-object v0, p0, Lqe6;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    .line 18
    iput-byte p1, p0, Lqe6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    const/16 v0, 0xf

    iput-byte v0, p0, Lqe6;->a:B

    .line 25
    new-instance v1, Lkba;

    invoke-direct {v1, p1}, Lkba;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-direct {p0, v1, v0}, Lqe6;-><init>(Ljava/lang/Object;B)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 17
    iput-byte p2, p0, Lqe6;->a:B

    iput-object p1, p0, Lqe6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lygh;)V
    .registers 3

    const/16 v0, 0x11

    iput-byte v0, p0, Lqe6;->a:B

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Lga6;

    invoke-direct {v0, p1}, Lga6;-><init>(Lygh;)V

    iput-object v0, p0, Lqe6;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([B)V
    .registers 4

    const/16 v0, 0x16

    iput-byte v0, p0, Lqe6;->a:B

    array-length v0, p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v1, v0, [B

    iput-object v1, p0, Lqe6;->b:Ljava/lang/Object;

    const/4 p0, 0x0

    invoke-static {p1, p0, v1, p0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public static K(Luio;)Lqe6;
    .registers 4

    const-string v0, "AdSession is null"

    invoke-static {p0, v0}, Lzch;->d(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Luio;->b:Ls9i;

    iget-object v0, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lgvf;

    const/4 v1, 0x0

    sget-object v2, Lgvf;->b:Lgvf;

    if-ne v2, v0, :cond_33

    iget-boolean v0, p0, Luio;->f:Z

    if-nez v0, :cond_2d

    invoke-static {p0}, Lzch;->g(Luio;)V

    iget-object v0, p0, Luio;->e:Lyp;

    iget-object v2, v0, Lyp;->d:Lqe6;

    if-nez v2, :cond_27

    new-instance v1, Lqe6;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, v2}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lyp;->d:Lqe6;

    return-object v1

    :cond_27
    const-string p0, "MediaEvents already exists for AdSession"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1

    :cond_2d
    const-string p0, "AdSession is started"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1

    :cond_33
    const-string p0, "Cannot create MediaEvents for JavaScript AdSession"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method

.method public static N(Landroid/view/View;)V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Ljba;

    if-nez v1, :cond_10

    new-instance v0, Ljba;

    invoke-direct {v0, p0}, Ljba;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_10
    check-cast v0, Ljba;

    iget-object p0, v0, Ljba;->e:Landroid/animation/ObjectAnimator;

    if-eqz p0, :cond_19

    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    :cond_19
    iget-object p0, v0, Ljba;->b:Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    const/16 v2, 0x42

    filled-new-array {v1, v2}, [I

    move-result-object v1

    const-string v2, "alpha"

    invoke-static {p0, v2, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p0

    iput-object p0, v0, Ljba;->e:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0xc8

    invoke-virtual {p0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p0, v0, Ljba;->e:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    iget-object p0, v0, Ljba;->e:Landroid/animation/ObjectAnimator;

    iget-object v1, v0, Ljba;->c:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {p0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p0, v0, Ljba;->e:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    iget-object p0, v0, Ljba;->e:Landroid/animation/ObjectAnimator;

    new-instance v1, Lkc;

    const/16 v2, 0xd

    invoke-direct {v1, v0, v2}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p0, v0, Ljba;->e:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public static S(Lsn2;)Leo2;
    .registers 14

    iget-object v0, p0, Lsn2;->a:Leo2;

    iget-object v1, v0, Leo2;->a:Ljava/lang/Object;

    check-cast v1, Lqya;

    iget-object v2, v0, Leo2;->e:Landroid/graphics/Rect;

    :try_start_8
    iget p0, p0, Lsn2;->b:I

    iget v3, v0, Leo2;->f:I

    invoke-static {v1, v2, p0, v3}, Lsfe;->Q0(Lqya;Landroid/graphics/Rect;II)[B

    move-result-object v5
    :try_end_10
    .catch Luza; {:try_start_8 .. :try_end_10} :catch_63

    const/4 p0, 0x0

    :try_start_11
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v6, Lrg8;

    new-instance v3, Lgh8;

    invoke-direct {v3, v1}, Lgh8;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v3}, Lrg8;-><init>(Lgh8;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_20} :catch_5a

    new-instance v8, Landroid/util/Size;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-direct {v8, v1, v3}, Landroid/util/Size;-><init>(II)V

    new-instance v9, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-direct {v9, p0, p0, v1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iget v10, v0, Leo2;->f:I

    iget-object p0, v0, Leo2;->g:Landroid/graphics/Matrix;

    sget-object v1, Ld2m;->a:Landroid/graphics/RectF;

    new-instance v11, Landroid/graphics/Matrix;

    invoke-direct {v11, p0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iget p0, v2, Landroid/graphics/Rect;->left:I

    neg-int p0, p0

    int-to-float p0, p0

    iget v1, v2, Landroid/graphics/Rect;->top:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v11, p0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v12, v0, Leo2;->h:Lyb4;

    new-instance v4, Leo2;

    const/16 v7, 0x100

    invoke-direct/range {v4 .. v12}, Leo2;-><init>(Ljava/lang/Object;Lrg8;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Lyb4;)V

    return-object v4

    :catch_5a
    move-exception v0

    new-instance v1, Lgwa;

    const-string v2, "Failed to extract Exif from YUV-generated JPEG"

    invoke-direct {v1, p0, v2, v0}, Lgwa;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_63
    move-exception v0

    move-object p0, v0

    new-instance v0, Lgwa;

    const/4 v1, 0x1

    const-string v2, "Failed to encode the image to JPEG."

    invoke-direct {v0, v1, v2, p0}, Lgwa;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public final A(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    return-void
.end method

.method public final B()Z
    .registers 1

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lev7;

    iget-object p0, p0, Lev7;->h:Ljava/lang/Object;

    check-cast p0, Lwzg;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Lmrk;

    iget-object p0, p0, Lmrk;->i:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_1b

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    return p0

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method

.method public final C(Lzw5;)Lzw5;
    .registers 3

    instance-of v0, p1, Lush;

    if-eqz v0, :cond_5

    return-object p1

    :cond_5
    new-instance v0, Lgx;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lzdd;

    invoke-virtual {p0}, Lzdd;->m()F

    move-result p0

    neg-float p0, p0

    invoke-direct {v0, p0, p1}, Lgx;-><init>(FLzw5;)V

    return-object v0
.end method

.method public final D()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final E(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ll2b;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 p1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    return-void
.end method

.method public final F(Ltun;)V
    .registers 3

    invoke-virtual {p1}, Ltun;->d()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lr2;

    if-eqz p1, :cond_13

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_13
    new-instance p1, Lop6;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lop6;-><init>(Z)V

    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final G(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    invoke-virtual {p0, p1}, Lqe6;->E(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ll2b;

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p1, p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    iget p1, p1, Lhuh;->a:F

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-float p1, v0

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/chromium/ui/base/EventForwarder;->g(FF)V

    return-void
.end method

.method public final H(Z)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ltah;

    if-eqz p0, :cond_9

    invoke-virtual {p0, p1}, Ltah;->H(Z)V

    :cond_9
    return-void
.end method

.method public final I()V
    .registers 1

    return-void
.end method

.method public final J(Leri;)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lev7;

    iget-object p0, p0, Lev7;->g:Ljava/lang/Object;

    check-cast p0, Liv7;

    invoke-virtual {p0, p1}, Liv7;->c(Leri;)V

    return-void
.end method

.method public final L()Ljava/lang/StringBuilder;
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lj3;

    instance-of v0, p0, Lxzf;

    if-eqz v0, :cond_15

    check-cast p0, Lxzf;

    iget-object p0, p0, Lxzf;->b:Lyfc;

    iget-object p0, p0, Lyfc;->b:Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_15

    return-object p0

    :cond_15
    const/4 p0, 0x0

    return-object p0
.end method

.method public final M(I)V
    .registers 6

    iget-object v0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast v0, Lhld;

    iget-object v0, v0, Lhld;->l:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-nez v1, :cond_12

    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_12
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v1, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v1, Lc48;

    const/4 v2, 0x4

    invoke-direct {v1, v2, v0, p0}, Lc48;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final O(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lhq6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lhq6;

    iget v1, v0, Lhq6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lhq6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lhq6;

    invoke-direct {v0, p0, p1}, Lhq6;-><init>(Lqe6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lhq6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lhq6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_44

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lpv;

    const/4 v2, 0x7

    invoke-direct {p1, v2, v3, p0}, Lpv;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v4, v0, Lhq6;->v:I

    invoke-static {p1, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    sget-object p1, Lea8;->a:Lea8;

    sget-object v0, Lt0i;->b:Lp0i;

    instance-of v0, p0, Lq0i;

    if-eqz v0, :cond_4d

    return-object p1

    :cond_4d
    return-object p0
.end method

.method public final P(Luv9;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lrx6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lrx6;

    iget v1, v0, Lrx6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lrx6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lrx6;

    invoke-direct {v0, p0, p2}, Lrx6;-><init>(Lqe6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lrx6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lrx6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Ls23;

    const/4 v2, 0x5

    invoke-direct {p2, p0, p1, v3, v2}, Ls23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lrx6;->v:I

    invoke-static {p2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    return-object p0
.end method

.method public final Q(Lskg;)V
    .registers 4

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "state"

    invoke-static {v0, v1, p1}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "playerStateChange"

    invoke-virtual {p0, p1, v0}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public final R(Lsn2;I)Leo2;
    .registers 13

    iget-object p1, p1, Lsn2;->a:Leo2;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lga6;

    iget-object v0, p1, Leo2;->a:Ljava/lang/Object;

    check-cast v0, Lqya;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    const/4 v1, 0x0

    if-nez p0, :cond_29

    invoke-interface {v0}, Lqya;->A0()[Lpya;

    move-result-object p0

    aget-object p0, p0, v1

    invoke-interface {p0}, Lpya;->u()Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    :goto_27
    move-object v2, v0

    goto :goto_82

    :cond_29
    invoke-interface {v0}, Lqya;->A0()[Lpya;

    move-result-object p0

    aget-object p0, p0, v1

    invoke-interface {p0}, Lpya;->u()Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    move-result v0

    new-array v2, v0, [B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    const/4 v3, 0x2

    move v4, v3

    :goto_41
    add-int/lit8 v5, v4, 0x4

    const/4 v6, -0x1

    if-gt v5, v0, :cond_66

    aget-byte v5, v2, v4

    if-ne v5, v6, :cond_66

    if-ne v5, v6, :cond_54

    add-int/lit8 v5, v4, 0x1

    aget-byte v5, v2, v5

    const/16 v6, -0x26

    if-eq v5, v6, :cond_79

    :cond_54
    add-int/lit8 v5, v4, 0x2

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    add-int/lit8 v6, v4, 0x3

    aget-byte v6, v2, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v5, v6

    add-int/2addr v5, v3

    add-int/2addr v4, v5

    goto :goto_41

    :cond_66
    :goto_66
    add-int/lit8 v1, v3, 0x1

    if-le v1, v0, :cond_6c

    move v1, v6

    goto :goto_77

    :cond_6c
    aget-byte v4, v2, v3

    if-ne v4, v6, :cond_98

    aget-byte v4, v2, v1

    const/16 v5, -0x28

    if-ne v4, v5, :cond_98

    move v1, v3

    :goto_77
    if-eq v1, v6, :cond_82

    :cond_79
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    move-result p0

    invoke-static {v2, v1, p0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    goto :goto_27

    :cond_82
    :goto_82
    iget-object v3, p1, Leo2;->b:Lrg8;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v5, p1, Leo2;->d:Landroid/util/Size;

    iget-object v6, p1, Leo2;->e:Landroid/graphics/Rect;

    iget v7, p1, Leo2;->f:I

    iget-object v8, p1, Leo2;->g:Landroid/graphics/Matrix;

    iget-object v9, p1, Leo2;->h:Lyb4;

    new-instance v1, Leo2;

    move v4, p2

    invoke-direct/range {v1 .. v9}, Leo2;-><init>(Ljava/lang/Object;Lrg8;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Lyb4;)V

    return-object v1

    :cond_98
    move v4, p2

    move v3, v1

    move p2, v4

    goto :goto_66
.end method

.method public final T(Luv9;Lnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p2, Lsx6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lsx6;

    iget v1, v0, Lsx6;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lsx6;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lsx6;

    invoke-direct {v0, p0, p2}, Lsx6;-><init>(Lqe6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lsx6;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lsx6;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p1, v0, Lsx6;->t:Luv9;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_44

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lft6;

    iget-object p0, p0, Lft6;->e:Lyc1;

    iput-object p1, v0, Lsx6;->t:Luv9;

    iput v3, v0, Lsx6;->w:I

    invoke-static {p0, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    check-cast p2, Luv9;

    if-nez p2, :cond_4b

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_4b
    iget-object p0, p1, Luv9;->c:Lebb;

    iget-object v0, p2, Luv9;->c:Lebb;

    invoke-virtual {p0, v0}, Lebb;->g(Lebb;)J

    move-result-wide v0

    new-array v12, v3, [F

    iget-wide v4, p2, Luv9;->a:D

    iget-wide v6, p2, Luv9;->b:D

    iget-wide v8, p1, Luv9;->a:D

    iget-wide v10, p1, Luv9;->b:D

    invoke-static/range {v4 .. v12}, Landroid/location/Location;->distanceBetween(DDDD[F)V

    const/4 p0, 0x0

    aget p1, v12, p0

    sget-object p2, Lpn7;->b:Lon7;

    sget-object p2, Lun7;->f:Lun7;

    invoke-static {v0, v1, p2}, Lpn7;->p(JLun7;)J

    move-result-wide v0

    long-to-float p2, v0

    const/high16 v0, 0x43c80000    # 400.0f

    mul-float/2addr p2, v0

    const/high16 v0, 0x41700000    # 15.0f

    div-float/2addr p2, v0

    const/high16 v0, 0x43fa0000    # 500.0f

    sub-float/2addr v0, p2

    const/high16 p2, 0x42c80000    # 100.0f

    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    cmpl-float p1, p1, p2

    if-gez p1, :cond_80

    move v3, p0

    :cond_80
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p5, Lkyb;

    if-eqz v0, :cond_13

    move-object v0, p5

    check-cast v0, Lkyb;

    iget v1, v0, Lkyb;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lkyb;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lkyb;

    invoke-direct {v0, p0, p5}, Lkyb;-><init>(Lqe6;Lmt5;)V

    :goto_18
    iget-object p5, v0, Lkyb;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lkyb;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_37

    if-eq v2, v4, :cond_31

    if-ne v2, v3, :cond_2b

    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    return-object p5

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_31
    iget-object p0, v0, Lkyb;->t:Luu5;

    :try_start_33
    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_86

    goto :goto_7e

    :cond_37
    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {p4, p3}, Lrih;->i(Ljava/lang/String;Lx9m;)Ls9m;

    move-result-object p3

    iget-object p4, p3, Ls9m;->c:Lx9m;

    iget-object p5, p4, Lx9m;->a:Litb;

    const-class v2, Lyqa;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    invoke-static {p5, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p5

    const/4 v2, 0x0

    if-eqz p5, :cond_5d

    new-instance p0, Lspa;

    invoke-direct {p0}, Lspa;-><init>()V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lyqa;

    invoke-direct {p2, p0, p1, v2}, Lyqa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p2

    :cond_5d
    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ljyb;

    invoke-virtual {p0, p3}, Ljyb;->a(Ls9m;)Luu5;

    move-result-object p0

    if-eqz p0, :cond_99

    :try_start_67
    new-instance p3, Lspa;

    invoke-direct {p3}, Lspa;-><init>()V

    invoke-interface {p2, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lyqa;

    invoke-direct {p2, p3, p1, v2}, Lyqa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p0, v0, Lkyb;->t:Luu5;

    iput v4, v0, Lkyb;->w:I

    invoke-virtual {p2, v0}, Lyqa;->e(Lmt5;)Ljava/lang/Object;

    move-result-object p5

    if-eq p5, v1, :cond_97

    :goto_7e
    check-cast p5, Lfr6;

    new-instance p1, Lmyb;

    invoke-direct {p1, p5}, Lmyb;-><init>(Lfr6;)V
    :try_end_85
    .catchall {:try_start_67 .. :try_end_85} :catchall_86

    goto :goto_8d

    :catchall_86
    move-exception p1

    new-instance p2, Llyb;

    invoke-direct {p2, p1}, Llyb;-><init>(Ljava/lang/Throwable;)V

    move-object p1, p2

    :goto_8d
    iput-object v5, v0, Lkyb;->t:Luu5;

    iput v3, v0, Lkyb;->w:I

    invoke-interface {p0, p1, v0}, Luu5;->l(Lnyb;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_98

    :cond_97
    return-object v1

    :cond_98
    return-object p0

    :cond_99
    const-string p0, "No SuspendResponseConverter found to convert "

    invoke-static {p4, p0}, Lpza;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v5
.end method

.method public final V(F)V
    .registers 4

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_37

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_37

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const-string v1, "mediaPlayerVolume"

    invoke-static {v0, v1, p1}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lw5p;->b()Lw5p;

    move-result-object p1

    iget p1, p1, Lw5p;->b:F

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const-string v1, "deviceVolume"

    invoke-static {v0, v1, p1}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "volumeChange"

    invoke-virtual {p0, p1, v0}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :cond_37
    const-string p0, "Invalid Media volume"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final a()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ljr9;

    invoke-interface {p0, p1}, Ljr9;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lk1g;->G(Ljava/lang/Object;)Lq0b;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lyxc;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lcha;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lcha;

    iget v1, v0, Lcha;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lcha;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lcha;

    invoke-direct {v0, p0, p2}, Lcha;-><init>(Lqe6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lcha;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lcha;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_40

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ltah;

    if-eqz p0, :cond_47

    iput v3, v0, Lcha;->v:I

    invoke-virtual {p0, p1, v0}, Ltah;->b(Lyxc;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_40

    return-object v1

    :cond_40
    :goto_40
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    goto :goto_48

    :cond_47
    const/4 p0, 0x0

    :goto_48
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final c()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lev7;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lev7;->c:Z

    return-void
.end method

.method public final e(Z)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ltah;

    if-eqz p0, :cond_9

    invoke-virtual {p0, p1}, Ltah;->e(Z)V

    :cond_9
    return-void
.end method

.method public final f(Z)V
    .registers 3

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lr2;

    new-instance v0, Lop6;

    invoke-direct {v0, p1}, Lop6;-><init>(Z)V

    new-instance p1, Lrw7;

    invoke-direct {p1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final h()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final i()V
    .registers 1

    return-void
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Loh;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/fragment/app/w;

    iget-object v0, p0, Landroidx/fragment/app/w;->H:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyl9;

    if-eqz v0, :cond_1c

    iget-object v1, v0, Lyl9;->a:Ljava/lang/String;

    iget v0, v0, Lyl9;->b:I

    iget-object p0, p0, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {p0, v1}, Landroidx/fragment/app/a0;->c(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    if-nez p0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    iget v1, p1, Loh;->a:I

    iget-object p1, p1, Loh;->b:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1, p1}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public final l(Leri;)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lev7;

    invoke-virtual {p0, p1}, Lev7;->k(Leri;)V

    return-void
.end method

.method public final m(Lbm;)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lchb;

    iget-object p0, p0, Lchb;->q:Ll45;

    invoke-virtual {p0, p1}, Ll45;->p(Lbm;)V

    return-void
.end method

.method public final n(Lcom/opera/android/browser/chromium/ChromiumContent;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final o(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    return-void
.end method

.method public final onAdClicked()V
    .registers 1

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 7

    iget-byte v0, p0, Lqe6;->a:B

    packed-switch v0, :pswitch_data_da

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lp12;

    new-instance p1, Ldnb;

    const/16 v0, 0xa

    invoke-direct {p1, p0, v0}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-static {}, Lxug;->n()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Ldnb;->run()V

    goto :goto_43

    :cond_1b
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Ljri;

    const/16 v4, 0x1d

    invoke-direct {v3, p1, v0, v4}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result p1

    const-string v2, "Unable to post to main thread"

    invoke-static {v2, p1}, Ljpo;->n(Ljava/lang/String;Z)V

    :try_start_39
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v2, v3, p1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1
    :try_end_41
    .catch Ljava/lang/InterruptedException; {:try_start_39 .. :try_end_41} :catch_c8

    if-eqz p1, :cond_c0

    :goto_43
    iget-object p1, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p1, Lwg4;

    if-eqz p1, :cond_a0

    iget-object p1, p1, Lwg4;->n:Lcf4;

    iget-object p1, p1, Lcf4;->n:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v0, Lbo3;

    const/16 v2, 0x10

    invoke-direct {v0, p0, v2}, Lbo3;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    iget-object p1, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p1, Lwg4;

    iget-object v0, p1, Lwg4;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_5e
    iget-object v2, p1, Lwg4;->e:Landroid/os/Handler;

    const-string v3, "retry_token"

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget v2, p1, Lwg4;->p:I

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    const/4 v3, 0x5

    if-eqz v2, :cond_96

    if-eq v2, v1, :cond_8e

    const/4 v1, 0x2

    if-eq v2, v1, :cond_76

    const/4 v1, 0x3

    if-ne v2, v1, :cond_8a

    :cond_76
    iput v3, p1, Lwg4;->p:I

    iget-object v1, p1, Lwg4;->r:Ljava/lang/Integer;

    invoke-static {v1}, Lwg4;->a(Ljava/lang/Integer;)V

    new-instance v1, Lva2;

    const/16 v2, 0x1a

    invoke-direct {v1, p1, v2}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lk1g;->z(Lm94;)Lo94;

    move-result-object v1

    iput-object v1, p1, Lwg4;->q:Lcom/google/common/util/concurrent/ListenableFuture;

    :cond_8a
    iget-object p1, p1, Lwg4;->q:Lcom/google/common/util/concurrent/ListenableFuture;

    monitor-exit v0

    goto :goto_a2

    :cond_8e
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "CameraX could not be shutdown when it is initializing."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_96
    iput v3, p1, Lwg4;->p:I

    sget-object p1, Lq0b;->c:Lq0b;

    monitor-exit v0

    goto :goto_a2

    :goto_9c
    monitor-exit v0
    :try_end_9d
    .catchall {:try_start_5e .. :try_end_9d} :catchall_9e

    throw p0

    :catchall_9e
    move-exception p0

    goto :goto_9c

    :cond_a0
    sget-object p1, Lq0b;->c:Lq0b;

    :goto_a2
    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_a6
    iput-object v1, p0, Lp12;->c:Ljava/lang/Object;

    iput-object p1, p0, Lp12;->d:Ljava/lang/Object;

    iget-object p1, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    iget-object p1, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V
    :try_end_b8
    .catchall {:try_start_a6 .. :try_end_b8} :catchall_bd

    monitor-exit v0

    invoke-virtual {p0, v1, v1}, Lp12;->k(Lwg4;Landroid/content/Context;)V

    return-void

    :catchall_bd
    move-exception p0

    monitor-exit v0

    throw p0

    :cond_c0
    :try_start_c0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Timeout to wait main thread execution"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_c8
    .catch Ljava/lang/InterruptedException; {:try_start_c0 .. :try_end_c8} :catch_c8

    :catch_c8
    move-exception p0

    new-instance p1, Le22;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :pswitch_cf
    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lf28;

    const/4 v0, 0x0

    const-string v1, "Unable to acquire InputBuffer."

    invoke-virtual {p0, v0, v1, p1}, Lf28;->a(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :pswitch_data_da
    .packed-switch 0x9
        :pswitch_cf
    .end packed-switch
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 3

    .line 218
    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lnh4;

    sget-object p1, Lt0i;->b:Lp0i;

    .line 219
    new-instance p1, Lq0i;

    invoke-direct {p1, p2}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    .line 220
    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public final onProgress(I)V
    .registers 6

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lmab;

    if-nez p1, :cond_20

    iget-object p1, p0, Lmab;->b:Lcom/opera/android/custom_views/OperaIntroView;

    const/16 v0, 0xec

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/16 v3, 0x9d

    invoke-virtual {p1, v2, v3, v0, v1}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    iget-object p0, p0, Lmab;->c:Lnu5;

    iget-object p1, p0, Lnu5;->b:Landroid/os/Handler;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const p1, 0x3f4ccccd    # 0.8f

    iput p1, p0, Lnu5;->d:F

    invoke-virtual {p0}, Lnu5;->run()V

    :cond_20
    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 3

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lnh4;

    sget-object p1, Lxe5;->g:Lxe5;

    invoke-virtual {p0, p2, p1}, Lnh4;->x(Ljava/lang/Object;Lcr9;)V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Lqe6;->a:B

    packed-switch v0, :pswitch_data_8e

    check-cast p1, Ljava/lang/Void;

    return-void

    :pswitch_8
    check-cast p1, La28;

    iget-object v0, p0, Lqe6;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lf28;

    iget-object v0, v1, Lf28;->p:Lz8b;

    invoke-virtual {v0}, Lz8b;->O()J

    move-result-wide v2

    iget-object v0, p1, La28;->i:Lf28;

    iget-boolean v4, v0, Lf28;->b:Z

    if-nez v4, :cond_1f

    invoke-virtual {v0, v2, v3}, Lf28;->j(J)J

    move-result-wide v2

    :cond_1f
    iget-object v0, p1, La28;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const-string v4, "The buffer is submitted or canceled."

    if-nez v0, :cond_89

    const-wide/16 v5, 0x0

    cmp-long v0, v2, v5

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ltz v0, :cond_33

    move v0, v6

    goto :goto_34

    :cond_33
    move v0, v5

    :goto_34
    invoke-static {v0}, Ljpo;->j(Z)V

    iput-wide v2, p1, La28;->g:J

    iget-object v0, p1, La28;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_85

    iput-boolean v6, p1, La28;->h:Z

    iget-object v2, p1, La28;->e:Ll94;

    iget-object v3, p1, La28;->c:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_6f

    :try_start_4d
    iget-object v6, p1, La28;->a:Landroid/media/MediaCodec;

    iget v7, p1, La28;->b:I

    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    move-result v8

    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    move-result v9

    iget-wide v10, p1, La28;->g:J

    iget-boolean v0, p1, La28;->h:Z

    if-eqz v0, :cond_62

    const/4 v0, 0x4

    move v12, v0

    goto :goto_63

    :cond_62
    move v12, v5

    :goto_63
    invoke-virtual/range {v6 .. v12}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ll94;->b(Ljava/lang/Object;)Z
    :try_end_6a
    .catch Ljava/lang/IllegalStateException; {:try_start_4d .. :try_end_6a} :catch_6b

    goto :goto_6f

    :catch_6b
    move-exception v0

    invoke-virtual {v2, v0}, Ll94;->d(Ljava/lang/Throwable;)Z

    :cond_6f
    :goto_6f
    iget-object p1, p1, La28;->d:Lo94;

    invoke-static {p1}, Lk1g;->O(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    new-instance v0, Ld06;

    invoke-direct {v0, p0}, Ld06;-><init>(Ljava/lang/Object;)V

    iget-object p0, v1, Lf28;->g:Lb2j;

    new-instance v1, Lwr9;

    invoke-direct {v1, p1, v0, v5}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v1, p0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_8c

    :cond_85
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_8c

    :cond_89
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    :goto_8c
    return-void

    nop

    :pswitch_data_8e
    .packed-switch 0x9
        :pswitch_8
    .end packed-switch
.end method

.method public final p(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lzse;

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object p0

    iget-object p0, p0, Ldte;->e:Lbte;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lbte;->b:Lkze;

    if-nez p1, :cond_13

    const-string p1, ""

    :cond_13
    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final q()V
    .registers 4

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Log5;

    iget-object p0, p0, Log5;->b:Ljava/lang/Object;

    check-cast p0, Lmm6;

    new-instance v0, Ljm6;

    sget-object v1, Lkm6;->b:Lkm6;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljm6;-><init>(Lkm6;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lmm6;->g(Ljm6;)V

    return-void
.end method

.method public final r(Lcom/opera/android/browser/chromium/ChromiumContent;Z)Z
    .registers 3

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ll2b;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object p0

    iget-boolean p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D:Z

    if-eqz p1, :cond_1f

    const/4 p1, 0x1

    if-eqz p2, :cond_19

    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->r()V

    return p1

    :cond_19
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D()Z

    move-result p2

    if-nez p2, :cond_21

    :cond_1f
    const/4 p0, 0x0

    return p0

    :cond_21
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->hidePopupsAndPreserveSelection()V

    return p1
.end method

.method public final s(Lyka;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ltah;

    if-eqz p0, :cond_12

    invoke-virtual {p0, p1}, Ltah;->s(Lyka;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_f

    return-object p0

    :cond_f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_12
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final t(Z)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ll2b;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    if-eqz p0, :cond_c

    invoke-virtual {p0, p1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->d(Z)V

    return-void

    :cond_c
    invoke-static {}, Lh9o;->e()V

    return-void
.end method

.method public final u(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V
    .registers 3

    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lzse;

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object p0

    iget-object p0, p0, Ldte;->e:Lbte;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lbte;->b:Lkze;

    if-nez p1, :cond_13

    const-string p1, ""

    :cond_13
    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 3

    new-instance p1, Lv24;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lj06;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lv24;-><init>(Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final x()Ljava/util/List;
    .registers 8

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Lev7;

    iget-object p0, p0, Lev7;->g:Ljava/lang/Object;

    check-cast p0, Liv7;

    iget-object v0, p0, Liv7;->d:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1b
    :goto_1b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Leri;

    invoke-interface {v3}, Leri;->getId()J

    move-result-wide v3

    const-wide v5, 0x7ffffffffffffffdL

    cmp-long v5, v3, v5

    if-eqz v5, :cond_1b

    iget-object v5, p0, Liv7;->e:Lpde;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leri;

    invoke-interface {v5}, Leri;->getId()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_1b

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    :cond_49
    return-object v1
.end method

.method public final y(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ltah;

    if-eqz p0, :cond_9

    invoke-virtual {p0, p1}, Ltah;->y(Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method public final z()V
    .registers 4

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Log5;

    iget-object p0, p0, Log5;->b:Ljava/lang/Object;

    check-cast p0, Lmm6;

    sget-object v0, Lac0;->c:Lac0;

    const/4 v1, 0x0

    sget-object v2, Lvb0;->c:Lvb0;

    invoke-virtual {p0, v2, v0, v1}, Lmm6;->c(Lvb0;Lac0;Ljava/lang/String;)V

    return-void
.end method
