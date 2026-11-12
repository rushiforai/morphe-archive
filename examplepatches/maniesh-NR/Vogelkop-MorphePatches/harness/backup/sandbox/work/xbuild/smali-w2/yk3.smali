.class public final Lyk3;
.super Lfmj;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f:B

.field public final g:Lnv6;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;B)V
    .registers 9

    iput-byte p4, p0, Lyk3;->f:B

    packed-switch p4, :pswitch_data_7e

    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    iput-object p3, p0, Lyk3;->g:Lnv6;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const p3, 0x7f080433

    invoke-static {p3, p2}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p4

    invoke-static {p2, p3, p4}, Lz5i;->x(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object p2

    if-eqz p2, :cond_50

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    iget p4, p0, Lfmj;->e:I

    const v0, 0x7f04067b

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v0, Luq8;

    invoke-static {p3}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v3

    invoke-direct {v0, p3, v3, v2, p2}, Luq8;-><init>(Landroid/content/Context;Lgjf;ILandroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1, v1, p4, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance p2, Lmxh;

    invoke-direct {p2, v0}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    :cond_50
    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Lrxh;

    const p2, 0x7f140373

    invoke-direct {p0, p2}, Lrxh;-><init>(I)V

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    return-void

    :pswitch_5f
    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    iput-object p3, p0, Lyk3;->g:Lnv6;

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lpc5;

    const/16 p3, 0xf

    invoke-direct {p2, p0, p3}, Lpc5;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p0

    if-eqz p0, :cond_7d

    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_7d
    return-void

    :pswitch_data_7e
    .packed-switch 0x1
        :pswitch_5f
    .end packed-switch
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 6

    iget-byte p2, p0, Lyk3;->f:B

    iget-object v0, p0, Lyk3;->g:Lnv6;

    iget-object v1, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    packed-switch p2, :pswitch_data_46

    check-cast p1, Lfqk;

    iput-object p1, p0, Lfmj;->d:Lfqk;

    iget-object p2, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iput-object p2, v1, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    iget-object p2, p2, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    new-instance v2, Lqxh;

    invoke-direct {v2, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object p2, p1, Lcom/opera/android/suggestion/Suggestion;->c:Ljava/lang/String;

    new-instance v2, Lqxh;

    invoke-direct {v2, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {p0}, Lyk3;->a0()V

    invoke-virtual {v0, p1}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    return-void

    :pswitch_2e
    check-cast p1, Lfqk;

    iput-object p1, p0, Lfmj;->d:Lfqk;

    iget-object p0, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iput-object p0, v1, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    new-instance p2, Lqxh;

    invoke-direct {p2, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object p0, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v0, p0}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    return-void

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method

.method public final a0()V
    .registers 12

    iget-object v0, p0, Lfmj;->d:Lfqk;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v0, v0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v0, :cond_c

    iget-object v0, v0, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    instance-of v2, v0, Lnt8;

    if-eqz v2, :cond_14

    move-object v1, v0

    check-cast v1, Lnt8;

    :cond_14
    if-eqz v1, :cond_bb

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/16 v1, 0x11

    const/4 v2, 0x2

    const v3, 0x7f06063b

    const/4 v4, 0x0

    iget-object v5, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    const/4 v6, 0x1

    iget p0, p0, Lfmj;->e:I

    if-eqz v0, :cond_7b

    if-ne v0, v6, :cond_77

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    sget-object v8, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v9, 0x7f040a75

    invoke-static {v9, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v9

    const v10, 0x7f040a76

    invoke-static {v10, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v10

    filled-new-array {v9, v10}, [I

    move-result-object v9

    invoke-direct {v7, v8, v9}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    new-instance v8, Ls8n;

    const v9, 0x7f0407e2

    invoke-direct {v8, v0, v9}, Ls8n;-><init>(Landroid/content/Context;I)V

    const v9, 0x7f0804c3

    invoke-static {v9, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v9, 0x7f0402b9

    invoke-static {v9, v8, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v3}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    div-int/lit8 v3, p0, 0x2

    new-instance v8, Landroid/graphics/drawable/LayerDrawable;

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v7, v2, v4

    aput-object v0, v2, v6

    invoke-direct {v8, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v8, v4, p0, p0}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v8, v6, v3, v3}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v8, v6, v1}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    goto :goto_b5

    :cond_77
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_7b
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v7, 0x7f040436

    invoke-static {v7, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    new-instance v7, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v7, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const v3, 0x7f08047c

    invoke-static {v3, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_e7

    div-int/lit8 v3, p0, 0x2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v8

    mul-int/2addr v8, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v9

    div-int/2addr v8, v9

    new-instance v9, Landroid/graphics/drawable/LayerDrawable;

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v7, v2, v4

    aput-object v0, v2, v6

    invoke-direct {v9, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v9, v4, p0, p0}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v9, v6, v8, v3}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v9, v6, v1}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    move-object v8, v9

    :goto_b5
    invoke-static {v8, p0, p0}, Lz5i;->x(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_bc

    :cond_bb
    return-void

    :cond_bc
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f04067b

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v2

    invoke-virtual {v2, v4, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v2, Luq8;

    invoke-static {v1}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v6

    invoke-direct {v2, v1, v6, v3, v0}, Luq8;-><init>(Landroid/content/Context;Lgjf;ILandroid/graphics/Bitmap;)V

    invoke-virtual {v2, v4, v4, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance p0, Lmxh;

    invoke-direct {p0, v2}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void

    :cond_e7
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lyk3;->f:B

    const/4 v0, 0x1

    iget-object v1, p0, Lfmj;->c:Lhqk;

    iget-object v2, p0, Lyk3;->g:Lnv6;

    packed-switch p1, :pswitch_data_24

    iget-object p0, p0, Lfmj;->d:Lfqk;

    if-eqz p0, :cond_16

    iget-object p0, p0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v2, p0}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    invoke-virtual {v1, p0, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_16
    return-void

    :pswitch_17
    iget-object p0, p0, Lfmj;->d:Lfqk;

    if-eqz p0, :cond_23

    iget-object p0, p0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v2, p0}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    invoke-virtual {v1, p0, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_23
    return-void

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
