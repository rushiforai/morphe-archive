.class public final Ljv2;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lov0;

.field public final c:Lxj;

.field public final d:Lso3;

.field public e:Lpc;


# direct methods
.method public constructor <init>(Lov0;Lxj;Lso3;Lli;)V
    .registers 6

    iget-object v0, p1, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Ljv2;->b:Lov0;

    iput-object p2, p0, Ljv2;->c:Lxj;

    iput-object p3, p0, Ljv2;->d:Lso3;

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    new-instance p2, Lu7;

    const/16 p3, 0xd

    invoke-direct {p2, p0, p3}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p3

    if-eqz p3, :cond_21

    invoke-static {p3, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_21
    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Ltj7;

    invoke-direct {p2, p4, p0}, Ltj7;-><init>(Lb6h;Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 6

    iget-object v0, p0, Ljv2;->e:Lpc;

    if-eqz v0, :cond_5c

    iget-object v1, p0, Ljv2;->d:Lso3;

    invoke-virtual {v1}, Lso3;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lva2;

    invoke-virtual {v1, v0}, Lva2;->h(Lpc;)Lxc;

    move-result-object v0

    if-eqz v0, :cond_5c

    iget-object v1, p0, Ljv2;->b:Lov0;

    iget-object v2, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v1, v1, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v3, v0, Lxc;->b:Lrxh;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v3, v4}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Ljv2;->c:Lxj;

    invoke-virtual {p0, v0}, Lxj;->b(Lxc;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, v0, Lxc;->f:Lrm5;

    instance-of v0, p0, Lwc;

    if-nez v0, :cond_4e

    sget-object v0, Luc;->m:Luc;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4e

    sget-object v0, Lvc;->m:Lvc;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4a

    const/4 p0, 0x0

    goto :goto_59

    :cond_4a
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_4e
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f0402c8

    invoke-static {v0, p0}, Lj7h;->l(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_59
    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    :cond_5c
    return-void
.end method
