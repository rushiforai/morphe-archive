.class public final Lf7b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final a:Lb7f;

.field public final synthetic b:Lg7b;


# direct methods
.method public constructor <init>(Lg7b;Lb7f;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf7b;->b:Lg7b;

    iput-object p2, p0, Lf7b;->a:Lb7f;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ldtl;

    iget-object p0, p0, Lf7b;->b:Lg7b;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v0, p0, Lg7b;->p:Lf7b;

    iget-object v0, v0, Lf7b;->a:Lb7f;

    iget-object v0, v0, Lb7f;->b:Ljava/lang/Object;

    check-cast v0, Ldtl;

    iget v1, v0, Ldtl;->a:I

    iget-boolean v2, v0, Ldtl;->g:Z

    if-eqz v2, :cond_1b

    iget v0, v0, Ldtl;->c:I

    goto :goto_1d

    :cond_1b
    iget v0, v0, Ldtl;->d:I

    :goto_1d
    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v1, v2, :cond_26

    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-ne v0, v2, :cond_26

    return-void

    :cond_26
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Lf7b;->a:Lb7f;

    invoke-virtual {p1, p0}, Lb7f;->b(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Lf7b;->a:Lb7f;

    invoke-virtual {p1, p0}, Lb7f;->a(Lorg/chromium/base/Callback;)V

    return-void
.end method
