.class public final Lqz;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lqz;->a:B

    iput-object p1, p0, Lqz;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final D(Lb2l;Z)V
    .registers 3

    iget-byte p1, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_14

    return-void

    :sswitch_8
    check-cast p0, Lh5l;

    invoke-virtual {p0}, Lh5l;->c0()V

    return-void

    :sswitch_e
    check-cast p0, Lh85;

    invoke-virtual {p0}, Lh85;->b0()V

    return-void

    :sswitch_data_14
    .sparse-switch
        0x5 -> :sswitch_e
        0x1d -> :sswitch_8
    .end sparse-switch
.end method

.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 14

    iget-byte v0, p0, Lqz;->a:B

    sget-object v1, Lijm;->b:Lijm;

    const/high16 v2, 0x1000000

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lqz;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_32a

    :pswitch_e
    return-void

    :pswitch_f
    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p0, :cond_18

    check-cast v6, Li3j;

    invoke-virtual {v6, p1}, Li3j;->P(Lb2l;)V

    :cond_18
    return-void

    :pswitch_19
    check-cast v6, Loji;

    iget-object p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_52

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v0, :cond_52

    iget v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->d(I)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-eqz p2, :cond_4b

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_49

    const-string p1, "/amp/"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    :cond_49
    if-eqz v5, :cond_52

    :cond_4b
    const/4 p0, 0x7

    invoke-virtual {v6, p0}, Loji;->G(I)V

    invoke-virtual {v6, v3}, Loji;->G(I)V

    :cond_52
    return-void

    :pswitch_53
    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p0, :cond_b2

    iget p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/2addr p0, v2

    if-nez p0, :cond_b2

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-nez p0, :cond_b2

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0}, Ldti;->a(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_7d

    const-string p0, "q"

    invoke-virtual {p1, p0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_98

    :cond_7d
    sget-object p2, Ldti;->b:Ljava/util/regex/Pattern;

    sget-object v0, Laik;->a:[Ljava/lang/String;

    invoke-static {p0, v0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    if-eqz p0, :cond_96

    const-string p0, "text"

    invoke-virtual {p1, p0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_98

    :cond_96
    const-string p0, ""

    :goto_98
    invoke-static {p0}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_b2

    check-cast v6, Ls28;

    iget-boolean p1, v6, Ls28;->d:Z

    if-eqz p1, :cond_b2

    new-instance p1, Lwr9;

    const/16 p2, 0xf

    invoke-direct {p1, p2, v6, p0, v5}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, v6, Ls28;->h:Ljava/lang/Object;

    check-cast p0, Lko7;

    invoke-virtual {p0, p1}, Lldk;->f(Ljava/lang/Runnable;)V

    :cond_b2
    return-void

    :pswitch_b3
    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_df

    check-cast v6, Lglh;

    invoke-virtual {p1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v6, Lglh;->d:Lqie;

    iget-object p2, v6, Lglh;->c:Lumi;

    new-instance v0, Lq2g;

    const/16 v1, 0x15

    invoke-direct {v0, v6, p0, v1}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p2, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance p2, Loml;

    invoke-direct {p2, p0}, Loml;-><init>(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p2, p0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_df
    return-void

    :pswitch_e0
    check-cast v6, Lcom/opera/android/PushedContentHandler;

    invoke-virtual {v6}, Lcom/opera/android/PushedContentHandler;->a()V

    return-void

    :pswitch_e6
    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p0, :cond_172

    iget p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->d(I)Z

    move-result p0

    if-eqz p0, :cond_172

    check-cast v6, Lq0h;

    iget-object p0, v6, Lq0h;->b:Lcom/opera/android/BrowserActivity;

    iget-object p1, v6, Lq0h;->f:Lqz;

    iget-object p2, v6, Lq0h;->e:Lk6l;

    iget v0, v6, Lq0h;->g:I

    add-int/2addr v0, v4

    iput v0, v6, Lq0h;->g:I

    iget-object v2, v6, Lq0h;->a:Lcom/opera/android/BrowserActivity;

    const/4 v3, 0x4

    const-string v4, "privacy_settings.promotion.can_show"

    if-lt v0, v3, :cond_138

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_138

    iget-object v0, v6, Lq0h;->c:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->k0()Z

    move-result v0

    if-eqz v0, :cond_138

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "privacy_monitor.promotion.shown.timestamp"

    const-wide/16 v7, 0x0

    invoke-interface {v0, v3, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    cmp-long v0, v9, v7

    if-eqz v0, :cond_138

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v9

    const-wide/32 v9, 0x5265c00

    cmp-long v0, v7, v9

    if-gez v0, :cond_14f

    :cond_138
    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_172

    invoke-virtual {p2, p1}, Lk6l;->v(La2l;)V

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-virtual {p0, v6}, Ltcc;->b(Lmdc;)V

    goto :goto_172

    :cond_14f
    invoke-virtual {p2, p1}, Lk6l;->v(La2l;)V

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-virtual {p0, v6}, Ltcc;->b(Lmdc;)V

    iget-object p0, v6, Lq0h;->d:Leej;

    new-instance p1, Lpjg;

    const/16 p2, 0xa

    invoke-direct {p1, v6, p2}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object p2, p0, Leej;->a:Lnej;

    iget-object p0, p0, Leej;->c:Lgjm;

    new-instance v0, Lxq3;

    const/4 v2, 0x6

    invoke-direct {v0, p0, p1, v2}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_172
    :goto_172
    return-void

    :pswitch_173
    check-cast v6, Ll0h;

    iget-object p0, v6, Ll0h;->i:Lcom/opera/android/settings/SettingsManager;

    iget-object v0, v6, Ll0h;->a:Lcom/opera/android/BrowserActivity;

    iget-boolean v5, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v5, :cond_1f7

    iget v5, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {v5}, Lcom/opera/android/browser/BrowserUtils;->d(I)Z

    move-result v5

    if-eqz v5, :cond_1f7

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result v5

    if-nez v5, :cond_1f7

    iget p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/2addr p2, v2

    if-nez p2, :cond_1f7

    iget p2, v6, Ll0h;->h:I

    add-int/2addr p2, v4

    iput p2, v6, Ll0h;->h:I

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v2, Lui6;->n:[Llag;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    invoke-static {p2, v2, p1}, Lui6;->x(Ljava/lang/String;[Llag;Z)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1f7

    iget p1, v6, Ll0h;->h:I

    if-lt p1, v3, :cond_1e1

    invoke-static {v0, p0}, Ll0h;->a(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;)Z

    move-result p1

    if-eqz p1, :cond_1e1

    iget-object p1, v6, Ll0h;->c:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->k0()Z

    move-result p1

    if-eqz p1, :cond_1e1

    iget-object p0, v6, Ll0h;->e:Lgbf;

    iget-object p1, p0, Lgbf;->b:Lz43;

    invoke-virtual {p1}, Lz43;->q()Z

    move-result p1

    if-eqz p1, :cond_1f7

    invoke-virtual {p0}, Lgbf;->q()Lcom/opera/android/bar/OmniButtonView;

    move-result-object p0

    if-eqz p0, :cond_1f7

    iget-object p0, v6, Ll0h;->d:Loz3;

    new-instance p1, Lkt3;

    invoke-direct {p1, v6, v3}, Lkt3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_1f7

    :cond_1e1
    invoke-static {v0, p0}, Ll0h;->a(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;)Z

    move-result p0

    if-nez p0, :cond_1f7

    iget-object p0, v6, Ll0h;->b:Lcom/opera/android/BrowserActivity;

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-virtual {p0, v6}, Ltcc;->b(Lmdc;)V

    iget-object p0, v6, Ll0h;->f:Lk6l;

    iget-object p1, v6, Ll0h;->g:Lqz;

    invoke-virtual {p0, p1}, Lk6l;->v(La2l;)V

    :cond_1f7
    :goto_1f7
    return-void

    :pswitch_1f8
    check-cast v6, Lmbf;

    invoke-virtual {v6, p1}, Lmbf;->R(Lb2l;)V

    return-void

    :pswitch_1fe
    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p0, :cond_21c

    iget p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->d(I)Z

    move-result p0

    if-eqz p0, :cond_21c

    check-cast v6, Lrwe;

    iget-object p0, v6, Lrwe;->a:Lbpd;

    new-instance p1, Lyqd;

    const/16 p2, 0x12

    invoke-direct {p1, v6, p2}, Lyqd;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-virtual {p0, p1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_21c
    return-void

    :pswitch_21d
    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->o:Z

    if-eqz v0, :cond_237

    iget-object v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lic4;->v(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_237

    check-cast p1, Ld7l;

    invoke-virtual {p1, p0}, Ld7l;->s0(La2l;)V

    goto :goto_24f

    :cond_237
    iget-object p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p2

    const-string v0, "lens.google"

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_24f

    check-cast p1, Ld7l;

    invoke-virtual {p1, p0}, Ld7l;->s0(La2l;)V

    check-cast v6, Llsc;

    invoke-virtual {p1, v6}, Ld7l;->Z(Llsc;)V

    :cond_24f
    :goto_24f
    return-void

    :pswitch_250
    check-cast v6, Liv7;

    iget p0, v6, Liv7;->l:I

    if-nez p0, :cond_259

    invoke-virtual {v6}, Liv7;->f()V

    :cond_259
    return-void

    :pswitch_25a
    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p0, :cond_26e

    move-object p0, p1

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->isActive()Z

    move-result p0

    if-eqz p0, :cond_26e

    check-cast v6, Ljt3;

    invoke-virtual {v6, p1}, Ljt3;->a(Lb2l;)V

    :cond_26e
    return-void

    :pswitch_26f
    check-cast v6, Lq82;

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p0, :cond_2e6

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p0, :cond_2e6

    iget-boolean p0, v6, Lq82;->c:Z

    if-eqz p0, :cond_2b5

    invoke-virtual {v6}, Lq82;->d()Z

    move-result p0

    if-eqz p0, :cond_2b5

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-eqz p0, :cond_2b5

    iget-boolean p0, v6, Lq82;->f:Z

    if-nez p0, :cond_28d

    iput-boolean v4, v6, Lq82;->f:Z

    :cond_28d
    iget-object p0, v6, Lq82;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_293
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2b1

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lr82;

    iget-object p2, v6, Lq82;->j:Lb2l;

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result p2

    invoke-interface {p1, p2, v5}, Lr82;->b(ZZ)V

    goto :goto_293

    :cond_2b1
    invoke-virtual {v6, v5, v4}, Lq82;->b(ZZ)V

    goto :goto_2e6

    :cond_2b5
    iget-boolean p0, v6, Lq82;->c:Z

    if-eqz p0, :cond_2d2

    invoke-virtual {v6}, Lq82;->d()Z

    move-result p0

    if-eqz p0, :cond_2d2

    iget-object p0, v6, Lq82;->e:Lg82;

    iget-object p0, p0, Lg82;->a:Ljava/lang/String;

    iget-object p1, v6, Lq82;->j:Lb2l;

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->f0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2d2

    move v4, v5

    :cond_2d2
    iget-object p0, v6, Lq82;->j:Lb2l;

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->n0()Z

    move-result p0

    invoke-virtual {v6, p0, v4}, Lq82;->b(ZZ)V

    invoke-virtual {v6}, Lq82;->d()Z

    move-result p0

    if-eqz p0, :cond_2e6

    invoke-virtual {v6}, Lq82;->a()V

    :cond_2e6
    :goto_2e6
    return-void

    :pswitch_2e7
    check-cast v6, Lx22;

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p0, :cond_323

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->i:Z

    if-nez p0, :cond_323

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p0, :cond_30e

    iget-boolean p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-nez p0, :cond_30e

    iget-object p0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {v6, p0}, Lx22;->k(Lorg/chromium/url/GURL;)Z

    move-result p0

    if-eqz p0, :cond_30e

    invoke-virtual {v6, p1}, Lx22;->e(Lb2l;)Lv22;

    move-result-object p0

    invoke-virtual {p0}, Lv22;->a()V

    iput-boolean v4, p0, Lv22;->c:Z

    invoke-virtual {p0}, Lv22;->b()V

    goto :goto_323

    :cond_30e
    iget-object p0, v6, Lx22;->g:Landroid/view/ViewGroup;

    const/16 p2, 0x8

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6, p1}, Lx22;->g(Lb2l;)Lv22;

    move-result-object p0

    if-eqz p0, :cond_323

    invoke-virtual {p0}, Lv22;->a()V

    iput-boolean v5, p0, Lv22;->c:Z

    invoke-virtual {p0}, Lv22;->b()V

    :cond_323
    :goto_323
    return-void

    :pswitch_324
    check-cast v6, Lwjh;

    invoke-virtual {v6, p1}, Lwjh;->f(Lb2l;)V

    return-void

    :pswitch_data_32a
    .packed-switch 0x0
        :pswitch_324
        :pswitch_2e7
        :pswitch_26f
        :pswitch_25a
        :pswitch_e
        :pswitch_e
        :pswitch_250
        :pswitch_e
        :pswitch_21d
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_1fe
        :pswitch_1f8
        :pswitch_e
        :pswitch_e
        :pswitch_173
        :pswitch_e6
        :pswitch_e0
        :pswitch_e
        :pswitch_b3
        :pswitch_53
        :pswitch_e
        :pswitch_e
        :pswitch_19
        :pswitch_f
    .end packed-switch
.end method

.method public final G(Lb2l;)V
    .registers 5

    iget-byte v0, p0, Lqz;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_94

    return-void

    :sswitch_9
    check-cast v2, Lh5l;

    invoke-virtual {v2}, Lh5l;->Z()V

    return-void

    :sswitch_f
    check-cast v2, Li3j;

    iget-object p0, v2, Li3j;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_1f

    invoke-static {p0}, LJ/N;->MWNGpfpJ(I)V

    :cond_1f
    return-void

    :sswitch_20
    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->P()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lqz;->W(Lb2l;I)V

    return-void

    :sswitch_2d
    check-cast v2, Ls9i;

    iget-object p0, v2, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lkwf;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p0

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    const v0, 0x7f0a07ef

    invoke-virtual {p0, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-static {p0, p1}, Lkwf;->u(Landroid/view/MenuItem;Lb2l;)V

    return-void

    :sswitch_46
    check-cast v2, Lmbf;

    invoke-virtual {v2, p1}, Lmbf;->R(Lb2l;)V

    return-void

    :sswitch_4c
    check-cast v2, Lpyl;

    iget-object p0, v2, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ld7l;

    if-eq p1, p0, :cond_5e

    iget-object p0, v2, Lpyl;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/LoadingView;

    invoke-virtual {p0, v1}, Lcom/opera/android/LoadingView;->a(Z)V

    const/4 p0, 0x0

    iput-object p0, v2, Lpyl;->e:Ljava/lang/Object;

    :cond_5e
    invoke-virtual {v2, p1}, Lpyl;->u(Lb2l;)V

    return-void

    :sswitch_62
    check-cast v2, Lxg;

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->Y()I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_70

    move v1, p1

    :cond_70
    invoke-virtual {v2, v1}, Lxg;->c(Z)V

    return-void

    :sswitch_74
    check-cast v2, Liv7;

    invoke-virtual {v2}, Liv7;->f()V

    return-void

    :sswitch_7a
    check-cast v2, Lx22;

    if-eqz p1, :cond_8c

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Lx22;->j(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_93

    :cond_8c
    iget-object p0, v2, Lx22;->g:Landroid/view/ViewGroup;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_93
    return-void

    :sswitch_data_94
    .sparse-switch
        0x1 -> :sswitch_7a
        0x6 -> :sswitch_74
        0x7 -> :sswitch_62
        0xb -> :sswitch_4c
        0xf -> :sswitch_46
        0x11 -> :sswitch_2d
        0x15 -> :sswitch_20
        0x1b -> :sswitch_f
        0x1d -> :sswitch_9
    .end sparse-switch
.end method

.method public final J(Lb2l;Z)V
    .registers 3

    iget-byte p1, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_14

    return-void

    :sswitch_8
    check-cast p0, Lh5l;

    invoke-virtual {p0}, Lh5l;->c0()V

    return-void

    :sswitch_e
    check-cast p0, Lh85;

    invoke-virtual {p0}, Lh85;->b0()V

    return-void

    :sswitch_data_14
    .sparse-switch
        0x5 -> :sswitch_e
        0x1d -> :sswitch_8
    .end sparse-switch
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-byte v0, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_30

    return-void

    :sswitch_8
    check-cast p0, Lpyl;

    invoke-virtual {p0, p1}, Lpyl;->u(Lb2l;)V

    return-void

    :sswitch_e
    check-cast p0, Lqx3;

    iget-object p2, p0, Lqx3;->b:Lb2l;

    if-ne p1, p2, :cond_17

    invoke-virtual {p0, p1}, Lqx3;->a(Lb2l;)V

    :cond_17
    return-void

    :sswitch_18
    check-cast p0, Lx22;

    iget-object p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0, p2}, Lx22;->k(Lorg/chromium/url/GURL;)Z

    move-result p2

    if-eqz p2, :cond_29

    invoke-virtual {p0, p1}, Lx22;->e(Lb2l;)Lv22;

    move-result-object p0

    invoke-virtual {p0}, Lv22;->a()V

    :cond_29
    return-void

    :sswitch_2a
    check-cast p0, Lwjh;

    invoke-virtual {p0}, Lwjh;->A()V

    return-void

    :sswitch_data_30
    .sparse-switch
        0x0 -> :sswitch_2a
        0x1 -> :sswitch_18
        0x4 -> :sswitch_e
        0xb -> :sswitch_8
    .end sparse-switch
.end method

.method public final R(Ld7l;)V
    .registers 3

    iget-byte p1, p0, Lqz;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_20

    return-void

    :sswitch_9
    check-cast p0, Lh5l;

    iput-object v0, p0, Lh5l;->h:Lu2l;

    invoke-virtual {p0}, Lh5l;->e0()V

    return-void

    :sswitch_11
    check-cast p0, Le0e;

    iput-object v0, p0, Le0e;->l:Lzzd;

    invoke-virtual {p0}, Le0e;->Z()V

    return-void

    :sswitch_19
    check-cast p0, Lwjh;

    invoke-virtual {p0}, Lwjh;->A()V

    return-void

    nop

    :sswitch_data_20
    .sparse-switch
        0x0 -> :sswitch_19
        0xd -> :sswitch_11
        0x1d -> :sswitch_9
    .end sparse-switch
.end method

.method public final S(Ld7l;)V
    .registers 2

    iget-byte p1, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_14

    return-void

    :sswitch_8
    check-cast p0, Lh5l;

    invoke-virtual {p0}, Lh5l;->Z()V

    return-void

    :sswitch_e
    check-cast p0, Lwjh;

    invoke-virtual {p0}, Lwjh;->A()V

    return-void

    :sswitch_data_14
    .sparse-switch
        0x0 -> :sswitch_e
        0x1d -> :sswitch_8
    .end sparse-switch
.end method

.method public final T(Lb2l;Lcom/opera/android/browser/TabInfo;)V
    .registers 12

    iget-byte v0, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_90

    return-void

    :sswitch_8
    check-cast p0, Lh5l;

    invoke-virtual {p0}, Lh5l;->a0()V

    return-void

    :sswitch_e
    check-cast p0, Lx2l;

    iget-object v0, p0, Lx2l;->m:Lh5k;

    invoke-virtual {v0}, Lh5k;->f()V

    check-cast p1, Ld7l;

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isActive()Z

    move-result v0

    if-eqz v0, :cond_38

    iget p2, p2, Lcom/opera/android/browser/TabInfo;->d:I

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq p2, v0, :cond_38

    iget-object p0, p0, Lx2l;->j:Lypd;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-virtual {p0, p1}, Lypd;->r(I)V

    :cond_38
    return-void

    :sswitch_39
    check-cast p0, Lcom/opera/android/browser/SessionStore;

    check-cast p1, Ld7l;

    iget-object p2, p1, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->m()Z

    move-result p2

    if-nez p2, :cond_5e

    iget-object p2, p1, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p2

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result v2

    iget-wide v3, p2, Lcom/opera/android/browser/TabInfo;->a:J

    iget-wide v5, p2, Lcom/opera/android/browser/TabInfo;->b:J

    iget v7, p2, Lcom/opera/android/browser/TabInfo;->c:I

    iget v8, p2, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static/range {v0 .. v8}, LJ/N;->Mbsb$YyE(JIJJII)V

    :cond_5e
    return-void

    :sswitch_5f
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    iget p2, p2, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq p1, p2, :cond_72

    check-cast p0, Ls9i;

    invoke-virtual {p0}, Ls9i;->b0()V

    :cond_72
    return-void

    :sswitch_73
    check-cast p0, Lb0e;

    iget-object p0, p0, Lb0e;->k:Lrn9;

    invoke-virtual {p0}, Lrn9;->N()V

    return-void

    :sswitch_7b
    iget p2, p2, Lcom/opera/android/browser/TabInfo;->d:I

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq p2, p1, :cond_8e

    check-cast p0, Lv8a;

    invoke-virtual {p0}, Lv8a;->a()V

    :cond_8e
    return-void

    nop

    :sswitch_data_90
    .sparse-switch
        0xa -> :sswitch_7b
        0xc -> :sswitch_73
        0x18 -> :sswitch_5f
        0x19 -> :sswitch_39
        0x1c -> :sswitch_e
        0x1d -> :sswitch_8
    .end sparse-switch
.end method

.method public final V(Lb2l;I)V
    .registers 3

    iget-byte p1, p0, Lqz;->a:B

    packed-switch p1, :pswitch_data_12

    return-void

    :pswitch_6
    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    check-cast p0, Lxg;

    const/4 p1, 0x1

    if-eq p2, p1, :cond_e

    const/4 p1, 0x0

    :cond_e
    invoke-virtual {p0, p1}, Lxg;->c(Z)V

    return-void

    :pswitch_data_12
    .packed-switch 0x7
        :pswitch_6
    .end packed-switch
.end method

.method public final W(Lb2l;I)V
    .registers 7

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p2, v1, :cond_14

    move v1, v3

    goto :goto_15

    :cond_14
    move v1, v2

    :goto_15
    if-nez v0, :cond_29

    if-ne p2, v3, :cond_27

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/opera/android/browser/UrlMangler;->isMangled(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_29

    :cond_27
    move p1, v2

    goto :goto_2a

    :cond_29
    move p1, v3

    :goto_2a
    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    check-cast p0, Lp8f;

    if-eqz p1, :cond_32

    if-eqz v1, :cond_33

    :cond_32
    move v3, v2

    :cond_33
    sget-object p1, Lukh;->e:Lukh;

    if-eqz v3, :cond_3f

    new-instance p2, Lukh;

    invoke-direct {p2, v3, v0, v2, v2}, Lukh;-><init>(ZZZB)V

    iput-object p2, p0, Lp8f;->d:Ljava/lang/Object;

    goto :goto_42

    :cond_3f
    iput-object p1, p0, Lp8f;->d:Ljava/lang/Object;

    move-object p2, p1

    :goto_42
    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lukh;

    iget-boolean v1, v0, Lukh;->b:Z

    if-nez v1, :cond_4c

    if-ne p2, p1, :cond_4d

    :cond_4c
    move-object p2, v0

    :cond_4d
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_55
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_65

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsbf;

    invoke-virtual {p1, p2}, Lsbf;->a(Lukh;)V

    goto :goto_55

    :cond_65
    return-void
.end method

.method public final e(Lb2l;II)V
    .registers 4

    iget-byte p3, p0, Lqz;->a:B

    packed-switch p3, :pswitch_data_a

    return-void

    :pswitch_6
    invoke-virtual {p0, p1, p2}, Lqz;->W(Lb2l;I)V

    return-void

    :pswitch_data_a
    .packed-switch 0x15
        :pswitch_6
    .end packed-switch
.end method

.method public final j(Lb2l;)V
    .registers 3

    iget-byte v0, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_36

    return-void

    :sswitch_8
    check-cast p0, Ls9i;

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lkwf;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p0

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    const v0, 0x7f0a07ef

    invoke-virtual {p0, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-static {p0, p1}, Lkwf;->u(Landroid/view/MenuItem;Lb2l;)V

    return-void

    :sswitch_21
    check-cast p0, Lpyl;

    iget-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v0, Ld7l;

    if-ne v0, p1, :cond_34

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->o0()Z

    move-result p1

    if-eqz p1, :cond_34

    invoke-virtual {p0}, Lpyl;->m()V

    :cond_34
    return-void

    nop

    :sswitch_data_36
    .sparse-switch
        0xb -> :sswitch_21
        0x11 -> :sswitch_8
    .end sparse-switch
.end method

.method public final p(Lb2l;)V
    .registers 3

    iget-byte v0, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    :pswitch_7
    return-void

    :pswitch_8
    check-cast p0, Lh5l;

    iget-object p1, p0, Lh5l;->i:Lu2l;

    if-eqz p1, :cond_1d

    iget-object p1, p1, Lu2l;->a:Lb2l;

    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object p0, p0, Ld5l;->g:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->l0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1d
    return-void

    :pswitch_1e
    check-cast p0, Li3j;

    invoke-virtual {p0, p1}, Li3j;->P(Lb2l;)V

    return-void

    :pswitch_data_24
    .packed-switch 0x1b
        :pswitch_1e
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final r(Ld7l;)V
    .registers 3

    iget-byte v0, p0, Lqz;->a:B

    packed-switch v0, :pswitch_data_16

    return-void

    :pswitch_6
    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isActive()Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    check-cast p0, Ljt3;

    invoke-virtual {p0, p1}, Ljt3;->a(Lb2l;)V

    :cond_15
    return-void

    :pswitch_data_16
    .packed-switch 0x3
        :pswitch_6
    .end packed-switch
.end method

.method public final u(Lb2l;)V
    .registers 3

    iget-byte v0, p0, Lqz;->a:B

    packed-switch v0, :pswitch_data_1c

    return-void

    :pswitch_6
    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    check-cast p0, Lpyl;

    iget-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v0, Ld7l;

    if-ne v0, p1, :cond_1b

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->o0()Z

    move-result p1

    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Lpyl;->m()V

    :cond_1b
    return-void

    :pswitch_data_1c
    .packed-switch 0xb
        :pswitch_6
    .end packed-switch
.end method

.method public final v(Lb2l;)V
    .registers 8

    iget-byte v0, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_4e

    return-void

    :sswitch_8
    check-cast p0, Li3j;

    iget-object p0, p0, Li3j;->d:Ljava/lang/Object;

    check-cast p0, Ldxk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Ldxk;->l:Ljava/lang/String;

    if-nez p1, :cond_34

    iget-object p1, p0, Ldxk;->d:Lzwk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->f()Z

    move-result p1

    if-eqz p1, :cond_34

    iget-wide v2, p0, Ldxk;->k:J

    sub-long v2, v0, v2

    const-wide/32 v4, 0x36ee80

    cmp-long p1, v2, v4

    if-ltz p1, :cond_34

    iput-wide v0, p0, Ldxk;->k:J

    invoke-virtual {p0}, Ldxk;->R()V

    :cond_34
    return-void

    :sswitch_35
    check-cast p0, Ls9i;

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lkwf;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p0

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    const v0, 0x7f0a07ef

    invoke-virtual {p0, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-static {p0, p1}, Lkwf;->u(Landroid/view/MenuItem;Lb2l;)V

    return-void

    :sswitch_data_4e
    .sparse-switch
        0x11 -> :sswitch_35
        0x1b -> :sswitch_8
    .end sparse-switch
.end method

.method public final x(Lb2l;)V
    .registers 5

    iget-byte v0, p0, Lqz;->a:B

    iget-object p0, p0, Lqz;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_42

    return-void

    :sswitch_8
    check-cast p0, Lh5l;

    invoke-virtual {p0}, Lh5l;->b0()V

    return-void

    :sswitch_e
    check-cast p0, Li3j;

    invoke-virtual {p0, p1}, Li3j;->P(Lb2l;)V

    return-void

    :sswitch_14
    check-cast p0, Lpgf;

    invoke-virtual {p0, p1}, Lpgf;->b(Lb2l;)V

    return-void

    :sswitch_1a
    check-cast p0, Le0e;

    invoke-virtual {p0}, Le0e;->Y()V

    return-void

    :sswitch_20
    check-cast p0, Lg5a;

    iget-object p1, p0, Lg5a;->c:Lkol;

    new-instance v0, Lfol;

    iget-object p0, p0, Lg5a;->a:Lb2l;

    move-object v1, p0

    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Lb9l;->T()Lp6l;

    move-result-object v2

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-direct {v0, p0, v2, v1}, Lfol;-><init>(ILp6l;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lkol;->j(Lfol;)V

    return-void

    :sswitch_data_42
    .sparse-switch
        0x9 -> :sswitch_20
        0xd -> :sswitch_1a
        0x10 -> :sswitch_14
        0x1b -> :sswitch_e
        0x1d -> :sswitch_8
    .end sparse-switch
.end method
