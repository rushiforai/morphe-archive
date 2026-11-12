.class public final Lqjo;
.super Ln1;
.source "SourceFile"


# instance fields
.field public c:Landroid/view/ViewGroup;

.field public d:Loji;

.field public e:Ljvg;

.field public final synthetic f:B

.field public final g:Lk8;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/ad/interstitial/AdActivity;Lk8;B)V
    .registers 4

    iput-byte p3, p0, Lqjo;->f:B

    const/4 p3, 0x1

    invoke-direct {p0, p1, p3}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lqjo;->g:Lk8;

    return-void
.end method


# virtual methods
.method public final H0(ILuuj;)V
    .registers 5

    iget-object v0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/ad/interstitial/AdActivity;

    const v1, 0x7f0d0041

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(I)V

    const v1, 0x7f0a0077

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    :try_start_13
    invoke-virtual {v1, p1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lqjo;->c:Landroid/view/ViewGroup;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1e} :catch_1e

    :catch_1e
    sget-object p1, Llto;->a:[I

    iget-object v1, p2, Luuj;->b:Ljava/lang/Object;

    check-cast v1, Lahb;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget p1, p1, v1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_3d

    const/4 v1, 0x2

    if-eq p1, v1, :cond_39

    const/4 v1, 0x3

    if-ne p1, v1, :cond_41

    const p1, 0x7f0a0ad6

    :goto_36
    iput p1, p2, Luuj;->a:I

    goto :goto_41

    :cond_39
    const p1, 0x7f0a0907

    goto :goto_36

    :cond_3d
    const p1, 0x7f0a0a82

    goto :goto_36

    :cond_41
    :goto_41
    new-instance p1, Ldgo;

    const/4 v1, 0x6

    invoke-direct {p1, p0, v1}, Ldgo;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0, p1}, Luuj;->d(Lcom/opera/ad/interstitial/AdActivity;Lg94;)Loji;

    move-result-object p1

    iput-object p1, p0, Lqjo;->d:Loji;

    return-void
.end method

