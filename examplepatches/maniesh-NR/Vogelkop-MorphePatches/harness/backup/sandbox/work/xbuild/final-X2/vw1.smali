.class public final synthetic Lvw1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzt8;
.implements Lswl;
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lau8;Lcom/opera/android/BrowserActivity;Lnue;Lxw8;Ljue;Lx5f;Lx5f;Lumi;Lqq6;)V
    .registers 10

    const/4 p3, 0x1

    iput-byte p3, p0, Lvw1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvw1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lvw1;->c:Ljava/lang/Object;

    iput-object p4, p0, Lvw1;->d:Ljava/lang/Object;

    iput-object p6, p0, Lvw1;->e:Ljava/lang/Object;

    iput-object p8, p0, Lvw1;->f:Ljava/lang/Object;

    iput-object p9, p0, Lvw1;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 8

    .line 19
    iput-byte p7, p0, Lvw1;->a:B

    iput-object p1, p0, Lvw1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lvw1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lvw1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lvw1;->e:Ljava/lang/Object;

    iput-object p5, p0, Lvw1;->f:Ljava/lang/Object;

    iput-object p6, p0, Lvw1;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)V
    .registers 9

    iget-object v0, p0, Lvw1;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lhjf;

    iget-object v0, p0, Lvw1;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Landroid/content/Context;

    iget-object v0, p0, Lvw1;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lr65;

    iget-object v0, p0, Lvw1;->e:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Lvw1;->f:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lcom/opera/android/Lazy;

    iget-object p0, p0, Lvw1;->g:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Ll45;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result p1

    if-nez p1, :cond_35

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_35

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/appsflyer/AppsFlyerLib;->setOaidData(Ljava/lang/String;)V

    :cond_35
    invoke-static/range {v1 .. v6}, Lxw1;->a(Lhjf;Landroid/content/Context;Lr65;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Ll45;)V

    return-void
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lvw1;->b:Ljava/lang/Object;

    check-cast v1, Lb0e;

    iget-object v2, v0, Lvw1;->c:Ljava/lang/Object;

    move-object v6, v2

    check-cast v6, Lu4l;

    iget-object v2, v0, Lvw1;->d:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Lv8a;

    iget-object v2, v0, Lvw1;->e:Ljava/lang/Object;

    move-object v9, v2

    check-cast v9, Lyhe;

    iget-object v2, v0, Lvw1;->f:Ljava/lang/Object;

    move-object v10, v2

    check-cast v10, Lpde;

    iget-object v0, v0, Lvw1;->g:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ls9i;

    new-instance v3, Ld0e;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    move-object/from16 v2, p1

    invoke-static {v0, v2}, Lsf2;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lsf2;

    move-result-object v4

    iget-object v5, v1, Lb0e;->e:Lpde;

    iget-object v7, v1, Lb0e;->g:Lpde;

    new-instance v12, Ls2;

    iget-object v14, v1, Lb0e;->j:Li0e;

    const/16 v18, 0x0

    const/16 v19, 0xf

    const/4 v13, 0x2

    const-class v15, Li0e;

    const-string v16, "handleTabGroupItemClick"

    const-string v17, "handleTabGroupItemClick(Lcom/opera/android/tabui2/MiniTabAdapter$TabGroupItem;Lcom/opera/android/tabui2/MiniTabViewHolder;)V"

    invoke-direct/range {v12 .. v19}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct/range {v3 .. v12}, Ld0e;-><init>(Lsf2;Lpde;Lu4l;Lpde;Lv8a;Lyhe;Lpde;Ls9i;Ls2;)V

    return-object v3
.end method

.method public final i(Lcue;Z)Ljava/lang/Object;
    .registers 13

    iget-object p2, p0, Lvw1;->b:Ljava/lang/Object;

    check-cast p2, Lau8;

    iget-object v0, p0, Lvw1;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lvw1;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lxw8;

    iget-object v0, p0, Lvw1;->e:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lx5f;

    iget-object v0, p0, Lvw1;->f:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lumi;

    iget-object p0, p0, Lvw1;->g:Ljava/lang/Object;

    move-object v9, p0

    check-cast v9, Lqq6;

    sget-object p0, Lcue;->b:Lcue;

    const/4 v0, 0x0

    if-ne p1, p0, :cond_26

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0

    :cond_26
    iget-object p0, p2, Lau8;->b:Ljava/util/EnumMap;

    invoke-virtual {p0, p1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxue;

    if-eqz p0, :cond_51

    new-instance v1, Lvue;

    iget-object p0, p0, Lxue;->a:Lfqe;

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object v4

    new-instance v5, Lhu8;

    invoke-direct {v5, v3}, Lhu8;-><init>(Lxw8;)V

    iget-object p0, v2, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lrl3;

    const/4 p1, 0x1

    invoke-direct {v8, p0, p1}, Lrl3;-><init>(Lysj;B)V

    invoke-direct/range {v1 .. v9}, Lvue;-><init>(Lcom/opera/android/BrowserActivity;Lxw8;Luqe;Lhu8;Lx5f;Lumi;Lrl3;Lqq6;)V

    return-object v1

    :cond_51
    const-string p0, "Unsupported news source: "

    invoke-static {p1, p0}, Lbxl;->l(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final run()Lqwl;
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lvw1;->a:B

    const/4 v2, 0x0

    iget-object v3, v0, Lvw1;->g:Ljava/lang/Object;

    iget-object v4, v0, Lvw1;->f:Ljava/lang/Object;

    iget-object v5, v0, Lvw1;->e:Ljava/lang/Object;

    iget-object v6, v0, Lvw1;->d:Ljava/lang/Object;

    iget-object v7, v0, Lvw1;->c:Ljava/lang/Object;

    iget-object v0, v0, Lvw1;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_5e

    move-object v9, v0

    check-cast v9, Lle9;

    move-object v12, v7

    check-cast v12, Ljava/lang/String;

    move-object v13, v6

    check-cast v13, Ljava/lang/String;

    move-object v14, v5

    check-cast v14, Lx1b;

    move-object v15, v4

    check-cast v15, Lqn;

    move-object/from16 v16, v3

    check-cast v16, Laxl;

    iget-object v0, v9, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v11

    if-eqz v10, :cond_3b

    if-eqz v11, :cond_3b

    new-instance v8, Lae9;

    invoke-direct/range {v8 .. v16}, Lae9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx1b;Lqn;Laxl;)V

    move-object v2, v8

    :cond_3b
    return-object v2

    :pswitch_3c
    check-cast v0, Lle9;

    check-cast v7, Ljava/lang/String;

    check-cast v6, Ljava/lang/String;

    move-object v8, v5

    check-cast v8, Ljava/lang/String;

    move-object v9, v4

    check-cast v9, Lse9;

    move-object v10, v3

    check-cast v10, Lse9;

    iget-object v1, v0, Lle9;->d:Loji;

    invoke-virtual {v1}, Loji;->r()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5d

    new-instance v3, Lae9;

    move-object v4, v7

    move-object v7, v6

    move-object v6, v4

    move-object v4, v0

    invoke-direct/range {v3 .. v10}, Lae9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lse9;Lse9;)V

    move-object v2, v3

    :cond_5d
    return-object v2

    :pswitch_data_5e
    .packed-switch 0x2
        :pswitch_3c
    .end packed-switch
.end method
