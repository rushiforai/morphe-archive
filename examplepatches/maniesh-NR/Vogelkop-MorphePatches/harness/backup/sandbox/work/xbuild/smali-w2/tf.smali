.class public final Ltf;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# static fields
.field public static final synthetic i:I


# instance fields
.field public final b:Lcq3;

.field public final c:Lr2;

.field public final d:Lxj;

.field public final e:Lso3;

.field public f:Lpc;

.field public g:Lxj7;

.field public h:Lsf;


# direct methods
.method public constructor <init>(Lcq3;Lkze;Lr2;Lxj;Lso3;Lli;)V
    .registers 8

    iget-object v0, p1, Lcq3;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Ltf;->b:Lcq3;

    iput-object p3, p0, Ltf;->c:Lr2;

    iput-object p4, p0, Ltf;->d:Lxj;

    iput-object p5, p0, Ltf;->e:Lso3;

    sget-object p1, Luj7;->a:Luj7;

    iput-object p1, p0, Ltf;->g:Lxj7;

    sget-object p1, Lsf;->a:Lsf;

    iput-object p1, p0, Ltf;->h:Lsf;

    new-instance p1, Lu7;

    const/4 p3, 0x2

    invoke-direct {p1, p0, p3}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p3

    if-eqz p3, :cond_26

    invoke-static {p3, v0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_26
    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p3, Ltj7;

    invoke-direct {p3, p6, p0}, Ltj7;-><init>(Lb6h;Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p1}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object p1

    new-instance p3, Lpb;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 5

    iget-object v0, p0, Ltf;->f:Lpc;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Ltf;->g:Lxj7;

    sget-object v2, Luj7;->a:Luj7;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15

    sget-object v1, Lsf;->a:Lsf;

    invoke-virtual {p0, v1}, Ltf;->V(Lsf;)V

    goto :goto_4a

    :cond_15
    sget-object v2, Lvj7;->a:Lvj7;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    sget-object v1, Lsf;->a:Lsf;

    invoke-virtual {p0, v1}, Ltf;->V(Lsf;)V

    goto :goto_4a

    :cond_23
    instance-of v2, v1, Lwj7;

    if-eqz v2, :cond_a7

    iget-object v2, p0, Ltf;->c:Lr2;

    invoke-virtual {v2, v0}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_45

    check-cast v1, Lwj7;

    iget-object v1, v1, Lwj7;->c:Ltf;

    invoke-static {v1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    sget-object v1, Lsf;->c:Lsf;

    goto :goto_47

    :cond_42
    sget-object v1, Lsf;->b:Lsf;

    goto :goto_47

    :cond_45
    sget-object v1, Lsf;->a:Lsf;

    :goto_47
    invoke-virtual {p0, v1}, Ltf;->V(Lsf;)V

    :goto_4a
    iget-object v1, p0, Ltf;->e:Lso3;

    invoke-virtual {v1}, Lso3;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lva2;

    invoke-virtual {v1, v0}, Lva2;->h(Lpc;)Lxc;

    move-result-object v0

    iget-object v1, p0, Ltf;->b:Lcq3;

    iget-object v1, v1, Lcq3;->b:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v2, v0, Lxc;->c:Lpxh;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Ltf;->d:Lxj;

    invoke-virtual {v2, v0}, Lxj;->b(Lxc;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, v0, Lxc;->f:Lrm5;

    instance-of v2, v0, Lwc;

    if-nez v2, :cond_8e

    sget-object v2, Luc;->m:Luc;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8e

    sget-object p0, Lvc;->m:Lvc;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8a

    const/4 p0, 0x0

    goto :goto_a3

    :cond_8a
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_8e
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Ltf;->h:Lsf;

    sget-object v2, Lsf;->c:Lsf;

    if-ne p0, v2, :cond_9c

    const p0, 0x7f0402d7

    goto :goto_9f

    :cond_9c
    const p0, 0x7f0402c8

    :goto_9f
    invoke-static {p0, v0}, Lj7h;->l(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_a3
    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void

    :cond_a7
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final V(Lsf;)V
    .registers 3

    iget-object v0, p0, Ltf;->h:Lsf;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput-object p1, p0, Ltf;->h:Lsf;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object p0, p0, Ltf;->b:Lcq3;

    if-eqz p1, :cond_3f

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2c

    const/4 v0, 0x2

    if-ne p1, v0, :cond_28

    iget-object p0, p0, Lcq3;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0801ed

    invoke-static {v0, p1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_28
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_2c
    iget-object p0, p0, Lcq3;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0801ee

    invoke-static {v0, p1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_3f
    iget-object p0, p0, Lcq3;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
