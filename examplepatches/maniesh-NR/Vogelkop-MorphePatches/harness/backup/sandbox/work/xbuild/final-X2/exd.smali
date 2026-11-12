.class public final Lexd;
.super Llz3;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;IJLhxj;)V
    .registers 7

    .line 149
    const/4 v0, 0x0

    iput-byte v0, p0, Lexd;->f:B

    invoke-direct/range {p0 .. p5}, Llz3;-><init>(Landroid/view/ViewGroup;IJLhxj;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Lhxj;Lftd;Ljava/util/List;)V
    .registers 12

    const/4 v0, 0x1

    iput-byte v0, p0, Lexd;->f:B

    const v3, 0x7f0d028d

    const-wide/16 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Llz3;-><init>(Landroid/view/ViewGroup;IJLhxj;)V

    iget-object p0, v1, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    new-instance p1, Lsma;

    const/16 p2, 0x1d

    invoke-direct {p1, v1, p2}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v1, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    iget-object p0, v1, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    iget-object p2, p3, Lftd;->a:Lixh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Ly7h;->l(Landroid/content/Context;)F

    move-result p2

    iget p3, p3, Lftd;->b:I

    iput p2, p0, Lcom/opera/android/bubbleview/BubbleView;->m:F

    iput p3, p0, Lcom/opera/android/bubbleview/BubbleView;->A:I

    invoke-virtual {p0}, Lcom/opera/android/bubbleview/BubbleView;->b()V

    iget-object p0, v1, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    const p2, 0x7f0a026e

    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    check-cast p4, Ljava/lang/Iterable;

    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_46
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_94

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lgtd;

    invoke-static {p0}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object p4

    const v0, 0x7f0d028e

    invoke-virtual {p4, v0, p0, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p4

    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const/4 v0, 0x0

    if-eqz p4, :cond_8e

    check-cast p4, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, p3, Lgtd;->a:Lrxh;

    invoke-virtual {p4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p3, Lgtd;->b:Llxh;

    if-eqz v2, :cond_7f

    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_80

    :cond_7f
    move-object v2, v0

    :goto_80
    invoke-virtual {p4, v2, v0}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Ljf7;

    const/16 v2, 0x15

    invoke-direct {v0, p3, v1, v2}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_46

    :cond_8e
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0

    :cond_94
    return-void
.end method

.method public synthetic constructor <init>(Landroid/view/ViewGroup;Ll11;Ljava/util/List;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lexd;->f:B

    .line 150
    sget-object v0, Lftd;->c:Lftd;

    .line 151
    invoke-direct {p0, p1, p2, v0, p3}, Lexd;-><init>(Landroid/view/ViewGroup;Lhxj;Lftd;Ljava/util/List;)V

    return-void
.end method

.method public static g(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 5

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    if-nez p2, :cond_7

    return-object p1

    :cond_7
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    new-instance v1, Ldxd;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0, p2}, Ldxd;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    const/16 p1, 0x11

    const/4 p2, 0x0

    invoke-virtual {v0, v1, p2, p0, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object v0
.end method


# virtual methods
.method public final c(Z)V
    .registers 3

    iget-byte v0, p0, Lexd;->f:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Llz3;->c(Z)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Llz3;->c(Z)V

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Llz3;->b(Lhjm;)Z

    return-void

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
