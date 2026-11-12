.class public final synthetic Ldv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Ldv2;->a:B

    iput-object p1, p0, Ldv2;->b:Ljava/lang/Object;

    iput-object p2, p0, Ldv2;->c:Ljava/lang/Object;

    iput-object p3, p0, Ldv2;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 12

    iget-byte v0, p0, Ldv2;->a:B

    const/4 v1, 0x0

    const/16 v2, 0xa

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object v6, p0, Ldv2;->d:Ljava/lang/Object;

    iget-object v7, p0, Ldv2;->c:Ljava/lang/Object;

    iget-object p0, p0, Ldv2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_23e

    check-cast p0, Llro;

    check-cast v7, Landroid/view/View;

    check-cast v6, Lxbf;

    iget-object p1, p0, Llro;->s:Lqb7;

    if-eqz p1, :cond_1e

    invoke-virtual {p1}, Lqb7;->onAdClicked()V

    :cond_1e
    invoke-virtual {v6, v7}, Lxbf;->a(Landroid/view/View;)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Llro;->s0(I)V

    return-void

    :pswitch_26
    check-cast p0, Lnqi;

    check-cast v7, Landroid/widget/LinearLayout;

    check-cast v6, Le7o;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, v6, Le7o;->a:Lr7o;

    iget v0, v0, Lr7o;->b:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnqi;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3d
    check-cast p0, Lrcn;

    check-cast v7, Llcn;

    check-cast v6, Lwzg;

    iget-object v0, v7, Llcn;->b:Lrcn;

    iget-object v0, v0, Llz3;->c:Li7f;

    invoke-virtual {v0, v7}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, v7, Llcn;->a:Lrn9;

    sget-object v1, Lkf0;->c:Lkf0;

    invoke-virtual {v0, v1}, Lrn9;->J(Lkf0;)V

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {p0, v0}, Llz3;->b(Lhjm;)Z

    iget-object p0, v6, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View$OnClickListener;

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    return-void

    :pswitch_5e
    check-cast p0, Lddm;

    check-cast v7, Lcdm;

    check-cast v6, Lcom/usercentrics/sdk/ui/components/UCImageView;

    iget-object p0, p0, Lddm;->d:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    iget-object p0, v7, Lcdm;->r:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/usercentrics/sdk/ui/components/UCImageView;

    invoke-virtual {p0, v4}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, v7, Lcdm;->t:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance p0, Lcbl;

    const/16 p1, 0x18

    invoke-direct {p0, v7, p1}, Lcbl;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v0, 0xdac

    invoke-virtual {v6, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_8c
    check-cast p0, Lsdh;

    check-cast v7, Landroid/content/Context;

    check-cast v6, Lhq8;

    invoke-virtual {p0, v7, v6}, Lsdh;->I(Landroid/content/Context;Lhq8;)V

    return-void

    :pswitch_96
    check-cast p0, Lg0h;

    check-cast v7, Llag;

    check-cast v6, Lkag;

    iget-object v0, p0, Lg0h;->c:Lxol;

    iget-object v0, v0, Lxol;->c:Ljava/lang/Object;

    check-cast v0, Li0h;

    iget-object v8, v0, Li0h;->c:Lx5f;

    sget-object v9, Len0;->g:Len0;

    invoke-virtual {v8, v9}, Lx5f;->n0(Len0;)V

    iget-object v8, v0, Li0h;->b:Lp0h;

    iget-object v8, v8, Lp0h;->e:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eq v9, v5, :cond_111

    if-eq v9, v3, :cond_103

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    instance-of p1, p1, Lxzg;

    if-eqz p1, :cond_d2

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lxzg;

    goto :goto_d3

    :cond_d2
    move-object p1, v1

    :goto_d3
    if-eqz p1, :cond_d8

    invoke-virtual {p1}, Landroidx/fragment/app/i;->dismiss()V

    :cond_d8
    sget-object p1, Ls9g;->h:Ls9g;

    invoke-virtual {p1, v8, v4}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object p1

    if-eqz p1, :cond_f1

    invoke-virtual {p1, v7, v1}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object p1

    if-eqz p1, :cond_f1

    iget-object p0, v0, Li0h;->a:Lgjm;

    new-instance p1, Lc9g;

    invoke-direct {p1, v8}, Lc9g;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v4}, Lgjm;->e(Ln37;Z)V

    goto :goto_132

    :cond_f1
    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    new-instance p1, Lwpe;

    invoke-direct {p1, v8, v7}, Lwpe;-><init>(Ljava/lang/String;Llag;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_132

    :cond_103
    new-instance v0, Lh0h;

    new-instance v1, Lr9g;

    invoke-direct {v1, p0, v2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v8, v7, v1}, Lh0h;-><init>(Ljava/lang/String;Llag;Lr9g;)V

    invoke-virtual {v0, p1}, Lo73;->o(Landroid/view/View;)V

    goto :goto_132

    :cond_111
    iget-object v0, v0, Li0h;->b:Lp0h;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lkag;->b:Lkag;

    if-ne v6, v3, :cond_11c

    move v4, v5

    :cond_11c
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1, v8, v4}, Laoh;->l(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_132

    new-instance v0, Lh0h;

    new-instance v1, Lr9g;

    invoke-direct {v1, p0, v2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v8, v7, v1}, Lh0h;-><init>(Ljava/lang/String;Llag;Lr9g;)V

    invoke-virtual {v0, p1}, Lo73;->o(Landroid/view/View;)V

    :cond_132
    :goto_132
    return-void

    :pswitch_133
    check-cast p0, Ligi;

    check-cast v7, Lnwf;

    check-cast v6, Ljava/lang/Runnable;

    iget-object v0, p0, Ligi;->c:Ljava/lang/Object;

    check-cast v0, Lpt1;

    iget-object v1, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14b

    invoke-virtual {v7, v5}, Lnwf;->u(Z)V

    goto :goto_1b4

    :cond_14b
    iget-object v1, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_159

    invoke-virtual {v7, v4}, Lnwf;->u(Z)V

    goto :goto_1b4

    :cond_159
    iget-object v1, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_174

    iget-byte p0, v7, Lnwf;->a:B

    packed-switch p0, :pswitch_data_256

    new-instance p0, Lc7k;

    invoke-direct {p0, v7, v5}, Lc7k;-><init>(Lnwf;B)V

    goto :goto_1b4

    :pswitch_16e
    new-instance p0, Llwf;

    invoke-direct {p0, v7, v2}, Llwf;-><init>(Lnwf;B)V

    goto :goto_1b4

    :cond_174
    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1b4

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->isLoading()Z

    move-result p0

    if-eqz p0, :cond_1a2

    iget-byte p0, v7, Lnwf;->a:B

    packed-switch p0, :pswitch_data_25c

    new-instance p0, Lc7k;

    const/4 p1, 0x3

    invoke-direct {p0, v7, p1}, Lc7k;-><init>(Lnwf;B)V

    goto :goto_1b4

    :pswitch_19a
    new-instance p0, Llwf;

    const/16 p1, 0xc

    invoke-direct {p0, v7, p1}, Llwf;-><init>(Lnwf;B)V

    goto :goto_1b4

    :cond_1a2
    iget-byte p0, v7, Lnwf;->a:B

    packed-switch p0, :pswitch_data_262

    new-instance p0, Lc7k;

    invoke-direct {p0, v7, v3}, Lc7k;-><init>(Lnwf;B)V

    goto :goto_1b4

    :pswitch_1ad
    new-instance p0, Llwf;

    const/16 p1, 0xb

    invoke-direct {p0, v7, p1}, Llwf;-><init>(Lnwf;B)V

    :cond_1b4
    :goto_1b4
    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_1b8
    check-cast p0, Lb1c;

    check-cast v7, Ly83;

    check-cast v6, La1c;

    iget-object p1, v7, Ly83;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lb1c;->e:Lf1c;

    iget-object p0, p0, Lf1c;->z:Lv3m;

    iget-object p1, v6, La1c;->a:Li0c;

    iget-object p1, p1, Li0c;->a:Lszb;

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object v0, p0, Lplk;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    new-instance v1, Liyk;

    invoke-direct {v1, p0, p1, v3}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lxl;->j(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_1dc
    check-cast p0, Lxb9;

    check-cast v7, Lja2;

    check-cast v6, Lhb9;

    iget-object p1, p0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    invoke-virtual {p0, v7}, Lxb9;->e0(Lja2;)Z

    move-result v0

    if-nez v0, :cond_203

    iget-boolean v0, p1, Lcom/opera/android/flow/MyFlowMessageRoot;->j:Z

    xor-int/2addr v0, v5

    iget-object p0, p0, Lxb9;->g:Lrn9;

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    iget-wide v1, v6, Lhb9;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v0, v5}, Lcom/opera/android/flow/MyFlowMessageRoot;->a(ZZ)V

    :cond_203
    return-void

    :pswitch_204
    check-cast p0, Lwt7;

    check-cast v7, Landroid/view/View;

    check-cast v6, Ltaf;

    iget-object p1, p0, Lwt7;->b:Ldbf;

    iget-object p0, p0, Lwt7;->i:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhbf;

    if-nez p0, :cond_218

    sget-object p0, Lhbf;->a:Lhbf;

    :cond_218
    invoke-virtual {p1, v7, v6, v4, p0}, Ldbf;->v(Landroid/view/View;Ltaf;ZLhbf;)V

    return-void

    :pswitch_21c
    check-cast p0, Llqh;

    check-cast v7, Lcv2;

    check-cast v6, Landroid/widget/ImageView;

    iget-boolean p1, p0, Llqh;->a:Z

    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Llqh;->a:Z

    if-nez p1, :cond_22e

    const p1, 0x7f080624

    goto :goto_231

    :cond_22e
    const p1, 0x7f080625

    :goto_231
    invoke-virtual {v6, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-boolean p0, p0, Llqh;->a:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v7, p0}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_23e
    .packed-switch 0x0
        :pswitch_21c
        :pswitch_204
        :pswitch_1dc
        :pswitch_1b8
        :pswitch_133
        :pswitch_96
        :pswitch_8c
        :pswitch_5e
        :pswitch_3d
        :pswitch_26
    .end packed-switch

    :pswitch_data_256
    .packed-switch 0x0
        :pswitch_16e
    .end packed-switch

    :pswitch_data_25c
    .packed-switch 0x0
        :pswitch_19a
    .end packed-switch

    :pswitch_data_262
    .packed-switch 0x0
        :pswitch_1ad
    .end packed-switch
.end method
