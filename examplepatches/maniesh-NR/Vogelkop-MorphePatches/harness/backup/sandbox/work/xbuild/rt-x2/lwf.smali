.class public final Llwf;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Lnwf;


# direct methods
.method public synthetic constructor <init>(Lnwf;B)V
    .registers 3

    iput-byte p2, p0, Llwf;->b:B

    iput-object p1, p0, Llwf;->c:Lnwf;

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 13

    iget-byte v0, p0, Llwf;->b:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Llwf;->c:Lnwf;

    packed-switch v0, :pswitch_data_1dc

    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->x1()V

    return-void

    :pswitch_14
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->t()V

    return-void

    :pswitch_1a
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->s()V

    return-void

    :pswitch_20
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->r()V

    return-void

    :pswitch_26
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->q()V

    return-void

    :pswitch_2c
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->o()V

    return-void

    :pswitch_32
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->n()V

    return-void

    :pswitch_38
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->m()V

    return-void

    :pswitch_3e
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->l()V

    return-void

    :pswitch_44
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_53

    invoke-static {p0, v0}, Lhyg;->n(Ldx3;Lb2l;)V

    :cond_53
    return-void

    :pswitch_54
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->Z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lpgf;

    invoke-virtual {v5}, Lpgf;->a()Logf;

    move-result-object p0

    if-eqz p0, :cond_14c

    iget-object v0, p0, Logf;->a:Ljava/lang/String;

    iget-object v4, v5, Lpgf;->b:Lk6l;

    iget-object v4, v4, Lk6l;->o:Lb2l;

    invoke-static {v4}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v4

    if-eqz v4, :cond_14c

    iget-object v4, v4, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v4}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v7

    iget-object v6, p0, Logf;->b:Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Intent;->clone()Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Landroid/content/Intent;

    iget-boolean v4, v4, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    if-eqz v4, :cond_8b

    invoke-virtual {v7, v8}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_14c

    :cond_8b
    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_14c

    iget-object v4, v5, Lpgf;->a:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    invoke-interface {v4, v6, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v9

    add-int/2addr v9, v3

    invoke-static {v4, v6, v9}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    const/4 v4, 0x2

    if-ne v9, v4, :cond_149

    sget-object v4, Ls9g;->h:Ls9g;

    sget-object v9, Llag;->g:Llag;

    invoke-virtual {v4, v9, v6, v2}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v4

    sget-object v9, Lkag;->b:Lkag;

    if-eq v4, v9, :cond_149

    iget-object v4, v5, Lpgf;->c:Lcom/opera/android/Lazy;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvo7;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lorg/chromium/url/GURL;

    invoke-direct {v9, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v9}, Lvo7;->b(Lorg/chromium/url/GURL;)Lto7;

    move-result-object v4

    if-eqz v4, :cond_cf

    iget-object v4, v4, Lto7;->a:Lqo7;

    iget-boolean v4, v4, Lqo7;->e:Z

    goto :goto_d0

    :cond_cf
    move v4, v2

    :goto_d0
    if-nez v4, :cond_149

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_14c

    invoke-static {v7}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    iget-object p0, p0, Logf;->d:Ljava/lang/CharSequence;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v4, 0x7f14072c

    invoke-virtual {v7, v4, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const v4, 0x7f14072b

    invoke-virtual {v7, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_101

    new-instance v9, Lqxh;

    invoke-direct {v9, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object v10, v9

    goto :goto_102

    :cond_101
    move-object v10, v1

    :goto_102
    new-instance v11, La32;

    const/16 v4, 0x14

    invoke-direct {v11, v5, v7, v8, v4}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lws1;

    const/16 v9, 0xb

    invoke-direct/range {v4 .. v9}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lkqd;

    const/16 v7, 0x10

    invoke-direct {v6, v5, v7}, Lkqd;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lgkj;

    invoke-direct {v5, v2, v2}, Lnz0;-><init>(ZZ)V

    iput-object v1, v5, Lgkj;->a:Ljava/lang/String;

    iput-object v1, v5, Lgkj;->b:Ljava/lang/String;

    iput-object v1, v5, Lgkj;->c:Ljava/lang/String;

    iput-object p0, v5, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v6, v5, Lgkj;->e:Lekj;

    iput-object v1, v5, Lgkj;->f:Lfkj;

    iput-object v1, v5, Lgkj;->g:Lqp2;

    iput-object v4, v5, Lgkj;->h:Ldkj;

    iput-object v11, v5, Lgkj;->i:Ldkj;

    iput-object v1, v5, Lgkj;->j:Lql;

    const p0, 0x7f14072e

    iput p0, v5, Lgkj;->k:I

    const p0, 0x7f14072f

    iput p0, v5, Lgkj;->l:I

    iput v2, v5, Lgkj;->m:I

    iput-boolean v3, v5, Lgkj;->n:Z

    iput-object v10, v5, Lgkj;->o:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v5, p0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_14c

    :cond_149
    invoke-virtual {v7, v8}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_14c
    :goto_14c
    return-void

    :pswitch_14d
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->B1()V

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lq9n;->v(Landroid/view/Window;)Z

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance v0, Lic2;

    invoke-direct {v0}, Lic2;-><init>()V

    invoke-virtual {p0, v0, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_16c
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->s()V

    return-void

    :pswitch_172
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->m()V

    return-void

    :pswitch_178
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->i()V

    return-void

    :pswitch_17e
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz p0, :cond_187

    move-object v1, p0

    :cond_187
    invoke-virtual {v1, v3}, Lgbf;->t(Z)V

    return-void

    :pswitch_18b
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->h()V

    return-void

    :pswitch_191
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    invoke-virtual {p0, v3}, Leq9;->d(Z)V

    return-void

    :pswitch_19d
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->g()V

    return-void

    :pswitch_1a3
    iget-object p0, p0, Lnwf;->b:Lhv3;

    sget-object v0, Lhw0;->a:Lhw0;

    invoke-virtual {p0, v0}, Lhv3;->f(Lhw0;)V

    return-void

    :pswitch_1ab
    iget-object p0, p0, Lnwf;->b:Lhv3;

    sget-object v0, Lhw0;->a:Lhw0;

    invoke-virtual {p0}, Lhv3;->e()V

    return-void

    :pswitch_1b3
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->d()V

    return-void

    :pswitch_1b9
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->g0()V

    return-void

    :pswitch_1c3
    iget-object p0, p0, Lnwf;->b:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_1d4

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->X()V

    :cond_1d4
    return-void

    :pswitch_1d5
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->c()V

    return-void

    nop

    :pswitch_data_1dc
    .packed-switch 0x0
        :pswitch_1d5
        :pswitch_1c3
        :pswitch_1b9
        :pswitch_1b3
        :pswitch_1ab
        :pswitch_1a3
        :pswitch_19d
        :pswitch_191
        :pswitch_18b
        :pswitch_17e
        :pswitch_178
        :pswitch_172
        :pswitch_16c
        :pswitch_14d
        :pswitch_54
        :pswitch_44
        :pswitch_3e
        :pswitch_38
        :pswitch_32
        :pswitch_2c
        :pswitch_26
        :pswitch_20
        :pswitch_1a
        :pswitch_14
    .end packed-switch
.end method

.method public final o()V
    .registers 3

    iget-byte v0, p0, Llwf;->b:B

    sget-object v1, Lxl0;->i:Lxl0;

    iget-object p0, p0, Llwf;->c:Lnwf;

    packed-switch v0, :pswitch_data_9c

    sget-object v0, Lxl0;->F:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_f
    sget-object v0, Lxl0;->p:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_15
    invoke-virtual {p0, v1}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_19
    sget-object v0, Lxl0;->o:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_1f
    sget-object v0, Lxl0;->m:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_25
    sget-object v0, Lxl0;->l:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_2b
    sget-object v0, Lxl0;->k:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_31
    invoke-virtual {p0, v1}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_35
    sget-object v0, Lxl0;->q:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_3b
    sget-object v0, Lxl0;->r:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_41
    sget-object v0, Lxl0;->t:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_47
    sget-object v0, Lxl0;->D:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_4d
    sget-object v0, Lxl0;->y:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_53
    sget-object v0, Lxl0;->x:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_59
    sget-object v0, Lxl0;->w:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_5f
    sget-object v0, Lxl0;->g:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_65
    sget-object v0, Lxl0;->G:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_6b
    sget-object v0, Lxl0;->h:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_71
    sget-object v0, Lxl0;->B:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_77
    sget-object v0, Lxl0;->E:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_7d
    sget-object v0, Lxl0;->z:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_83
    sget-object v0, Lxl0;->e:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_89
    sget-object v0, Lxl0;->d:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_8f
    sget-object v0, Lxl0;->c:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_95
    sget-object v0, Lxl0;->b:Lxl0;

    invoke-virtual {p0, v0}, Lnwf;->w(Lxl0;)V

    return-void

    nop

    :pswitch_data_9c
    .packed-switch 0x0
        :pswitch_95
        :pswitch_8f
        :pswitch_89
        :pswitch_83
        :pswitch_7d
        :pswitch_77
        :pswitch_71
        :pswitch_6b
        :pswitch_65
        :pswitch_5f
        :pswitch_59
        :pswitch_53
        :pswitch_4d
        :pswitch_47
        :pswitch_41
        :pswitch_3b
        :pswitch_35
        :pswitch_31
        :pswitch_2b
        :pswitch_25
        :pswitch_1f
        :pswitch_19
        :pswitch_15
        :pswitch_f
    .end packed-switch
.end method
