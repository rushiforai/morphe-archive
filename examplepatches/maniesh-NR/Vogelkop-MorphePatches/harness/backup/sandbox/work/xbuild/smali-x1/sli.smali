.class public final synthetic Lsli;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lami;


# direct methods
.method public synthetic constructor <init>(Lami;B)V
    .registers 3

    iput-byte p2, p0, Lsli;->a:B

    iput-object p1, p0, Lsli;->b:Lami;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Lsli;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lsli;->b:Lami;

    packed-switch v0, :pswitch_data_19a

    check-cast p1, Lyli;

    iget-object v0, p0, Lami;->c:Ljava/lang/Object;

    check-cast v0, Lei;

    iget-object v1, v0, Lei;->c:Landroid/view/View;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-boolean v4, p1, Lyli;->f:Z

    iget-object v5, p1, Lyli;->c:Landroid/view/View$OnClickListener;

    iget-object v6, p1, Lyli;->e:La4h;

    iget-object v7, p1, Lyli;->b:Ltli;

    iget-object v8, p1, Lyli;->d:Landroid/view/View$OnClickListener;

    iget-object p1, p1, Lyli;->a:Ltli;

    const/4 v9, 0x0

    const/16 v10, 0x8

    if-eqz v4, :cond_27

    move v4, v9

    goto :goto_28

    :cond_27
    move v4, v10

    :goto_28
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lei;->h:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p1, :cond_56

    iget-object v4, p1, Ltli;->a:Luli;

    invoke-virtual {v1, v9}, Landroid/view/View;->setVisibility(I)V

    iget-object v11, v4, Luli;->a:Llxh;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v11, v12}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v4, v4, Luli;->b:Lrxh;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v4, v11}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Ltli;->b:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_59

    :cond_56
    invoke-virtual {v1, v10}, Landroid/view/View;->setVisibility(I)V

    :goto_59
    iget-object p1, v0, Lei;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v5, :cond_66

    invoke-virtual {p1, v9}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_69

    :cond_66
    invoke-virtual {p1, v10}, Landroid/view/View;->setVisibility(I)V

    :goto_69
    iget-object p1, v0, Lei;->i:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    sget-object v1, Lvli;->b:Lvli;

    invoke-virtual {v6, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_79

    invoke-virtual {p1, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_c0

    :cond_79
    instance-of v1, v6, Lxli;

    if-eqz v1, :cond_9d

    invoke-virtual {p1, v9}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Ldkl;

    check-cast v6, Lxli;

    iget-object v2, v6, Lxli;->b:Ljava/lang/String;

    invoke-direct {v1, v2}, Ldkl;-><init>(Ljava/lang/String;)V

    new-instance v2, Lzli;

    invoke-direct {v2, p0, v9}, Lzli;-><init>(Lami;B)V

    invoke-static {p1, v1, v2}, Lna2;->R(Landroid/widget/TextView;Lcgh;Ledf;)V

    invoke-virtual {p1, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v8, :cond_98

    move p0, v3

    goto :goto_99

    :cond_98
    move p0, v9

    :goto_99
    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    goto :goto_c0

    :cond_9d
    instance-of v1, v6, Lwli;

    if-eqz v1, :cond_f1

    invoke-virtual {p1, v9}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Lckl;

    check-cast v6, Lwli;

    iget-object v2, v6, Lwli;->b:Ljava/lang/String;

    invoke-direct {v1, v2}, Lckl;-><init>(Ljava/lang/String;)V

    new-instance v2, Lzli;

    invoke-direct {v2, p0, v3}, Lzli;-><init>(Lami;B)V

    invoke-static {p1, v1, v2}, Lna2;->R(Landroid/widget/TextView;Lcgh;Ledf;)V

    invoke-virtual {p1, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v8, :cond_bc

    move p0, v3

    goto :goto_bd

    :cond_bc
    move p0, v9

    :goto_bd
    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    :goto_c0
    iget-object p0, v0, Lei;->e:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz v7, :cond_eb

    iget-object p1, v7, Ltli;->a:Luli;

    invoke-virtual {p0, v9, v3}, Lsan;->a(IZ)V

    iget-object v0, p1, Luli;->a:Llxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p1, Luli;->b:Lrxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, v7, Ltli;->b:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_ee

    :cond_eb
    invoke-virtual {p0, v10, v3}, Lsan;->a(IZ)V

    :goto_ee
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_f4

    :cond_f1
    invoke-static {}, Lh9o;->p()V

    :goto_f4
    return-object v2

    :pswitch_f5
    check-cast p1, Lt0a;

    iget-object p0, p0, Lami;->e:Ljava/lang/Object;

    check-cast p0, Llfh;

    iget-object p0, p0, Llfh;->f:Lycc;

    invoke-virtual {p0, v1}, Lycc;->m(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_103
    check-cast p1, Lkl5;

    iget-object p1, p0, Lami;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/qr/ScanQrCodeActivity;

    iget-object v0, p0, Lami;->c:Ljava/lang/Object;

    check-cast v0, Lei;

    iget-object p0, p0, Lami;->d:Ljava/lang/Object;

    check-cast p0, Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkl5;

    iget-object v4, v4, Lkl5;->b:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-static {v4, p1}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    const/4 v5, 0x3

    if-eqz v4, :cond_13b

    if-eq v4, v3, :cond_133

    if-eq v4, v1, :cond_133

    if-eq v4, v5, :cond_133

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_198

    :cond_133
    const/high16 v4, 0x42700000    # 60.0f

    invoke-static {p1, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    :goto_139
    move v7, v4

    goto :goto_142

    :cond_13b
    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {p1, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    goto :goto_139

    :goto_142
    iget-object v4, v0, Lei;->d:Landroid/view/View;

    move-object v6, v4

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v10, 0x0

    const/16 v11, 0xa

    const/4 v8, 0x0

    move v9, v7

    invoke-static/range {v6 .. v11}, Lp37;->o0(Landroid/view/View;IIIII)V

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkl5;

    iget-object p0, p0, Lkl5;->b:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    invoke-static {p0, p1}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_176

    if-eq v4, v3, :cond_16f

    if-eq v4, v1, :cond_16f

    if-eq v4, v5, :cond_16f

    invoke-static {}, Lh9o;->p()V

    goto :goto_198

    :cond_16f
    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {p1, v2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v2

    goto :goto_17c

    :cond_176
    const/high16 v2, 0x42100000    # 36.0f

    invoke-static {p1, v2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v2

    :goto_17c
    const/high16 v3, 0x440c0000    # 560.0f

    invoke-static {p1, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    sub-int/2addr p0, p1

    div-int/2addr p0, v1

    if-ge v2, p0, :cond_188

    move v4, p0

    goto :goto_189

    :cond_188
    move v4, v2

    :goto_189
    iget-object p0, v0, Lei;->i:Landroid/view/View;

    move-object v3, p0

    check-cast v3, Landroid/widget/TextView;

    const/4 v7, 0x0

    const/16 v8, 0xa

    const/4 v5, 0x0

    move v6, v4

    invoke-static/range {v3 .. v8}, Lp37;->o0(Landroid/view/View;IIIII)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_198
    return-object v2

    nop

    :pswitch_data_19a
    .packed-switch 0x0
        :pswitch_103
        :pswitch_f5
    .end packed-switch
.end method
