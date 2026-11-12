.class public final synthetic Lzu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leua;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/content/Context;B)V
    .registers 4

    iput-byte p3, p0, Lzu5;->a:B

    iput-object p1, p0, Lzu5;->c:Ljava/lang/Object;

    iput-object p2, p0, Lzu5;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 10
    iput-byte p3, p0, Lzu5;->a:B

    iput-object p1, p0, Lzu5;->b:Ljava/lang/Object;

    iput-object p2, p0, Lzu5;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 15

    iget-byte v0, p0, Lzu5;->a:B

    const/4 v1, 0x0

    const-string v2, "local"

    sget-object v3, Lwb0;->b:Lwb0;

    const/4 v4, 0x1

    sget-object v5, Lvb0;->b:Lvb0;

    const/4 v6, 0x0

    iget-object v7, p0, Lzu5;->c:Ljava/lang/Object;

    iget-object p0, p0, Lzu5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_140

    check-cast p0, Lxq3;

    check-cast v7, Lven;

    iput-object v5, p0, Lxq3;->b:Ljava/lang/Object;

    iget-object p0, v7, Lven;->e:Lnu3;

    invoke-virtual {p0}, Lnu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyug;

    sget-object v0, Lven;->j:Lltg;

    const/4 v1, 0x4

    const/16 v2, 0x11

    invoke-static {p0, v2, v0, v1}, Lyug;->c(Lyug;ILltg;I)V

    return-void

    :pswitch_29
    check-cast p0, Lt5d;

    check-cast v7, Lgom;

    if-eqz p0, :cond_32

    invoke-static {p0, v7}, Lmom;->b(Lt5d;Lgom;)V

    :cond_32
    return-void

    :pswitch_33
    check-cast p0, Lydn;

    check-cast v7, Lb2l;

    invoke-virtual {p0, v6}, Lydn;->C(Z)V

    move-object p0, v7

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->isLoading()Z

    move-result p0

    if-nez p0, :cond_4a

    check-cast v7, Ld7l;

    invoke-virtual {v7}, Ld7l;->b()V

    :cond_4a
    return-void

    :pswitch_4b
    check-cast p0, Lqq8;

    move-object v12, v7

    check-cast v12, Lcom/opera/android/autofill/Address;

    iget-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Lx5f;

    invoke-virtual {v9, v5}, Lx5f;->w0(Lvb0;)V

    iget-object v0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    iget-wide v1, p0, Lqq8;->a:J

    new-instance v13, Lyh2;

    invoke-direct {v13, v1, v2, v4}, Lyh2;-><init>(JB)V

    new-instance v8, Lnr2;

    new-instance v10, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v10}, Lcom/opera/android/autofill/AutofillManager;-><init>()V

    new-instance v11, Lgw;

    invoke-direct {v11, v0}, Lgw;-><init>(Lhjf;)V

    invoke-direct/range {v8 .. v13}, Lnr2;-><init>(Lx5f;Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;Lyh2;)V

    const/16 p0, 0x1003

    invoke-static {v8, p0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_80
    check-cast p0, Lrii;

    check-cast v7, Lpr;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {p0, v7, v0}, Lrii;->o(Lpr;Lhjm;)V

    return-void

    :pswitch_8a
    check-cast v7, Ln4i;

    check-cast p0, Landroid/content/Context;

    iget-object v0, v7, Ln4i;->b:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_94
    check-cast v7, Lo4i;

    check-cast p0, Landroid/content/Context;

    iget-object v0, v7, Lo4i;->d:Ln4i;

    iget-object v0, v0, Ln4i;->b:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_a0
    check-cast p0, Lorm;

    check-cast v7, Lgjm;

    sget-object v0, Lhl0;->c:Lhl0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->i0(Lhl0;)V

    new-instance p0, Lswe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v7, p0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_b4
    check-cast p0, Lorm;

    check-cast v7, Lyqd;

    sget-object v0, Lhl0;->b:Lhl0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->i0(Lhl0;)V

    invoke-virtual {v7}, Lyqd;->run()V

    return-void

    :pswitch_c3
    check-cast v7, Lxq3;

    check-cast p0, Landroid/content/Context;

    iput-object v3, v7, Lxq3;->c:Ljava/lang/Object;

    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_e0

    new-instance v0, Lggf;

    new-instance v3, La98;

    const-string v4, "free_upsell_in_app"

    invoke-direct {v3, v2, v4}, La98;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lr88;->a:Lr88;

    invoke-direct {v0, p0, v1, v3, v2}, Lggf;-><init>(Lcom/opera/android/BrowserActivity;Lt88;La98;Ls88;)V

    invoke-virtual {v0}, Lggf;->execute()V

    :cond_e0
    return-void

    :pswitch_e1
    check-cast v7, Lim6;

    check-cast p0, Landroid/content/Context;

    iput-object v3, v7, Lim6;->d:Ljava/lang/Object;

    iget-object v0, v7, Lim6;->b:Ljava/lang/Object;

    check-cast v0, Ln98;

    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_11f

    new-instance v3, Lggf;

    new-instance v5, La98;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_104

    if-ne v6, v4, :cond_100

    const-string v6, "country_change_paid_in_app"

    goto :goto_106

    :cond_100
    invoke-static {}, Lh9o;->p()V

    goto :goto_11f

    :cond_104
    const-string v6, "country_change_free_in_app"

    :goto_106
    invoke-direct {v5, v2, v6}, La98;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_117

    if-ne v0, v4, :cond_113

    move-object v0, v1

    goto :goto_119

    :cond_113
    invoke-static {}, Lh9o;->p()V

    goto :goto_11f

    :cond_117
    sget-object v0, Ln88;->a:Ln88;

    :goto_119
    invoke-direct {v3, p0, v1, v5, v0}, Lggf;-><init>(Lcom/opera/android/BrowserActivity;Lt88;La98;Ls88;)V

    invoke-virtual {v3}, Lggf;->execute()V

    :cond_11f
    :goto_11f
    return-void

    :pswitch_120
    check-cast p0, Landroid/content/Context;

    check-cast v7, Lgjm;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    sget-object v0, Lp90;->c:Lp90;

    invoke-virtual {p0, v0}, Lx5f;->H(Lp90;)V

    new-instance p0, Lqk;

    invoke-direct {p0}, Lqk;-><init>()V

    invoke-virtual {v7, p0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_140
    .packed-switch 0x0
        :pswitch_120
        :pswitch_e1
        :pswitch_c3
        :pswitch_b4
        :pswitch_a0
        :pswitch_94
        :pswitch_8a
        :pswitch_80
        :pswitch_4b
        :pswitch_33
        :pswitch_29
    .end packed-switch
.end method
