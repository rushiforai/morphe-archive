.class public final Lo66;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/widget/PopupWindow$OnDismissListener;
.implements Llud;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# static fields
.field public static final G:[I


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Lkqd;

.field public E:Z

.field public final F:Lkze;

.field public final a:Ldkf;

.field public final b:Litd;

.field public final c:Lm56;

.field public final d:I

.field public final e:Landroid/view/View;

.field public f:Ll56;

.field public g:Landroid/view/ViewTreeObserver;

.field public h:Lr9i;

.field public i:Landroid/widget/FrameLayout;

.field public j:Z

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Z

.field public p:I

.field public q:Z

.field public r:I

.field public s:Z

.field public t:Z

.field public u:I

.field public v:I

.field public w:Lo73;

.field public x:Lb4g;

.field public y:Z

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x1010429

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lo66;->G:[I

    return-void
.end method

.method public constructor <init>(Ldkf;Litd;Landroid/view/View;I)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lo66;->m:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lo66;->y:Z

    new-instance v0, Lkze;

    sget-object v1, Log;->a:Log;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lo66;->F:Lkze;

    iput-object p1, p0, Lo66;->a:Ldkf;

    iput-object p2, p0, Lo66;->b:Litd;

    new-instance v0, Lm56;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lm56;-><init>(Litd;Landroid/view/LayoutInflater;)V

    iput-object v0, p0, Lo66;->c:Lm56;

    iput p4, p0, Lo66;->d:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    invoke-virtual {p4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 v0, v0, 0x2

    const v1, 0x7f07084c

    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    iput p4, p0, Lo66;->u:I

    iput-object p3, p0, Lo66;->e:Landroid/view/View;

    invoke-virtual {p2, p0, p1}, Litd;->b(Llud;Landroid/content/Context;)V

    return-void
.end method

.method public static l(Lptd;Landroid/content/res/ColorStateList;)V
    .registers 5

    invoke-virtual {p0}, Lptd;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, v0}, Lptd;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    :cond_c
    invoke-virtual {p0}, Lptd;->hasSubMenu()Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object p0, p0, Lptd;->o:Lakk;

    const/4 v0, 0x0

    :goto_15
    iget-object v1, p0, Litd;->f:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2d

    invoke-virtual {p0, v0}, Litd;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    instance-of v2, v1, Lptd;

    if-eqz v2, :cond_2a

    check-cast v1, Lptd;

    invoke-static {v1, p1}, Lo66;->l(Lptd;Landroid/content/res/ColorStateList;)V

    :cond_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_2d
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    iget-boolean v0, p0, Lo66;->A:Z

    if-nez v0, :cond_7

    if-nez p1, :cond_7

    return-void

    :cond_7
    iget-object p1, p0, Lo66;->f:Ll56;

    iget-object p1, p1, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    :goto_b
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/WindowManager$LayoutParams;

    if-nez v0, :cond_1f

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_1f

    move-object p1, v0

    check-cast p1, Landroid/view/View;

    goto :goto_b

    :cond_1f
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager$LayoutParams;

    iget-boolean p0, p0, Lo66;->A:Z

    if-eqz p0, :cond_3c

    iget p0, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 p0, p0, 0x2000

    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_42

    :cond_3c
    iget p0, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 p0, p0, -0x2001

    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    :goto_42
    invoke-interface {v0, p1, v1}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final b(Lakk;)Z
    .registers 10

    invoke-virtual {p1}, Litd;->hasVisibleItems()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_90

    new-instance v0, Lo66;

    iget-object v2, p0, Lo66;->e:Landroid/view/View;

    iget v3, p0, Lo66;->d:I

    iget-object v4, p0, Lo66;->a:Ldkf;

    invoke-direct {v0, v4, p1, v2, v3}, Lo66;-><init>(Ldkf;Litd;Landroid/view/View;I)V

    iget-boolean v2, p0, Lo66;->o:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_1d

    iget v2, p0, Lo66;->n:I

    iput v2, v0, Lo66;->n:I

    iput-boolean v3, v0, Lo66;->o:Z

    :cond_1d
    iget-boolean v2, p0, Lo66;->q:Z

    if-eqz v2, :cond_27

    iget v2, p0, Lo66;->p:I

    iput v2, v0, Lo66;->p:I

    iput-boolean v3, v0, Lo66;->q:Z

    :cond_27
    iget-boolean v2, p0, Lo66;->t:Z

    if-eqz v2, :cond_31

    iget-boolean v2, p0, Lo66;->s:Z

    if-eqz v2, :cond_31

    move v2, v3

    goto :goto_32

    :cond_31
    move v2, v1

    :goto_32
    iput-boolean v2, v0, Lo66;->s:Z

    iput-boolean v3, v0, Lo66;->t:Z

    iget v2, p0, Lo66;->m:I

    iput v2, v0, Lo66;->m:I

    iget-object v2, p0, Lo66;->h:Lr9i;

    iput-object v2, v0, Lo66;->h:Lr9i;

    iget-object v2, p1, Litd;->f:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v5, v1

    :goto_45
    if-ge v5, v2, :cond_5c

    invoke-virtual {p1, v5}, Litd;->getItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/MenuItem;->isVisible()Z

    move-result v7

    if-eqz v7, :cond_59

    invoke-interface {v6}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_59

    move p1, v3

    goto :goto_5d

    :cond_59
    add-int/lit8 v5, v5, 0x1

    goto :goto_45

    :cond_5c
    move p1, v1

    :goto_5d
    iget-object v2, v0, Lo66;->c:Lm56;

    iput-boolean p1, v2, Lm56;->c:Z

    iget-object p0, p0, Lo66;->b:Litd;

    invoke-virtual {p0, v1}, Litd;->c(Z)V

    invoke-virtual {v0}, Lo66;->m()Z

    move-result p0

    if-eqz p0, :cond_90

    iget-object p0, v0, Lo66;->f:Ll56;

    const/4 p1, 0x0

    if-eqz p0, :cond_74

    iget-object p0, p0, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    goto :goto_75

    :cond_74
    move-object p0, p1

    :goto_75
    if-eqz p0, :cond_7b

    invoke-static {p0}, Lq9n;->m(Lim7;)Landroid/view/View;

    move-result-object p1

    :cond_7b
    if-eqz p1, :cond_8f

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p0

    invoke-virtual {p0, p1}, Lqwe;->b(Landroid/view/View;)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setClipToOutline(Z)V

    :cond_8f
    return v3

    :cond_90
    return v1
.end method

.method public final c(Lptd;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final d(Lkud;)V
    .registers 2

    const/4 p0, 0x0

    throw p0
.end method

.method public final e()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lo66;->j:Z

    iget-object p0, p0, Lo66;->c:Lm56;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lm56;->notifyDataSetChanged()V

    :cond_a
    return-void
.end method

.method public final f(Litd;Z)V
    .registers 3

    iget-object p2, p0, Lo66;->b:Litd;

    if-eq p1, p2, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lo66;->j()Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_10
    return-void
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final h(Lptd;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final i(Landroid/content/Context;Litd;)V
    .registers 3

    return-void
.end method

.method public final j()Z
    .registers 1

    iget-object p0, p0, Lo66;->f:Ll56;

    if-eqz p0, :cond_e

    iget-object p0, p0, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final k()V
    .registers 12

    iget v0, p0, Lo66;->v:I

    iget-object v1, p0, Lo66;->c:Lm56;

    invoke-virtual {v1}, Lm56;->getCount()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v5, v3

    move v6, v5

    move v7, v6

    move-object v8, v4

    :goto_e
    if-ge v5, v2, :cond_41

    invoke-virtual {v1, v5}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    move-result v9

    if-eq v9, v6, :cond_18

    move-object v8, v4

    move v6, v9

    :cond_18
    iget-object v9, p0, Lo66;->i:Landroid/widget/FrameLayout;

    if-nez v9, :cond_25

    new-instance v9, Landroid/widget/FrameLayout;

    iget-object v10, p0, Lo66;->a:Ldkf;

    invoke-direct {v9, v10}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lo66;->i:Landroid/widget/FrameLayout;

    :cond_25
    invoke-virtual {v1, v5, v8, v9}, Lm56;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v3, v3}, Landroid/view/View;->measure(II)V

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    iget v10, p0, Lo66;->u:I

    if-lt v9, v10, :cond_36

    move v0, v10

    goto :goto_39

    :cond_36
    if-le v9, v0, :cond_39

    move v0, v9

    :cond_39
    :goto_39
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    add-int/2addr v7, v9

    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    :cond_41
    iget-object v1, p0, Lo66;->f:Ll56;

    iget-object v1, v1, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    if-eqz v1, :cond_52

    if-lez v2, :cond_51

    invoke-virtual {v1}, Landroid/widget/ListView;->getDividerHeight()I

    move-result v1

    add-int/lit8 v2, v2, -0x1

    mul-int v3, v2, v1

    :cond_51
    add-int/2addr v7, v3

    :cond_52
    iput v0, p0, Lo66;->k:I

    iput v7, p0, Lo66;->l:I

    return-void
.end method

.method public final m()Z
    .registers 16

    invoke-virtual {p0}, Lo66;->j()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1b9

    iget-object v0, p0, Lo66;->e:Landroid/view/View;

    const/4 v2, 0x0

    if-nez v0, :cond_d

    return v2

    :cond_d
    new-instance v3, Ll56;

    iget v4, p0, Lo66;->d:I

    iget-object v5, p0, Lo66;->a:Ldkf;

    invoke-direct {v3, v5, v4}, Ll56;-><init>(Ldkf;I)V

    iput-object v3, p0, Lo66;->f:Ll56;

    iget-object v3, v3, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {v3, p0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    iget-object v3, p0, Lo66;->f:Ll56;

    iput-object p0, v3, Landroidx/appcompat/widget/ListPopupWindow;->r:Landroid/widget/AdapterView$OnItemClickListener;

    iget-boolean v4, p0, Lo66;->y:Z

    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/ListPopupWindow;->q(Z)V

    iget-object v3, p0, Lo66;->f:Ll56;

    iget-boolean v4, p0, Lo66;->z:Z

    iput-boolean v4, v3, Landroidx/appcompat/widget/ListPopupWindow;->l:Z

    iget-boolean v4, p0, Lo66;->E:Z

    iput-boolean v4, v3, Landroidx/appcompat/widget/ListPopupWindow;->o:Z

    iget-object v4, p0, Lo66;->D:Lkqd;

    if-eqz v4, :cond_b6

    iget-object v4, v4, Lkqd;->b:Ljava/lang/Object;

    check-cast v4, Lkwf;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-boolean v8, v4, Lkwf;->B:Z

    const-string v9, "rootView"

    if-eqz v8, :cond_5d

    const v8, 0x7f0d010e

    invoke-virtual {v6, v8, v7, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v8, :cond_59

    check-cast v8, Landroid/widget/FrameLayout;

    goto :goto_6b

    :cond_59
    invoke-static {v9}, Lt3p;->q(Ljava/lang/String;)V

    return v2

    :cond_5d
    const v8, 0x7f0d0110

    invoke-virtual {v6, v8, v7, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v8, :cond_b2

    check-cast v8, Landroid/widget/FrameLayout;

    :goto_6b
    const v8, 0x7f0d0320

    invoke-virtual {v6, v8, v7, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v7, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v6}, Lpt1;->b(Landroid/view/View;)Lpt1;

    move-result-object v10

    new-instance v8, Ligi;

    iget-object v9, v4, Lkwf;->v:Lk6l;

    new-instance v11, Leu3;

    invoke-direct {v11, v4, v1}, Leu3;-><init>(Ljava/lang/Object;B)V

    iget-object v12, v4, Lkwf;->l:Lnwf;

    new-instance v13, Lvdf;

    const/16 v6, 0xa

    invoke-direct {v13, v4, v6}, Lvdf;-><init>(Ljava/lang/Object;B)V

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v14}, Ligi;-><init>(Lk6l;Lpt1;Ljava/util/function/BooleanSupplier;Lnwf;Ljava/lang/Runnable;Lkze;)V

    iget-object v4, v3, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_aa

    iget-object v6, v3, Landroidx/appcompat/widget/ListPopupWindow;->n:Landroid/widget/LinearLayout;

    if-eqz v6, :cond_aa

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    instance-of v8, v6, Landroid/view/ViewGroup;

    if-eqz v8, :cond_aa

    check-cast v6, Landroid/view/ViewGroup;

    iget-object v8, v3, Landroidx/appcompat/widget/ListPopupWindow;->n:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v8}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_aa
    iput-object v7, v3, Landroidx/appcompat/widget/ListPopupWindow;->n:Landroid/widget/LinearLayout;

    if-eqz v4, :cond_b6

    invoke-virtual {v3}, Ll56;->show()V

    goto :goto_b6

    :cond_b2
    invoke-static {v9}, Lt3p;->q(Ljava/lang/String;)V

    return v2

    :cond_b6
    :goto_b6
    iget-object v3, p0, Lo66;->g:Landroid/view/ViewTreeObserver;

    if-nez v3, :cond_bc

    move v3, v1

    goto :goto_bd

    :cond_bc
    move v3, v2

    :goto_bd
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    iput-object v4, p0, Lo66;->g:Landroid/view/ViewTreeObserver;

    if-eqz v3, :cond_c8

    invoke-virtual {v4, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_c8
    iget-object v3, p0, Lo66;->f:Ll56;

    iput-object v0, v3, Landroidx/appcompat/widget/ListPopupWindow;->q:Landroid/view/View;

    iget v3, p0, Lo66;->m:I

    if-eqz v3, :cond_d7

    const/high16 v4, 0x800000

    and-int/2addr v3, v4

    if-nez v3, :cond_d7

    move v0, v2

    goto :goto_db

    :cond_d7
    invoke-static {v0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v0

    :goto_db
    iget-object v3, p0, Lo66;->f:Ll56;

    iget v4, p0, Lo66;->m:I

    if-eqz v0, :cond_f6

    if-nez v4, :cond_e7

    const v0, 0x800003

    goto :goto_eb

    :cond_e7
    invoke-static {v4, v1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v0

    :goto_eb
    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/ListPopupWindow;->p(I)V

    iget-object v0, p0, Lo66;->f:Ll56;

    iget v3, v0, Landroidx/appcompat/widget/ListPopupWindow;->f:I

    neg-int v3, v3

    iput v3, v0, Landroidx/appcompat/widget/ListPopupWindow;->f:I

    goto :goto_f9

    :cond_f6
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/ListPopupWindow;->p(I)V

    :goto_f9
    iget-boolean v0, p0, Lo66;->j:Z

    if-nez v0, :cond_102

    invoke-virtual {p0}, Lo66;->k()V

    iput-boolean v1, p0, Lo66;->j:Z

    :cond_102
    iget-boolean v0, p0, Lo66;->o:Z

    iget-object v3, p0, Lo66;->f:Ll56;

    if-eqz v0, :cond_10e

    iget v0, p0, Lo66;->n:I

    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/ListPopupWindow;->g(I)V

    goto :goto_115

    :cond_10e
    invoke-virtual {v3}, Landroidx/appcompat/widget/ListPopupWindow;->j()I

    move-result v0

    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/ListPopupWindow;->g(I)V

    :goto_115
    iget-boolean v0, p0, Lo66;->q:Z

    if-eqz v0, :cond_11f

    iget-object v0, p0, Lo66;->f:Ll56;

    iget v3, p0, Lo66;->p:I

    iput v3, v0, Landroidx/appcompat/widget/ListPopupWindow;->f:I

    :cond_11f
    iget-boolean v0, p0, Lo66;->t:Z

    if-eqz v0, :cond_142

    iget-object v0, p0, Lo66;->f:Ll56;

    iget-boolean v3, p0, Lo66;->s:Z

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v4}, [Ljava/lang/Class;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const-string v7, "setPopupClipToScreenEnabled"

    invoke-static {v0, v7, v4, v6}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    :cond_142
    invoke-virtual {p0}, Lo66;->n()V

    iget-object v0, p0, Lo66;->f:Ll56;

    const/4 v3, 0x2

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    iget-object v0, p0, Lo66;->b:Litd;

    iget-object v3, v0, Litd;->n:Ljava/lang/CharSequence;

    if-eqz v3, :cond_155

    move v3, v1

    goto :goto_156

    :cond_155
    move v3, v2

    :goto_156
    iget-object v4, p0, Lo66;->c:Lm56;

    if-nez v3, :cond_15f

    iget-object v6, p0, Lo66;->f:Ll56;

    invoke-virtual {v6, v4}, Landroidx/appcompat/widget/ListPopupWindow;->k(Landroid/widget/ListAdapter;)V

    :cond_15f
    iget-object v6, p0, Lo66;->F:Lkze;

    sget-object v7, Lng;->a:Lng;

    invoke-virtual {v6, v7}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v6, p0, Lo66;->f:Ll56;

    invoke-virtual {v6}, Ll56;->show()V

    invoke-virtual {p0, v2}, Lo66;->a(Z)V

    iget-object v6, p0, Lo66;->f:Ll56;

    iget-object v6, v6, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    invoke-virtual {v6, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    new-instance v7, Ln66;

    invoke-direct {v7, p0}, Ln66;-><init>(Lo66;)V

    sget-object v8, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v6, v7}, Lm5n;->a(Landroid/view/View;Lq5n;)V

    invoke-virtual {v6, p0}, Landroid/widget/AdapterView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    const v7, 0x7f0a084a

    invoke-virtual {v6, v7}, Landroid/view/View;->setId(I)V

    iget v7, p0, Lo66;->r:I

    if-eqz v7, :cond_194

    new-instance v7, Ln66;

    invoke-direct {v7, p0}, Ln66;-><init>(Lo66;)V

    invoke-static {v6, v7}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    :cond_194
    if-eqz v3, :cond_1b9

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v5, 0x7f0d00e4

    invoke-virtual {v3, v5, v6, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v0, v0, Litd;->n:Ljava/lang/CharSequence;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    const/4 v0, 0x0

    invoke-virtual {v6, v3, v0, v2}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lo66;->f:Ll56;

    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/ListPopupWindow;->k(Landroid/widget/ListAdapter;)V

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Ll56;->show()V

    :cond_1b9
    return v1
.end method

.method public final n()V
    .registers 4

    iget-boolean v0, p0, Lo66;->B:Z

    iget-object v1, p0, Lo66;->e:Landroid/view/View;

    if-eqz v0, :cond_17

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    iget v2, p0, Lo66;->u:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget v2, p0, Lo66;->k:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_19

    :cond_17
    iget v0, p0, Lo66;->k:I

    :goto_19
    invoke-static {v1}, Lq9n;->n(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    iget-object p0, p0, Lo66;->f:Ll56;

    const/4 v2, 0x0

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-static {v0, v2, v1}, Lcs5;->t(III)I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/ListPopupWindow;->o(I)V

    return-void
.end method

.method public final onDismiss()V
    .registers 4

    iget-object v0, p0, Lo66;->w:Lo73;

    if-eqz v0, :cond_7

    invoke-interface {v0}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    :cond_7
    iget-object v0, p0, Lo66;->f:Ll56;

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    iget-object v0, v0, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    if-eqz v0, :cond_15

    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v0, v1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    :cond_15
    iput-object v1, p0, Lo66;->f:Ll56;

    :cond_17
    iget-object v0, p0, Lo66;->b:Litd;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Litd;->c(Z)V

    iget-object v0, p0, Lo66;->g:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_36

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lo66;->e:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Lo66;->g:Landroid/view/ViewTreeObserver;

    :cond_2f
    iget-object v0, p0, Lo66;->g:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iput-object v1, p0, Lo66;->g:Landroid/view/ViewTreeObserver;

    :cond_36
    iget-object p0, p0, Lo66;->F:Lkze;

    sget-object v0, Log;->a:Log;

    invoke-static {p0, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final onGlobalLayout()V
    .registers 9

    invoke-virtual {p0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_b1

    iget-object v0, p0, Lo66;->e:Landroid/view/View;

    if-eqz v0, :cond_a6

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_a6

    invoke-virtual {p0}, Lo66;->n()V

    iget-boolean v1, p0, Lo66;->C:Z

    if-eqz v1, :cond_a0

    iget-object v1, p0, Lo66;->c:Lm56;

    invoke-virtual {v1}, Lm56;->getCount()I

    move-result v2

    const/4 v3, 0x1

    if-lt v2, v3, :cond_a0

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lo66;->k()V

    iget v4, p0, Lo66;->l:I

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iget-object v6, p0, Lo66;->f:Ll56;

    iget-object v6, v6, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {v6}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_47

    iget-object v6, p0, Lo66;->f:Ll56;

    iget-object v6, v6, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {v6}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    :cond_47
    iget v6, v5, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v6

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v4, v5

    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v6

    sub-int/2addr v5, v6

    iget v6, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, v2

    invoke-virtual {v1}, Lm56;->getCount()I

    move-result v1

    div-int v1, v4, v1

    if-lt v4, v6, :cond_6d

    if-lt v0, v6, :cond_6d

    const/4 v3, 0x0

    :cond_6d
    const-string v2, "Invalid height. Must be a positive value, MATCH_PARENT, or WRAP_CONTENT."

    const/4 v6, -0x1

    const/4 v7, -0x2

    if-eqz v3, :cond_89

    if-le v4, v5, :cond_89

    if-le v5, v1, :cond_89

    iget-object v0, p0, Lo66;->f:Ll56;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-gez v5, :cond_86

    if-eq v7, v5, :cond_86

    if-eq v6, v5, :cond_86

    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_86
    iput v5, v0, Landroidx/appcompat/widget/ListPopupWindow;->d:I

    goto :goto_a0

    :cond_89
    if-nez v3, :cond_a0

    if-le v4, v0, :cond_a0

    if-le v0, v1, :cond_a0

    iget-object v1, p0, Lo66;->f:Ll56;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-gez v0, :cond_9e

    if-eq v7, v0, :cond_9e

    if-eq v6, v0, :cond_9e

    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_9e
    iput v0, v1, Landroidx/appcompat/widget/ListPopupWindow;->d:I

    :cond_a0
    :goto_a0
    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Ll56;->show()V

    return-void

    :cond_a6
    invoke-virtual {p0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_b1

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_b1
    return-void
.end method

.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6

    iget-object p0, p0, Lo66;->f:Ll56;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object p0

    check-cast p0, Landroid/widget/ListAdapter;

    instance-of p1, p0, Landroid/widget/HeaderViewListAdapter;

    if-eqz p1, :cond_19

    move-object p1, p0

    check-cast p1, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {p1}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lm56;

    goto :goto_1c

    :cond_19
    move-object p1, p0

    check-cast p1, Lm56;

    :goto_1c
    invoke-interface {p0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/MenuItem;

    iget-object p1, p1, Lm56;->a:Litd;

    const/4 p2, 0x0

    const/4 p3, 0x0

    invoke-virtual {p1, p0, p2, p3}, Litd;->q(Landroid/view/MenuItem;Llud;I)Z

    return-void
.end method

.method public final onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 6

    iget-object p2, p0, Lo66;->x:Lb4g;

    const/4 p4, 0x0

    if-nez p2, :cond_6

    return p4

    :cond_6
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object p1

    check-cast p1, Landroid/widget/ListAdapter;

    iget-object p0, p0, Lo66;->x:Lb4g;

    invoke-interface {p1, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/MenuItem;

    iget-object p0, p0, Lb4g;->m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return p4
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 5

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_22

    const/16 p1, 0x52

    if-eq p2, p1, :cond_16

    const/16 p1, 0x6f

    if-ne p2, p1, :cond_22

    const/4 p1, 0x0

    invoke-static {p1, p3}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_22

    :cond_16
    invoke-virtual {p0}, Lo66;->j()Z

    move-result p1

    if-eqz p1, :cond_21

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_21
    return v0

    :cond_22
    invoke-static {}, Lc37;->r()Lc37;

    move-result-object p0

    const/4 p1, 0x2

    invoke-virtual {p0, p1, p3}, Lc37;->l(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
