.class public Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;


# static fields
.field public static u:F = 2.0f

.field public static final v:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ll/s900;

.field public b:Ll/idi0;

.field public final c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Z

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:Landroid/view/VelocityTracker;

.field public r:Z

.field public s:Z

.field public t:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/pn50;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView$a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    const-string v2, "innerPaddingBottom"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->v:Landroid/util/Property;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x2710

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->c:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i:Z

    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->j:I

    .line 12
    .line 13
    const/4 p2, -0x1

    .line 14
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->k:I

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->n:I

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->o:I

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->p:Z

    .line 21
    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r:Z

    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->s:Z

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->o()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->q:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->q:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private o()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->d:I

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->e:I

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->f:I

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public D()V
    .locals 1

    .line 1
    const-string v0, "requestInner call"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "safeLayout: from "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " state :"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->p:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->p:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->D()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->W(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final F(II)V
    .locals 3

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->k:I

    .line 2
    .line 3
    int-to-float v0, p2

    .line 4
    const/high16 v1, -0x40800000    # -1.0f

    .line 5
    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->j:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->j:I

    .line 15
    .line 16
    sub-int v2, p1, p2

    .line 17
    .line 18
    add-int/2addr v0, v2

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->j:I

    .line 20
    .line 21
    sub-int p2, p1, p2

    .line 22
    .line 23
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->w(II)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 27
    .line 28
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->k:I

    .line 29
    .line 30
    sub-int v0, p1, v0

    .line 31
    .line 32
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->d0(II)Z

    .line 33
    .line 34
    .line 35
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->k:I

    .line 36
    .line 37
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->r:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .locals 0

    .line 8
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;II)V
    .locals 0

    .line 12
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 14
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 10
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r(Landroid/view/View;)V

    return-void
.end method

