.class public final synthetic Letl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lltl;


# direct methods
.method public synthetic constructor <init>(Lltl;B)V
    .registers 3

    iput-byte p2, p0, Letl;->a:B

    iput-object p1, p0, Letl;->b:Lltl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Letl;->a:B

    iget-object p0, p0, Letl;->b:Lltl;

    packed-switch v0, :pswitch_data_4c

    iget-object p1, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v0

    invoke-static {v0, p1}, Lj14;->p0(Litd;Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->e()V

    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->a:Lqe;

    invoke-virtual {p0}, Lqe;->j()Litd;

    iget-object p0, p0, Lqe;->t:Lne;

    iget-object p0, p0, Lne;->g:Lme;

    if-eqz p0, :cond_2f

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    goto :goto_30

    :cond_2f
    const/4 p0, 0x0

    :goto_30
    invoke-static {p0, p1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_34
    invoke-virtual {p0}, Lltl;->E0()V

    return-void

    :pswitch_38
    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0408f8

    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_38
        :pswitch_34
    .end packed-switch
.end method
