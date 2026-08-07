.class public Lv/VDraweeView;
.super Lcom/facebook/drawee/view/SimpleDraweeView;
.source "SourceFile"

# interfaces
.implements Lv/a$b;
.implements Ll/hs40$a;


# static fields
.field public static n:Ll/jxd0;


# instance fields
.field public j:Ll/lsh0;

.field public k:Lv/a;

.field public l:Z

.field public final m:Ll/hs40;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "no_image_mode"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lv/VDraweeView;->n:Ll/jxd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 20
    invoke-direct {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lv/VDraweeView;->l:Z

    .line 22
    new-instance v0, Ll/hs40;

    invoke-direct {v0, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    iput-object v0, p0, Lv/VDraweeView;->m:Ll/hs40;

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 23
    invoke-direct {p0, p1, v0, v1}, Lv/VDraweeView;->s(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lv/VDraweeView;->l:Z

    .line 26
    new-instance v0, Ll/hs40;

    invoke-direct {v0, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    iput-object v0, p0, Lv/VDraweeView;->m:Ll/hs40;

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, p2, v0}, Lv/VDraweeView;->s(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x1

    .line 29
    iput-boolean p3, p0, Lv/VDraweeView;->l:Z

    .line 30
    new-instance p3, Ll/hs40;

    invoke-direct {p3, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    iput-object p3, p0, Lv/VDraweeView;->m:Ll/hs40;

    const/4 p3, 0x0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;->s(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p3, 0x1

    .line 33
    iput-boolean p3, p0, Lv/VDraweeView;->l:Z

    .line 34
    new-instance p3, Ll/hs40;

    invoke-direct {p3, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    iput-object p3, p0, Lv/VDraweeView;->m:Ll/hs40;

    const/4 p3, 0x0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;->s(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/wlj;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;Ll/wlj;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    iput-boolean p2, p0, Lv/VDraweeView;->l:Z

    .line 6
    .line 7
    new-instance p2, Ll/hs40;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Lv/VDraweeView;->m:Ll/hs40;

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, p2, v0}, Lv/VDraweeView;->s(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic q()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r(Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VDraweeView;->t()V

    return-void
.end method

.method private s(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    new-instance v0, Ll/lsh0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lsh0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3}, Ll/lsh0;->h(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lv/a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lv/a;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    sget-object v0, Ll/hhc0;->D3:[I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget p2, Ll/hhc0;->E3:I

    .line 28
    .line 29
    iget-boolean p3, p0, Lv/VDraweeView;->l:Z

    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput-boolean p2, p0, Lv/VDraweeView;->l:Z

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lv/a;->g(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/lsh0;->a(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/mxk0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/mxk0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p1, v0}, Ll/c33;->b(Landroid/view/View;Ljava/lang/Throwable;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public drawableStateChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lsh0;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getForeground()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lsh0;->g()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getOriginalHeight()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/a;->i()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOriginalWidth()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/a;->j()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getZoomAnimationAttacher()Lv/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public jumpDrawablesToCurrentState()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lsh0;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/a;->F()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->G(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 2

    .line 1
    instance-of v0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setScale(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lv/a;->H(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p1

    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/nxk0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/nxk0;-><init>(Lv/VDraweeView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, p1, v0}, Ll/c33;->b(Landroid/view/View;Ljava/lang/Throwable;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lsh0;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/lsh0;->d(Landroid/view/MotionEvent;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/facebook/drawee/view/DraweeView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->m:Ll/hs40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hs40;->a(Landroid/graphics/ColorFilter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setController(Ll/lde;)V
    .locals 1
    .param p1    # Ll/lde;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lv/VDraweeView;->n:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-super {p0, p1}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setForeground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lsh0;->i(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOriginalHeight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->y(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOriginalWidth(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->z(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VDraweeView;->k:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->B(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic t()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/wlj;

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 8
    .line 9
    const v1, 0xffffff

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 13
    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {p0, v0, v1, v2}, Ll/wlj;->f(Landroid/graphics/drawable/Drawable;FZ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lv/VDraweeView;->j:Ll/lsh0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/lsh0;->e(Landroid/graphics/drawable/Drawable;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method
