.class public final synthetic La3j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llo7;
.implements Ljtl;
.implements Lxjj;
.implements Lzjj;
.implements Lktn;
.implements Ln5o;
.implements Lv0k;
.implements Lbcf;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, La3j;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final e(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Lorg/chromium/content/browser/selection/SmartSelectionClient;

    invoke-direct {p0, p1}, Lorg/chromium/content/browser/selection/SmartSelectionClient;-><init>(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)V

    return-object p0
.end method

.method public final f(Lvr3;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .registers 3

    new-instance p0, Lt0k;

    invoke-direct {p0, p1, p2}, Lu0k;-><init>(Lvr3;Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Landroid/net/Uri;

    invoke-static {p1}, Lqyn;->G(Landroid/net/Uri;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 7

    iget-byte p0, p0, La3j;->a:B

    packed-switch p0, :pswitch_data_3c

    check-cast p1, Lrcj;

    check-cast p2, Lscj;

    return-void

    :pswitch_a
    check-cast p1, Ltcj;

    check-cast p2, Lucj;

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object v0, p2, Lucj;->b:Lq5g;

    iget-object v1, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p1, Ltcj;->a:Lwcj;

    invoke-interface {v2, p0}, Lwcj;->d(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-interface {v2, p0}, Lwcj;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Lj5g;

    const/16 v1, 0xd

    invoke-direct {v0, p2, p1, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;
    .registers 30

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-byte v1, v1, La3j;->a:B

    const-string v3, "Missing required view with ID: "

    const/4 v4, 0x0

    const/4 v5, 0x0

    sparse-switch v1, :sswitch_data_2a8

    const v1, 0x7f0d01f8

    invoke-virtual {v0, v1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a09b4

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_c4

    const v1, 0x7f0a09b6

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_c4

    const v1, 0x7f0a09c0

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_c4

    const v1, 0x7f0a09d7

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_c4

    const v1, 0x7f0a09db

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_c4

    const v1, 0x7f0a09e4

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v13, :cond_c4

    const v1, 0x7f0a09f0

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_c4

    const v1, 0x7f0a09f1

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_c4

    const v1, 0x7f0a09f9

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_c4

    const v1, 0x7f0a0a01

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v17, :cond_c4

    const v1, 0x7f0a0a1b

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v18, :cond_c4

    const v1, 0x7f0a0a1d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v19, :cond_c4

    const v1, 0x7f0a0ccf

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v20, :cond_c4

    new-instance v6, Lsm9;

    move-object v7, v0

    check-cast v7, Landroid/widget/LinearLayout;

    invoke-direct/range {v6 .. v20}, Lsm9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroidx/recyclerview/widget/RecyclerView;)V

    move-object v5, v6

    goto :goto_d3

    :cond_c4
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_d3
    return-object v5

    :sswitch_d4
    sget-object v1, Lszj;->w:[Lxtb;

    const v1, 0x7f0d01f7

    invoke-virtual {v0, v1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a09be

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_182

    const v1, 0x7f0a09d3

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_182

    const v1, 0x7f0a09f4

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_182

    const v1, 0x7f0a09fa

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_182

    const v1, 0x7f0a09fb

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_182

    const v1, 0x7f0a0a34

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    if-eqz v13, :cond_172

    const v1, 0x7f0a0a35

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    if-eqz v14, :cond_172

    const v1, 0x7f0a0a36

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    if-eqz v15, :cond_172

    new-instance v11, Lvs;

    move-object v12, v2

    check-cast v12, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v16, 0x14

    invoke-direct/range {v11 .. v16}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v1, 0x7f0a09fc

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_182

    const v1, 0x7f0a09ff

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_182

    const v1, 0x7f0a0a00

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Landroid/widget/LinearLayout;

    if-eqz v12, :cond_182

    new-instance v6, Lrm9;

    move-object v7, v0

    check-cast v7, Landroid/widget/LinearLayout;

    invoke-direct/range {v6 .. v12}, Lrm9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lvs;Landroid/widget/LinearLayout;)V

    move-object v5, v6

    goto :goto_191

    :cond_172
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_191

    :cond_182
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_191
    return-object v5

    :sswitch_192
    sget-object v1, Lk6j;->x:[Lxtb;

    const v1, 0x7f0d01f5

    invoke-virtual {v0, v1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a063a

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;

    if-eqz v8, :cond_297

    const v1, 0x7f0a0945

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_297

    const v1, 0x7f0a0995

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v10, :cond_297

    const v1, 0x7f0a099c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_297

    const v1, 0x7f0a09a6

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v12, :cond_297

    const v1, 0x7f0a09a7

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v13, :cond_297

    const v1, 0x7f0a09ab

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v14, :cond_297

    const v1, 0x7f0a09b8

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_297

    const v1, 0x7f0a09c4

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v16, :cond_297

    const v1, 0x7f0a09cb

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v17, :cond_297

    const v1, 0x7f0a09d9

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v18, :cond_297

    const v1, 0x7f0a09de

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v19, :cond_297

    const v1, 0x7f0a09e1

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v20, :cond_297

    const v1, 0x7f0a09e7

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v21, v2

    check-cast v21, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v21, :cond_297

    const v1, 0x7f0a09e9

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v22, v2

    check-cast v22, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v22, :cond_297

    const v1, 0x7f0a09ef

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v23, v2

    check-cast v23, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v23, :cond_297

    const v1, 0x7f0a09fd

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v24, v2

    check-cast v24, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v24, :cond_297

    const v1, 0x7f0a0a16

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v25, v2

    check-cast v25, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v25, :cond_297

    const v1, 0x7f0a0a1a

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v26, v2

    check-cast v26, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v26, :cond_297

    new-instance v6, Lpm9;

    move-object v7, v0

    check-cast v7, Landroid/widget/LinearLayout;

    invoke-direct/range {v6 .. v26}, Lpm9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/MakeOperaDefaultBanner;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v5, v6

    goto :goto_2a6

    :cond_297
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_2a6
    return-object v5

    nop

    :sswitch_data_2a8
    .sparse-switch
        0x1 -> :sswitch_192
        0x9 -> :sswitch_d4
    .end sparse-switch
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 5

    iget-byte p0, p0, La3j;->a:B

    const/16 v0, 0x207

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_22

    iget-object p0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p0, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget p0, p0, Lr9b;->b:I

    invoke-virtual {p1, v1, p0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-object p2

    :pswitch_14
    iget-object p0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p0, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget v0, p0, Lr9b;->b:I

    iget p0, p0, Lr9b;->d:I

    invoke-virtual {p1, v1, v0, v1, p0}, Landroid/view/View;->setPadding(IIII)V

    return-object p2

    :pswitch_data_22
    .packed-switch 0xd
        :pswitch_14
    .end packed-switch
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 4

    iget-byte p0, p0, La3j;->a:B

    const/16 v0, 0x11

    sparse-switch p0, :sswitch_data_22

    new-instance p0, Lwok;

    const-string v1, "suggested_sites"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    :sswitch_f
    new-instance p0, Lk7k;

    sget v0, Lk7k;->m:I

    const-string v1, "start_page_settings"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    :sswitch_19
    new-instance p0, Le3j;

    const-string v1, "dyn.services.cred"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    nop

    :sswitch_data_22
    .sparse-switch
        0x0 -> :sswitch_19
        0xb -> :sswitch_f
    .end sparse-switch
.end method
