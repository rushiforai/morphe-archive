.class Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;


# direct methods
.method public constructor <init>(Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView$c;->a:Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView$c;->a:Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->c(Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView$c;->a:Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->g(Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView$c;->a:Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-static {v0}, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->h(Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/animation/Animator;->isStarted()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView$c;->a:Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {v1}, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->h(Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->reverse()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {v1}, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->h(Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-static {v0}, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->h(Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;)Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->reverse()V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView$c;->a:Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialMultiAutoCompleteTextView;->Q0:Landroid/view/View$OnFocusChangeListener;

    .line 59
    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    invoke-interface {p0, p1, p2}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_3
    return-void
.end method
