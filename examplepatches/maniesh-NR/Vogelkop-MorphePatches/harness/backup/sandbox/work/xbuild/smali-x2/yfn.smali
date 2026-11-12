.class public final synthetic Lyfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcgn;


# direct methods
.method public synthetic constructor <init>(Lcgn;B)V
    .registers 3

    iput-byte p2, p0, Lyfn;->a:B

    iput-object p1, p0, Lyfn;->b:Lcgn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 11

    iget-byte p1, p0, Lyfn;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lyfn;->b:Lcgn;

    packed-switch p1, :pswitch_data_110

    iget-object p0, p0, Lcgn;->z:Lc0i;

    invoke-virtual {p0}, Lc0i;->a()V

    return-void

    :pswitch_10
    iget-object p1, p0, Lcgn;->v:Lydn;

    iget-object v0, p1, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcgn;->M:Z

    invoke-virtual {p1, v0}, Lydn;->C(Z)V

    return-void

    :pswitch_1d
    iget-object p0, p0, Lcgn;->I:Lua7;

    new-instance p1, Lodn;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lgjm;

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_2c
    iget-object p1, p0, Lcgn;->C:Lx5f;

    sget-object v0, Lkcn;->a:[Lkcn;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_4d

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-static {v0, v1}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v0

    new-instance v3, Lzbe;

    const/16 v4, 0x11

    invoke-direct {v3, v4}, Lzbe;-><init>(B)V

    const-string v4, "vpn_pro_still_active_reminder"

    invoke-virtual {v0, v4, v3}, Lhi0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    :cond_4d
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "vpn_pro.kill_switch.on"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    invoke-virtual {p0}, Lcgn;->L0()V

    return-void

    :pswitch_69
    iget-object p0, p0, Lcgn;->F:Lpfn;

    iget-object p1, p0, Lpfn;->n:Lmfn;

    iget v0, p1, Lmfn;->f:I

    add-int/2addr v0, v1

    iput v0, p1, Lmfn;->f:I

    iget-object p0, p0, Lpfn;->g:Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "vpn.vpnpro.upsell_banner_closed"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    :pswitch_85
    iget-object v3, p0, Lcgn;->F:Lpfn;

    iget-object p0, v3, Lpfn;->n:Lmfn;

    iget p1, p0, Lmfn;->e:I

    const/4 v6, 0x1

    add-int/2addr p1, v6

    iput p1, p0, Lmfn;->e:I

    iget-object p0, v3, Lpfn;->r:Lwvg;

    if-eqz p0, :cond_97

    invoke-virtual {p0}, Lwvg;->b()Z

    move-result v2

    :cond_97
    if-eqz v2, :cond_a8

    iget-object p0, v3, Lpfn;->j:Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyug;

    const/16 p1, 0xc

    const/4 v1, 0x6

    invoke-static {p0, p1, v0, v1}, Lyug;->c(Lyug;ILltg;I)V

    goto :goto_c8

    :cond_a8
    iget-object p0, v3, Lpfn;->o:Lamk;

    if-eqz p0, :cond_c8

    iget-object p1, v3, Lpfn;->h:Lz77;

    iget-object v4, v3, Lpfn;->f:Lfmk;

    iget-object v5, v3, Lpfn;->c:Lqb7;

    iget-object p0, p0, Lamk;->a:Lzsk;

    iget-object v7, p0, Lzsk;->a:Ljava/lang/String;

    new-instance p0, Ltim;

    new-instance v2, Lh8d;

    invoke-direct/range {v2 .. v7}, Lh8d;-><init>(Lg8d;Lfmk;Lqb7;ILjava/lang/String;)V

    invoke-direct {p0, v2}, Ltim;-><init>(Luim;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_c8
    :goto_c8
    return-void

    :pswitch_c9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget p1, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->b:I

    invoke-static {p0}, Lt8;->R(Landroid/content/Context;)V

    return-void

    :pswitch_d3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget p1, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->b:I

    sget p1, Leif;->a:I

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f0d02bf

    const v0, 0x7f0d0388

    const-class v1, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-static {p0, v1, p1, v0}, Lkfo;->c0(Landroid/content/Context;Ljava/lang/Class;II)V

    return-void

    :pswitch_eb
    new-array p1, v2, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x4

    const-class v3, Lmhf;

    invoke-direct {v2, v0, v3, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v1, Lzhj;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_10c
    invoke-virtual {p0}, Lcgn;->L0()V

    return-void

    :pswitch_data_110
    .packed-switch 0x0
        :pswitch_10c
        :pswitch_eb
        :pswitch_d3
        :pswitch_c9
        :pswitch_85
        :pswitch_69
        :pswitch_2c
        :pswitch_1d
        :pswitch_10
    .end packed-switch
.end method
