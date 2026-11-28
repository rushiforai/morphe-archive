.class public Landroidx/appcompat/app/AppCompatDelegateImpl;
.super Ld/b/k/m;
.source ""

# interfaces
.implements Ld/b/p/i/g$a;
.implements Landroid/view/LayoutInflater$Factory2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/AppCompatDelegateImpl$j;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$c;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$g;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$i;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$h;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$f;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$k;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$d;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$l;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$e;
    }
.end annotation


# static fields
.field public static final a0:Ld/e/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ld/e/h<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final b0:Z

.field public static final c0:[I

.field public static d0:Z

.field public static final e0:Z


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:[Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

.field public H:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:I

.field public O:I

.field public P:Z

.field public Q:Z

.field public R:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

.field public S:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

.field public T:Z

.field public U:I

.field public final V:Ljava/lang/Runnable;

.field public W:Z

.field public X:Landroid/graphics/Rect;

.field public Y:Landroid/graphics/Rect;

.field public Z:Landroidx/appcompat/app/AppCompatViewInflater;

.field public final c:Ljava/lang/Object;

.field public final d:Landroid/content/Context;

.field public e:Landroid/view/Window;

.field public f:Landroidx/appcompat/app/AppCompatDelegateImpl$f;

.field public final g:Ld/b/k/l;

.field public i:Landroidx/appcompat/app/ActionBar;

.field public j:Landroid/view/MenuInflater;

.field public k:Ljava/lang/CharSequence;

.field public l:Ld/b/q/n;

.field public m:Landroidx/appcompat/app/AppCompatDelegateImpl$d;

.field public n:Landroidx/appcompat/app/AppCompatDelegateImpl$l;

.field public o:Ld/b/p/a;

.field public p:Landroidx/appcompat/widget/ActionBarContextView;

.field public q:Landroid/widget/PopupWindow;

.field public r:Ljava/lang/Runnable;

.field public s:Ld/h/l/u;

.field public t:Z

.field public u:Z

.field public v:Landroid/view/ViewGroup;

.field public w:Landroid/widget/TextView;

.field public x:Landroid/view/View;

.field public y:Z

.field public z:Z


# virtual methods
.method public h(I)I
    .registers 10

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/widget/ActionBarContextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->isShown()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_8

    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->X:Landroid/graphics/Rect;

    if-nez v2, :cond_0

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->X:Landroid/graphics/Rect;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Y:Landroid/graphics/Rect;

    :cond_0
    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->X:Landroid/graphics/Rect;

    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Y:Landroid/graphics/Rect;

    invoke-virtual {v2, v1, p1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Landroid/view/ViewGroup;

    .line 10
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1d

    if-lt v6, v7, :cond_1

    invoke-static {v5, v2, v4}, Landroidx/appcompat/widget/ViewUtils;->computeFitSystemWindows(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    goto :goto_0

    :cond_1
    sget-object v6, Ld/b/q/q0;->a:Ljava/lang/reflect/Method;

    if-eqz v6, :cond_2

    const/4 v7, 0x2

    :try_start_0
    new-array v7, v7, [Ljava/lang/Object;

    aput-object v2, v7, v1

    aput-object v4, v7, v3

    invoke-virtual {v6, v5, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    :catch_0
    :cond_2
    :goto_0
    iget v2, v4, Landroid/graphics/Rect;->top:I

    if-nez v2, :cond_3

    move v2, p1

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    :goto_1
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq v4, v2, :cond_6

    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/view/View;

    if-nez v2, :cond_4

    new-instance v2, Landroid/view/View;

    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->d:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/view/View;

    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/view/View;

    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->d:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Ld/b/c;->abc_input_method_navigation_guard:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Landroid/view/ViewGroup;

    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/view/View;

    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v6, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, p1, :cond_5

    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/view/View;

    invoke-virtual {v4, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5
    :goto_2
    const/4 v2, 0x1

    goto :goto_3

    :cond_6
    const/4 v2, 0x0

    :goto_3
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/view/View;

    if-eqz v4, :cond_7

    goto :goto_4

    :cond_7
    const/4 v3, 0x0

    :goto_4
    iget-boolean v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Z

    if-nez v4, :cond_a

    if-eqz v3, :cond_a

    const/4 p1, 0x0

    goto :goto_6

    :cond_8
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eqz v2, :cond_9

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    const/4 v2, 0x1

    goto :goto_5

    :cond_9
    const/4 v2, 0x0

    :goto_5
    const/4 v3, 0x0

    :cond_a
    :goto_6
    if-eqz v2, :cond_c

    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_7

    :cond_b
    const/4 v3, 0x0

    :cond_c
    :goto_7
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/view/View;

    if-eqz v0, :cond_e

    if-eqz v3, :cond_d

    goto :goto_8

    :cond_d
    const/16 v1, 0x8

    :goto_8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_e
    return p1
.end method
