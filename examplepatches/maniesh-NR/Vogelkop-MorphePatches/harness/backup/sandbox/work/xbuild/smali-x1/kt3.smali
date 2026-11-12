.class public final Lkt3;
.super Ll53;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lkt3;->c:B

    iput-object p1, p0, Lkt3;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Llz3;
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lkt3;->c:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/high16 v5, 0x41000000    # 8.0f

    iget-object v6, v0, Lkt3;->d:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_1fa

    check-cast v6, Lala;

    iget-object v1, v6, Lala;->a:Ljava/lang/Object;

    check-cast v1, Lpt1;

    iget-object v1, v1, Lpt1;->c:Landroid/view/View;

    move-object v2, v1

    check-cast v2, Lcom/opera/android/custom_views/BottomIndicatorButton;

    new-array v1, v3, [Ljava/lang/Object;

    new-instance v3, Lsxh;

    const v4, 0x7f141269

    invoke-direct {v3, v4, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v5, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    new-instance v6, Lz4k;

    const/16 v4, 0x8

    invoke-direct {v6, v0, v4}, Lz4k;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lqba;

    const v7, 0x7f0d0202

    const/4 v4, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v5, v3

    move v3, v1

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v9}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    new-instance v1, Lsba;

    invoke-direct {v1, v0}, Lsba;-><init>(Lqba;)V

    return-object v1

    :pswitch_46
    move-object/from16 v1, p1

    check-cast v6, Ll0h;

    iget-object v0, v6, Ll0h;->e:Lgbf;

    invoke-virtual {v0}, Lgbf;->q()Lcom/opera/android/bar/OmniButtonView;

    move-result-object v3

    iget v7, v6, Ll0h;->h:I

    const/4 v8, 0x2

    if-lt v7, v8, :cond_8f

    iget-object v7, v6, Ll0h;->a:Lcom/opera/android/BrowserActivity;

    iget-object v8, v6, Ll0h;->i:Lcom/opera/android/settings/SettingsManager;

    invoke-static {v7, v8}, Ll0h;->a(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;)Z

    move-result v7

    if-eqz v7, :cond_8f

    iget-object v7, v6, Ll0h;->c:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v7}, Lcom/opera/android/BrowserActivity;->k0()Z

    move-result v7

    if-eqz v7, :cond_8f

    iget-object v0, v0, Lgbf;->b:Lz43;

    invoke-virtual {v0}, Lz43;->q()Z

    move-result v0

    if-eqz v0, :cond_8f

    if-eqz v3, :cond_8f

    new-instance v0, Ll11;

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v5, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-direct {v0, v3, v4, v2}, Ll11;-><init>(Landroid/view/View;II)V

    new-instance v2, Llz3;

    const v3, 0x7f0d034e

    invoke-direct {v2, v1, v3, v0}, Llz3;-><init>(Landroid/view/ViewGroup;ILl11;)V

    new-instance v0, Lk0h;

    invoke-direct {v0, v6, v2}, Lk0h;-><init>(Ll0h;Llz3;)V

    invoke-virtual {v2, v0}, Llz3;->a(Lkz3;)V

    goto :goto_90

    :cond_8f
    const/4 v2, 0x0

    :goto_90
    return-object v2

    :pswitch_91
    move-object/from16 v1, p1

    check-cast v6, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->u0()Landroid/widget/ImageView;

    move-result-object v0

    new-instance v2, Ll11;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v5, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    const/4 v5, 0x3

    invoke-direct {v2, v0, v5, v3}, Ll11;-><init>(Landroid/view/View;II)V

    new-instance v3, Llz3;

    const v5, 0x7f0d00ae

    invoke-direct {v3, v1, v5, v2}, Llz3;-><init>(Landroid/view/ViewGroup;ILl11;)V

    new-instance v1, Lnz3;

    invoke-direct {v1, v0}, Lnz3;-><init>(Landroid/widget/ImageView;)V

    invoke-virtual {v3, v1}, Llz3;->a(Lkz3;)V

    new-instance v1, Lq22;

    invoke-direct {v1, v0, v4}, Lq22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v1}, Llz3;->a(Lkz3;)V

    return-object v3

    :pswitch_c2
    move-object/from16 v1, p1

    check-cast v6, Ligi;

    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    iget-object v8, v6, Ligi;->c:Ljava/lang/Object;

    check-cast v8, Lqb7;

    invoke-virtual {v8}, Lqb7;->p()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    const/4 v11, 0x7

    if-ge v10, v11, :cond_de

    sget-object v8, Lv08;->a:Lv08;

    goto/16 :goto_15e

    :cond_de
    sget-object v10, Lpc;->C:Lh58;

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v10}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_e9
    :goto_e9
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_fe

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    move-object v14, v13

    check-cast v14, Lpc;

    iget-boolean v14, v14, Lpc;->b:Z

    if-eqz v14, :cond_e9

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e9

    :cond_fe
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v13

    move v14, v3

    :cond_108
    :goto_108
    if-ge v14, v13, :cond_11f

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v14, v14, 0x1

    move-object v2, v15

    check-cast v2, Lpc;

    sget-object v5, Ldq3;->b:Ljava/util/Set;

    invoke-interface {v5, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_108

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_108

    :cond_11f
    invoke-static {v10}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v2

    iget-object v5, v8, Lqb7;->b:Ljava/lang/Object;

    check-cast v5, Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    move v8, v3

    :goto_12e
    if-ge v8, v11, :cond_15d

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v10, v4

    sub-int/2addr v10, v8

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lnt3;

    invoke-interface {v5, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lot3;

    if-eqz v10, :cond_15a

    iget-object v10, v10, Lot3;->b:Ljava/util/LinkedHashSet;

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_14a
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_15a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lpc;

    invoke-interface {v2, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_14a

    :cond_15a
    add-int/lit8 v8, v8, 0x1

    goto :goto_12e

    :cond_15d
    move-object v8, v2

    :goto_15e
    check-cast v8, Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_164
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_19c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lpc;

    iget-object v8, v6, Ligi;->d:Ljava/lang/Object;

    check-cast v8, Lfd;

    invoke-virtual {v8, v5}, Lfd;->e(Lpc;)Ljf;

    move-result-object v8

    if-eqz v8, :cond_17e

    iget-object v9, v8, Ljf;->c:Lxc;

    if-nez v9, :cond_180

    :cond_17e
    iget-object v9, v5, Lpc;->a:Lxc;

    :cond_180
    iget v5, v9, Lxc;->d:I

    if-eqz v5, :cond_164

    if-eqz v8, :cond_164

    iget-boolean v8, v8, Ljf;->d:Z

    if-ne v8, v4, :cond_164

    iget-object v8, v6, Ligi;->b:Ljava/lang/Object;

    check-cast v8, Landroid/view/View;

    invoke-virtual {v8, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_164

    invoke-virtual {v5, v7}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v8

    if-eqz v8, :cond_164

    move-object v2, v5

    goto :goto_19d

    :cond_19c
    const/4 v2, 0x0

    :goto_19d
    if-eqz v2, :cond_1f3

    iget-object v4, v6, Ligi;->e:Ljava/lang/Object;

    check-cast v4, Lru9;

    iget-object v5, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v7, "browser_actions_unused_button_hint_shown"

    invoke-interface {v5, v7, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_1f3

    iget-object v4, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "customize_toolbar_ui_shown"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1f3

    new-array v0, v3, [Ljava/lang/Object;

    new-instance v5, Lsxh;

    const v3, 0x7f140522

    invoke-direct {v5, v3, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v3, 0x41000000    # 8.0f

    invoke-static {v3, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    new-instance v0, Ls6h;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v6, v0, Ls6h;->b:Ljava/lang/Object;

    new-instance v4, Lrn9;

    iget-object v6, v6, Ligi;->g:Ljava/lang/Object;

    check-cast v6, Lx5f;

    sget-object v7, Lmf0;->k:Lmf0;

    const/16 v8, 0x12

    invoke-direct {v4, v6, v7, v8}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v4, v0, Ls6h;->a:Ljava/lang/Object;

    move-object v6, v0

    new-instance v0, Lqba;

    const v7, 0x7f0d0202

    const/4 v4, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v0 .. v9}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    new-instance v2, Lsba;

    invoke-direct {v2, v0}, Lsba;-><init>(Lqba;)V

    goto :goto_1f9

    :cond_1f3
    sget-object v1, Lhjm;->b:Lhjm;

    invoke-virtual {v0, v1}, Ll53;->finish(Lhjm;)V

    const/4 v2, 0x0

    :goto_1f9
    return-object v2

    :pswitch_data_1fa
    .packed-switch 0x0
        :pswitch_c2
        :pswitch_91
        :pswitch_46
    .end packed-switch
.end method