.method public final I0(Lp12;)V
    .registers 5

    iget-object v0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/ad/interstitial/AdActivity;

    const v1, 0x7f0a0074

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lqjo;->e:Ljvg;

    if-nez v1, :cond_1a

    new-instance v1, Ljvg;

    const/16 v2, 0xf

    invoke-direct {v1, v2}, Ljvg;-><init>(B)V

    iput-object v1, p0, Lqjo;->e:Ljvg;

    :cond_1a
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    new-instance v1, Lobn;

    const/16 v2, 0x11

    invoke-direct {v1, p0, p1, v2}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final R()V
    .registers 7

    iget-byte v0, p0, Lqjo;->f:B

    iget-object v1, p0, Lqjo;->g:Lk8;

    packed-switch v0, :pswitch_data_ba

    iget-object v0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/ad/interstitial/AdActivity;

    check-cast v1, Lkoo;

    iget-object v2, v1, Lkoo;->o:Lnxo;

    invoke-virtual {v2}, Lnxo;->d()Z

    move-result v3

    if-eqz v3, :cond_5b

    iget-object v3, v1, Lk8;->a:Ljava/lang/Object;

    check-cast v3, Luuj;

    iget-object v4, v3, Luuj;->b:Ljava/lang/Object;

    check-cast v4, Lahb;

    sget-object v5, Lahb;->c:Lahb;

    if-ne v4, v5, :cond_25

    sget-object v4, Lahb;->b:Lahb;

    iput-object v4, v3, Luuj;->b:Ljava/lang/Object;

    :cond_25
    const v4, 0x7f0d0047

    invoke-virtual {p0, v4, v3}, Lqjo;->H0(ILuuj;)V

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v3, v2, Lnxo;->q:Ljava/lang/ref/WeakReference;

    iget-object p0, p0, Lqjo;->c:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/LinearLayout;

    if-eqz p0, :cond_5e

    new-instance v3, Lp5g;

    invoke-direct {v3, v0, v2}, Lp5g;-><init>(Lcom/opera/ad/interstitial/AdActivity;Lnxo;)V

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v3, p0}, Lnxo;->b(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V

    const p0, 0x7f0a01bf

    invoke-virtual {v0, p0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/ad/view/VolumeMutableButton;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/ad/view/VolumeMutableButton;->c:Z

    iput-object v1, p0, Lcom/opera/ad/view/VolumeMutableButton;->d:Lecn;

    iget-object v0, p0, Lcom/opera/ad/view/VolumeMutableButton;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_5e

    :cond_5b
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_5e
    :goto_5e
    return-void

    :pswitch_5f
    check-cast v1, Llro;

    iget v0, v1, Llro;->p:I

    iget-object v2, v1, Lk8;->a:Ljava/lang/Object;

    check-cast v2, Luuj;

    invoke-virtual {p0, v0, v2}, Lqjo;->H0(ILuuj;)V

    iget-object v0, v1, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lp12;

    if-eqz v0, :cond_73

    invoke-virtual {p0, v0}, Lqjo;->I0(Lp12;)V

    :cond_73
    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {v1, p0}, Llro;->t0(Landroid/app/Activity;)V

    return-void

    :pswitch_7b
    check-cast v1, Ljoo;

    iget-object v0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/ad/interstitial/AdActivity;

    iget-object v2, v1, Ljoo;->o:Llxo;

    iget-object v2, v2, Llxo;->p:Ldcl;

    iget-object v2, v2, Ldcl;->a:Ljava/lang/Object;

    check-cast v2, Ldzo;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v3, v2, Ldzo;->b:Ljava/lang/ref/WeakReference;

    iget-object v2, v1, Lk8;->a:Ljava/lang/Object;

    check-cast v2, Luuj;

    const v3, 0x7f0d0040

    invoke-virtual {p0, v3, v2}, Lqjo;->H0(ILuuj;)V

    iget-object v2, v1, Lk8;->b:Ljava/lang/Object;

    check-cast v2, Lp12;

    if-eqz v2, :cond_a3

    invoke-virtual {p0, v2}, Lqjo;->I0(Lp12;)V

    :cond_a3
    iget-object p0, p0, Lqjo;->c:Landroid/view/ViewGroup;

    if-eqz p0, :cond_b8

    :try_start_a7
    invoke-virtual {v1, v0}, Ljoo;->s0(Lcom/opera/ad/interstitial/AdActivity;)Ly9p;

    move-result-object v1

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_b4
    .catch Lzno; {:try_start_a7 .. :try_end_b4} :catch_b5

    goto :goto_b8

    :catch_b5
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_b8
    :goto_b8
    return-void

    nop

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_7b
        :pswitch_5f
    .end packed-switch
.end method

.method public final X()V
    .registers 5

    iget-byte v0, p0, Lqjo;->f:B

    const/4 v1, 0x0

    iget-object p0, p0, Lqjo;->g:Lk8;

    packed-switch v0, :pswitch_data_7c

    check-cast p0, Lkoo;

    iget-object p0, p0, Lkoo;->o:Lnxo;

    iget-object v0, p0, Lnxo;->c:Lrwo;

    iput-object v1, p0, Lnxo;->k:Ljava/lang/Object;

    iget-object v2, p0, Lnxo;->d:Lujo;

    const/4 v3, 0x2

    iput-short v3, v2, Lujo;->c:S

    iget-object v3, v2, Lujo;->a:Lqi8;

    invoke-virtual {v3}, Lqi8;->release()V

    iput-object v1, v2, Lujo;->f:Landroid/view/TextureView;

    iput-object v1, v2, Lujo;->e:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lnxo;->i:Lxup;

    if-eqz v2, :cond_39

    iget-object v2, v2, Lxup;->d:Ln9h;

    iget-object v2, v2, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v2, p0, Lnxo;->i:Lxup;

    iget-object v2, v2, Lxup;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v2, p0, Lnxo;->i:Lxup;

    invoke-virtual {v2}, Lxup;->b()V

    iput-object v1, p0, Lnxo;->i:Lxup;

    :cond_39
    iget-object v2, p0, Lnxo;->h:Lha6;

    if-eqz v2, :cond_53

    iget-object v2, v2, Lha6;->e:Ljava/lang/Object;

    check-cast v2, Ln9h;

    iget-object v2, v2, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v2, p0, Lnxo;->h:Lha6;

    iget-object v2, v2, Lha6;->f:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iput-object v1, p0, Lnxo;->h:Lha6;

    :cond_53
    iget-object v0, p0, Lnxo;->j:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_5c

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iput-object v1, p0, Lnxo;->j:Landroid/widget/FrameLayout;

    :cond_5c
    return-void

    :pswitch_5d
    check-cast p0, Llro;

    iget-object p0, p0, Llro;->v:Lnoo;

    if-eqz p0, :cond_66

    invoke-virtual {p0}, Lsc;->a()V

    :cond_66
    return-void

    :pswitch_67
    check-cast p0, Ljoo;

    iget-object p0, p0, Ljoo;->o:Llxo;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Llxo;->unregister()V

    iget-object v0, p0, Llxo;->r:Ly9p;

    if-eqz v0, :cond_7a

    invoke-virtual {v0}, Ly9p;->o()V

    iput-object v1, p0, Llxo;->r:Ly9p;

    :cond_7a
    return-void

    nop

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_67
        :pswitch_5d
    .end packed-switch
.end method

.method public final c0()V
    .registers 4

    iget-byte v0, p0, Lqjo;->f:B

    iget-object v1, p0, Lqjo;->g:Lk8;

    packed-switch v0, :pswitch_data_62

    iget-object p0, p0, Lqjo;->d:Loji;

    if-eqz p0, :cond_18

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    iget-object p0, p0, Lbx7;->b:Ljava/lang/Object;

    check-cast p0, Lttn;

    sget-object v0, Lgxo;->d:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_18
    check-cast v1, Lkoo;

    iget-object p0, v1, Lkoo;->o:Lnxo;

    invoke-virtual {p0}, Lnxo;->f()V

    return-void

    :pswitch_20
    iget-object p0, p0, Lqjo;->d:Loji;

    if-eqz p0, :cond_31

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    iget-object p0, p0, Lbx7;->b:Ljava/lang/Object;

    check-cast p0, Lttn;

    sget-object v0, Lgxo;->d:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_31
    return-void

    :pswitch_32
    iget-object p0, p0, Lqjo;->d:Loji;

    if-eqz p0, :cond_43

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    iget-object p0, p0, Lbx7;->b:Ljava/lang/Object;

    check-cast p0, Lttn;

    sget-object v0, Lgxo;->d:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_43
    check-cast v1, Ljoo;

    iget-object p0, v1, Ljoo;->o:Llxo;

    iget-object p0, p0, Llxo;->p:Ldcl;

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ldzo;

    iget-object v0, p0, Ldzo;->c:Lnyo;

    iget-boolean v1, p0, Ldzo;->f:Z

    if-nez v1, :cond_61

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v0}, Lnyo;->onPause()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ldzo;->f:Z

    :cond_61
    return-void

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_32
        :pswitch_20
    .end packed-switch
.end method

.method public final e0()V
    .registers 3

    iget-byte v0, p0, Lqjo;->f:B

    iget-object v1, p0, Lqjo;->g:Lk8;

    packed-switch v0, :pswitch_data_3c

    iget-object p0, p0, Lqjo;->d:Loji;

    if-eqz p0, :cond_12

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    invoke-virtual {p0}, Lbx7;->c()V

    :cond_12
    check-cast v1, Lkoo;

    iget-object p0, v1, Lkoo;->o:Lnxo;

    invoke-virtual {p0}, Lnxo;->g()V

    return-void

    :pswitch_1a
    iget-object p0, p0, Lqjo;->d:Loji;

    if-eqz p0, :cond_25

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    invoke-virtual {p0}, Lbx7;->c()V

    :cond_25
    return-void

    :pswitch_26
    iget-object p0, p0, Lqjo;->d:Loji;

    if-eqz p0, :cond_31

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    invoke-virtual {p0}, Lbx7;->c()V

    :cond_31
    check-cast v1, Ljoo;

    iget-object p0, v1, Ljoo;->o:Llxo;

    iget-object p0, p0, Llxo;->p:Ldcl;

    invoke-virtual {p0}, Ldcl;->i()V

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_26
        :pswitch_1a
    .end packed-switch
.end method
