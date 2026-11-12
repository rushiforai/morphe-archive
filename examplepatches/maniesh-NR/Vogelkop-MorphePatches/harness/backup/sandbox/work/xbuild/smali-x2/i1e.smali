.class public final synthetic Li1e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwj9;


# direct methods
.method public synthetic constructor <init>(Lwj9;B)V
    .registers 3

    iput-byte p2, p0, Li1e;->a:B

    iput-object p1, p0, Li1e;->b:Lwj9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 17

    iget-byte v0, p0, Li1e;->a:B

    const-class v1, Ld8j;

    sget-object v2, Lbf;->a:Lbf;

    sget-object v3, Laf;->a:Laf;

    sget-object v4, Lcf;->a:Lcf;

    const/4 v5, 0x4

    const/4 v6, 0x0

    sget-object v7, Lad;->a:Lad;

    const/4 v8, 0x3

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    iget-object p0, p0, Li1e;->b:Lwj9;

    packed-switch v0, :pswitch_data_3b6

    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    new-instance v2, Lzc;

    sget-object v3, Lpc;->q:Lpc;

    invoke-direct {v2, v3}, Lzc;-><init>(Lpc;)V

    new-instance v3, Lzc;

    sget-object v4, Lpc;->p:Lpc;

    invoke-direct {v3, v4}, Lzc;-><init>(Lpc;)V

    new-array v4, v8, [Lbd;

    aput-object v2, v4, v11

    aput-object v7, v4, v10

    aput-object v3, v4, v9

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Ldd;-><init>(Lfd;Ljava/util/List;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_45
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance v0, Lxl3;

    invoke-direct {v0, v6}, Lxl3;-><init>(Ljava/lang/Long;)V

    invoke-virtual {p0, v0, v11}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_63
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lyp3;

    invoke-direct {v1, p0, v0, v9}, Lyp3;-><init>(Lbq3;Landroid/view/View;B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_79
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lyp3;

    invoke-direct {v1, p0, v0, v10}, Lyp3;-><init>(Lbq3;Landroid/view/View;B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8f
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {v1, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a3
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lxp3;

    invoke-direct {v0, p0, v9}, Lxp3;-><init>(Lt0h;B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b9
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lyp3;

    invoke-direct {v1, p0, v0, v11}, Lyp3;-><init>(Lbq3;Landroid/view/View;B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_cf
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    new-instance v2, Lzc;

    sget-object v3, Lpc;->v:Lpc;

    invoke-direct {v2, v3}, Lzc;-><init>(Lpc;)V

    new-instance v3, Lzc;

    sget-object v4, Lpc;->u:Lpc;

    invoke-direct {v3, v4}, Lzc;-><init>(Lpc;)V

    new-instance v4, Lzc;

    sget-object v6, Lpc;->p:Lpc;

    invoke-direct {v4, v6}, Lzc;-><init>(Lpc;)V

    new-array v5, v5, [Lbd;

    aput-object v2, v5, v11

    aput-object v3, v5, v10

    aput-object v7, v5, v9

    aput-object v4, v5, v8

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Ldd;-><init>(Lfd;Ljava/util/List;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_106
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    sget-object v0, Lp6l;->a:Lp6l;

    iget-object v1, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_120

    invoke-interface {p0}, Lb9l;->T()Lp6l;

    :cond_120
    const/4 v4, 0x0

    sget-object v5, Llqm;->l:Llqm;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12c
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {v1, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_140
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lxp3;

    invoke-direct {v0, p0, v10}, Lxp3;-><init>(Lt0h;B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_156
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Laq3;

    invoke-direct {v1, p0, v0, v11, v11}, Laq3;-><init>(Lt0h;Ljava/lang/Object;ZB)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_16c
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {v1, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_180
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget-object v0, Ljzd;->c:Ljzd;

    invoke-static {p0, v0}, Llcp;->C(Landroid/content/Context;Ljzd;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_195
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->q:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljbn;

    sget-object v1, Libn;->a:Libn;

    new-instance v2, Lst3;

    invoke-direct {v2, p0, v8}, Lst3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v0, v1, v2}, Ljbn;->f(Libn;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1bd
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzp3;

    invoke-direct {v0, p0, v11, v11}, Lzp3;-><init>(Lt0h;ZB)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d3
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    sget-object v5, Lwo3;->K:Lpsp;

    iget-object v0, v0, Lef;->a:Ldf;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1eb

    sget-object v0, Luo3;->c:Luo3;

    goto :goto_1fc

    :cond_1eb
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f4

    sget-object v0, Luo3;->d:Luo3;

    goto :goto_1fc

    :cond_1f4
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_217

    sget-object v0, Luo3;->b:Luo3;

    :goto_1fc
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lpsp;->j(Luo3;)Landroid/os/Bundle;

    move-result-object v0

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    const-class v1, Lwo3;

    invoke-virtual {p0, v1, v0}, Lg8j;->l(Ljava/lang/Class;Landroid/os/Bundle;)V

    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_21a

    :cond_217
    invoke-static {}, Lh9o;->p()V

    :goto_21a
    return-object v6

    :pswitch_21b
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {v1, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_22f
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    iget-object v0, v0, Lef;->a:Ldf;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_245

    sget-object v0, Lhbf;->a:Lhbf;

    goto :goto_257

    :cond_245
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_255

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_255

    invoke-static {}, Lh9o;->p()V

    goto :goto_261

    :cond_255
    sget-object v0, Lhbf;->b:Lhbf;

    :goto_257
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lwp3;

    invoke-direct {v1, p0, v0, v11}, Lwp3;-><init>(Lt0h;Ljava/lang/Object;B)V

    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_261
    return-object v6

    :pswitch_262
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    new-instance v0, Le6j;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v11}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_286
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {v1, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29a
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    const-class v0, Ljt2;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    check-cast p0, Lot2;

    invoke-virtual {p0}, Lot2;->d()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2b9
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {v1, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2cd
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lnlh;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lnlh;-><init>(Lglh;Lx5f;Lcom/opera/android/settings/SettingsManager;)V

    new-array v0, v11, [Ln6h;

    new-instance v7, Lwzg;

    const-class v2, Lnlh;

    invoke-direct {v7, v1, v2, v5}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, -0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v6 .. v13}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v6, p0}, Lzhj;->c(Landroid/content/Context;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_314
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    new-instance v2, Lzc;

    sget-object v3, Lpc;->r:Lpc;

    invoke-direct {v2, v3}, Lzc;-><init>(Lpc;)V

    new-instance v3, Lzc;

    sget-object v4, Lpc;->p:Lpc;

    invoke-direct {v3, v4}, Lzc;-><init>(Lpc;)V

    new-array v4, v8, [Lbd;

    aput-object v2, v4, v11

    aput-object v7, v4, v10

    aput-object v3, v4, v9

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Ldd;-><init>(Lfd;Ljava/util/List;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_342
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance v0, Ltca;

    invoke-direct {v0, v11}, Ltca;-><init>(I)V

    invoke-virtual {p0, v0, v11}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_360
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    new-instance v1, Ldd;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-direct {v1, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v0}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_374
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v1, p2

    check-cast v1, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Laq3;

    invoke-direct {v1, p0, v0, v10, v11}, Laq3;-><init>(Lt0h;Ljava/lang/Object;ZB)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_38a
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->f:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v11}, Lcom/opera/android/BrowserActivity;->e1(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_39f
    move-object v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    iget-object p0, p0, Lwj9;->e:Ljava/lang/Object;

    check-cast p0, Lbq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzp3;

    invoke-direct {v0, p0, v10, v11}, Lzp3;-><init>(Lt0h;ZB)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3b6
    .packed-switch 0x0
        :pswitch_39f
        :pswitch_38a
        :pswitch_374
        :pswitch_360
        :pswitch_342
        :pswitch_314
        :pswitch_2cd
        :pswitch_2b9
        :pswitch_29a
        :pswitch_286
        :pswitch_262
        :pswitch_22f
        :pswitch_21b
        :pswitch_1d3
        :pswitch_1bd
        :pswitch_195
        :pswitch_180
        :pswitch_16c
        :pswitch_156
        :pswitch_140
        :pswitch_12c
        :pswitch_106
        :pswitch_cf
        :pswitch_b9
        :pswitch_a3
        :pswitch_8f
        :pswitch_79
        :pswitch_63
        :pswitch_45
    .end packed-switch
.end method
