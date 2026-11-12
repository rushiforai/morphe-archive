.class public final synthetic Lj5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lj5g;->a:B

    iput-object p1, p0, Lj5g;->b:Ljava/lang/Object;

    iput-object p2, p0, Lj5g;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lj5g;->a:B

    const/16 v3, 0x1388

    const v4, 0x7f14076b

    sget-object v5, Leo0;->c:Leo0;

    sget-object v6, Leo0;->b:Leo0;

    const-string v7, "android.intent.action.VIEW"

    const/4 v8, 0x3

    const-string v9, "image/png"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    iget-object v13, v0, Lj5g;->c:Ljava/lang/Object;

    iget-object v0, v0, Lj5g;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_432

    check-cast v0, Lcom/usercentrics/sdk/ui/secondLayer/component/header/UCSecondLayerHeader;

    check-cast v13, Lufm;

    iget-object v2, v0, Lcom/usercentrics/sdk/ui/secondLayer/component/header/UCSecondLayerHeader;->B:Lbfm;

    if-eqz v2, :cond_27

    move-object v11, v2

    :cond_27
    check-cast v11, Ldfm;

    iget-object v2, v11, Ldfm;->a:Lxbf;

    iget-object v2, v2, Lxbf;->g:Ljava/lang/Object;

    check-cast v2, Loqg;

    if-eqz v2, :cond_5d

    iget-object v3, v2, Loqg;->a:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5d

    iget-object v2, v2, Loqg;->b:Lnqg;

    iget-object v2, v2, Lnqg;->a:Ljava/lang/String;

    new-instance v4, Lh0c;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5, v13}, Lh0c;-><init>(Landroid/content/Context;Lufm;)V

    new-instance v14, Llrk;

    const/16 v20, 0x0

    const/16 v21, 0x9

    const/4 v15, 0x1

    const-class v17, Lcom/usercentrics/sdk/ui/secondLayer/component/header/UCSecondLayerHeader;

    const-string v18, "onLanguageSelected"

    const-string v19, "onLanguageSelected(Ljava/lang/String;)V"

    move-object/from16 v16, v0

    invoke-direct/range {v14 .. v21}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iput-object v14, v4, Lh0c;->d:Lkotlin/jvm/functions/Function1;

    invoke-virtual {v4, v1, v3, v2}, Lh0c;->b(Landroid/view/View;Ljava/util/List;Ljava/lang/String;)V

    :cond_5d
    return-void

    :pswitch_5e
    check-cast v0, Lcom/usercentrics/sdk/ui/secondLayer/component/header/UCSecondLayerHeader;

    check-cast v13, Lqqg;

    iget-object v0, v0, Lcom/usercentrics/sdk/ui/secondLayer/component/header/UCSecondLayerHeader;->B:Lbfm;

    if-eqz v0, :cond_67

    move-object v11, v0

    :cond_67
    check-cast v11, Ldfm;

    invoke-virtual {v11, v13}, Ldfm;->a(Lqqg;)V

    return-void

    :pswitch_6d
    check-cast v0, Lzdm;

    check-cast v13, Lqqg;

    iget-object v1, v0, Lzdm;->g:Lcom/usercentrics/sdk/c;

    iget-object v1, v1, Lcom/usercentrics/sdk/c;->a:Lcom/usercentrics/sdk/UsercentricsBanner;

    iget-object v2, v13, Lqqg;->c:Lrqg;

    iget-object v3, v13, Lqqg;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    iget-object v2, v2, Lrqg;->a:Ljava/lang/Integer;

    if-eqz v4, :cond_9a

    if-eq v4, v12, :cond_96

    const/4 v5, 0x2

    if-eq v4, v5, :cond_92

    if-ne v4, v8, :cond_b5

    invoke-static {v1}, Lcom/usercentrics/sdk/UsercentricsBanner;->access$getOnLoginClickedCallback$p(Lcom/usercentrics/sdk/UsercentricsBanner;)Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_b5

    invoke-interface {v0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b5

    :cond_92
    invoke-virtual {v0, v2}, Lzdm;->f(Ljava/lang/Integer;)V

    goto :goto_b5

    :cond_96
    invoke-virtual {v0, v2}, Lzdm;->f(Ljava/lang/Integer;)V

    goto :goto_b5

    :cond_9a
    invoke-static {v1}, Lcom/usercentrics/sdk/UsercentricsBanner;->access$getContext(Lcom/usercentrics/sdk/UsercentricsBanner;)Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_a7

    if-nez v3, :cond_a4

    const-string v3, ""

    :cond_a4
    invoke-static {v0, v3}, Lcs5;->k0(Landroid/content/Context;Ljava/lang/String;)V

    :cond_a7
    iget-object v0, v13, Lqqg;->d:Lpvm;

    sget-object v1, Ldqg;->c:Ldcl;

    if-nez v1, :cond_b2

    new-instance v1, Ls16;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    :cond_b2
    invoke-interface {v1, v0}, Lqvm;->a(Lpvm;)V

    :cond_b5
    :goto_b5
    return-void

    :pswitch_b6
    check-cast v0, Lldm;

    check-cast v13, Lmdm;

    iget-boolean v1, v0, Lldm;->s:Z

    xor-int/2addr v1, v12

    iput-boolean v1, v0, Lldm;->s:Z

    iget-object v2, v13, Lmdm;->c:Lof3;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v2, v1}, Lof3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lldm;->r:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/usercentrics/sdk/ui/components/UCButton;

    iget-boolean v0, v0, Lldm;->s:Z

    if-eqz v0, :cond_d7

    const-string v0, "Opt in all"

    goto :goto_d9

    :cond_d7
    const-string v0, "Opt out all"

    :goto_d9
    iget-object v1, v1, Lcom/usercentrics/sdk/ui/components/UCButton;->p:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/usercentrics/sdk/ui/components/UCTextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_e5
    check-cast v0, Ly5m;

    check-cast v13, Lfl3;

    iget-object v1, v13, Lfl3;->u:Lel3;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v0

    iget-object v1, v1, Lel3;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lll3;

    iget-object v1, v13, Lfl3;->t:Lkl3;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_106

    iget-object v0, v13, Lfl3;->s:Ljl3;

    invoke-virtual {v0}, Ljl3;->f()Ljl3;

    move-result-object v0

    goto :goto_108

    :cond_106
    check-cast v0, Ljl3;

    :goto_108
    iput-object v0, v13, Lfl3;->s:Ljl3;

    invoke-virtual {v13}, Lfl3;->J0()V

    return-void

    :pswitch_10e
    check-cast v0, Ly4m;

    check-cast v13, Ljava/lang/String;

    iget-object v1, v0, Ly4m;->d:Lv3m;

    iget-object v1, v1, Lv3m;->d:Lplk;

    iget-object v2, v1, Lplk;->b:Ljava/lang/Object;

    check-cast v2, Lxl;

    new-instance v3, Le4m;

    invoke-direct {v3, v1, v13, v12}, Le4m;-><init>(Lplk;Ljava/lang/String;B)V

    invoke-virtual {v2, v3}, Lxl;->j(Lcom/opera/api/Callback;)V

    iget-object v0, v0, Ly4m;->f:Lr4m;

    iget-object v1, v0, Lr4m;->f:Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    invoke-virtual {v0, v1, v12}, Lr4m;->Y(Lb2l;I)V

    return-void

    :pswitch_12c
    check-cast v0, Lev5;

    check-cast v13, Lr3m;

    iget-object v0, v0, Lev5;->c:Ljava/lang/Object;

    check-cast v0, Lu3m;

    iget-object v1, v0, Lu3m;->t:Ls3m;

    iget-object v2, v13, Lr3m;->a:Lszb;

    invoke-interface {v1, v2}, Ls3m;->a(Lszb;)V

    invoke-virtual {v0}, Lryl;->g0()V

    return-void

    :pswitch_13f
    check-cast v0, Lwyl;

    check-cast v13, Lcom/opera/android/settings/BigSwitchButton;

    iget-byte v1, v13, Lcom/opera/android/settings/BigSwitchButton;->c:B

    if-eq v1, v8, :cond_148

    move v10, v12

    :cond_148
    iget-boolean v1, v0, Lwyl;->A:Z

    if-nez v1, :cond_169

    if-eqz v10, :cond_170

    iget-object v0, v0, Lwyl;->z:Lpt1;

    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lgpk;

    const/16 v2, 0x1a

    invoke-direct {v1, v2}, Lgpk;-><init>(B)V

    const v2, 0x7f1412d3

    const v3, 0x7f1412d2

    invoke-static {v0, v1, v2, v3}, Lxf8;->s0(Landroid/content/Context;Lekj;II)V

    goto :goto_170

    :cond_169
    iget-object v0, v0, Lwyl;->u:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "tracker_blocker"

    invoke-virtual {v0, v10, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_170
    :goto_170
    return-void

    :pswitch_171
    check-cast v0, Llrk;

    check-cast v13, Lbgm;

    if-eqz v0, :cond_17c

    iget-object v1, v13, Lbgm;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17c
    return-void

    :pswitch_17d
    check-cast v0, Landroid/view/View;

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_188

    move v12, v10

    :cond_188
    if-eqz v12, :cond_18c

    const/16 v10, 0x8

    :cond_18c
    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    if-eqz v12, :cond_195

    const v0, 0x7f08051a

    goto :goto_198

    :cond_195
    const v0, 0x7f080520

    :goto_198
    new-instance v1, Llxh;

    invoke-direct {v1, v0}, Llxh;-><init>(I)V

    invoke-virtual {v13, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v(Lb8h;)V

    return-void

    :pswitch_1a1
    check-cast v0, Lo9k;

    check-cast v13, Lor2;

    iget-boolean v1, v0, Lo9k;->l:Z

    if-nez v1, :cond_1b5

    iput-boolean v12, v0, Lo9k;->l:Z

    iget-object v1, v13, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v1, v12}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    invoke-virtual {v0}, Lo9k;->i0()V

    :cond_1b5
    return-void

    :pswitch_1b6
    check-cast v0, Ltl3;

    check-cast v13, Landroid/net/Uri;

    iget-object v0, v0, Ltl3;->e:Ljava/lang/Object;

    check-cast v0, Lkuj;

    iget-object v0, v0, Lkuj;->A:Ldx3;

    sget-object v1, Ls29;->a:Ljava/util/HashSet;

    const-string v1, "file"

    invoke-virtual {v13}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d2

    invoke-static {v0, v13, v9}, Lcom/opera/android/downloads/DownloadProvider;->b(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    :cond_1d2
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v13, v9}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_1e1
    check-cast v0, Ljuj;

    check-cast v13, Landroid/net/Uri;

    iget v1, v0, Ljuj;->z:I

    add-int/2addr v1, v12

    iput v1, v0, Ljuj;->z:I

    new-instance v1, Lghf;

    new-instance v2, Li4d;

    new-instance v3, Lvvf;

    const/16 v4, 0x13

    invoke-direct {v3, v13, v9, v4}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v1, v2}, Lghf;-><init>(Li4d;)V

    new-instance v2, Ltxi;

    const/16 v3, 0x9

    invoke-direct {v2, v0, v3}, Ltxi;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v1, Lghf;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return-void

    :pswitch_20c
    check-cast v0, Lasj;

    check-cast v13, Landroid/view/View$OnClickListener;

    invoke-interface {v13, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    invoke-virtual {v0, v12}, Lna3;->b(I)V

    return-void

    :pswitch_217
    check-cast v0, Lqmj;

    check-cast v13, Lpmj;

    iget-object v0, v0, Lqmj;->c:Lcom/opera/api/Callback;

    iget-object v1, v13, Lpmj;->c:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_223
    check-cast v0, Lshf;

    check-cast v13, Ln8g;

    iget-object v0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ld7h;

    iget-object v0, v0, Ld7h;->b:Ljava/lang/Object;

    check-cast v0, Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ls5h;

    const/16 v2, 0x3e

    invoke-static {v1, v13, v10, v10, v2}, Ls5h;->a(Ls5h;Ln8g;ZII)Ls5h;

    move-result-object v1

    invoke-virtual {v0, v11, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :pswitch_23f
    check-cast v0, Lucj;

    check-cast v13, Ltcj;

    iget-object v0, v0, Lucj;->c:Lldh;

    iget-object v1, v13, Ltcj;->a:Lwcj;

    invoke-virtual {v0, v1}, Lldh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_24b
    check-cast v0, Landroid/net/Uri;

    check-cast v13, Lgcj;

    iget-object v1, v13, Lgcj;->r:Ldx3;

    invoke-static {v0}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_25b

    invoke-static {v1, v0, v9}, Lcom/opera/android/downloads/DownloadProvider;->b(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :cond_25b
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v2, v0, v9}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_26a
    check-cast v0, Lz8j;

    check-cast v13, Ltji;

    iget-object v0, v0, Lz8j;->c:Ll6j;

    if-eqz v0, :cond_275

    invoke-virtual {v13, v0}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_275
    return-void

    :pswitch_276
    check-cast v0, Lvxi;

    check-cast v13, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;

    iget-object v1, v0, Lvxi;->f:Ljava/lang/Object;

    check-cast v1, Llz8;

    invoke-virtual {v13}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getCredentialId()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Llz8;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lhjm;->a:Lhjm;

    iget-object v0, v0, Ldej;->b:Lmej;

    invoke-interface {v0, v1}, Lmej;->Q(Lhjm;)V

    return-void

    :pswitch_28d
    check-cast v0, Lami;

    check-cast v13, Ljfh;

    iget-object v0, v0, Lami;->e:Ljava/lang/Object;

    check-cast v0, Llfh;

    check-cast v13, Lhfh;

    iget-boolean v1, v13, Lhfh;->a:Z

    xor-int/2addr v1, v12

    invoke-virtual {v0, v1}, Llfh;->a(Z)V

    return-void

    :pswitch_29e
    check-cast v0, Lami;

    check-cast v13, Lhmi;

    iget-object v0, v0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lpli;

    invoke-virtual {v0, v13}, Lpli;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2aa
    check-cast v0, Lami;

    check-cast v13, Lgfh;

    iget-object v0, v0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lpli;

    check-cast v13, Lffh;

    iget-object v1, v13, Lffh;->a:Lhmi;

    invoke-virtual {v0, v1}, Lpli;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2ba
    check-cast v0, Ls6h;

    check-cast v13, Lknh;

    invoke-virtual {v0}, Ls6h;->I()Z

    move-result v0

    if-eqz v0, :cond_2cc

    iget-object v0, v13, Lknh;->B:Lvl6;

    if-eqz v0, :cond_2c9

    move-object v11, v0

    :cond_2c9
    invoke-virtual {v11}, Lvl6;->S()Z

    :cond_2cc
    return-void

    :pswitch_2cd
    check-cast v0, Lpg5;

    check-cast v13, Lcom/opera/android/custom_views/OperaRateBar;

    iget-object v1, v0, Lpg5;->e:Ljava/lang/Object;

    check-cast v1, Lwjh;

    iget v2, v13, Lcom/opera/android/custom_views/OperaRateBar;->p:I

    iget-object v3, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lvjh;

    iget-object v3, v3, Lvjh;->b:Ljava/lang/Integer;

    if-eqz v3, :cond_306

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v2, :cond_2e8

    sget-object v2, Lujh;->b:Lujh;

    goto :goto_2ea

    :cond_2e8
    sget-object v2, Lujh;->a:Lujh;

    :goto_2ea
    new-instance v4, Lvjh;

    invoke-direct {v4, v2, v3}, Lvjh;-><init>(Lujh;Ljava/lang/Integer;)V

    iput-object v4, v1, Lwjh;->f:Ljava/lang/Object;

    iget-object v2, v1, Lwjh;->e:Ljava/lang/Object;

    check-cast v2, Lsa2;

    invoke-virtual {v2}, Lsa2;->e()Z

    move-result v2

    if-eqz v2, :cond_306

    iget-object v2, v1, Lwjh;->b:Ljava/lang/Object;

    check-cast v2, Lai;

    iget-object v1, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v1, Lvjh;

    invoke-virtual {v2, v1}, Lai;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_306
    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_30a
    check-cast v0, Lpg5;

    check-cast v13, Lq5g;

    iget-object v1, v0, Lpg5;->e:Ljava/lang/Object;

    check-cast v1, Lojh;

    iget-object v2, v13, Lq5g;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    if-eqz v2, :cond_321

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_322

    :cond_321
    move-object v2, v11

    :goto_322
    iget-object v7, v1, Lojh;->d:Lsx8;

    iget-object v8, v1, Lojh;->c:Lsa2;

    invoke-virtual {v8}, Lsa2;->e()Z

    move-result v8

    if-eqz v8, :cond_358

    iget-object v1, v1, Lojh;->a:Lyo7;

    iget-object v8, v1, Lyo7;->b:Ljava/lang/Object;

    check-cast v8, Lcom/opera/api/Callback;

    iget-object v9, v1, Lyo7;->c:Ljava/lang/Object;

    check-cast v9, Lvjh;

    iget-object v1, v1, Lyo7;->d:Ljava/lang/Object;

    check-cast v1, Lqjh;

    new-instance v10, Lpjh;

    if-eqz v7, :cond_340

    iget-object v11, v7, Lsx8;->b:Lee0;

    :cond_340
    iget-object v7, v9, Lvjh;->b:Ljava/lang/Integer;

    invoke-direct {v10, v11, v6, v2, v7}, Lpjh;-><init>(Lee0;Leo0;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-interface {v8, v10}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_358

    iget-object v1, v1, Lqjh;->c:Lgw3;

    new-instance v2, Lglj;

    invoke-direct {v2, v4, v3}, Lglj;-><init>(II)V

    invoke-virtual {v1, v2}, Lgw3;->f(Lo93;)V

    :cond_358
    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_35c
    check-cast v0, Lljh;

    check-cast v13, Lq5g;

    iget-object v1, v0, Lljh;->f:Ljava/lang/Object;

    check-cast v1, Lojh;

    iget-object v2, v13, Lq5g;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    if-eqz v2, :cond_373

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_374

    :cond_373
    move-object v2, v11

    :goto_374
    iget-object v7, v1, Lojh;->d:Lsx8;

    iget-object v8, v1, Lojh;->c:Lsa2;

    invoke-virtual {v8}, Lsa2;->e()Z

    move-result v8

    if-eqz v8, :cond_3aa

    iget-object v1, v1, Lojh;->a:Lyo7;

    iget-object v8, v1, Lyo7;->b:Ljava/lang/Object;

    check-cast v8, Lcom/opera/api/Callback;

    iget-object v9, v1, Lyo7;->c:Ljava/lang/Object;

    check-cast v9, Lvjh;

    iget-object v1, v1, Lyo7;->d:Ljava/lang/Object;

    check-cast v1, Lqjh;

    new-instance v10, Lpjh;

    if-eqz v7, :cond_392

    iget-object v11, v7, Lsx8;->b:Lee0;

    :cond_392
    iget-object v7, v9, Lvjh;->b:Ljava/lang/Integer;

    invoke-direct {v10, v11, v6, v2, v7}, Lpjh;-><init>(Lee0;Leo0;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-interface {v8, v10}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3aa

    iget-object v1, v1, Lqjh;->c:Lgw3;

    new-instance v2, Lglj;

    invoke-direct {v2, v4, v3}, Lglj;-><init>(II)V

    invoke-virtual {v1, v2}, Lgw3;->f(Lo93;)V

    :cond_3aa
    invoke-virtual {v0}, Luim;->h0()V

    return-void

    :pswitch_3ae
    check-cast v0, Lljh;

    check-cast v13, Lcom/opera/android/custom_views/OperaRateBar;

    iget-object v1, v0, Lljh;->f:Ljava/lang/Object;

    check-cast v1, Lwjh;

    iget v2, v13, Lcom/opera/android/custom_views/OperaRateBar;->p:I

    iget-object v3, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lvjh;

    iget-object v3, v3, Lvjh;->b:Ljava/lang/Integer;

    if-eqz v3, :cond_3e7

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v2, :cond_3c9

    sget-object v2, Lujh;->b:Lujh;

    goto :goto_3cb

    :cond_3c9
    sget-object v2, Lujh;->a:Lujh;

    :goto_3cb
    new-instance v4, Lvjh;

    invoke-direct {v4, v2, v3}, Lvjh;-><init>(Lujh;Ljava/lang/Integer;)V

    iput-object v4, v1, Lwjh;->f:Ljava/lang/Object;

    iget-object v2, v1, Lwjh;->e:Ljava/lang/Object;

    check-cast v2, Lsa2;

    invoke-virtual {v2}, Lsa2;->e()Z

    move-result v2

    if-eqz v2, :cond_3e7

    iget-object v2, v1, Lwjh;->b:Ljava/lang/Object;

    check-cast v2, Lai;

    iget-object v1, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v1, Lvjh;

    invoke-virtual {v2, v1}, Lai;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3e7
    invoke-virtual {v0}, Luim;->h0()V

    return-void

    :pswitch_3eb
    check-cast v0, Lhag;

    check-cast v13, Lpmj;

    iget-object v1, v0, Lhag;->b:Luoj;

    iget-object v0, v0, Lhag;->c:Ljava/util/ArrayList;

    invoke-virtual {v13}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgag;

    iget-object v0, v0, Lgag;->a:Ljava/lang/String;

    iget-object v1, v1, Luoj;->s:Lgjm;

    new-instance v2, Lc9g;

    invoke-direct {v2, v0}, Lc9g;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v10}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_40a
    check-cast v0, Lk5g;

    check-cast v13, Lw3g;

    iget-object v0, v0, Lk5g;->c:Lqfb;

    iget-object v0, v0, Lqfb;->b:Ljava/lang/Object;

    check-cast v0, Lt5g;

    invoke-virtual {v0}, Lt5g;->I0()Lt6g;

    move-result-object v0

    iget-object v0, v0, Lt6g;->b:Lot2;

    iget v1, v13, Lw3g;->a:I

    iget-object v2, v0, Lot2;->d:Lcom/opera/android/Lazy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx5g;

    new-instance v3, Leme;

    invoke-direct {v3, v2}, Leme;-><init>(Ljava/lang/Object;)V

    new-instance v4, Llt2;

    invoke-direct {v4, v1, v3, v0}, Llt2;-><init>(ILeme;Lot2;)V

    invoke-static {v2, v4}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_data_432
    .packed-switch 0x0
        :pswitch_40a
        :pswitch_3eb
        :pswitch_3ae
        :pswitch_35c
        :pswitch_30a
        :pswitch_2cd
        :pswitch_2ba
        :pswitch_2aa
        :pswitch_29e
        :pswitch_28d
        :pswitch_276
        :pswitch_26a
        :pswitch_24b
        :pswitch_23f
        :pswitch_223
        :pswitch_217
        :pswitch_20c
        :pswitch_1e1
        :pswitch_1b6
        :pswitch_1a1
        :pswitch_17d
        :pswitch_171
        :pswitch_13f
        :pswitch_12c
        :pswitch_10e
        :pswitch_e5
        :pswitch_b6
        :pswitch_6d
        :pswitch_5e
    .end packed-switch
.end method
