.class public final Lq6l;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lq6l;->a:B

    iput-object p1, p0, Lq6l;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 10

    iget-byte v0, p0, Lq6l;->a:B

    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_16e

    return-void

    :sswitch_8
    check-cast p0, Lcdn;

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v0, :cond_5a

    invoke-virtual {p0}, Lcdn;->R()Lydn;

    move-result-object v0

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    if-eqz p1, :cond_21

    iget-object p1, v0, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    goto :goto_27

    :cond_21
    iget-object p1, v0, Lydn;->d:Lvdn;

    invoke-virtual {p1}, Lvdn;->a()Z

    move-result p1

    :goto_27
    if-eqz p1, :cond_53

    iget p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->k:I

    const/16 v0, -0x6f

    if-ne p1, v0, :cond_53

    iget-object p1, p0, Lcdn;->f:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_53

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Ljf0;->e(I)V

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    :cond_53
    iget p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->k:I

    iput p1, p0, Lcdn;->j:I

    invoke-virtual {p0}, Lcdn;->S()V

    :cond_5a
    return-void

    :sswitch_5b
    check-cast p0, Lm8l;

    iget-object v0, p0, Lm8l;->d:Lx5f;

    iget-object v1, p0, Lm8l;->e:Lx5f;

    iget-boolean v2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    const/high16 v3, 0x1000000

    const/4 v4, 0x0

    if-nez v2, :cond_9d

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-nez p0, :cond_162

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->p:Z

    if-eqz p0, :cond_162

    iget p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/2addr p0, v3

    if-nez p0, :cond_162

    iget-object p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    iget v2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {v2}, Lwqm;->B(I)Llqm;

    move-result-object v2

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p0, v2, v3, v4}, Lx5f;->h(Ljava/lang/String;Llqm;Ljava/lang/String;Z)V

    iget-object p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    iget-boolean p2, v0, Lx5f;->h:Z

    if-eqz p2, :cond_162

    invoke-virtual {v0, p0, p1, v4}, Lx5f;->g(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_162

    :cond_9d
    iget v2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->d(I)Z

    move-result v2

    if-eqz v2, :cond_162

    iget-boolean v2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->w:Z

    if-nez v2, :cond_162

    iget-object v2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_162

    iget-boolean v5, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    const/4 v6, 0x1

    if-eqz v5, :cond_d2

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c8

    move p1, v4

    goto :goto_ce

    :cond_c8
    const-string p1, "/amp/"

    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    :goto_ce
    if-eqz p1, :cond_162

    move p1, v6

    goto :goto_d3

    :cond_d2
    move p1, v4

    :goto_d3
    iget p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/2addr v3, p2

    if-nez v3, :cond_e7

    invoke-static {p2}, Lwqm;->B(I)Llqm;

    move-result-object p2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p2, v3, v6}, Lx5f;->h(Ljava/lang/String;Llqm;Ljava/lang/String;Z)V

    iget-boolean p2, v0, Lx5f;->h:Z

    if-eqz p2, :cond_e7

    invoke-virtual {v0, v2, v3, v6}, Lx5f;->g(Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_e7
    iget-object p2, p0, Lm8l;->a:Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    const-string v2, "compression"

    invoke-virtual {p2, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    iget-object p0, p0, Lm8l;->a:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    if-eqz p0, :cond_115

    invoke-virtual {p0, v6}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_115

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p0

    if-eqz p0, :cond_115

    move p0, v6

    goto :goto_116

    :cond_115
    move p0, v4

    :goto_116
    iget-boolean v2, v0, Lx5f;->h:Z

    if-eqz v2, :cond_146

    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v5, Lck0;

    invoke-direct {v5, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v2, v5, Lck0;->j:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzl0;

    if-eqz p2, :cond_134

    iget-object p2, v2, Lzl0;->a:Lyl0;

    invoke-virtual {p2, v4, v6, v6}, Ljf0;->o(III)V

    :cond_134
    if-eqz p0, :cond_13b

    iget-object p0, v2, Lzl0;->a:Lyl0;

    invoke-virtual {p0, v6, v6, v6}, Ljf0;->o(III)V

    :cond_13b
    if-eqz p1, :cond_143

    iget-object p0, v2, Lzl0;->a:Lyl0;

    const/4 p1, 0x2

    invoke-virtual {p0, p1, v6, v6}, Ljf0;->o(III)V

    :cond_143
    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_146
    iget-object p0, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    new-instance p2, Lck0;

    invoke-direct {p2, p0, p1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object p0, p2, Lck0;->j:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzl0;

    iget-object p0, p0, Lzl0;->a:Lyl0;

    const/4 p2, 0x3

    invoke-virtual {p0, p2, v6, v6}, Ljf0;->o(III)V

    invoke-virtual {v1, p1}, Lx5f;->U0(Lx56;)V

    :cond_162
    :goto_162
    return-void

    :sswitch_163
    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p2, :cond_16c

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_16c
    return-void

    nop

    :sswitch_data_16e
    .sparse-switch
        0x0 -> :sswitch_163
        0x3 -> :sswitch_5b
        0x5 -> :sswitch_8
    .end sparse-switch
.end method

.method public final G(Lb2l;)V
    .registers 3

    iget-byte v0, p0, Lq6l;->a:B

    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_26

    return-void

    :sswitch_8
    check-cast p0, Lcdn;

    const/4 p1, 0x0

    iput p1, p0, Lcdn;->j:I

    iget-object p1, p0, Lcdn;->o:Lddn;

    if-eqz p1, :cond_14

    invoke-interface {p1}, Lddn;->cancel()V

    :cond_14
    iget-object p1, p0, Lcdn;->n:Lssi;

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    iput p1, p0, Lcdn;->l:I

    invoke-virtual {p0}, Lcdn;->S()V

    return-void

    :sswitch_20
    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :sswitch_data_26
    .sparse-switch
        0x0 -> :sswitch_20
        0x5 -> :sswitch_8
    .end sparse-switch
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-byte p1, p0, Lq6l;->a:B

    packed-switch p1, :pswitch_data_1a

    return-void

    :pswitch_6
    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    check-cast p0, Lcdn;

    const/4 p1, 0x0

    iput p1, p0, Lcdn;->j:I

    iget-object p1, p0, Lcdn;->n:Lssi;

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    iput p1, p0, Lcdn;->l:I

    invoke-virtual {p0}, Lcdn;->S()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x5
        :pswitch_6
    .end packed-switch
.end method

.method public final R(Ld7l;)V
    .registers 2

    iget-byte p1, p0, Lq6l;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    check-cast p0, Le8l;

    invoke-virtual {p0}, Le8l;->c()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final T(Lb2l;Lcom/opera/android/browser/TabInfo;)V
    .registers 4

    iget-byte v0, p0, Lq6l;->a:B

    packed-switch v0, :pswitch_data_1c

    return-void

    :pswitch_6
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    iget p2, p2, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq p1, p2, :cond_1b

    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    check-cast p0, Lm8l;

    invoke-virtual {p0}, Lm8l;->b()V

    :cond_1b
    return-void

    :pswitch_data_1c
    .packed-switch 0x3
        :pswitch_6
    .end packed-switch
.end method

.method public final j(Lb2l;)V
    .registers 3

    iget-byte v0, p0, Lq6l;->a:B

    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    :pswitch_7
    return-void

    :pswitch_8
    check-cast p0, Lcdn;

    invoke-virtual {p0}, Lcdn;->S()V

    return-void

    :pswitch_e
    check-cast p1, Ld7l;

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_28

    check-cast p0, Lj8l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lj8l;->a(II)V

    :cond_28
    return-void

    :pswitch_29
    check-cast p0, Le8l;

    invoke-virtual {p0}, Le8l;->c()V

    return-void

    :pswitch_2f
    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_29
        :pswitch_e
        :pswitch_7
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final q(Ld7l;)V
    .registers 2

    iget-byte p1, p0, Lq6l;->a:B

    packed-switch p1, :pswitch_data_14

    return-void

    :pswitch_6
    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    check-cast p0, Lt8l;

    iget-object p1, p0, Lt8l;->c:Lpde;

    invoke-virtual {p0}, Lt8l;->a()Lq8l;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_data_14
    .packed-switch 0x4
        :pswitch_6
    .end packed-switch
.end method

.method public final u(Lb2l;)V
    .registers 2

    iget-byte p1, p0, Lq6l;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    check-cast p0, Le8l;

    invoke-virtual {p0}, Le8l;->c()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final v(Lb2l;)V
    .registers 6

    iget-byte v0, p0, Lq6l;->a:B

    iget-object p0, p0, Lq6l;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_40

    return-void

    :sswitch_8
    check-cast p0, Lcdn;

    iget-object p1, p0, Lcdn;->n:Lssi;

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    iput p1, p0, Lcdn;->l:I

    invoke-virtual {p0}, Lcdn;->S()V

    return-void

    :sswitch_16
    check-cast p0, Lj8l;

    iget-object p0, p0, Lj8l;->a:Lc8l;

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc8l;->c(Lp6l;)Lmcj;

    move-result-object p1

    iget-object v1, p1, Lmcj;->b:Ljava/lang/Object;

    check-cast v1, Lo7l;

    new-instance v2, Ld7k;

    const/16 v3, 0x15

    invoke-direct {v2, p0, p1, v3}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v0, v2}, Lo7l;->k(ILd7k;)V

    return-void

    :sswitch_3a
    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :sswitch_data_40
    .sparse-switch
        0x0 -> :sswitch_3a
        0x2 -> :sswitch_16
        0x5 -> :sswitch_8
    .end sparse-switch
.end method
