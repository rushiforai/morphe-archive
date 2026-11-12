.class public final Lhze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;Lcom/opera/android/PushedContentHandler;Lgmk;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lhze;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lhze;->b:Ljava/lang/Object;

    iput-object p2, p0, Lhze;->c:Ljava/lang/Object;

    iget-object p1, p3, Lgmk;->a:Lkze;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lgmk;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lhze;->a:B

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhze;->b:Ljava/lang/Object;

    .line 21
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lhze;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Likc;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Lhze;->a:B

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, Lhze;->c:Ljava/lang/Object;

    .line 31
    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lhze;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 27
    iput-byte p3, p0, Lhze;->a:B

    iput-object p1, p0, Lhze;->b:Ljava/lang/Object;

    iput-object p2, p0, Lhze;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lslk;Lx5f;Lox3;)V
    .registers 5

    const/4 v0, 0x3

    iput-byte v0, p0, Lhze;->a:B

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p2, p0, Lhze;->b:Ljava/lang/Object;

    .line 24
    iput-object p3, p0, Lhze;->c:Ljava/lang/Object;

    .line 25
    iget-object p1, p1, Lslk;->i:Lkze;

    .line 26
    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Ltah;Lcvg;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lhze;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhze;->b:Ljava/lang/Object;

    iput-object p1, p0, Lhze;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxzg;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lhze;->a:B

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lhze;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 6

    iget-object v0, p0, Lhze;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lhze;->b:Ljava/lang/Object;

    check-cast v1, Lgmk;

    iget-object v2, v1, Lgmk;->a:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luvg;

    sget-object v3, Luvg;->g:Luvg;

    if-ne v2, v3, :cond_23

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v2, :cond_22

    iget-object p1, v1, Lgmk;->a:Lkze;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    :cond_22
    return-void

    :cond_23
    invoke-interface {p1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Lhze;->a:B

    sget-object v1, Luvg;->g:Luvg;

    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    iget-object v8, p0, Lhze;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2ae

    iget-object v0, p0, Lhze;->b:Ljava/lang/Object;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    iput-object p1, p0, Lhze;->b:Ljava/lang/Object;

    check-cast v8, Lkotlin/jvm/functions/Function1;

    invoke-interface {v8, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    return-void

    :pswitch_1f
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_35

    iget-object p1, p0, Lhze;->b:Ljava/lang/Object;

    check-cast p1, Lm9k;

    iget-object p1, p1, Lm9k;->e:Ljze;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    check-cast v8, Lf49;

    invoke-virtual {v8}, Lf49;->run()V

    :cond_35
    return-void

    :pswitch_36
    check-cast p1, Lm18;

    check-cast v8, Lx5f;

    iget-object v0, v8, Lx5f;->d:Lzpa;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_e5

    const/16 v1, 0x1d

    const/16 v2, 0x98b

    const/16 v9, 0x14

    if-eq p1, v7, :cond_91

    if-eq p1, v4, :cond_91

    if-ne p1, v3, :cond_8d

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    new-instance p1, Lck0;

    invoke-direct {p1, v0, p0}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lct0;

    invoke-direct {v0, v2, v5, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_74

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_74

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_81

    :cond_74
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, v1, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_81
    invoke-virtual {v3, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lvd0;->d:Lvd0;

    invoke-virtual {v0, v6, v7, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v8, p0}, Lx5f;->U0(Lx56;)V

    goto :goto_e5

    :cond_8d
    invoke-static {}, Lh9o;->p()V

    goto :goto_e5

    :cond_91
    iget-object p0, p0, Lhze;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_rewards"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->j(Ljava/lang/String;)Lh7j;

    move-result-object p0

    iget-object p1, p0, Lh7j;->b:Lop0;

    iget-boolean p0, p0, Lh7j;->a:Z

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v10, Lck0;

    invoke-direct {v10, v0, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    new-instance v9, Lct0;

    invoke-direct {v9, v2, v5, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_c5

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c5

    new-instance v4, Lif0;

    invoke-direct {v4, v3, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_d2

    :cond_c5
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v3, v1, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v3, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_d2
    invoke-virtual {v4, v0, v9}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v9, v7, v7, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p0, :cond_dd

    sget-object p0, Lvd0;->b:Lvd0;

    goto :goto_df

    :cond_dd
    sget-object p0, Lvd0;->c:Lvd0;

    :goto_df
    invoke-virtual {v9, v6, v7, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v8, v3}, Lx5f;->U0(Lx56;)V

    :cond_e5
    :goto_e5
    return-void

    :pswitch_e6
    check-cast p1, Ljava/lang/String;

    check-cast v8, Lxzg;

    iget-object v0, p0, Lhze;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_10a

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10a

    invoke-virtual {v8}, Landroidx/fragment/app/i;->dismiss()V

    goto :goto_13d

    :cond_10a
    iput-object p1, p0, Lhze;->b:Ljava/lang/Object;

    iget-object p0, v8, Lxzg;->h:Lei;

    iget-object p0, p0, Lei;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v0, Lorg/chromium/url/GURL;

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v7}, LJ/N;->MN7bz_Mm(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LJ/N;->M52RypMk(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    iget-object p1, v8, Lxzg;->e:Lp0h;

    iget-object p1, p1, Lp0h;->f:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqwi;

    iget-object p1, p1, Lqwi;->a:Lnwi;

    invoke-virtual {v8, p0, p1}, Lxzg;->k0(Ljava/lang/String;Lnwi;)V

    :goto_13d
    return-void

    :pswitch_13e
    check-cast p1, Lwvg;

    iget-object p0, p0, Lhze;->b:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-object v0, p0, Lx5f;->d:Lzpa;

    iget v1, p1, Lwvg;->e:I

    if-eqz v1, :cond_235

    const/4 v6, 0x6

    const/4 v9, 0x4

    const/4 v10, 0x5

    if-eqz v1, :cond_1e7

    invoke-virtual {p1}, Lwvg;->a()Z

    move-result v11

    sget-object v12, Lcn0;->b:Lcn0;

    if-nez v11, :cond_15b

    iget v11, p1, Lwvg;->e:I

    if-ne v11, v10, :cond_180

    :cond_15b
    invoke-virtual {p1}, Lwvg;->b()Z

    move-result v11

    if-nez v11, :cond_180

    iget-object v11, p1, Lwvg;->i:Lo9g;

    if-eqz v11, :cond_180

    invoke-virtual {v11}, Lo9g;->a()I

    move-result v11

    if-eq v11, v5, :cond_17f

    if-eqz v11, :cond_17c

    if-eq v11, v7, :cond_179

    if-eq v11, v4, :cond_176

    if-ne v11, v3, :cond_17f

    sget-object v12, Lcn0;->c:Lcn0;

    goto :goto_180

    :cond_176
    sget-object v12, Lcn0;->d:Lcn0;

    goto :goto_180

    :cond_179
    sget-object v12, Lcn0;->e:Lcn0;

    goto :goto_180

    :cond_17c
    sget-object v12, Lcn0;->f:Lcn0;

    goto :goto_180

    :cond_17f
    move-object v12, v2

    :cond_180
    :goto_180
    if-eqz v12, :cond_1e7

    invoke-virtual {p1}, Lwvg;->b()Z

    move-result v4

    sget-object v5, Lbn0;->b:Lbn0;

    if-nez v4, :cond_198

    if-eq v1, v3, :cond_196

    if-eq v1, v9, :cond_193

    if-ne v1, v10, :cond_198

    sget-object v5, Lbn0;->d:Lbn0;

    goto :goto_198

    :cond_193
    sget-object v5, Lbn0;->e:Lbn0;

    goto :goto_198

    :cond_196
    sget-object v5, Lbn0;->c:Lbn0;

    :cond_198
    :goto_198
    iget-object v4, p1, Lwvg;->h:Ljmk;

    if-eqz v4, :cond_19e

    iget-object v2, v4, Ljmk;->a:Ljava/lang/String;

    :cond_19e
    if-eqz v2, :cond_1c7

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    const v11, -0x62ea218b

    if-eq v4, v11, :cond_1b9

    const v11, 0x1aa0978

    if-ne v4, v11, :cond_1c1

    const-string v4, "ofa_free_trial"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c1

    sget-object v2, Ltm0;->d:Ltm0;

    goto :goto_1c9

    :cond_1b9
    const-string v4, "google_billing"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1c4

    :cond_1c1
    sget-object v2, Ltm0;->e:Ltm0;

    goto :goto_1c9

    :cond_1c4
    sget-object v2, Ltm0;->c:Ltm0;

    goto :goto_1c9

    :cond_1c7
    sget-object v2, Ltm0;->b:Ltm0;

    :goto_1c9
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v0}, Lx56;->O(Lzpa;)Le66;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v11, v10, v7, v12}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v11, v6, v7, v12}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 v12, 0x9

    invoke-virtual {v11, v12, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 v2, 0x8

    invoke-virtual {v11, v2, v7, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Lx5f;->U0(Lx56;)V

    :cond_1e7
    invoke-virtual {p1}, Lwvg;->b()Z

    move-result v2

    if-nez v2, :cond_209

    if-eq v1, v3, :cond_1f5

    if-eq v1, v9, :cond_1f5

    if-eq v1, v10, :cond_1f5

    if-ne v1, v6, :cond_209

    :cond_1f5
    iget-object v2, p1, Lwvg;->a:Ljava/lang/String;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v0}, Lx56;->O(Lzpa;)Le66;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v5, 0x7

    invoke-virtual {v0, v5, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Lx5f;->U0(Lx56;)V

    :cond_209
    if-eq v1, v3, :cond_211

    if-eq v1, v9, :cond_211

    if-eq v1, v10, :cond_211

    if-ne v1, v6, :cond_235

    :cond_211
    check-cast v8, Lox3;

    invoke-virtual {v8}, Lox3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lwvg;->b()Z

    move-result p1

    if-eqz p1, :cond_22d

    const-string p1, "premium.has_owned_giveaway"

    invoke-interface {v0, p1, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_232

    :cond_22d
    const-string p1, "premium.has_owned_subscription"

    invoke-interface {v0, p1, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    :goto_232
    invoke-virtual {p0}, Lnv6;->w()V

    :cond_235
    return-void

    :pswitch_236
    check-cast p1, Luvg;

    if-eq p1, v1, :cond_266

    sget-object v0, Luvg;->d:Luvg;

    if-ne p1, v0, :cond_240

    move p1, v7

    goto :goto_241

    :cond_240
    move p1, v6

    :goto_241
    iget-object p0, p0, Lhze;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object v0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "premium.force_push.state"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eq v0, p1, :cond_266

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    check-cast v8, Lcom/opera/android/PushedContentHandler;

    invoke-virtual {v8, v7, v2}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    :cond_266
    return-void

    :pswitch_267
    check-cast p1, Lh1b;

    check-cast v8, Ltah;

    iget-object p1, v8, Ltah;->k:Ljava/lang/Object;

    check-cast p1, Lebh;

    iget-object p1, p1, Lebh;->a:Lode;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    iget-object p1, v8, Ltah;->f:Ljava/lang/Object;

    check-cast p1, Lfmk;

    iget-object p1, p1, Lfmk;->c:Lode;

    iget-object v0, p0, Lhze;->b:Ljava/lang/Object;

    check-cast v0, Lcvg;

    new-instance v1, Ld8d;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0, v1}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :pswitch_289
    check-cast p1, Luvg;

    check-cast v8, Ljava/util/ArrayList;

    if-eq p1, v1, :cond_2ad

    iget-object v0, p0, Lhze;->b:Ljava/lang/Object;

    check-cast v0, Lgmk;

    iget-object v0, v0, Lgmk;->a:Lkze;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_29c
    if-ge v6, p0, :cond_2aa

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v6, v6, 0x1

    check-cast v0, Lcom/opera/api/Callback;

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_29c

    :cond_2aa
    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    :cond_2ad
    return-void

    :pswitch_data_2ae
    .packed-switch 0x0
        :pswitch_289
        :pswitch_267
        :pswitch_236
        :pswitch_13e
        :pswitch_e6
        :pswitch_36
        :pswitch_1f
    .end packed-switch
.end method
