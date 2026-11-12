.class public final Lj8k;
.super Lab2;
.source "SourceFile"

# interfaces
.implements Lev8;


# instance fields
.field public final d:Lor2;

.field public final e:Lfd;

.field public final f:Ltsd;


# direct methods
.method public constructor <init>(Lor2;Lpde;Lfd;Ltsd;)V
    .registers 9

    iget-object v0, p1, Lor2;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Lab2;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lj8k;->d:Lor2;

    iput-object p3, p0, Lj8k;->e:Lfd;

    iput-object p4, p0, Lj8k;->f:Ltsd;

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object v0

    new-instance v1, Lh8k;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lh8k;-><init>(Lj8k;B)V

    invoke-static {p2, v0, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p2, Lyc;

    const/4 v1, 0x5

    invoke-direct {p2, p0, v1}, Lyc;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ldnj;

    const/16 v3, 0xd

    invoke-direct {v1, p0, v3}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, v0, p2, v1}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    sget p2, Ld03;->e:I

    iget-object p2, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p2, Landroid/widget/FrameLayout;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    const v1, 0x7f0809aa

    invoke-static {v1, p3}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    invoke-static {p2, p3}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {v1, p3}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    invoke-static {p1, p3}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    new-instance p3, Lh8k;

    const/4 v1, 0x1

    invoke-direct {p3, p0, v1}, Lh8k;-><init>(Lj8k;B)V

    invoke-static {p4, v0, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Li8k;

    invoke-direct {p3, p0, v2}, Li8k;-><init>(Lj8k;B)V

    invoke-static {p2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p4

    if-eqz p4, :cond_64

    invoke-static {p4, p2, p3}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_64
    new-instance p2, Li8k;

    invoke-direct {p2, p0, v1}, Li8k;-><init>(Lj8k;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_70

    return-void

    :cond_70
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final b0(Landroid/view/View;)V
    .registers 3

    iget-object p0, p0, Lj8k;->f:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv8k;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lv8k;->d(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final c0(Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lpc;)V
    .registers 9

    iget-object p0, p0, Lj8k;->e:Lfd;

    invoke-virtual {p0, p3}, Lfd;->e(Lpc;)Ljf;

    move-result-object p0

    if-nez p0, :cond_a

    sget-object p0, Lfd;->e:Ljf;

    :cond_a
    iget-object v0, p0, Ljf;->c:Lxc;

    if-nez v0, :cond_10

    iget-object v0, p3, Lpc;->a:Lxc;

    :cond_10
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    iget v1, v0, Lxc;->a:I

    iget-object v2, v0, Lxc;->b:Lrxh;

    invoke-static {v1, p3}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    iget-object v1, v0, Lxc;->f:Lrm5;

    sget-object v3, Luc;->m:Luc;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0402c8

    const/4 v4, 0x0

    invoke-static {v3, v1, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-static {p3, v1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    goto :goto_42

    :cond_36
    sget-object v3, Lvc;->m:Lvc;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_42

    instance-of v1, v1, Lwc;

    if-eqz v1, :cond_70

    :cond_42
    :goto_42
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v2, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    invoke-virtual {p2, p3, v1}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {v2, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p2

    iget p3, v0, Lxc;->e:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p1, p2, p3}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    new-instance p2, La24;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, La24;-><init>(Ljf;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-boolean p0, p0, Ljf;->d:Z

    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_70
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final e0()V
    .registers 4

    sget-object v0, Lpc;->z:Lpc;

    iget-object v1, p0, Lj8k;->e:Lfd;

    invoke-virtual {v1, v0}, Lfd;->b(Lpc;)Z

    move-result v1

    iget-object v2, p0, Lj8k;->d:Lor2;

    if-eqz v1, :cond_18

    iget-object v1, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v1, v2, v0}, Lj8k;->c0(Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lpc;)V

    return-void

    :cond_18
    iget-object v0, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    sget-object v2, Lpc;->m:Lpc;

    invoke-virtual {p0, v0, v1, v2}, Lj8k;->c0(Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lpc;)V

    return-void
.end method
