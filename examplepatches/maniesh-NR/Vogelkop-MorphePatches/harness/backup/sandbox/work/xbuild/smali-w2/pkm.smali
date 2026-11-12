.class public final synthetic Lpkm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lpkm;->a:B

    iput-object p1, p0, Lpkm;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Lpkm;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lpkm;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_158

    check-cast p0, Lads_mobile_sdk/rr1;

    invoke-virtual {p0, v3}, Lads_mobile_sdk/rr1;->a(Z)V

    return-void

    :pswitch_10
    check-cast p0, Lads_mobile_sdk/mt0;

    sget-object p1, Lads_mobile_sdk/ev;->b:Lads_mobile_sdk/ev;

    invoke-virtual {p0, p1}, Lads_mobile_sdk/mt0;->a(Lads_mobile_sdk/ev;)V

    return-void

    :pswitch_18
    check-cast p0, Loep;

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v0

    iget-boolean v0, v0, Lz8p;->j:Z

    if-eqz v0, :cond_25

    invoke-virtual {p0, p1}, Loep;->onClick(Landroid/view/View;)V

    :cond_25
    return-void

    :pswitch_26
    check-cast p0, Lu2p;

    invoke-virtual {p0, p1}, Laoo;->j(Landroid/view/View;)V

    return-void

    :pswitch_2c
    check-cast p0, Lads_mobile_sdk/jz2;

    iget-object p0, p0, Lads_mobile_sdk/jz2;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void

    :pswitch_34
    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_3a
    check-cast p0, Lfxn;

    iget-object p1, p0, Ljxn;->f:Lvtn;

    if-eqz p1, :cond_4b

    iget-object p1, p0, Lyzi;->b:Ltzi;

    invoke-virtual {p1}, Ltzi;->c()V

    invoke-virtual {p0}, Lfxn;->k0()V

    invoke-virtual {p0}, Lfxn;->h0()V

    :cond_4b
    return-void

    :pswitch_4c
    check-cast p0, Lexn;

    invoke-virtual {p0}, Lexn;->k0()V

    invoke-virtual {p0}, Lyzi;->h0()V

    return-void

    :pswitch_55
    check-cast p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    sget p1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->e0:I

    iget-object p0, p0, Lrz4;->N:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p0, :cond_60

    invoke-virtual {p0, v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->x(Z)V

    :cond_60
    return-void

    :pswitch_61
    check-cast p0, Lukn;

    iget-object p0, p0, Lukn;->F:Lorm;

    const/16 v0, 0xb

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->S(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lrih;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_84

    sget-object p1, Llqm;->d:Llqm;

    invoke-static {p0, p1, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-virtual {p0, v3}, Lvx3;->a(Z)V

    iput v1, p0, Lvx3;->b:I

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    :cond_84
    return-void

    :pswitch_85
    check-cast p0, Lyug;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p1

    invoke-virtual {p1}, Ljtg;->d()Z

    move-result p1

    if-eqz p1, :cond_a2

    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Lyug;->a(I)V

    :cond_a2
    return-void

    :pswitch_a3
    check-cast p0, Lbg7;

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    iget-object p1, p0, Lbg7;->b:Ljava/lang/Object;

    check-cast p1, Lydn;

    invoke-virtual {p1, v2}, Lydn;->C(Z)V

    invoke-virtual {p0}, Lbg7;->d()V

    iget-object p0, p0, Lbg7;->d:Ljava/lang/Object;

    check-cast p0, Lx5f;

    sget-object p1, Lwb0;->f:Lwb0;

    const/4 v0, 0x0

    const/4 v4, 0x7

    invoke-virtual {p0, v4, p1, v0}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    const-string p0, "https://support-vpn-pro.opera.com/"

    sget-object p1, Llqm;->v:Llqm;

    invoke-static {p0, p1, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    iput v1, p0, Lvx3;->b:I

    invoke-static {p0, v3, p0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void

    :pswitch_cd
    check-cast p0, Lidn;

    iget-object p1, p0, Lidn;->l:Lcom/opera/api/Callback;

    check-cast p1, Lhdn;

    iget-object p0, p0, Lidn;->j:Lfdn;

    invoke-virtual {p1, p0}, Lhdn;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_d9
    check-cast p0, Lgjm;

    new-instance p1, Lvfn;

    invoke-direct {p1}, Lvfn;-><init>()V

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_e4
    check-cast p0, Lg3b;

    iget-object p1, p0, Lg3b;->t:Ljava/lang/Object;

    check-cast p1, Ltah;

    iget-object p0, p0, Lg3b;->s:Ljava/lang/Object;

    check-cast p0, Lfdn;

    invoke-virtual {p1, p0}, Ltah;->M(Lfdn;)V

    return-void

    :pswitch_f2
    check-cast p0, Ly6n;

    iget-object p1, p0, Ly6n;->c:Laln;

    if-eqz p1, :cond_fd

    iget-object p0, p0, Ly6n;->b:Ltjn;

    invoke-interface {p0, p1}, Ltjn;->n(Laln;)V

    :cond_fd
    return-void

    :pswitch_fe
    check-cast p0, Lx6n;

    iget-object p0, p0, Lx6n;->c:Ltjn;

    invoke-interface {p0}, Ltjn;->c()V

    return-void

    :pswitch_106
    check-cast p0, Lw6n;

    iget-object p1, p0, Lw6n;->c:Ltjn;

    iget p0, p0, Lw6n;->d:I

    invoke-interface {p1, p0}, Ltjn;->h(I)V

    return-void

    :pswitch_110
    check-cast p0, Lu6n;

    iget-object p1, p0, Lu6n;->f:Laln;

    if-eqz p1, :cond_11b

    iget-object p0, p0, Lu6n;->d:Ltjn;

    invoke-interface {p0, p1}, Ltjn;->n(Laln;)V

    :cond_11b
    return-void

    :pswitch_11c
    check-cast p0, Lt6n;

    iget-object p1, p0, Lt6n;->c:Ltjn;

    iget-object v0, p0, Lt6n;->b:Lfbl;

    iget-object v1, v0, Lfbl;->e:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v1

    invoke-interface {p1, v1}, Ltjn;->j(Z)V

    iget-object p1, v0, Lfbl;->e:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result p1

    invoke-virtual {p0, p1}, Lt6n;->U(Z)V

    return-void

    :pswitch_139
    check-cast p0, Lr6n;

    iget-object p0, p0, Lr6n;->c:Ltjn;

    invoke-interface {p0}, Ltjn;->retry()V

    return-void

    :pswitch_141
    check-cast p0, Lnmm;

    invoke-virtual {p0}, Lnmm;->G0()V

    return-void

    :pswitch_147
    check-cast p0, Lr2f;

    iget-boolean p1, p0, Lr2f;->d:Z

    if-nez p1, :cond_156

    iput-boolean v3, p0, Lr2f;->d:Z

    iget-object p0, p0, Lr2f;->e:Ljava/lang/Object;

    check-cast p0, Lr6l;

    invoke-interface {p0}, Lr6l;->l()V

    :cond_156
    return-void

    nop

    :pswitch_data_158
    .packed-switch 0x0
        :pswitch_147
        :pswitch_141
        :pswitch_139
        :pswitch_11c
        :pswitch_110
        :pswitch_106
        :pswitch_fe
        :pswitch_f2
        :pswitch_e4
        :pswitch_d9
        :pswitch_cd
        :pswitch_a3
        :pswitch_85
        :pswitch_61
        :pswitch_55
        :pswitch_4c
        :pswitch_3a
        :pswitch_34
        :pswitch_2c
        :pswitch_26
        :pswitch_18
        :pswitch_10
    .end packed-switch
.end method
