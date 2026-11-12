.class public final Lem3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnph;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lem3;->a:B

    iput-object p1, p0, Lem3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Z)V
    .registers 2

    return-void
.end method

.method private final e(Z)V
    .registers 2

    return-void
.end method

.method private final f(Z)V
    .registers 2

    return-void
.end method

.method private final g(Z)V
    .registers 2

    return-void
.end method

.method private final h(Z)V
    .registers 2

    return-void
.end method

.method private final i(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method

.method private final j(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method

.method private final k(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method

.method private final l(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method

.method private final m(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final b(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .registers 10

    iget-byte p1, p0, Lem3;->a:B

    const/4 v0, 0x3

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lem3;->b:Ljava/lang/Object;

    const/4 v4, 0x0

    packed-switch p1, :pswitch_data_1de

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Lr9l;->u()V

    iget-object p1, p0, Lr9l;->q:Lebl;

    iget-object p1, p1, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    if-eqz p1, :cond_21

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-nez p1, :cond_24

    :cond_21
    invoke-virtual {p0, v4}, Lr9l;->r(Z)Z

    :cond_24
    return v4

    :pswitch_25
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_2f

    check-cast p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    iput-boolean v3, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->h:Z

    :cond_2f
    return v4

    :pswitch_30
    check-cast p0, Lc9j;

    sget-object p1, Lc9j;->w:[Lxtb;

    iget-object p1, p0, Lc9j;->t:Lov0;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result p1

    if-eqz p1, :cond_43

    invoke-virtual {p0}, Lc9j;->G0()V

    :cond_43
    return v4

    :pswitch_44
    check-cast p0, Loy;

    iget-object p1, p0, Loy;->i:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz p1, :cond_55

    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result p1

    if-ne p1, v3, :cond_55

    invoke-virtual {p0}, Loy;->b()V

    :cond_55
    return v4

    :pswitch_56
    check-cast p0, Lglb;

    iget-object p1, p0, Lglb;->x:Landroid/view/GestureDetector;

    invoke-virtual {p1, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_db

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lglb;->l:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lglb;->d:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lglb;->e:F

    iget-object p1, p0, Lglb;->t:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_7c

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    :cond_7c
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object p1

    iput-object p1, p0, Lglb;->t:Landroid/view/VelocityTracker;

    iget-object p1, p0, Lglb;->c:Landroidx/recyclerview/widget/i;

    if-nez p1, :cond_f2

    iget-object p1, p0, Lglb;->p:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_aa

    invoke-virtual {p0, p2}, Lglb;->j(Landroid/view/MotionEvent;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v3

    :goto_97
    if-ltz v1, :cond_aa

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxkb;

    iget-object v6, v5, Lxkb;->e:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-ne v6, v0, :cond_a7

    move-object v2, v5

    goto :goto_aa

    :cond_a7
    add-int/lit8 v1, v1, -0x1

    goto :goto_97

    :cond_aa
    :goto_aa
    if-eqz v2, :cond_f2

    iget-object p1, v2, Lxkb;->e:Landroidx/recyclerview/widget/i;

    iget v0, p0, Lglb;->d:F

    iget v1, v2, Lxkb;->i:F

    sub-float/2addr v0, v1

    iput v0, p0, Lglb;->d:F

    iget v0, p0, Lglb;->e:F

    iget v1, v2, Lxkb;->j:F

    sub-float/2addr v0, v1

    iput v0, p0, Lglb;->e:F

    invoke-virtual {p0, p1, v3}, Lglb;->i(Landroidx/recyclerview/widget/i;Z)V

    iget-object v0, p0, Lglb;->a:Ljava/util/ArrayList;

    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d0

    iget-object v0, p0, Lglb;->m:Lclb;

    iget-object v1, p0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1, p1}, Lclb;->b(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    :cond_d0
    iget-byte v0, v2, Lxkb;->f:B

    invoke-virtual {p0, p1, v0}, Lglb;->n(Landroidx/recyclerview/widget/i;I)V

    iget p1, p0, Lglb;->o:I

    invoke-virtual {p0, p1, v4, p2}, Lglb;->o(IILandroid/view/MotionEvent;)V

    goto :goto_f2

    :cond_db
    if-eq p1, v0, :cond_ed

    if-eq p1, v3, :cond_ed

    iget v0, p0, Lglb;->l:I

    if-eq v0, v1, :cond_f2

    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-ltz v0, :cond_f2

    invoke-virtual {p0, p1, v0, p2}, Lglb;->g(IILandroid/view/MotionEvent;)V

    goto :goto_f2

    :cond_ed
    iput v1, p0, Lglb;->l:I

    invoke-virtual {p0, v2, v4}, Lglb;->n(Landroidx/recyclerview/widget/i;I)V

    :cond_f2
    :goto_f2
    iget-object p1, p0, Lglb;->t:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_f9

    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_f9
    iget-object p0, p0, Lglb;->c:Landroidx/recyclerview/widget/i;

    if-nez p0, :cond_fe

    move v3, v4

    :cond_fe
    return v3

    :pswitch_ff
    check-cast p0, Lflb;

    iget-object p1, p0, Lflb;->B:Landroid/view/GestureDetector;

    invoke-virtual {p1, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v5, 0x2

    if-ne p1, v5, :cond_125

    iget-object v5, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-nez v5, :cond_125

    iget v5, p0, Lflb;->p:I

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    if-ne v5, v6, :cond_125

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iput v5, p0, Lflb;->g:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iput v5, p0, Lflb;->h:F

    :cond_125
    if-nez p1, :cond_1ab

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lflb;->p:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lflb;->e:F

    iput p1, p0, Lflb;->g:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lflb;->f:F

    iput p1, p0, Lflb;->h:F

    iget-object p1, p0, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_144

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    :cond_144
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object p1

    iput-object p1, p0, Lflb;->x:Landroid/view/VelocityTracker;

    iget-object p1, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-nez p1, :cond_1c2

    iget-object p1, p0, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_172

    invoke-virtual {p0, p2}, Lflb;->m(Landroid/view/MotionEvent;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v3

    :goto_15f
    if-ltz v1, :cond_172

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lelb;

    iget-object v6, v5, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-ne v6, v0, :cond_16f

    move-object v2, v5

    goto :goto_172

    :cond_16f
    add-int/lit8 v1, v1, -0x1

    goto :goto_15f

    :cond_172
    :goto_172
    if-eqz v2, :cond_1c2

    iget-object p1, v2, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget v0, p0, Lflb;->e:F

    iget v1, v2, Lelb;->k:F

    sub-float/2addr v0, v1

    iput v0, p0, Lflb;->e:F

    iget v0, p0, Lflb;->f:F

    iget v1, v2, Lelb;->l:F

    sub-float/2addr v0, v1

    iput v0, p0, Lflb;->f:F

    invoke-virtual {p0, p1, v3}, Lflb;->k(Landroidx/recyclerview/widget/i;Z)I

    iget-object v0, p0, Lflb;->a:Ljava/util/ArrayList;

    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_198

    iget-object v0, p0, Lflb;->q:Lblb;

    iget-object v1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1, p1}, Lblb;->d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    :cond_198
    iget-byte v0, v2, Lelb;->f:B

    invoke-virtual {p0, p1, v0}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    iget p1, p0, Lflb;->s:I

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lflb;->t(IFF)V

    goto :goto_1c2

    :cond_1ab
    if-eq p1, v0, :cond_1bd

    if-eq p1, v3, :cond_1bd

    iget v0, p0, Lflb;->p:I

    if-eq v0, v1, :cond_1c2

    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-ltz v0, :cond_1c2

    invoke-virtual {p0, p1, v0, p2}, Lflb;->g(IILandroid/view/MotionEvent;)V

    goto :goto_1c2

    :cond_1bd
    iput v1, p0, Lflb;->p:I

    invoke-virtual {p0, v2, v4}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    :cond_1c2
    :goto_1c2
    iget-object p1, p0, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_1c9

    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_1c9
    iget-object p0, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-nez p0, :cond_1ce

    move v3, v4

    :cond_1ce
    return v3

    :pswitch_1cf
    check-cast p0, Lim3;

    iget-object p1, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result p1

    if-eqz p1, :cond_1dc

    invoke-virtual {p0}, Lim3;->K0()V

    :cond_1dc
    return v4

    nop

    :pswitch_data_1de
    .packed-switch 0x0
        :pswitch_1cf
        :pswitch_ff
        :pswitch_56
        :pswitch_44
        :pswitch_30
        :pswitch_25
    .end packed-switch
.end method

.method public final c(Z)V
    .registers 5

    iget-byte v0, p0, Lem3;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lem3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1a

    :pswitch_9
    return-void

    :pswitch_a
    if-eqz p1, :cond_11

    check-cast p0, Lglb;

    invoke-virtual {p0, v2, v1}, Lglb;->n(Landroidx/recyclerview/widget/i;I)V

    :cond_11
    return-void

    :pswitch_12
    if-eqz p1, :cond_19

    check-cast p0, Lflb;

    invoke-virtual {p0, v2, v1}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    :cond_19
    :pswitch_19
    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_19
        :pswitch_12
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_9
    .end packed-switch
.end method

.method public final d(Landroid/view/MotionEvent;)V
    .registers 13

    iget-byte v0, p0, Lem3;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x3

    const/4 v4, 0x2

    iget-object p0, p0, Lem3;->b:Ljava/lang/Object;

    const/4 v5, -0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_10e

    :pswitch_e
    return-void

    :pswitch_f
    check-cast p0, Lglb;

    iget-object v0, p0, Lglb;->s:Lvl9;

    iget-object v8, p0, Lglb;->x:Landroid/view/GestureDetector;

    invoke-virtual {v8, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v8, p0, Lglb;->t:Landroid/view/VelocityTracker;

    if-eqz v8, :cond_1f

    invoke-virtual {v8, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_1f
    iget v8, p0, Lglb;->l:I

    if-eq v8, v5, :cond_7e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v8

    iget v9, p0, Lglb;->l:I

    invoke-virtual {p1, v9}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v9

    if-ltz v9, :cond_32

    invoke-virtual {p0, v8, v9, p1}, Lglb;->g(IILandroid/view/MotionEvent;)V

    :cond_32
    iget-object v10, p0, Lglb;->c:Landroidx/recyclerview/widget/i;

    if-eqz v10, :cond_7e

    if-eq v8, v6, :cond_79

    if-eq v8, v4, :cond_61

    if-eq v8, v3, :cond_59

    if-ne v8, v2, :cond_7e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iget v2, p0, Lglb;->l:I

    if-ne v1, v2, :cond_7e

    if-eqz v0, :cond_4d

    move v6, v7

    :cond_4d
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iput v1, p0, Lglb;->l:I

    iget v1, p0, Lglb;->o:I

    invoke-virtual {p0, v1, v0, p1}, Lglb;->o(IILandroid/view/MotionEvent;)V

    goto :goto_7e

    :cond_59
    iget-object p1, p0, Lglb;->t:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_79

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    goto :goto_79

    :cond_61
    if-ltz v9, :cond_7e

    iget v1, p0, Lglb;->o:I

    invoke-virtual {p0, v1, v9, p1}, Lglb;->o(IILandroid/view/MotionEvent;)V

    invoke-virtual {p0, v10}, Lglb;->m(Landroidx/recyclerview/widget/i;)V

    iget-object p1, p0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-virtual {v0}, Lvl9;->run()V

    iget-object p0, p0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_7e

    :cond_79
    :goto_79
    invoke-virtual {p0, v1, v7}, Lglb;->n(Landroidx/recyclerview/widget/i;I)V

    iput v5, p0, Lglb;->l:I

    :cond_7e
    :goto_7e
    return-void

    :pswitch_7f
    check-cast p0, Lflb;

    iget-object v0, p0, Lflb;->B:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_8d

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_8d
    iget v0, p0, Lflb;->p:I

    if-ne v0, v5, :cond_96

    invoke-virtual {p0}, Lflb;->j()V

    goto/16 :goto_10c

    :cond_96
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    iget v8, p0, Lflb;->p:I

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v8

    if-ltz v8, :cond_a5

    invoke-virtual {p0, v0, v8, p1}, Lflb;->g(IILandroid/view/MotionEvent;)V

    :cond_a5
    iget-object v9, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-nez v9, :cond_ad

    invoke-virtual {p0}, Lflb;->j()V

    goto :goto_10c

    :cond_ad
    if-eq v0, v6, :cond_104

    if-eq v0, v4, :cond_e0

    if-eq v0, v3, :cond_d8

    if-ne v0, v2, :cond_10c

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iget v2, p0, Lflb;->p:I

    if-ne v1, v2, :cond_10c

    if-eqz v0, :cond_c4

    move v6, v7

    :cond_c4
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iput v1, p0, Lflb;->p:I

    iget v1, p0, Lflb;->s:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {p0, v1, v2, p1}, Lflb;->t(IFF)V

    goto :goto_10c

    :cond_d8
    iget-object p1, p0, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_104

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    goto :goto_104

    :cond_e0
    if-ltz v8, :cond_10c

    iget v0, p0, Lflb;->s:I

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {p0, v0, v1, p1}, Lflb;->t(IFF)V

    invoke-virtual {p0, v9}, Lflb;->q(Landroidx/recyclerview/widget/i;)V

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lflb;->w:Lwkb;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_10c

    :cond_104
    :goto_104
    invoke-virtual {p0}, Lflb;->j()V

    invoke-virtual {p0, v1, v7}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    iput v5, p0, Lflb;->p:I

    :cond_10c
    :goto_10c
    :pswitch_10c
    return-void

    nop

    :pswitch_data_10e
    .packed-switch 0x0
        :pswitch_10c
        :pswitch_7f
        :pswitch_f
        :pswitch_e
        :pswitch_e
        :pswitch_e
    .end packed-switch
.end method
