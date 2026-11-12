.class public final Lcnh;
.super Lonh;
.source "SourceFile"


# instance fields
.field public final b:Lpt1;

.field public final c:Lgnh;

.field public final d:Lkol;

.field public e:Lzmh;


# direct methods
.method public constructor <init>(Likc;Lpt1;Lgnh;Likc;Lyqa;)V
    .registers 13

    iget-object v0, p2, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lcnh;->b:Lpt1;

    iput-object p3, p0, Lcnh;->c:Lgnh;

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object p3

    invoke-static {p1, p3}, La26;->w(Likc;Lkze;)Ltsd;

    move-result-object v3

    new-instance v1, Lkol;

    iget-object p1, p2, Lpt1;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v6, Lrmg;

    const/16 p3, 0xe

    invoke-direct {v6, p0, p3}, Lrmg;-><init>(Ljava/lang/Object;B)V

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v1 .. v6}, Lkol;-><init>(Landroid/content/Context;Lpde;Likc;Lyqa;Lkotlin/jvm/functions/Function1;)V

    new-instance p3, Lanh;

    const/4 p4, 0x0

    invoke-direct {p3, v1, p4}, Lanh;-><init>(Lkol;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p5

    if-eqz p5, :cond_38

    invoke-static {p5, p1, p3}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_38
    iput-object v1, p0, Lcnh;->d:Lkol;

    new-instance p1, Lbnh;

    invoke-direct {p1, p0, p4}, Lbnh;-><init>(Lcnh;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p2, Lpt1;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p2, Lbnh;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lbnh;-><init>(Lcnh;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final U()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final V()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lcnh;->e:Lzmh;

    if-eqz p0, :cond_7

    iget-object p0, p0, Lzmh;->a:Lenh;

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    :goto_8
    invoke-static {p0}, Lj95;->i(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final X(Lzmh;)V
    .registers 6

    iput-object p1, p0, Lcnh;->e:Lzmh;

    new-instance v0, Lfol;

    iget-object p1, p1, Lzmh;->a:Lenh;

    iget-object v1, p1, Lenh;->b:Ljava/lang/String;

    sget-object v2, Lp6l;->a:Lp6l;

    iget v3, p1, Lenh;->c:I

    invoke-direct {v0, v3, v2, v1}, Lfol;-><init>(ILp6l;Ljava/lang/String;)V

    iget-object v1, p0, Lcnh;->d:Lkol;

    invoke-virtual {v1, v0}, Lkol;->j(Lfol;)V

    iget-object v0, p1, Lenh;->b:Ljava/lang/String;

    iget-object v1, p1, Lenh;->a:Ljava/lang/String;

    iget-object p1, p1, Lenh;->b:Ljava/lang/String;

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lcnh;->b:Lpt1;

    if-eqz v0, :cond_38

    iget-object v0, p0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p1}, Lz5i;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    const p1, 0x7f14017c

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_38
    iget-object v0, p0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_44

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_59

    :cond_44
    invoke-static {p1}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_59

    iget-object v1, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1410aa

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_59
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->H(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