.method public addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget p1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->p:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(IFIIZ)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->w(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public detachViewFromParent(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->detachViewFromParent(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public forceLayout()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->forceLayout()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->p:Z

    .line 6
    .line 7
    return-void
.end method

.method public g(Ll/pn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getChildDrawingOrder(II)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->getChildDrawingOrder(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getInnerPaddingBottom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getRealHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public getRealWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getRenderContentHeight()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->l:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->o:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/pn50;

    .line 26
    .line 27
    iget-boolean v0, v0, Ll/pn50;->a:Z

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method public i(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->B0(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const-string p0, "TantanListView"

    .line 5
    .line 6
    const-string v0, "\u4ece\u7a97\u53e3\u4e2d\u79fb\u51fa\u4e86"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    float-to-int v1, v1

    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    float-to-int v2, v2

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r:Z

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h:I

    .line 28
    .line 29
    sub-int v0, v2, v0

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->d:I

    .line 36
    .line 37
    if-le v1, v3, :cond_2

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i:Z

    .line 41
    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->g:I

    .line 43
    .line 44
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h:I

    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->q:I

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t(I)V

    .line 49
    .line 50
    .line 51
    return p1

    .line 52
    :cond_1
    const/4 v0, 0x0

    .line 53
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r:Z

    .line 54
    .line 55
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->g:I

    .line 56
    .line 57
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h:I

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->u0()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->k0()V

    .line 70
    .line 71
    .line 72
    sget v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->p:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t(I)V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 7

    .line 1
    const-string v0, "onLayout"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    move v2, p1

    .line 11
    move v3, p2

    .line 12
    move v4, p3

    .line 13
    move v5, p4

    .line 14
    move v6, p5

    .line 15
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->O(ZIIII)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->p:Z

    .line 20
    .line 21
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "onMeasure: "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "*"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->l:I

    .line 42
    .line 43
    if-eq v2, p2, :cond_1

    .line 44
    .line 45
    if-lez p2, :cond_1

    .line 46
    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 v0, 0x0

    .line 52
    :goto_0
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->l:I

    .line 53
    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->m:I

    .line 55
    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v3, "onMeasure: calculateItemInfoNecessary"

    .line 59
    .line 60
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Ll/yor;->c(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/idi0;->E0(Z)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->p:Z

    .line 86
    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->V()V

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->q:Landroid/view/VelocityTracker;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    and-int/lit16 v0, v0, 0xff

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    float-to-int v1, v1

    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    float-to-int p1, p1

    .line 25
    const/4 v2, 0x0

    .line 26
    const/4 v3, 0x1

    .line 27
    if-eqz v0, :cond_7

    .line 28
    .line 29
    if-eq v0, v3, :cond_2

    .line 30
    .line 31
    const/4 v1, 0x2

    .line 32
    if-eq v0, v1, :cond_0

    .line 33
    .line 34
    const/4 p1, 0x3

    .line 35
    if-eq v0, p1, :cond_2

    .line 36
    .line 37
    goto/16 :goto_3

    .line 38
    .line 39
    :cond_0
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r:Z

    .line 40
    .line 41
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h:I

    .line 42
    .line 43
    sub-int v0, p1, v0

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->d:I

    .line 50
    .line 51
    if-le v1, v2, :cond_1

    .line 52
    .line 53
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i:Z

    .line 54
    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i:Z

    .line 58
    .line 59
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->g:I

    .line 60
    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h:I

    .line 62
    .line 63
    sget v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->q:I

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t(I)V

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i:Z

    .line 69
    .line 70
    if-eqz v0, :cond_8

    .line 71
    .line 72
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h:I

    .line 73
    .line 74
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->F(II)V

    .line 75
    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_2
    const/4 p1, -0x1

    .line 79
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->k:I

    .line 80
    .line 81
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i:Z

    .line 82
    .line 83
    if-eqz p1, :cond_8

    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->q:Landroid/view/VelocityTracker;

    .line 86
    .line 87
    const/16 v0, 0x3e8

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    sget v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->u:F

    .line 97
    .line 98
    div-float/2addr p1, v0

    .line 99
    float-to-int p1, p1

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v1, "\u6eda\u52a8\u7684\u901f\u5ea6\u4e3a\uff1a  ====\u300b"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    const-string v1, "TantanListView"

    .line 115
    .line 116
    invoke-static {v1, v0}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->f:I

    .line 124
    .line 125
    if-le v0, v1, :cond_3

    .line 126
    .line 127
    const/16 v0, 0x9c4

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_3
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->e:I

    .line 135
    .line 136
    if-le v0, v1, :cond_4

    .line 137
    .line 138
    const/16 v0, 0x578

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_4
    const/16 v0, 0x12c

    .line 142
    .line 143
    :goto_0
    const/16 v1, 0x2710

    .line 144
    .line 145
    if-lt p1, v1, :cond_5

    .line 146
    .line 147
    :goto_1
    move p1, v1

    .line 148
    goto :goto_2

    .line 149
    :cond_5
    const/16 v1, -0x2710

    .line 150
    .line 151
    if-gt p1, v1, :cond_6

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_6
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 155
    .line 156
    int-to-long v0, v0

    .line 157
    invoke-virtual {p0, p1, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->C0(IIJ)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_7
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i:Z

    .line 162
    .line 163
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->r:Z

    .line 164
    .line 165
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->g:I

    .line 166
    .line 167
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h:I

    .line 168
    .line 169
    :cond_8
    :goto_3
    return v3
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->t0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final r(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .line 1
    const-string v0, "requestLayout"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/idi0;->U()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setAdapter(Ll/dxi0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "\u8bf7\u8bbe\u7f6e\u6b63\u786e\u7684LayoutManager"

    .line 7
    .line 8
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setDebugMove(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Landroid/view/View;->scrollBy(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setInnerPaddingBottom(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->o:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->o:I

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Ll/idi0;->E0(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 14
    .line 15
    const-string p1, "setInnerPaddingBottom"

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->Y(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setLayoutManager(Ll/idi0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->A0(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->c0(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->s:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/pn50;

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ll/pn50;->a(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h()V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->s:Z

    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public w(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->s:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/pn50;

    .line 29
    .line 30
    invoke-virtual {v1, p1, p2}, Ll/pn50;->b(II)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->h()V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->s:Z

    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public y(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->removeDetachedView(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public z(Ll/pn50;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    iput-boolean p0, p1, Ll/pn50;->a:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->t:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
