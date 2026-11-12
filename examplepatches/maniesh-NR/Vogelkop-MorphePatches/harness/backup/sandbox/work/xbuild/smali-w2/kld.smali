.class public final Lkld;
.super Landroid/view/GestureDetector;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lnld;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lnld;Lnld;)V
    .registers 4

    iput-object p3, p0, Lkld;->a:Lnld;

    invoke-direct {p0, p1, p2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    return-void
.end method


# virtual methods
.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9

    iget-object v0, p0, Lkld;->a:Lnld;

    iget-object v1, v0, Lnld;->i:Lold;

    iget-object v0, v0, Lnld;->h:Lpld;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x8

    if-ne v2, v3, :cond_35

    iget-object v2, v0, Lpld;->c:Lbp;

    iget-object v2, v2, Lbp;->b:Ljava/lang/Object;

    check-cast v2, Lhld;

    iget-object v2, v2, Lhld;->t:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v5, v0, Lpld;->h:Z

    iget-object v0, v1, Lold;->a:Lbp;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lhld;

    iget-object v0, v0, Lhld;->t:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v1, Lold;->j:Lqld;

    if-eqz v0, :cond_32

    invoke-interface {v0}, Lqld;->d()V

    iput-object v4, v1, Lold;->j:Lqld;

    :cond_32
    iput-object v4, v1, Lold;->i:La0n;

    goto :goto_5f

    :cond_35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_5f

    iget-object v2, v0, Lpld;->c:Lbp;

    iget-object v2, v2, Lbp;->b:Ljava/lang/Object;

    check-cast v2, Lhld;

    iget-object v2, v2, Lhld;->t:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v5, v0, Lpld;->h:Z

    iget-object v0, v1, Lold;->a:Lbp;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lhld;

    iget-object v0, v0, Lhld;->t:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v1, Lold;->j:Lqld;

    if-eqz v0, :cond_5d

    invoke-interface {v0}, Lqld;->d()V

    iput-object v4, v1, Lold;->j:Lqld;

    :cond_5d
    iput-object v4, v1, Lold;->i:La0n;

    :cond_5f
    :goto_5f
    invoke-super {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
