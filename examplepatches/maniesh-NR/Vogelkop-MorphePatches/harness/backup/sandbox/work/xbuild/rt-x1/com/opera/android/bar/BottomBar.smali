.class public Lcom/opera/android/bar/BottomBar;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final r:Z


# instance fields
.field public final a:Lio3;

.field public b:Lc1f;

.field public c:Lap3;

.field public final d:Lqvk;

.field public e:Z

.field public f:Z

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:Landroid/view/View;

.field public final j:Landroid/graphics/Paint;

.field public k:Z

.field public final l:Landroid/graphics/Paint;

.field public final m:I

.field public final n:I

.field public final o:Lkze;

.field public final p:Lkze;

.field public q:Latj;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    invoke-static {}, Li0l;->g()Z

    move-result v0

    sput-boolean v0, Lcom/opera/android/bar/BottomBar;->r:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Lio3;

    invoke-direct {p2, p0}, Lio3;-><init>(Lcom/opera/android/bar/BottomBar;)V

    iput-object p2, p0, Lcom/opera/android/bar/BottomBar;->a:Lio3;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/opera/android/bar/BottomBar;->j:Landroid/graphics/Paint;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/android/bar/BottomBar;->k:Z

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/opera/android/bar/BottomBar;->l:Landroid/graphics/Paint;

    new-instance v1, Lkze;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/opera/android/bar/BottomBar;->o:Lkze;

    new-instance v1, Lkze;

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/opera/android/bar/BottomBar;->p:Lkze;

    new-instance v1, Lqvk;

    invoke-direct {v1, p1}, Lqvk;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/opera/android/bar/BottomBar;->d:Lqvk;

    new-instance v1, Lap3;

    new-instance v2, Lzo3;

    const v3, 0x7f040205

    invoke-static {v3, p1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-direct {v2, p1}, Lzo3;-><init>(I)V

    invoke-direct {v1, v2, p2, v0}, Lap3;-><init>(Lzo3;ZZ)V

    iput-object v1, p0, Lcom/opera/android/bar/BottomBar;->c:Lap3;

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    sget-boolean p1, Lcom/opera/android/bar/BottomBar;->r:Z

    if-eqz p1, :cond_74

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0707e2

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bar/BottomBar;->m:I

    new-instance p1, Lu7;

    const/16 p2, 0x12

    invoke-direct {p1, p0, p2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_70

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_70
    invoke-virtual {p1, p0}, Lu7;->a(Landroid/view/View;)V

    goto :goto_76

    :cond_74
    iput v0, p0, Lcom/opera/android/bar/BottomBar;->m:I

    :goto_76
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070a00

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bar/BottomBar;->n:I

    new-instance p1, Lva2;

    const/16 p2, 0x14

    invoke-direct {p1, p0, p2}, Lva2;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0, p1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    if-eqz p0, :cond_7

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_7
    return-void
.end method

.method public b(Z)V
    .registers 2

    return-void
.end method

.method public c()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d()I
    .registers 6

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_27

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const-string v3, "floater"

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_24

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int/2addr v2, v1

    move v1, v2

    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_27
    return v1
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/bar/BottomBar;->f:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_20

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 15

    iget-boolean v0, p0, Lcom/opera/android/bar/BottomBar;->k:Z

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->c:Lap3;

    iget-object v0, v0, Lap3;->a:Lzo3;

    iget v0, v0, Lzo3;->a:I

    iget-object v6, p0, Lcom/opera/android/bar/BottomBar;->j:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v3, v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v5, v0

    const/4 v2, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_2a

    :cond_29
    move-object v1, p1

    :goto_2a
    invoke-super {p0, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    sget-boolean p1, Lcom/opera/android/bar/BottomBar;->r:Z

    if-eqz p1, :cond_52

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    const/4 v0, 0x1

    iget v2, p0, Lcom/opera/android/bar/BottomBar;->m:I

    if-ne p1, v0, :cond_40

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    sub-int/2addr p1, v2

    goto :goto_41

    :cond_40
    const/4 p1, 0x0

    :goto_41
    int-to-float v8, p1

    iget v0, p0, Lcom/opera/android/bar/BottomBar;->n:I

    int-to-float v9, v0

    add-int/2addr p1, v2

    int-to-float v10, p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float v11, p1

    iget-object v12, p0, Lcom/opera/android/bar/BottomBar;->l:Landroid/graphics/Paint;

    move-object v7, v1

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_52
    return-void
.end method

.method public e(Lnje;)Landroid/view/View;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public f()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public g()V
    .registers 3

    new-instance v0, Lz61;

    invoke-direct {v0}, Lz61;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-virtual {v0, p0}, Lz61;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_e
    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public h()V
    .registers 2

    const v0, 0x7f0a0bed

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    const v0, 0x7f0a0bee

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomBar;->h:Landroid/view/View;

    const v0, 0x7f0a0180

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomBar;->i:Landroid/view/View;

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->m()V

    return-void
.end method

.method public i(Lno3;)V
    .registers 2

    return-void
.end method

.method public final j(I)V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->d()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_34

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const-string v2, "floater"

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    int-to-float v2, p1

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    :cond_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    :cond_34
    return-void
.end method

.method public final k()V
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->m()V

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->c()I

    move-result v0

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->p:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_1c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_1c
    return-void
.end method

.method public l(I)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    if-eqz v0, :cond_8

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    :cond_8
    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->i:Landroid/view/View;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p0, p1}, Lcom/opera/android/bar/BottomBar;->j(I)V

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->m()V

    return-void
.end method

.method public final m()V
    .registers 5

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->c()I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_25

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_25

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f040a4c

    invoke-static {v3, v1, v2}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v3, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    add-int/2addr v2, v1

    :cond_25
    add-int/2addr v2, v0

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->f()I

    move-result v0

    sub-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->o:Lkze;

    invoke-static {p0, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->c:Lap3;

    iget-object v0, v0, Lap3;->a:Lzo3;

    iget v0, v0, Lzo3;->a:I

    invoke-virtual {p0, v0}, Lcom/opera/android/bar/BottomBar;->a(I)V

    const v0, 0x7f0a0a8f

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_18

    check-cast v0, Latj;

    goto :goto_2d

    :cond_18
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_24

    check-cast v0, Landroid/view/View;

    goto :goto_25

    :cond_24
    move-object v0, v2

    :goto_25
    if-eqz v0, :cond_2c

    invoke-static {v0}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v0

    goto :goto_2d

    :cond_2c
    move-object v0, v2

    :goto_2d
    iput-object v0, p0, Lcom/opera/android/bar/BottomBar;->q:Latj;

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->g()V

    :cond_34
    invoke-static {p0}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomBar;->b:Lc1f;

    if-eqz v0, :cond_41

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->a:Lio3;

    invoke-virtual {v0, p0}, Lc1f;->d(Lfck;)V

    :cond_41
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->q:Latj;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iput-object v1, p0, Lcom/opera/android/bar/BottomBar;->q:Latj;

    :cond_7
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->b:Lc1f;

    if-eqz v0, :cond_15

    iget-object v2, p0, Lcom/opera/android/bar/BottomBar;->a:Lio3;

    invoke-virtual {v0, v2}, Lc1f;->g(Lfck;)V

    iput-object v1, p0, Lcom/opera/android/bar/BottomBar;->b:Lc1f;

    :cond_15
    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_25

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_21

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget-object v3, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_22

    :cond_21
    move v1, v2

    :cond_22
    iput-boolean v1, p0, Lcom/opera/android/bar/BottomBar;->e:Z

    goto :goto_34

    :cond_25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eq v0, v2, :cond_32

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_34

    :cond_32
    iput-boolean v1, p0, Lcom/opera/android/bar/BottomBar;->e:Z

    :cond_34
    :goto_34
    iget-boolean v0, p0, Lcom/opera/android/bar/BottomBar;->e:Z

    if-eqz v0, :cond_41

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->d:Lqvk;

    invoke-virtual {v0, p1}, Lqvk;->a(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_41

    return v2

    :cond_41
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->k()V

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    iget-boolean v1, p0, Lcom/opera/android/bar/BottomBar;->e:Z

    if-eqz v1, :cond_f

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->d:Lqvk;

    invoke-virtual {p0, p1}, Lqvk;->a(Landroid/view/MotionEvent;)Z

    move-result p0

    or-int/2addr v0, p0

    :cond_f
    return v0
.end method
