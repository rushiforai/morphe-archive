.class public abstract Lb23;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lb23;->a:B

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnz0;-><init>(ZZ)V

    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 2

    const p0, 0x7f08079b

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public d(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 2

    const p0, 0x7f08079c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public e()I
    .registers 1

    const p0, 0x7f07019e

    return p0
.end method

.method public f(Landroid/content/Context;)Landroid/view/View;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public h()Ljava/lang/Integer;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f1404a0

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f0804f0

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public k(Landroid/content/Context;)I
    .registers 2

    const p0, 0x7f0802f5

    return p0
.end method

.method public l(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    const p0, 0x7f0403aa

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public m(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    const p0, 0x7f0403ab

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public n()Landroid/widget/ImageView$ScaleType;
    .registers 1

    sget-object p0, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    return-object p0
.end method

.method public o()Ljava/lang/Integer;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreateDialog(Laz0;)V
    .registers 4

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb23;->i(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_d

    invoke-virtual {p1, v0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    :cond_d
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb23;->g(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1b

    iget-object v1, p1, Laz0;->a:Lwy0;

    iput-object v0, v1, Lwy0;->f:Ljava/lang/CharSequence;

    :cond_1b
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb23;->f(Landroid/content/Context;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_28

    invoke-virtual {p1, p0}, Laz0;->setView(Landroid/view/View;)Laz0;

    :cond_28
    return-void
.end method

.method public final onDialogViewsInflated(Lbz0;)V
    .registers 8

    iget-byte v0, p0, Lb23;->a:B

    packed-switch v0, :pswitch_data_6a

    invoke-super {p0, p1}, Lnz0;->onDialogViewsInflated(Lbz0;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Lnz0;->onDialogViewsInflated(Lbz0;)V

    invoke-virtual {p0}, Lb23;->o()Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x7f0a00dc

    if-eqz v0, :cond_4f

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const v2, 0x7f0a00dd

    invoke-virtual {p1, v2}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {p1, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_4f

    if-eqz v3, :cond_4f

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    const/4 v5, -0x2

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4f
    new-instance v0, Le73;

    const/16 v2, 0xd

    invoke-direct {v0, p1, p0, v2}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_68

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_65

    invoke-static {p1, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_65
    invoke-virtual {v0, p0}, Le73;->a(Landroid/view/View;)V

    :cond_68
    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public onShowDialog(Lbz0;)V
    .registers 5

    iget-byte v0, p0, Lb23;->a:B

    packed-switch v0, :pswitch_data_52

    invoke-virtual {p0, p1}, Lb23;->p(Lbz0;)V

    return-void

    :pswitch_9
    invoke-virtual {p0, p1}, Lb23;->p(Lbz0;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb23;->d(Landroid/content/Context;)Ljava/lang/Integer;

    new-instance v0, La23;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, La23;-><init>(Lb23;Lbz0;B)V

    const v1, 0x7f0a00d9

    invoke-virtual {p1, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2e

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_2b

    invoke-static {v2, v1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_2b
    invoke-virtual {v0, v1}, La23;->a(Landroid/view/View;)V

    :cond_2e
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb23;->b(Landroid/content/Context;)Ljava/lang/Integer;

    new-instance v0, La23;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, La23;-><init>(Lb23;Lbz0;B)V

    const p0, 0x7f0a00da

    invoke-virtual {p1, p0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_50

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_4d

    invoke-static {p1, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_4d
    invoke-virtual {v0, p0}, La23;->a(Landroid/view/View;)V

    :cond_50
    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final p(Lbz0;)V
    .registers 6

    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    const v0, 0x7f0a00d6

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/DialogTitle;

    const/4 v1, 0x1

    const/4 v2, 0x4

    if-eqz v0, :cond_16

    invoke-virtual {v0, v2}, Landroid/view/View;->setTextAlignment(I)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    :cond_16
    invoke-virtual {p0}, Lb23;->h()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const v3, 0x102000b

    invoke-virtual {p1, v3}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_33

    invoke-virtual {v3, v0}, Landroid/view/View;->setTextAlignment(I)V

    if-ne v0, v2, :cond_33

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setGravity(I)V

    :cond_33
    iget-byte p0, p0, Lb23;->a:B

    packed-switch p0, :pswitch_data_70

    const/4 p0, 0x0

    goto :goto_41

    :pswitch_3a
    const p0, 0x7f070069

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    :goto_41
    if-eqz p0, :cond_6e

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    const v0, 0x7f0a00da

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_6e

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v2, :cond_6e

    move-object v2, v1

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    iput p0, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6e
    return-void

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
