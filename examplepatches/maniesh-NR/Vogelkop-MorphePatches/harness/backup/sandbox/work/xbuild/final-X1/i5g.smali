.class public final Li5g;
.super Lm5g;
.source "SourceFile"


# instance fields
.field public final b:Lqfb;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lqfb;B)V
    .registers 10

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p3, :pswitch_data_ae

    const p3, 0x7f0d0222

    invoke-static {p1, p3, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p3, 0x7f0a006b

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    if-eqz v2, :cond_6a

    const p3, 0x7f0a0231

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v3, :cond_6a

    const p3, 0x7f0a056f

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_6a

    const p3, 0x7f0a06b5

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_6a

    const p3, 0x7f0a06c5

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_6a

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Li5g;->b:Lqfb;

    new-instance p1, Lh5g;

    invoke-direct {p1, p0, v1}, Lh5g;-><init>(Li5g;B)V

    invoke-virtual {v2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lh5g;

    invoke-direct {p1, p0, v0}, Lh5g;-><init>(Li5g;B)V

    invoke-virtual {v3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Lhz0;

    const/4 p1, 0x5

    invoke-direct {p0, p1}, Lhz0;-><init>(B)V

    invoke-static {v4}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_69

    invoke-static {p1, v4, p0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_69
    return-void

    :cond_6a
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :pswitch_7d
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    const v2, 0x7f0d03e8

    invoke-virtual {p3, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Llwk;->a(Landroid/view/View;)Llwk;

    move-result-object p1

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Li5g;->b:Lqfb;

    new-instance p2, Ll5g;

    invoke-direct {p2, p0, v1}, Ll5g;-><init>(Li5g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b(Landroid/view/View$OnClickListener;)V

    new-instance p2, Ll5g;

    invoke-direct {p2, p0, v0}, Ll5g;-><init>(Li5g;B)V

    iget-object p0, p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p0, p0, Lei;->f:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_7d
    .end packed-switch
.end method
