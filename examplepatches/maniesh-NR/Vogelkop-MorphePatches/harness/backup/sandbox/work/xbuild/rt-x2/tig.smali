.class public final synthetic Ltig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    iput-byte p5, p0, Ltig;->a:B

    iput-object p1, p0, Ltig;->b:Ljava/lang/Object;

    iput-object p2, p0, Ltig;->c:Ljava/lang/Object;

    iput-object p3, p0, Ltig;->d:Ljava/lang/Object;

    iput-object p4, p0, Ltig;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 15

    iget-byte p1, p0, Ltig;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Ltig;->e:Ljava/lang/Object;

    iget-object v3, p0, Ltig;->d:Ljava/lang/Object;

    iget-object v4, p0, Ltig;->c:Ljava/lang/Object;

    iget-object p0, p0, Ltig;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_b4

    move-object v7, p0

    check-cast v7, Lzdm;

    check-cast v4, Lafc;

    check-cast v3, Lcom/usercentrics/sdk/ui/components/UCTextView;

    check-cast v2, Lcom/usercentrics/sdk/ui/components/UCTextView;

    iput-boolean v1, v7, Lzdm;->y:Z

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v7}, Lzdm;->b()Lsdm;

    move-result-object p0

    iget-object p0, p0, Lsdm;->a:Ljava/lang/String;

    invoke-virtual {v7}, Lzdm;->b()Lsdm;

    move-result-object p1

    iget-object p1, p1, Lsdm;->g:Ljava/lang/Boolean;

    new-instance v5, Llrk;

    const/4 v11, 0x0

    const/4 v12, 0x7

    const/4 v6, 0x1

    const-class v8, Lzdm;

    const-string v9, "onHtmlLinkClick"

    const-string v10, "onHtmlLinkClick(Lcom/usercentrics/sdk/models/settings/PredefinedUIHtmlLinkType;)V"

    invoke-direct/range {v5 .. v12}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, p0, p1, v5}, Lcom/usercentrics/sdk/ui/components/UCTextView;->s(Ljava/lang/String;Ljava/lang/Boolean;Lkotlin/jvm/functions/Function1;)V

    invoke-static {v7, v2}, Lxvg;->t(Lzdm;Lcom/usercentrics/sdk/ui/components/UCTextView;)V

    return-void

    :pswitch_3e
    check-cast p0, Lcom/usercentrics/sdk/ui/components/UCImageView;

    check-cast v4, Lufm;

    check-cast v3, Loqg;

    check-cast v2, Lzdm;

    new-instance p1, Lh0c;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1, v4}, Lh0c;-><init>(Landroid/content/Context;Lufm;)V

    new-instance v1, Lucm;

    invoke-direct {v1, v2, v0}, Lucm;-><init>(Lzdm;B)V

    iput-object v1, p1, Lh0c;->d:Lkotlin/jvm/functions/Function1;

    iget-object v0, v3, Loqg;->a:Ljava/util/List;

    iget-object v1, v3, Loqg;->b:Lnqg;

    iget-object v1, v1, Lnqg;->a:Ljava/lang/String;

    invoke-virtual {p1, p0, v0, v1}, Lh0c;->b(Landroid/view/View;Ljava/util/List;Ljava/lang/String;)V

    return-void

    :pswitch_60
    check-cast p0, Lnig;

    check-cast v4, Lgig;

    check-cast v3, Leyl;

    check-cast v2, Lsig;

    const/16 p1, 0x1d

    invoke-interface {v4, p1}, Lgig;->C(I)Z

    move-result p1

    if-eqz p1, :cond_b3

    invoke-interface {v4}, Lgig;->L()Lnyl;

    move-result-object p1

    invoke-virtual {p1}, Lnyl;->a()Lmyl;

    move-result-object p1

    new-instance v5, Lkyl;

    iget v6, v2, Lsig;->b:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v6

    invoke-direct {v5, v3, v6}, Lkyl;-><init>(Leyl;Ljava/util/List;)V

    invoke-virtual {p1, v5}, Lmyl;->h(Lkyl;)Lmyl;

    move-result-object p1

    iget-object v3, v2, Lsig;->a:Lezl;

    iget-object v3, v3, Lezl;->b:Leyl;

    iget v3, v3, Leyl;->c:I

    invoke-virtual {p1, v3, v0}, Lmyl;->l(IZ)Lmyl;

    move-result-object p1

    invoke-virtual {p1}, Lmyl;->b()Lnyl;

    move-result-object p1

    invoke-interface {v4, p1}, Lgig;->m(Lnyl;)V

    iget-object p1, v2, Lsig;->c:Ljava/lang/String;

    iget-byte v0, p0, Lnig;->c:B

    packed-switch v0, :pswitch_data_bc

    goto :goto_ac

    :pswitch_a4
    iget-object v0, p0, Lnig;->d:Luig;

    iget-object v0, v0, Luig;->l:Lqig;

    iget-object v0, v0, Lqig;->b:[Ljava/lang/String;

    aput-object p1, v0, v1

    :goto_ac
    iget-object p0, p0, Lnig;->b:Luig;

    iget-object p0, p0, Luig;->q:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_b3
    return-void

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_60
        :pswitch_3e
    .end packed-switch

    :pswitch_data_bc
    .packed-switch 0x0
        :pswitch_a4
    .end packed-switch
.end method
