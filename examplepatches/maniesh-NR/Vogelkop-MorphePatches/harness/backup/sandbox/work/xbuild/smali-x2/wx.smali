.class public final synthetic Lwx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lwx;->a:B

    iput-object p1, p0, Lwx;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwx;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lwx;Lf9d;)V
    .registers 4

    const/16 p1, 0x10

    iput-byte p1, p0, Lwx;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwx;->b:Ljava/lang/Object;

    iput-object p3, p0, Lwx;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 24

    move-object/from16 v0, p0

    iget-byte v1, v0, Lwx;->a:B

    const v2, 0x7f140800

    const/16 v3, 0xa

    sget-object v4, Lijm;->b:Lijm;

    const/16 v5, 0x13

    const/4 v6, 0x3

    const/16 v7, 0x8

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    iget-object v12, v0, Lwx;->c:Ljava/lang/Object;

    iget-object v0, v0, Lwx;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_a7e

    check-cast v0, Les5;

    check-cast v12, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    invoke-interface {v0, v1, v12}, Les5;->a(Landroid/net/Uri;Ljava/lang/String;)V

    return-void

    :pswitch_27
    check-cast v0, Lp35;

    check-cast v12, Landroid/view/LayoutInflater;

    move-object/from16 v1, p1

    check-cast v1, Ls25;

    iget-object v2, v0, Lp35;->r:Ljava/util/ArrayList;

    invoke-static {}, Lz4o;->T()[Lr25;

    move-result-object v3

    move v4, v9

    :goto_36
    const/4 v5, 0x5

    if-ge v4, v5, :cond_4c

    aget-object v5, v3, v4

    invoke-virtual {v5, v1}, Lr25;->d(Ls25;)Z

    move-result v10

    if-eqz v10, :cond_49

    new-instance v10, Lo35;

    invoke-direct {v10, v0, v12, v5, v9}, Lo35;-><init>(Lp35;Landroid/view/LayoutInflater;Lr25;Z)V

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_49
    add-int/lit8 v4, v4, 0x1

    goto :goto_36

    :cond_4c
    new-instance v3, Lv25;

    invoke-direct {v3}, Lv25;-><init>()V

    new-instance v4, Lz25;

    invoke-direct {v4, v11}, Lz25;-><init>(B)V

    new-instance v5, Ln25;

    invoke-direct {v5}, Ln25;-><init>()V

    new-instance v10, Lt25;

    invoke-direct {v10, v9}, Lt25;-><init>(B)V

    const/4 v13, 0x4

    new-array v14, v13, [Lr25;

    aput-object v3, v14, v9

    aput-object v4, v14, v11

    aput-object v5, v14, v8

    aput-object v10, v14, v6

    const v3, 0x7f0d037f

    iget-object v4, v0, Lp35;->t:Landroid/view/ViewGroup;

    invoke-virtual {v12, v3, v4, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v3, v0, Lp35;->x:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v4, v0, Lp35;->t:Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v3, v0, Lp35;->x:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v12}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v14}, Lz4o;->V(Landroid/content/Context;[Lr25;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v3, v0, Lp35;->x:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v4, Lyk4;

    invoke-direct {v4, v0, v8}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move v3, v9

    :goto_95
    if-ge v3, v13, :cond_ba

    aget-object v4, v14, v3

    invoke-virtual {v4, v1}, Lr25;->d(Ls25;)Z

    move-result v5

    if-eqz v5, :cond_b7

    new-instance v5, Lo35;

    invoke-direct {v5, v0, v12, v4, v11}, Lo35;-><init>(Lp35;Landroid/view/LayoutInflater;Lr25;Z)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v11

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lo35;

    iget-object v4, v4, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    :cond_b7
    add-int/lit8 v3, v3, 0x1

    goto :goto_95

    :cond_ba
    iget-object v1, v0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    const-string v3, "exit_clear_data_categories"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lz4o;->A0(Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_ca
    if-ge v9, v3, :cond_e2

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v9, v9, 0x1

    check-cast v4, Lo35;

    iget-object v5, v4, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v4, v4, Lo35;->a:Lr25;

    iget-object v4, v4, Lr25;->a:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v5, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    goto :goto_ca

    :cond_e2
    iget-object v1, v0, Lp35;->u:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "exit_dialog_enabled"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v1, v0, Lp35;->u:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Ljl4;

    const/16 v4, 0xd

    invoke-direct {v3, v0, v4}, Ljl4;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object v0, v0, Lp35;->w:Lac1;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    iput v1, v0, Lac1;->a:I

    invoke-virtual {v0}, Lac1;->k()V

    return-void

    :pswitch_106
    check-cast v0, Ls25;

    check-cast v12, Ljava/lang/Runnable;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_11b

    iget-object v0, v0, Ls25;->f:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "onboarding_deleted"

    invoke-virtual {v0, v11, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_11b
    invoke-interface {v12}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_11f
    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    check-cast v12, Llsc;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    sget-object v2, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_132

    invoke-virtual {v0, v12}, Lcom/opera/android/browser/chromium/ChromiumContent;->w(Llsc;)V

    :cond_132
    return-void

    :pswitch_133
    check-cast v0, Lo8f;

    check-cast v12, Lyu4;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v2, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v3, v2, Lq0i;

    if-nez v3, :cond_142

    move-object v10, v2

    :cond_142
    check-cast v10, Lnfj;

    if-eqz v10, :cond_160

    iget-object v2, v12, Lyu4;->d:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "last-language-header"

    iget-object v4, v10, Lnfj;->b:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v2, v10, Lnfj;->a:Lmfj;

    iput-object v2, v12, Lyu4;->e:Lmfj;

    :cond_160
    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_16c

    sget-object v2, Lt0i;->b:Lp0i;

    check-cast v1, Lnfj;

    iget-object v1, v1, Lnfj;->a:Lmfj;

    :cond_16c
    new-instance v2, Lt0i;

    invoke-direct {v2, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_175
    check-cast v0, Lf84;

    check-cast v12, Liyk;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v12, v1}, Liyk;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_184
    check-cast v0, Lb2l;

    check-cast v12, Lcom/opera/android/BrowserActivity;

    move-object/from16 v1, p1

    check-cast v1, Ltun;

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lsu;

    invoke-direct {v3, v12, v1, v2, v7}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v11, v3}, Ld7l;->d0(Ljava/lang/String;ZLcom/opera/api/Callback;)V

    return-void

    :pswitch_19b
    check-cast v0, Ljava/lang/String;

    check-cast v12, Laz4;

    move-object/from16 v1, p1

    check-cast v1, Ll2g;

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    const-string v2, "https"

    if-nez v1, :cond_1bf

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1e3

    :cond_1bf
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, v1, Ll2g;->h:J

    cmp-long v0, v3, v5

    if-lez v0, :cond_1e1

    iget-object v0, v1, Ll2g;->c:Ljava/lang/String;

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1e3

    :cond_1e1
    iget-object v0, v1, Ll2g;->b:Ljava/lang/String;

    :goto_1e3
    invoke-virtual {v12, v0}, Laz4;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1e7
    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v12, Lolh;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    if-eqz v1, :cond_1fd

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v6, -0x1

    cmp-long v2, v2, v6

    if-eqz v2, :cond_218

    :cond_1fd
    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    new-instance v2, Lbv3;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    new-instance v1, Lfv2;

    invoke-direct {v1, v0, v5}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v12, v6, v7, v1}, Lbv3;-><init>(Lolh;JLfv2;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v2, v4}, Lr22;->b(Ljjm;Lijm;)V

    :cond_218
    return-void

    :pswitch_219
    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v12, Lcom/opera/android/browser/BrowserFragment;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    check-cast v1, Ljava/lang/Iterable;

    instance-of v2, v1, Ljava/util/Collection;

    if-eqz v2, :cond_232

    move-object v2, v1

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_257

    :cond_232
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_236
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_257

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_236

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v1

    iget-boolean v1, v1, Lb7j;->b:Z

    if-ne v1, v11, :cond_257

    move v9, v11

    :cond_257
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->B:Lcom/opera/android/browser/BrowserContainer;

    if-eqz v0, :cond_25c

    move-object v10, v0

    :cond_25c
    invoke-virtual {v10, v7, v9}, Lcom/opera/android/browser/BrowserContainer;->e(IZ)V

    invoke-virtual {v10}, Landroid/view/View;->requestLayout()V

    iget-object v0, v12, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    if-eqz v0, :cond_26d

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iput-boolean v9, v0, Lzy4;->o:Z

    invoke-virtual {v0}, Lzy4;->T()V

    :cond_26d
    return-void

    :pswitch_26e
    check-cast v0, Lgn3;

    check-cast v12, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Lml3;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12}, Lalo;->j(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v2

    iget-object v0, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_283
    :goto_283
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_29d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lal3;

    invoke-interface {v5}, Lal3;->getId()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6, v11}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v5

    if-nez v5, :cond_283

    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_283

    :cond_29d
    iget-object v4, v0, Lcom/opera/android/bookmarks/h;->c:Lcom/opera/android/bookmarks/g;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-le v5, v11, :cond_2bb

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v2, Lta2;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v6

    invoke-direct {v2, v6}, Lta2;-><init>(Lcom/opera/android/bookmarks/c;)V

    invoke-static {v2}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v2

    invoke-static {v5, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    move-object v2, v5

    :cond_2bb
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    :try_start_2c0
    iput-boolean v9, v4, Lcom/opera/android/bookmarks/g;->a:Z

    move-object v6, v1

    check-cast v6, Lcom/opera/android/bookmarks/c;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v9

    :cond_2ca
    :goto_2ca
    if-ge v8, v7, :cond_30e

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v8, v8, 0x1

    check-cast v10, Lal3;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v12

    invoke-interface {v10, v12}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v12

    invoke-static {v12, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2ca

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v12

    invoke-interface {v10, v12}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v12

    new-instance v13, Lmn;

    invoke-direct {v13, v3}, Lmn;-><init>(B)V

    invoke-virtual {v5, v12, v13}, Ljava/util/HashMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    check-cast v10, Lcom/opera/android/bookmarks/b;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v10}, Lol3;->g()Z

    move-result v12

    iget-object v13, v6, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v12, :cond_30a

    iget-object v12, v6, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-eqz v12, :cond_30a

    move-object v13, v12

    :cond_30a
    invoke-static {v10, v13, v9}, Lcom/opera/android/bookmarks/c;->n(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V
    :try_end_30d
    .catchall {:try_start_2c0 .. :try_end_30d} :catchall_341

    goto :goto_2ca

    :cond_30e
    iput-boolean v11, v4, Lcom/opera/android/bookmarks/g;->a:Z

    iget-object v0, v0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :cond_316
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_340

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lql3;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_32a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_316

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lml3;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v2, v6, v4, v1}, Lql3;->d(Ljava/util/Collection;Lml3;Lml3;)V

    goto :goto_32a

    :cond_340
    return-void

    :catchall_341
    move-exception v0

    iput-boolean v11, v4, Lcom/opera/android/bookmarks/g;->a:Z

    throw v0

    :pswitch_345
    check-cast v0, Lim3;

    check-cast v12, Lqim;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_35a

    const v1, 0x7f14071c

    goto :goto_35d

    :cond_35a
    const v1, 0x7f14071a

    :goto_35d
    new-instance v2, Lglj;

    const/16 v3, 0x1388

    invoke-direct {v2, v1, v3}, Lglj;-><init>(II)V

    iget-object v0, v0, Lltl;->n:Lqm9;

    if-nez v0, :cond_371

    iget-object v0, v12, Lqim;->e:Lysj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v2, v4}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_374

    :cond_371
    invoke-virtual {v0, v2}, Lqm9;->f(Lo93;)V

    :goto_374
    return-void

    :pswitch_375
    check-cast v0, Li53;

    check-cast v12, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Ljl3;

    iget-object v1, v1, Lll3;->a:Lal3;

    invoke-interface {v1}, Lal3;->getId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_39a

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0, v1, v2, v11}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lml3;

    :cond_39a
    if-eqz v10, :cond_39f

    invoke-interface {v12, v10}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_39f
    return-void

    :pswitch_3a0
    check-cast v0, Lwx;

    check-cast v12, Lf9d;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_3c3

    move-object v10, v1

    check-cast v10, Ljava/io/File;

    iget-object v1, v12, Lf9d;->a:Lwv1;

    iget-object v1, v1, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v6, v11}, Lx5f;->K0(IZ)V

    goto :goto_41a

    :cond_3c3
    iget-object v1, v12, Lf9d;->a:Lwv1;

    iget-object v1, v1, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v6, v9}, Lx5f;->K0(IZ)V

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_40d

    sget-object v2, Lbz8;->a:Ljava/util/List;

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lbz8;->a:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3e6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_40e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Laz8;

    iget-object v5, v4, Laz8;->a:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3f8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3e6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v2, v6, v9}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_3f8

    iget-object v1, v4, Laz8;->b:Ljava/lang/String;

    goto :goto_40e

    :cond_40d
    move-object v1, v10

    :cond_40e
    :goto_40e
    if-nez v1, :cond_412

    const-string v1, ""

    :cond_412
    new-instance v2, Le9d;

    invoke-direct {v2, v1}, Le9d;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v2}, Lf9d;->a(Loup;)V

    :goto_41a
    invoke-virtual {v0, v10}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_41e
    check-cast v0, Lcj3;

    check-cast v12, Ljava/util/Set;

    move-object/from16 v1, p1

    check-cast v1, Ljava/io/File;

    if-eqz v1, :cond_4b3

    check-cast v12, Ljava/lang/Iterable;

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_42e
    :goto_42e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4b3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwj3;

    iget-object v4, v0, Lcj3;->i:Ljava/util/LinkedHashSet;

    invoke-interface {v4, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    new-instance v4, Lbj3;

    iget-object v5, v3, Lwj3;->a:Lsj3;

    iget-object v6, v3, Lwj3;->b:Ljava/lang/String;

    invoke-direct {v4, v5, v6}, Lbj3;-><init>(Lsj3;Ljava/lang/String;)V

    iget-object v5, v0, Lcj3;->g:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42e

    new-instance v4, Lvj3;

    iget-object v3, v3, Lwj3;->a:Lsj3;

    new-instance v5, Lak3;

    invoke-direct {v5, v1, v6}, Lak3;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v4, v3, v5}, Lvj3;-><init>(Lsj3;Ltj3;)V

    iget-object v3, v0, Lcj3;->d:Ljze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v6, v0, Lcj3;->j:Ljava/util/Set;

    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_473
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_497

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Luj3;

    iget-object v8, v8, Luj3;->b:Lwj3;

    iget-object v9, v8, Lwj3;->a:Lsj3;

    iget-object v11, v4, Lvj3;->a:Lsj3;

    if-ne v9, v11, :cond_473

    iget-object v8, v8, Lwj3;->b:Ljava/lang/String;

    iget-object v9, v4, Lvj3;->b:Ltj3;

    invoke-interface {v9}, Ltj3;->a()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_473

    goto :goto_498

    :cond_497
    move-object v7, v10

    :goto_498
    check-cast v7, Luj3;

    if-eqz v7, :cond_4ae

    iget-object v4, v7, Luj3;->a:Lvj3;

    invoke-interface {v5, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v4, v0, Lcj3;->j:Ljava/util/Set;

    check-cast v4, Ljava/lang/Iterable;

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v4

    invoke-interface {v4, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iput-object v4, v0, Lcj3;->j:Ljava/util/Set;

    :cond_4ae
    invoke-virtual {v3, v5}, Ljze;->r(Ljava/lang/Object;)V

    goto/16 :goto_42e

    :cond_4b3
    return-void

    :pswitch_4b4
    check-cast v0, Ln03;

    iget-object v1, v0, Ln03;->b:Lpde;

    iget-object v0, v0, Ln03;->c:Ltsd;

    check-cast v12, Ll03;

    iget-object v2, v12, Ll03;->a:Lqjn;

    move-object/from16 v3, p1

    check-cast v3, Ldnn;

    instance-of v3, v3, Lcnn;

    if-eqz v3, :cond_4e1

    new-instance v3, Lb03;

    iget-object v2, v2, Lqjn;->a:Lxkn;

    iget v4, v2, Lxkn;->d:I

    iget v5, v2, Lxkn;->e:I

    iget v2, v2, Lxkn;->f:I

    invoke-direct {v3, v4, v5, v2}, Lb03;-><init>(III)V

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v12, v0}, Ll03;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4fb

    invoke-static {v1, v3}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    goto :goto_4fb

    :cond_4e1
    new-instance v3, Lb03;

    iget-object v2, v2, Lqjn;->a:Lxkn;

    iget v4, v2, Lxkn;->d:I

    iget v5, v2, Lxkn;->e:I

    iget v2, v2, Lxkn;->f:I

    invoke-direct {v3, v4, v5, v2}, Lb03;-><init>(III)V

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v12, v0}, Ll03;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4fb

    invoke-static {v1, v3}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_4fb
    :goto_4fb
    return-void

    :pswitch_4fc
    check-cast v0, Lhu2;

    check-cast v12, Lw3g;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    iget-object v0, v0, Lhu2;->d:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-virtual {v1, v12}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v12, v1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->G(Lw3g;Ljava/lang/String;)V

    return-void

    :pswitch_50e
    check-cast v0, Lbr2;

    check-cast v12, Lcom/opera/android/autofill/CreditCard;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lbr2;->e:Lode;

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_51e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_536

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcom/opera/android/autofill/Address;

    iget-object v4, v4, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    iget-object v5, v12, Lcom/opera/android/autofill/CreditCard;->g:Ljava/lang/String;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_51e

    move-object v10, v3

    :cond_536
    check-cast v10, Lcom/opera/android/autofill/Address;

    invoke-virtual {v0, v12, v10}, Lbr2;->f(Lcom/opera/android/autofill/CreditCard;Lcom/opera/android/autofill/Address;)Lar2;

    move-result-object v0

    invoke-virtual {v2, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_540
    check-cast v0, Ls62;

    check-cast v12, Lz5i;

    move-object/from16 v1, p1

    check-cast v1, Lu42;

    iput-object v10, v0, Ls62;->B:Lr62;

    iget-object v1, v0, Ls62;->e:Lqb;

    iget-object v2, v0, Ls62;->f:Lesk;

    new-instance v3, Lx2;

    const/16 v4, 0x16

    invoke-direct {v3, v0, v12, v4}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v4, v1, Lqb;->f:Ls62;

    iget-object v5, v1, Lqb;->b:Lyv3;

    if-eq v4, v0, :cond_56f

    iput-object v10, v1, Lqb;->f:Ls62;

    iget-object v4, v1, Lqb;->h:Lrn9;

    if-eqz v4, :cond_564

    invoke-virtual {v4}, Lrn9;->t()V

    :cond_564
    iput-object v0, v1, Lqb;->f:Ls62;

    iput-object v2, v1, Lqb;->g:Lesk;

    iget-object v0, v0, Ls62;->o:Lqdc;

    iget-object v2, v1, Lqb;->c:Lob;

    invoke-virtual {v0, v2}, Lqdc;->a(Lmdc;)V

    :cond_56f
    iget-object v0, v1, Lqb;->h:Lrn9;

    if-eqz v0, :cond_57c

    iget-object v0, v0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_61f

    :cond_57c
    iget-object v0, v1, Lqb;->a:Lji;

    iget-object v0, v0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "aria.sandbox.merge"

    invoke-interface {v0, v2, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5b2

    :try_start_58e
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v0, Lnb;

    const-string v4, "userId"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5aa

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lnb;-><init>(Ljava/lang/String;)V

    move-object v10, v0

    goto :goto_5b2

    :cond_5aa
    new-instance v0, Lorg/json/JSONException;

    const-string v2, "userId is null"

    invoke-direct {v0, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5b2
    .catch Lorg/json/JSONException; {:try_start_58e .. :try_end_5b2} :catch_5b2

    :catch_5b2
    :cond_5b2
    :goto_5b2
    if-eqz v10, :cond_61c

    iget-object v0, v10, Lnb;->a:Ljava/lang/String;

    iget-object v2, v1, Lqb;->d:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lipf;

    sget-object v4, Lepf;->a:Lepf;

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_61c

    sget-object v4, Lgpf;->a:Lgpf;

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d2

    invoke-virtual {v1}, Lqb;->a()V

    goto :goto_61c

    :cond_5d2
    instance-of v4, v2, Lfpf;

    if-eqz v4, :cond_5f5

    check-cast v2, Lfpf;

    iget-object v2, v2, Lfpf;->a:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5f1

    new-instance v0, Lrn9;

    invoke-direct {v0, v1, v3}, Lrn9;-><init>(Lqb;Lkotlin/jvm/functions/Function0;)V

    iput-object v0, v1, Lqb;->h:Lrn9;

    invoke-virtual {v5}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lehf;

    invoke-virtual {v0, v1}, Lrn9;->O(Lehf;)V

    goto :goto_61f

    :cond_5f1
    invoke-virtual {v1}, Lqb;->a()V

    goto :goto_61c

    :cond_5f5
    instance-of v4, v2, Lcpf;

    if-eqz v4, :cond_618

    check-cast v2, Lcpf;

    iget-object v2, v2, Lcpf;->a:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_614

    new-instance v0, Lrn9;

    invoke-direct {v0, v1, v3}, Lrn9;-><init>(Lqb;Lkotlin/jvm/functions/Function0;)V

    iput-object v0, v1, Lqb;->h:Lrn9;

    invoke-virtual {v5}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lehf;

    invoke-virtual {v0, v1}, Lrn9;->O(Lehf;)V

    goto :goto_61f

    :cond_614
    invoke-virtual {v1}, Lqb;->a()V

    goto :goto_61c

    :cond_618
    invoke-static {}, Lh9o;->p()V

    goto :goto_61f

    :cond_61c
    :goto_61c
    invoke-virtual {v3}, Lx2;->invoke()Ljava/lang/Object;

    :goto_61f
    return-void

    :pswitch_620
    check-cast v0, Lt42;

    check-cast v12, Lb2l;

    move-object/from16 v1, p1

    check-cast v1, Lb87;

    iget-object v0, v0, Lt42;->B:Lgv3;

    invoke-virtual {v0}, Lgv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laal;

    invoke-virtual {v0, v1, v12}, Laal;->Q(Lb87;Lb2l;)V

    return-void

    :pswitch_634
    check-cast v0, Lb22;

    check-cast v12, Lb2l;

    move-object/from16 v1, p1

    check-cast v1, Lb87;

    iget-object v0, v0, Lb22;->A:Ldu3;

    invoke-virtual {v0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laal;

    invoke-virtual {v0, v1, v12}, Laal;->Q(Lb87;Lb2l;)V

    return-void

    :pswitch_648
    check-cast v0, Lpjn;

    check-cast v12, Landroid/content/Context;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    if-nez v1, :cond_656

    invoke-virtual {v0, v2}, Lpjn;->m(I)V

    goto :goto_66a

    :cond_656
    new-instance v0, Lghf;

    new-instance v2, Li4d;

    new-instance v3, Lvvf;

    const-string v4, "image/png"

    invoke-direct {v3, v1, v4, v5}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v0, v2}, Lghf;-><init>(Li4d;)V

    invoke-virtual {v0, v12}, Lghf;->I(Landroid/content/Context;)Ljjm;

    :goto_66a
    return-void

    :pswitch_66b
    check-cast v0, Ll02;

    check-cast v12, Lt02;

    move-object/from16 v1, p1

    check-cast v1, Lisl;

    instance-of v2, v1, Ljsl;

    if-eqz v2, :cond_683

    check-cast v1, Ljsl;

    iget-object v1, v1, Ljsl;->a:Ljava/lang/String;

    iput-object v1, v0, Ll02;->e:Ljava/lang/String;

    new-instance v0, Li02;

    invoke-direct {v0, v1}, Li02;-><init>(Ljava/lang/String;)V

    goto :goto_68f

    :cond_683
    sget-object v2, Lhsl;->a:Lhsl;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_693

    invoke-virtual {v0}, Ll02;->a()Lk02;

    move-result-object v0

    :goto_68f
    invoke-virtual {v12, v0}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_696

    :cond_693
    invoke-static {}, Lh9o;->p()V

    :goto_696
    return-void

    :pswitch_697
    check-cast v0, Lzz1;

    check-cast v12, Ls02;

    move-object/from16 v1, p1

    check-cast v1, Ltvh;

    iget-object v2, v0, Lzz1;->c:Lesk;

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/w;

    iget-boolean v3, v3, Landroidx/fragment/app/w;->L:Z

    if-nez v3, :cond_6d5

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/w;

    invoke-virtual {v3}, Landroidx/fragment/app/w;->R()Z

    move-result v3

    if-nez v3, :cond_6d5

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/w;

    invoke-static {v3, v9, v1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/w;

    iget-object v0, v0, Lzz1;->b:Lndc;

    new-instance v2, Lbi;

    const/16 v3, 0x14

    invoke-direct {v2, v12, v3}, Lbi;-><init>(Ljava/lang/Object;B)V

    const-string v3, "SyncAuthPortalFragment_request"

    invoke-virtual {v1, v3, v0, v2}, Landroidx/fragment/app/w;->i0(Ljava/lang/String;Lndc;Lmm9;)V

    goto :goto_6da

    :cond_6d5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v12, v0}, Ls02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_6da
    return-void

    :pswitch_6db
    check-cast v0, Ljava/lang/String;

    check-cast v12, Ltz1;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6e9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6ff

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljz1;

    iget-object v4, v4, Ljz1;->a:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6e9

    move-object v10, v3

    :cond_6ff
    check-cast v10, Ljz1;

    if-eqz v10, :cond_70c

    iget-object v0, v12, Ltz1;->h:Lode;

    invoke-static {v1, v10}, Lkotlin/collections/CollectionsKt;->T(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_70c
    return-void

    :pswitch_70d
    check-cast v0, Liy1;

    move-object v3, v12

    check-cast v3, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lly1;

    if-eqz v1, :cond_71a

    iget-object v10, v1, Lly1;->b:Ljava/lang/String;

    :cond_71a
    if-nez v10, :cond_722

    iget-object v0, v0, Liy1;->h:Lgy1;

    invoke-interface {v0, v2}, Lgy1;->o(I)V

    goto :goto_751

    :cond_722
    iget-object v2, v1, Lly1;->d:Lo29;

    iget-object v4, v1, Lly1;->a:Landroid/net/Uri;

    sget-object v5, Lo29;->k:Lo29;

    if-ne v2, v5, :cond_739

    invoke-virtual {v0, v3}, Liy1;->c(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    new-instance v2, Lv12;

    invoke-direct {v2, v4, v1}, Lv12;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    sget-object v1, Lux1;->a:Lux1;

    invoke-virtual {v0, v3, v2, v1}, Liy1;->e(Ljava/lang/String;Lo0g;Lux1;)V

    goto :goto_751

    :cond_739
    iget-object v2, v1, Lly1;->c:Ljava/lang/String;

    sget-object v5, Lsnf;->c:Ljava/lang/String;

    invoke-static {v5, v3, v2}, Lulp;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    new-instance v5, Lpy1;

    invoke-direct {v5, v4, v2}, Lpy1;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    move-object v4, v5

    sget-object v5, Lux1;->a:Lux1;

    iget-object v6, v1, Lly1;->b:Ljava/lang/String;

    iget-object v7, v1, Lly1;->d:Lo29;

    move-object v2, v0

    invoke-virtual/range {v2 .. v7}, Liy1;->d(Ljava/lang/String;Lpy1;Lux1;Ljava/lang/String;Lo29;)V

    :goto_751
    return-void

    :pswitch_752
    check-cast v0, Lau1;

    check-cast v12, Lx5f;

    move-object/from16 v1, p1

    check-cast v1, Lui3;

    iget-object v0, v0, Lau1;->a:Lcom/opera/android/settings/SettingsManager;

    if-nez v1, :cond_765

    new-instance v0, Lss4;

    invoke-direct {v0}, Lss4;-><init>()V

    goto/16 :goto_812

    :cond_765
    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->b()La7j;

    move-result-object v2

    sget-object v3, La7j;->c:La7j;

    if-eq v2, v3, :cond_774

    new-instance v0, Lss4;

    invoke-direct {v0}, Lss4;-><init>()V

    goto/16 :goto_812

    :cond_774
    const-string v2, "ad_blocking_mode.selected_custom_lists"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_781

    move-object v0, v10

    :cond_781
    if-eqz v0, :cond_80d

    :try_start_783
    sget-object v2, Lt0i;->b:Lp0i;

    sget-object v2, Lrpb;->d:Lqpb;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lk72;

    sget-object v4, Lxhk;->a:Lxhk;

    invoke-direct {v3, v4, v9}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {v2, v0, v3}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0
    :try_end_79b
    .catchall {:try_start_783 .. :try_end_79b} :catchall_79c

    goto :goto_7a5

    :catchall_79c
    move-exception v0

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    :goto_7a5
    instance-of v2, v0, Lq0i;

    if-nez v2, :cond_7aa

    move-object v10, v0

    :cond_7aa
    check-cast v10, Ljava/util/Set;

    if-nez v10, :cond_7b0

    sget-object v10, Lv08;->a:Lv08;

    :cond_7b0
    if-eqz v10, :cond_80d

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v10, Ljava/lang/Iterable;

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7c7
    :goto_7c7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7fa

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, v1, Lui3;->d:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwi3;

    if-eqz v6, :cond_7c7

    iget-object v6, v6, Lwi3;->a:Lxi3;

    if-eqz v6, :cond_7c7

    iget-object v6, v6, Lxi3;->b:Lti3;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_7f5

    if-eq v6, v11, :cond_7f3

    if-ne v6, v8, :cond_7ef

    move-object v6, v3

    goto :goto_7f6

    :cond_7ef
    invoke-static {}, Lh9o;->p()V

    goto :goto_826

    :cond_7f3
    move-object v6, v2

    goto :goto_7f6

    :cond_7f5
    move-object v6, v0

    :goto_7f6
    invoke-interface {v6, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_7c7

    :cond_7fa
    new-instance v1, Lss4;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->b0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->b0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->b0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lss4;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    move-object v0, v1

    goto :goto_812

    :cond_80d
    new-instance v0, Lss4;

    invoke-direct {v0}, Lss4;-><init>()V

    :goto_812
    iget-boolean v1, v12, Lx5f;->h:Z

    if-eqz v1, :cond_826

    new-instance v1, Lyo7;

    const/16 v2, 0x15

    iget-object v3, v0, Lss4;->a:Ljava/util/List;

    iget-object v4, v0, Lss4;->b:Ljava/util/List;

    iget-object v0, v0, Lss4;->c:Ljava/util/List;

    invoke-direct {v1, v3, v4, v0, v2}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v12, v1}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_826
    :goto_826
    return-void

    :pswitch_827
    check-cast v0, Lmz;

    check-cast v12, Landroid/content/Context;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v12}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iput-object v1, v0, Lmz;->d:Ljava/lang/String;

    iput-object v2, v0, Lmz;->e:Ljava/lang/String;

    iget-object v1, v0, Lmz;->c:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-boolean v1, v0, Lmz;->f:Z

    if-eqz v1, :cond_84b

    invoke-virtual {v0}, Lmz;->a()Lnz;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmz;->b(Lnz;)V

    :cond_84b
    return-void

    :pswitch_84c
    check-cast v0, Lpy;

    check-cast v12, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lpy;->d:Lry;

    iget-object v0, v0, Lpy;->c:Loy;

    invoke-virtual {v0}, Loy;->a()Ltn;

    move-result-object v0

    invoke-interface {v2, v1, v12, v0}, Lry;->a(Ljava/lang/String;Ljava/lang/String;Ltn;)V

    return-void

    :pswitch_860
    check-cast v0, Lvzk;

    check-cast v12, Lsu;

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    iget-object v2, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v2, Lcy;

    iget-object v4, v2, Lcy;->d:Ljava/lang/Object;

    check-cast v4, Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    const-string v5, "ads_config_last_ip_address"

    invoke-interface {v4, v5, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v6, v2, Lcy;->d:Ljava/lang/Object;

    check-cast v6, Lb59;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    const-string v7, "controller_config_timestamp"

    const-wide/16 v13, 0x0

    invoke-interface {v6, v7, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    cmp-long v11, v7, v13

    const-wide/32 p0, 0x4d3f6400

    const-string v15, "expirationTime"

    const-string v3, "receivingTime"

    const-string v9, "requestTime"

    if-gtz v11, :cond_8a7

    new-instance v2, Lml;

    invoke-direct {v2, v10}, Lml;-><init>(Ljava/lang/String;)V

    goto/16 :goto_956

    :cond_8a7
    const-string v11, "controller_config_request_time"

    invoke-interface {v6, v11, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v17

    cmp-long v11, v17, v13

    if-lez v11, :cond_8bd

    invoke-static/range {v17 .. v18}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v11

    new-instance v13, Llyf;

    invoke-direct {v13, v9, v11}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8bd
    invoke-static {v7, v8}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v11

    new-instance v13, Llyf;

    invoke-direct {v13, v3, v11}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-long v7, v7, p0

    invoke-static {v7, v8}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Llyf;

    invoke-direct {v8, v15, v7}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v7, "controller_config_full_url"

    invoke-interface {v6, v7, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Llyf;

    const-string v8, "configRequest"

    invoke-direct {v7, v8, v6}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Lcy;->b()Ljava/lang/String;

    move-result-object v2

    const-string v6, "configResponse"

    if-nez v2, :cond_8f1

    move-object v7, v10

    goto :goto_93e

    :cond_8f1
    :try_start_8f1
    new-instance v7, Lorb;

    invoke-direct {v7, v2}, Lorb;-><init>(Ljava/lang/String;)V

    const-string v8, "data"

    const-string v11, "dat"

    invoke-virtual {v7, v11}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v11

    if-eqz v11, :cond_93a

    const/4 v13, 0x0

    :goto_901
    iget-object v14, v11, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v13, v14, :cond_93a

    invoke-virtual {v11, v13}, Lvpb;->e(I)Lorb;

    move-result-object v14

    if-nez v14, :cond_914

    move-object/from16 v19, v7

    :catchall_911
    :cond_911
    move-object/from16 v20, v11

    goto :goto_932

    :cond_914
    move-object/from16 v19, v7

    invoke-virtual {v14, v8, v10}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7
    :try_end_91a
    .catch Lorg/json/JSONException; {:try_start_8f1 .. :try_end_91a} :catch_947

    if-eqz v7, :cond_911

    const/4 v10, 0x0

    :try_start_91d
    invoke-static {v7, v10}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v7

    if-eqz v7, :cond_911

    new-instance v10, Lorb;
    :try_end_925
    .catchall {:try_start_91d .. :try_end_925} :catchall_911

    move-object/from16 v20, v11

    :try_start_927
    new-instance v11, Ljava/lang/String;

    invoke-direct {v11, v7}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v10, v11}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v10, v8}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_932
    .catchall {:try_start_927 .. :try_end_932} :catchall_932

    :catchall_932
    :goto_932
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v7, v19

    move-object/from16 v11, v20

    const/4 v10, 0x0

    goto :goto_901

    :cond_93a
    move-object/from16 v19, v7

    move-object/from16 v7, v19

    :goto_93e
    :try_start_93e
    new-instance v8, Llyf;

    invoke-direct {v8, v6, v7}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_946
    .catch Lorg/json/JSONException; {:try_start_93e .. :try_end_946} :catch_947

    goto :goto_950

    :catch_947
    new-instance v7, Llyf;

    const/4 v8, 0x0

    invoke-direct {v7, v6, v8}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_950
    new-instance v6, Lml;

    invoke-direct {v6, v2}, Lml;-><init>(Ljava/lang/String;)V

    move-object v2, v6

    :goto_956
    const-string v6, "0"

    iget-object v2, v2, Lml;->j:Ljava/util/HashSet;

    invoke-virtual {v2, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    const-string v7, "premiumEnabled"

    invoke-virtual {v1, v7, v6}, Lorb;->r(Ljava/lang/String;Z)V

    const-string v6, "externalIpAddress"

    invoke-virtual {v1, v4, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v4

    const-string v6, "generationTime"

    invoke-virtual {v1, v4, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v6, 0x0

    :goto_97a
    if-ge v6, v4, :cond_98e

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Llyf;

    iget-object v8, v7, Llyf;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v7, v7, Llyf;->b:Ljava/lang/Object;

    invoke-virtual {v1, v7, v8}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_97a

    :cond_98e
    iget-object v0, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Lami;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lvpb;

    invoke-direct {v4}, Lvpb;-><init>()V

    iget-object v0, v0, Lami;->f:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long v6, v6, p0

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_9b6
    :goto_9b6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a75

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const-string v10, "providers_config_"

    invoke-virtual {v8, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9b6

    const-string v10, "_timestamp"

    invoke-virtual {v8, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9b6

    const/16 v10, 0x5f

    const/16 v11, 0x11

    invoke-virtual {v8, v10, v11}, Ljava/lang/String;->indexOf(II)I

    move-result v10

    const/4 v13, -0x1

    if-eq v10, v13, :cond_9b6

    invoke-virtual {v8, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v11}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9b6

    add-int/lit8 v10, v10, 0x1

    const/16 v13, 0xa

    invoke-static {v13, v10, v8}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-wide/16 v13, 0x0

    invoke-interface {v0, v8, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v20

    cmp-long v19, v20, v13

    if-eqz v19, :cond_9b6

    cmp-long v13, v20, v6

    if-lez v13, :cond_9b6

    const-string v13, "pid"

    invoke-static {v13, v11}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v11

    const-string v13, "null,null"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_a10

    const-string v13, "origin"

    invoke-virtual {v11, v10, v13}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_a10
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    const/16 v16, 0xa

    add-int/lit8 v10, v10, -0xa

    const/4 v13, 0x0

    invoke-virtual {v8, v13, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    const-string v13, "_request_time"

    invoke-virtual {v10, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-wide/16 v13, 0x0

    invoke-interface {v0, v10, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v17

    cmp-long v10, v17, v13

    if-lez v10, :cond_a34

    invoke-static/range {v17 .. v18}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10, v9}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_a34
    invoke-static/range {v20 .. v21}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    add-long v20, v20, p0

    invoke-static/range {v20 .. v21}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10, v15}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    const/16 v16, 0xa

    add-int/lit8 v10, v10, -0xa

    const/4 v13, 0x0

    invoke-virtual {v8, v13, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    const-string v10, "_data"

    invoke-virtual {v8, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    invoke-interface {v0, v8, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v10, "response"

    if-nez v8, :cond_a62

    const/4 v8, 0x0

    goto :goto_a68

    :cond_a62
    :try_start_a62
    new-instance v14, Lorb;

    invoke-direct {v14, v8}, Lorb;-><init>(Ljava/lang/String;)V

    move-object v8, v14

    :goto_a68
    invoke-virtual {v11, v8, v10}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_a6b
    .catch Lorg/json/JSONException; {:try_start_a62 .. :try_end_a6b} :catch_a6c

    goto :goto_a70

    :catch_a6c
    const/4 v8, 0x0

    invoke-virtual {v11, v8, v10}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_a70
    invoke-virtual {v4, v11}, Lvpb;->a(Ljava/lang/Object;)V

    goto/16 :goto_9b6

    :cond_a75
    const-string v0, "fetches"

    invoke-virtual {v1, v4, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v12, v1}, Lsu;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_a7e
    .packed-switch 0x0
        :pswitch_860
        :pswitch_84c
        :pswitch_827
        :pswitch_752
        :pswitch_70d
        :pswitch_6db
        :pswitch_697
        :pswitch_66b
        :pswitch_648
        :pswitch_634
        :pswitch_620
        :pswitch_540
        :pswitch_50e
        :pswitch_4fc
        :pswitch_4b4
        :pswitch_41e
        :pswitch_3a0
        :pswitch_375
        :pswitch_345
        :pswitch_26e
        :pswitch_219
        :pswitch_1e7
        :pswitch_19b
        :pswitch_184
        :pswitch_175
        :pswitch_133
        :pswitch_11f
        :pswitch_106
        :pswitch_27
    .end packed-switch
.end method
