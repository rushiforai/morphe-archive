.class public final Lxo8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:J

.field public static final k:J

.field public static final synthetic l:I


# instance fields
.field public final a:Lxj;

.field public final b:Lso3;

.field public final c:Landroid/widget/FrameLayout;

.field public final d:Landroid/widget/RelativeLayout;

.field public final e:Landroid/widget/RelativeLayout;

.field public final f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

.field public final g:Lcom/opera/android/custom_views/StylingImageView;

.field public h:Lwo8;

.field public i:Lpc;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Lxo8;->j:J

    const/16 v1, 0x64

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lxo8;->k:J

    return-void
.end method

.method public constructor <init>(Lov0;Lxj;Lso3;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxo8;->a:Lxj;

    iput-object p3, p0, Lxo8;->b:Lso3;

    iget-object p2, p1, Lov0;->b:Landroid/view/View;

    check-cast p2, Landroid/widget/FrameLayout;

    iput-object p2, p0, Lxo8;->c:Landroid/widget/FrameLayout;

    iget-object p2, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p2, Lov0;

    iget-object p2, p2, Lov0;->b:Landroid/view/View;

    check-cast p2, Landroid/widget/RelativeLayout;

    iput-object p2, p0, Lxo8;->d:Landroid/widget/RelativeLayout;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lov0;

    iget-object p2, p1, Lov0;->b:Landroid/view/View;

    check-cast p2, Landroid/widget/RelativeLayout;

    iput-object p2, p0, Lxo8;->e:Landroid/widget/RelativeLayout;

    iget-object p3, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p3, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iput-object p3, p0, Lxo8;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    iput-object p1, p0, Lxo8;->g:Lcom/opera/android/custom_views/StylingImageView;

    sget-object v0, Lwo8;->a:Lwo8;

    iput-object v0, p0, Lxo8;->h:Lwo8;

    new-instance v0, Lpc5;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_41

    invoke-static {v1, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_41
    const/16 p1, 0x8

    invoke-virtual {p3, p1}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/animation/LayoutTransition;->setAnimateParentHierarchy(Z)V

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    sget-object p1, Lwo8;->b:Lwo8;

    invoke-virtual {p0, p1}, Lxo8;->c(Lwo8;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    sget-object v0, Lwo8;->b:Lwo8;

    invoke-virtual {p0, v0}, Lxo8;->c(Lwo8;)V

    iget-object v0, p0, Lxo8;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-wide v1, Lxo8;->j:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const v1, 0x3f666666    # 0.9f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Leg;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Leg;-><init>(Lxo8;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Lxo8;->i:Lpc;

    if-eqz v0, :cond_63

    iget-object v1, p0, Lxo8;->b:Lso3;

    invoke-virtual {v1}, Lso3;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lva2;

    invoke-virtual {v1, v0}, Lva2;->h(Lpc;)Lxc;

    move-result-object v0

    if-eqz v0, :cond_63

    iget-object v1, v0, Lxc;->b:Lrxh;

    iget-object v2, p0, Lxo8;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v1, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lxc;->c:Lpxh;

    iget-object v2, p0, Lxo8;->g:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v1, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lxo8;->a:Lxj;

    invoke-virtual {p0, v0}, Lxj;->b(Lxc;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v2, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, v0, Lxc;->f:Lrm5;

    instance-of v0, p0, Lwc;

    if-nez v0, :cond_55

    sget-object v0, Luc;->m:Luc;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    sget-object v0, Lvc;->m:Lvc;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_51

    const/4 p0, 0x0

    goto :goto_60

    :cond_51
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_55
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f0402c8

    invoke-static {v0, p0}, Lj7h;->l(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_60
    invoke-virtual {v2, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    :cond_63
    return-void
.end method

.method public final c(Lwo8;)V
    .registers 3

    iget-object v0, p0, Lxo8;->h:Lwo8;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput-object p1, p0, Lxo8;->h:Lwo8;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object p0, p0, Lxo8;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz p1, :cond_1c

    const/4 v0, 0x1

    if-ne p1, v0, :cond_18

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_18
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1c
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
