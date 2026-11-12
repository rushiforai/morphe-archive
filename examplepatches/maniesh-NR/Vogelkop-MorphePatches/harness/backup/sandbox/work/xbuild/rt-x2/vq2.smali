.class public final synthetic Lvq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxq2;


# direct methods
.method public synthetic constructor <init>(Lxq2;B)V
    .registers 3

    iput-byte p2, p0, Lvq2;->a:B

    iput-object p1, p0, Lvq2;->b:Lxq2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    iget-byte p1, p0, Lvq2;->a:B

    iget-object p0, p0, Lvq2;->b:Lxq2;

    packed-switch p1, :pswitch_data_d0

    iget-object p1, p0, Lxq2;->u:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbr2;

    new-instance v0, Loc2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Loc2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lbr2;->f:Ljvg;

    new-instance p1, Lbs2;

    invoke-direct {p1}, Lbs2;-><init>()V

    new-instance v1, Lt02;

    const/16 v2, 0xe

    invoke-direct {v1, v0, v2}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lpb;

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lpb;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v1, Lgjm;

    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Latl;

    invoke-virtual {v1, p1, p0, v0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void

    :pswitch_36
    iget-object p0, p0, Lxq2;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbr2;

    iget-object p1, p0, Lbr2;->c:Lot2;

    iget-object p0, p0, Lbr2;->h:Lcom/opera/android/autofill/CreditCard;

    if-nez p0, :cond_45

    const/4 p0, 0x0

    :cond_45
    move-object v5, p0

    iget-object p0, p1, Lot2;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p1, Lot2;->e:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/autofill/AutofillManager;

    iget-object v0, p1, Lot2;->g:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lgw;

    iget-object v0, p1, Lot2;->h:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lorm;

    iget-object v0, p1, Lot2;->f:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwh2;

    new-instance v6, Lva2;

    const/16 v2, 0x9

    invoke-direct {v6, p1, v2}, Lva2;-><init>(Ljava/lang/Object;B)V

    if-eqz v0, :cond_78

    :goto_76
    move-object v2, v0

    goto :goto_7e

    :cond_78
    new-instance v0, Lwh2;

    invoke-direct {v0, p0, v3}, Lwh2;-><init>(Lhjf;Lcom/opera/android/autofill/AutofillManager;)V

    goto :goto_76

    :goto_7e
    new-instance v0, Lfs2;

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lfs2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, p0, v0}, Llj2;->b(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void

    :pswitch_88
    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->g:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxq2;->G0(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_9a
    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->d:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxq2;->G0(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_ac
    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->c:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxq2;->G0(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_be
    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->f:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxq2;->G0(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_data_d0
    .packed-switch 0x0
        :pswitch_be
        :pswitch_ac
        :pswitch_9a
        :pswitch_88
        :pswitch_36
    .end packed-switch
.end method
