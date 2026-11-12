.class public final Llhf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfck;
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final b:Lcxh;

.field public c:Lc1f;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcxh;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llhf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Llhf;->b:Lcxh;

    invoke-static {p1}, Lz4o;->q0(Landroid/view/View;)V

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p2

    if-eqz p2, :cond_16

    invoke-virtual {p0, p1}, Llhf;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_16
    new-instance p2, Llzb;

    const/16 v0, 0x1c

    invoke-direct {p2, p0, v0}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_24

    return-void

    :cond_24
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget-object p0, p0, Llhf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    return p0
.end method

.method public final b()I
    .registers 2

    iget-object v0, p0, Llhf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Llhf;->b:Lcxh;

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Llhf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Llhf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {p1}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object p1

    iput-object p1, p0, Llhf;->c:Lc1f;

    if-eqz p1, :cond_d

    invoke-virtual {p1, p0}, Lc1f;->d(Lfck;)V

    :cond_d
    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Llhf;->c:Lc1f;

    if-eqz p1, :cond_7

    invoke-virtual {p1, p0}, Lc1f;->g(Lfck;)V

    :cond_7
    return-void
.end method
