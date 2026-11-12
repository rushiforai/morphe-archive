.class public final synthetic Lyv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lyv3;->a:B

    iput-object p1, p0, Lyv3;->b:Ltw3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lyv3;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lyv3;->b:Ltw3;

    packed-switch v0, :pswitch_data_240

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    new-instance v0, Lm7d;

    new-instance v2, Lwt3;

    invoke-direct {v2, p0, v1}, Lwt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v3, Lli;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    const/4 v8, 0x0

    const/16 v9, 0x15

    const-class v5, Lcom/opera/android/OperaApplication;

    const-string v6, "usageReporter"

    const-string v7, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    invoke-direct/range {v3 .. v9}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v4, Lwv1;

    invoke-direct {v4, v3, v1}, Lwv1;-><init>(Lb6h;B)V

    invoke-direct {v0, p0, v2, v4}, Lm7d;-><init>(Landroid/content/Context;Lwt3;Lwv1;)V

    return-object v0

    :pswitch_30
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lkxk;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lhxk;

    return-object p0

    :pswitch_3d
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lpm3;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lpm3;

    return-object p0

    :pswitch_4a
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    return-object p0

    :pswitch_57
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_5e
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_69
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :pswitch_73
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    return-object p0

    :pswitch_7d
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lhxk;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lhxk;

    return-object p0

    :pswitch_8a
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lot2;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lot2;

    return-object p0

    :pswitch_97
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_9e
    new-instance v0, Lqsh;

    iget-object v1, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->a:Lxbf;

    iget-object p0, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqln;

    const/16 v2, 0xa

    invoke-direct {v0, v1, p0, v2}, Lqsh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_ba
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :pswitch_c4
    iget-object p0, p0, Ltw3;->c0:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk42;

    iget-object p0, p0, Lk42;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    return-object p0

    :pswitch_d5
    iget-object p0, p0, Ltw3;->c0:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk42;

    iget-object p0, p0, Lk42;->d:Lh42;

    invoke-static {p0}, Lxf8;->W(Lekc;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    if-eqz p0, :cond_ed

    iget-object p0, p0, Lt0i;->a:Ljava/lang/Object;

    instance-of p0, p0, Lq0i;

    xor-int/2addr p0, v1

    goto :goto_ee

    :cond_ed
    const/4 p0, 0x0

    :goto_ee
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_f3
    iget-object p0, p0, Ltw3;->c0:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk42;

    iget-object p0, p0, Lk42;->a:Lji;

    iget-object p0, p0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object v0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "aria.sandbox.userinfo"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_121

    :try_start_10e
    invoke-static {v0}, Lyi4;->J(Ljava/lang/String;)Lehf;

    move-result-object v2
    :try_end_112
    .catch Lorg/json/JSONException; {:try_start_10e .. :try_end_112} :catch_113

    goto :goto_121

    :catch_113
    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_121
    :goto_121
    return-object v2

    :pswitch_122
    new-instance v0, La52;

    iget-object p0, p0, Ltw3;->q0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Li52;

    invoke-direct {v0, p0}, La52;-><init>(Li52;)V

    return-object v0

    :pswitch_130
    new-instance v0, Lbw3;

    invoke-direct {v0, p0}, Lbw3;-><init>(Ltw3;)V

    return-object v0

    :pswitch_136
    new-instance v0, Ll32;

    iget-object v1, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ltw3;->c:Lumi;

    sget-object v2, Lngh;->a:Lr16;

    invoke-direct {v0, v1, p0}, Ll32;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_142
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lgz1;

    iget-object v3, p0, Ltw3;->c:Lumi;

    sget-object v4, Lvml;->e:Lwjh;

    iget-object v5, p0, Ltw3;->t0:Lhw3;

    iget-object v6, v0, Lcom/opera/android/OperaApplication;->t:Lj4c;

    iget-object v7, p0, Ltw3;->h:Lj4c;

    iget-object v8, p0, Ltw3;->i:Lj4c;

    invoke-direct/range {v1 .. v8}, Lgz1;-><init>(Landroid/content/Context;Lumi;Lwjh;Lhw3;Lj4c;Lj4c;Lj4c;)V

    return-object v1

    :pswitch_15e
    new-instance v0, Ldz1;

    iget-object p0, p0, Ltw3;->w0:Lj4c;

    sget-object v1, Lxne;->b:Lii;

    sget-object v2, Law3;->a:Law3;

    sget-object v2, Lvml;->e:Lwjh;

    iget-object v3, v2, Lwjh;->b:Ljava/lang/Object;

    check-cast v3, Ld7a;

    iget-object v2, v2, Lwjh;->d:Ljava/lang/Object;

    check-cast v2, Ljg8;

    invoke-direct {v0, p0, v1, v3, v2}, Ldz1;-><init>(Lj4c;Lii;Ldx5;Ljg8;)V

    return-object v0

    :pswitch_174
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v2, p0, Ltw3;->v0:Lhw3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lufj;

    new-instance v3, Li9c;

    iget-object v4, p0, Ltw3;->d0:Lzv3;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ll02;

    iget-object v4, v4, Ll02;->d:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lghj;

    iget-object p0, p0, Ltw3;->c0:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk42;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-direct {v3, v0, v4, p0, v1}, Li9c;-><init>(Lndc;Lghj;Lk42;Lx5f;)V

    new-instance p0, Legj;

    invoke-direct {p0, v2, v3}, Legj;-><init>(Lufj;Li9c;)V

    return-object p0

    :pswitch_1af
    new-instance v4, Lky1;

    iget-object v5, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v6, p0, Ltw3;->c:Lumi;

    iget-object v7, p0, Ltw3;->m0:Lj4c;

    iget-object v8, p0, Ltw3;->n0:Lj4c;

    iget-object v9, p0, Ltw3;->o0:Lj4c;

    iget-object v10, p0, Ltw3;->p0:Lj4c;

    iget-object v11, p0, Ltw3;->x0:Lj4c;

    iget-object v12, p0, Ltw3;->q0:Lj4c;

    iget-object v13, p0, Ltw3;->j:Lj4c;

    iget-object v14, p0, Ltw3;->e0:Lzv3;

    invoke-direct/range {v4 .. v14}, Lky1;-><init>(Landroidx/fragment/app/r;Lumi;Lj4c;Lj4c;Lj4c;Lj4c;Lj4c;Lj4c;Lj4c;Lzv3;)V

    return-object v4

    :pswitch_1c9
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->j:Lqi;

    return-object p0

    :pswitch_1ce
    new-instance v0, Lqy1;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-direct {v0, p0}, Lqy1;-><init>(Landroid/content/ContentResolver;)V

    return-object v0

    :pswitch_1da
    new-instance v0, Lny1;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Lny1;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_1e4
    new-instance v0, Lx12;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object v1, Lxne;->b:Lii;

    invoke-direct {v0, p0, v1}, Lx12;-><init>(Landroid/content/ContentResolver;Lii;)V

    return-object v0

    :pswitch_1f2
    new-instance v0, Lq32;

    iget-object v1, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    new-instance v2, Lyv3;

    const/4 v3, 0x6

    invoke-direct {v2, p0, v3}, Lyv3;-><init>(Ltw3;B)V

    invoke-direct {v0, v1, v2}, Lq32;-><init>(Landroid/content/Context;Lyv3;)V

    return-object v0

    :pswitch_200
    new-instance v0, Lfw3;

    invoke-direct {v0, p0}, Lfw3;-><init>(Ltw3;)V

    return-object v0

    :pswitch_206
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Law0;

    iget-object v3, p0, Ltw3;->c:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v4

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lyk6;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->h:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lvk6;

    iget-object v0, p0, Ltw3;->i0:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Li12;

    iget-object p0, p0, Ltw3;->C0:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Ltz1;

    invoke-direct/range {v1 .. v7}, Law0;-><init>(Landroid/content/Context;Lumi;Lyk6;Lvk6;Li12;Ltz1;)V

    return-object v1

    nop

    :pswitch_data_240
    .packed-switch 0x0
        :pswitch_206
        :pswitch_200
        :pswitch_1f2
        :pswitch_1e4
        :pswitch_1da
        :pswitch_1ce
        :pswitch_1c9
        :pswitch_1af
        :pswitch_174
        :pswitch_15e
        :pswitch_142
        :pswitch_136
        :pswitch_130
        :pswitch_122
        :pswitch_f3
        :pswitch_d5
        :pswitch_c4
        :pswitch_ba
        :pswitch_9e
        :pswitch_97
        :pswitch_8a
        :pswitch_7d
        :pswitch_73
        :pswitch_69
        :pswitch_5e
        :pswitch_57
        :pswitch_4a
        :pswitch_3d
        :pswitch_30
    .end packed-switch
.end method
