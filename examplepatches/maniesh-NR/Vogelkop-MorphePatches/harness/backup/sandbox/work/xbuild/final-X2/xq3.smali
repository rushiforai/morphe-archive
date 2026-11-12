.class public final Lxq3;
.super Lcej;
.source "SourceFile"

# interfaces
.implements Labf;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 24
    iput-byte p1, p0, Lxq3;->a:B

    iput-object p3, p0, Lxq3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxq3;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ljava/util/List;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Lxq3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lxq3;->b:Ljava/lang/Object;

    iput-object p1, p0, Lxq3;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lebf;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lxq3;->a:B

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lxq3;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 15
    iput-byte p3, p0, Lxq3;->a:B

    iput-object p1, p0, Lxq3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxq3;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lven;)V
    .registers 3

    const/16 v0, 0xe

    iput-byte v0, p0, Lxq3;->a:B

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lxq3;->c:Ljava/lang/Object;

    .line 23
    sget-object p1, Lvb0;->d:Lvb0;

    iput-object p1, p0, Lxq3;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5f;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lxq3;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lxq3;->b:Ljava/lang/Object;

    .line 18
    sget-object p1, Lwb0;->d:Lwb0;

    iput-object p1, p0, Lxq3;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;)V
    .registers 5

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700a8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-gtz v1, :cond_15

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result v0

    int-to-float v0, v0

    :cond_15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0092

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    mul-int/lit8 v2, v1, 0xc

    add-int/lit8 v2, v2, 0x18

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lbmn;

    int-to-float p1, p1

    sub-float/2addr v0, p1

    int-to-float p1, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr p1, v1

    div-float/2addr v0, p1

    float-to-int p1, v0

    iput p1, p0, Lbmn;->g:I

    return-void
.end method

.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 34

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-byte v3, v0, Lxq3;->a:B

    const-string v4, "Missing required view with ID: "

    const v5, 0x7f1402f5

    const v6, 0x7f0a0ad7

    const v7, 0x7f0a01c8

    const v8, 0x7f140812

    const/4 v9, 0x7

    const v10, 0x7f0400f5

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x2

    const/4 v14, 0x0

    packed-switch v3, :pswitch_data_52c

    iget-object v2, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v2, Lzln;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    invoke-interface {v2}, Lzln;->j()V

    new-instance v2, Lqf;

    invoke-direct {v2, v0, v1}, Lqf;-><init>(Lxq3;Lmej;)V

    return-object v2

    :pswitch_31
    iget-object v2, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v2, Lven;

    iget-object v3, v2, Lven;->g:Lru9;

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v4

    iget-object v3, v3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "vpn.pro_adult_page_promo.show_count"

    invoke-interface {v3, v5, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    add-int/2addr v3, v11

    iget-object v6, v4, Lnv6;->a:Ljava/lang/Object;

    check-cast v6, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v6, v5, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-string v3, "vpn.pro_adult_page_promo.show_timestamp"

    invoke-interface {v6, v3, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v4}, Lnv6;->w()V

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v2, Lven;->d:Lji;

    iget-object v4, v4, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v4}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v4

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lbxc;

    new-instance v5, Llxh;

    const v6, 0x7f0807b5

    invoke-direct {v5, v6}, Llxh;-><init>(I)V

    const/16 v6, 0x19

    invoke-virtual {v4, v6, v3}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_81

    new-instance v7, Lqxh;

    invoke-direct {v7, v6}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_7e
    move-object/from16 v20, v7

    goto :goto_8a

    :cond_81
    new-instance v7, Lrxh;

    const v6, 0x7f1413b1

    invoke-direct {v7, v6}, Lrxh;-><init>(I)V

    goto :goto_7e

    :goto_8a
    const/16 v6, 0x1a

    invoke-virtual {v4, v6, v3}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9a

    new-instance v7, Lqxh;

    invoke-direct {v7, v6}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_97
    move-object/from16 v21, v7

    goto :goto_a3

    :cond_9a
    new-instance v7, Lrxh;

    const v6, 0x7f1413af

    invoke-direct {v7, v6}, Lrxh;-><init>(I)V

    goto :goto_97

    :goto_a3
    const/16 v6, 0x1b

    invoke-virtual {v4, v6, v3}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_b1

    new-instance v6, Lqxh;

    invoke-direct {v6, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_b9

    :cond_b1
    new-instance v6, Lrxh;

    const v4, 0x7f1413b0

    invoke-direct {v6, v4}, Lrxh;-><init>(I)V

    :goto_b9
    new-instance v4, Lzu5;

    const/16 v7, 0xb

    invoke-direct {v4, v0, v2, v7}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v6, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_d3

    move-object/from16 v25, v14

    move-object/from16 v26, v25

    goto :goto_d7

    :cond_d3
    move-object/from16 v26, v4

    move-object/from16 v25, v6

    :goto_d7
    new-instance v2, Lm98;

    invoke-direct {v2, v0, v9}, Lm98;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lqf;

    new-instance v15, Lgua;

    const/16 v18, 0x0

    const/16 v22, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v27, 0x1

    const/16 v28, 0x0

    const/16 v29, 0x1

    move-object/from16 v30, v2

    move-object/from16 v19, v5

    invoke-direct/range {v15 .. v30}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v0, v1, v15, v13}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_fd
    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lrxh;

    const v4, 0x7f14034e

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    iget-object v4, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v4, Lf0c;

    const v5, 0x7f14034c

    iget-object v4, v4, Lf0c;->a:Lv3m;

    invoke-virtual {v4, v5}, Lv3m;->a(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lqxh;

    invoke-direct {v5, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v4, Llxh;

    const v6, 0x7f08061b

    invoke-direct {v4, v6}, Llxh;-><init>(I)V

    new-instance v6, Ldxh;

    invoke-direct {v6, v10}, Ldxh;-><init>(I)V

    new-instance v7, Lrxh;

    const v9, 0x7f140a3b

    invoke-direct {v7, v9}, Lrxh;-><init>(I)V

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lk4m;

    new-instance v9, Lm98;

    const/4 v10, 0x6

    invoke-direct {v9, v0, v10}, Lm98;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v7}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_145

    move-object/from16 v23, v14

    move-object/from16 v24, v23

    goto :goto_149

    :cond_145
    move-object/from16 v23, v7

    move-object/from16 v24, v9

    :goto_149
    new-instance v0, Lrxh;

    invoke-direct {v0, v8}, Lrxh;-><init>(I)V

    new-instance v2, Lqf;

    new-instance v15, Lgua;

    const/16 v18, 0x0

    const/16 v22, 0x0

    const/16 v16, 0x0

    const/16 v19, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x1

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v25, v0

    move-object/from16 v20, v3

    move-object/from16 v17, v4

    move-object/from16 v21, v5

    move-object/from16 v28, v6

    invoke-direct/range {v15 .. v30}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v15, v13}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_173
    new-instance v2, Lpxk;

    iget-object v3, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v3, Lbyk;

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lu7k;

    invoke-direct {v2, v1, v3, v0}, Lpxk;-><init>(Lmej;Lbyk;Lu7k;)V

    return-object v2

    :pswitch_181
    if-eqz v2, :cond_19d

    new-instance v14, Lvxi;

    check-cast v2, Ld7l;

    invoke-virtual {v2}, Ld7l;->g0()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v2}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Llz8;

    invoke-direct {v14, v1, v2, v3, v0}, Lvxi;-><init>(Lmej;Ljava/lang/String;Ljava/util/ArrayList;Llz8;)V

    goto :goto_1a2

    :cond_19d
    const-string v0, ""

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1a2
    return-object v14

    :pswitch_1a3
    new-instance v2, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v8, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v8, Lqq8;

    iget-object v0, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/Address;

    iget-object v9, v0, Lcom/opera/android/autofill/Address;->b:Ljava/lang/String;

    iget-object v11, v0, Lcom/opera/android/autofill/Address;->c:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_1c1

    const-string v15, " - "

    invoke-static {v9, v15, v11}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    :cond_1c1
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v11

    const v15, 0x7f0d036d

    invoke-virtual {v11, v15, v14, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v11

    invoke-static {v7, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_253

    invoke-static {v6, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_254

    move-object/from16 v22, v11

    check-cast v22, Landroid/widget/LinearLayout;

    invoke-virtual {v12, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v0, Lcom/opera/android/autofill/Address;->n:Ljava/lang/String;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Llxh;

    const v6, 0x7f080580

    invoke-direct {v4, v6}, Llxh;-><init>(I)V

    new-instance v6, Ldxh;

    invoke-direct {v6, v10}, Ldxh;-><init>(I)V

    new-instance v7, Lrxh;

    const v9, 0x7f1402ef

    invoke-direct {v7, v9}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    invoke-direct {v9, v5}, Lrxh;-><init>(I)V

    new-instance v5, Lzu5;

    const/16 v10, 0x8

    invoke-direct {v5, v8, v0, v10}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v9}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_214

    move-object/from16 v25, v14

    move-object/from16 v26, v25

    goto :goto_218

    :cond_214
    move-object/from16 v26, v5

    move-object/from16 v25, v9

    :goto_218
    new-instance v0, Lrxh;

    const v5, 0x7f1403bf

    invoke-direct {v0, v5}, Lrxh;-><init>(I)V

    new-instance v5, Lm98;

    const/4 v9, 0x4

    invoke-direct {v5, v8, v9}, Lm98;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v0}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v3

    if-nez v3, :cond_231

    move-object/from16 v23, v14

    move-object/from16 v24, v23

    goto :goto_235

    :cond_231
    move-object/from16 v23, v0

    move-object/from16 v24, v5

    :goto_235
    new-instance v15, Lgua;

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v27, 0x1

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v17, v4

    move-object/from16 v28, v6

    move-object/from16 v20, v7

    invoke-direct/range {v15 .. v30}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v15, v13}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    move-object v14, v2

    goto :goto_263

    :cond_253
    move v6, v7

    :cond_254
    invoke-virtual {v11}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_263
    return-object v14

    :pswitch_264
    new-instance v2, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v8, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v8, Lrii;

    iget-object v0, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v0, Lpr;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v10

    const v11, 0x7f0d0371

    invoke-virtual {v10, v11, v14, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10

    invoke-static {v7, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v11, :cond_322

    invoke-static {v6, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_323

    move-object/from16 v22, v10

    check-cast v22, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object v4, v0, Lpr;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v11, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v0, Lpr;->c:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v10, 0x7f14029f

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v0, Lpr;->d:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Lrxh;

    const v6, 0x7f1402f6

    invoke-direct {v4, v6}, Lrxh;-><init>(I)V

    new-instance v6, Lmgf;

    const/16 v7, 0x15

    invoke-direct {v6, v3, v0, v7}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Lrxh;

    invoke-direct {v7, v5}, Lrxh;-><init>(I)V

    new-instance v5, Lm98;

    invoke-direct {v5, v8, v0}, Lm98;-><init>(Lrii;Lpr;)V

    invoke-static {v3, v7}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v10

    if-nez v10, :cond_2e4

    move-object/from16 v25, v14

    move-object/from16 v26, v25

    goto :goto_2e8

    :cond_2e4
    move-object/from16 v26, v5

    move-object/from16 v25, v7

    :goto_2e8
    new-instance v5, Lrxh;

    const v7, 0x7f1402f0

    invoke-direct {v5, v7}, Lrxh;-><init>(I)V

    new-instance v7, Lzu5;

    invoke-direct {v7, v8, v0, v9}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v5}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_300

    move-object/from16 v23, v14

    move-object/from16 v24, v23

    goto :goto_304

    :cond_300
    move-object/from16 v23, v5

    move-object/from16 v24, v7

    :goto_304
    new-instance v15, Lgua;

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v27, 0x1

    const/16 v28, 0x0

    const/16 v29, 0x1

    const/16 v30, 0x0

    move-object/from16 v20, v4

    move-object/from16 v16, v6

    invoke-direct/range {v15 .. v30}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v15, v13}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    move-object v14, v2

    goto :goto_332

    :cond_322
    move v6, v7

    :cond_323
    invoke-virtual {v10}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_332
    return-object v14

    :pswitch_333
    new-instance v2, Lpg5;

    iget-object v3, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v3, Ls9i;

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lwjh;

    const/4 v4, 0x3

    invoke-direct {v2, v1, v3, v0, v4}, Lpg5;-><init>(Lmej;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_342
    new-instance v2, Lpg5;

    iget-object v3, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v3, Lxbf;

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lojh;

    invoke-direct {v2, v1, v3, v0, v13}, Lpg5;-><init>(Lmej;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_350
    new-instance v2, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v0, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v0, Lgjm;

    new-instance v4, Llxh;

    const v5, 0x7f0805c3

    invoke-direct {v4, v5}, Llxh;-><init>(I)V

    new-instance v5, Ldxh;

    const v6, 0x7f0402eb

    invoke-direct {v5, v6}, Ldxh;-><init>(I)V

    new-instance v6, Lrxh;

    const v7, 0x7f141080

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Lrxh;

    const v9, 0x7f1401b7

    invoke-direct {v7, v9}, Lrxh;-><init>(I)V

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    new-instance v9, Lsxh;

    const v10, 0x7f14107f

    invoke-direct {v9, v10, v7}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v7, Lrxh;

    const v10, 0x7f140bea

    invoke-direct {v7, v10}, Lrxh;-><init>(I)V

    new-instance v10, Lm98;

    invoke-direct {v10, v0, v13}, Lm98;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v7}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_39e

    move-object/from16 v23, v14

    move-object/from16 v24, v23

    goto :goto_3a2

    :cond_39e
    move-object/from16 v23, v7

    move-object/from16 v24, v10

    :goto_3a2
    new-instance v0, Lrxh;

    invoke-direct {v0, v8}, Lrxh;-><init>(I)V

    new-instance v15, Lgua;

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x1

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v25, v0

    move-object/from16 v17, v4

    move-object/from16 v28, v5

    move-object/from16 v20, v6

    move-object/from16 v21, v9

    invoke-direct/range {v15 .. v30}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v15, v13}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_3ca
    new-instance v2, Lpg5;

    iget-object v0, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-direct {v2, v1, v0}, Lpg5;-><init>(Lmej;Ljava/util/List;)V

    return-object v2

    :pswitch_3d4
    new-instance v2, Lyvd;

    iget-object v3, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v3, Lja2;

    check-cast v3, Ljb9;

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Ltb9;

    invoke-static {v0}, Ltb9;->i0(Ltb9;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v0, v0, Ltb9;->m:Lvk2;

    invoke-direct {v2, v1, v3, v4, v0}, Lyvd;-><init>(Lmej;Ljb9;Ljava/lang/String;Lvk2;)V

    return-object v2

    :pswitch_3f2
    new-instance v2, Lyvd;

    iget-object v3, v0, Lxq3;->b:Ljava/lang/Object;

    check-cast v3, Lja2;

    check-cast v3, Lib9;

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lqb9;

    iget-object v0, v0, Lqb9;->m:Lfge;

    invoke-direct {v2, v1, v3, v0}, Lyvd;-><init>(Lmej;Lib9;Lfge;)V

    return-object v2

    :pswitch_404
    new-instance v2, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lrxh;

    const v5, 0x7f1406d3

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    new-instance v5, Lrxh;

    const v6, 0x7f1406d2

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    new-instance v6, Llxh;

    const v7, 0x7f08077c

    invoke-direct {v6, v7}, Llxh;-><init>(I)V

    new-instance v7, Lrxh;

    const v8, 0x7f14092a

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lm98;

    invoke-direct {v8, v0, v11}, Lm98;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v7}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v9

    if-nez v9, :cond_43a

    move-object/from16 v23, v14

    move-object/from16 v24, v23

    goto :goto_43e

    :cond_43a
    move-object/from16 v23, v7

    move-object/from16 v24, v8

    :goto_43e
    new-instance v7, Lrxh;

    const v8, 0x7f1406d1

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lzu5;

    invoke-direct {v8, v0, v3, v13}, Lzu5;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-static {v3, v7}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_456

    move-object/from16 v25, v14

    move-object/from16 v26, v25

    goto :goto_45a

    :cond_456
    move-object/from16 v25, v7

    move-object/from16 v26, v8

    :goto_45a
    new-instance v15, Lgua;

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v22, 0x0

    const/16 v27, 0x1

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v20, v4

    move-object/from16 v21, v5

    move-object/from16 v19, v6

    invoke-direct/range {v15 .. v30}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v2, v1, v15, v13}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_479
    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v3

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v3

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v4

    iget-object v4, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "cookie.blocker.sheet.show.count"

    invoke-interface {v4, v5, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    add-int/2addr v4, v11

    iget-object v6, v3, Lnv6;->a:Ljava/lang/Object;

    check-cast v6, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v6, v5, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v3}, Lnv6;->w()V

    new-instance v3, Lqf;

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lgjm;

    new-instance v4, Llxh;

    const v5, 0x7f080531

    invoke-direct {v4, v5}, Llxh;-><init>(I)V

    new-instance v5, Ldxh;

    invoke-direct {v5, v10}, Ldxh;-><init>(I)V

    new-instance v6, Lrxh;

    const v7, 0x7f140faf

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Lrxh;

    const v8, 0x7f140fae

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lrxh;

    const v9, 0x7f140932

    invoke-direct {v8, v9}, Lrxh;-><init>(I)V

    new-instance v9, Lzu5;

    invoke-direct {v9, v2, v0, v12}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v8}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_4d7

    move-object/from16 v23, v14

    move-object/from16 v24, v23

    goto :goto_4db

    :cond_4d7
    move-object/from16 v23, v8

    move-object/from16 v24, v9

    :goto_4db
    new-instance v0, Lrxh;

    const v8, 0x7f14035b

    invoke-direct {v0, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lav5;

    invoke-direct {v8, v2, v12}, Lav5;-><init>(Landroid/content/Context;B)V

    invoke-static {v2, v0}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v2

    if-nez v2, :cond_4f3

    move-object/from16 v25, v14

    move-object/from16 v26, v25

    goto :goto_4f7

    :cond_4f3
    move-object/from16 v25, v0

    move-object/from16 v26, v8

    :goto_4f7
    new-instance v15, Lgua;

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x0

    const/16 v27, 0x1

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v17, v4

    move-object/from16 v28, v5

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    invoke-direct/range {v15 .. v30}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v3, v1, v15, v13}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v3

    :pswitch_516
    new-instance v3, Lqf;

    invoke-direct {v3, v0, v1, v2}, Lqf;-><init>(Lxq3;Lmej;Lb2l;)V

    iput-object v3, v0, Lxq3;->c:Ljava/lang/Object;

    new-instance v1, Lof;

    invoke-direct {v1, v0, v11}, Lof;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v3, Ldej;->a:Li7f;

    invoke-virtual {v2, v1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v0, v0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lqf;

    return-object v0

    :pswitch_data_52c
    .packed-switch 0x0
        :pswitch_516
        :pswitch_479
        :pswitch_404
        :pswitch_3f2
        :pswitch_3d4
        :pswitch_3ca
        :pswitch_350
        :pswitch_342
        :pswitch_333
        :pswitch_264
        :pswitch_1a3
        :pswitch_181
        :pswitch_173
        :pswitch_fd
        :pswitch_31
    .end packed-switch
.end method

.method public final createSheetHost(Landroid/content/Context;)Lmej;
    .registers 8

    iget-byte v0, p0, Lxq3;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    sparse-switch v0, :sswitch_data_64

    invoke-super {p0, p1}, Lcej;->createSheetHost(Landroid/content/Context;)Lmej;

    move-result-object p0

    return-object p0

    :sswitch_c
    new-instance v0, Lwq3;

    new-instance v3, Lamn;

    invoke-direct {v3, p0, p1, v2}, Lamn;-><init>(Lcej;Landroid/content/Context;B)V

    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lbmn;

    iget-byte p0, p0, Lbmn;->a:B

    const/4 v4, 0x3

    if-eq p0, v4, :cond_20

    const v5, 0x7f0400f1

    goto :goto_23

    :cond_20
    const v5, 0x7f0400f0

    :goto_23
    if-eqz p0, :cond_27

    if-ne p0, v4, :cond_28

    :cond_27
    move v1, v2

    :cond_28
    filled-new-array {v5}, [I

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-virtual {p0, v2, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {v0, p1, v2, v1, v4}, Lwq3;-><init>(Landroid/content/Context;IZB)V

    iput-object v3, v0, Lvq3;->d:Lsni;

    return-object v0

    :sswitch_3d
    new-instance p0, Lvq3;

    new-instance v0, Ls8n;

    const v2, 0x7f0407e2

    invoke-direct {v0, p1, v2}, Ls8n;-><init>(Landroid/content/Context;I)V

    const p1, 0x7f15019c

    invoke-direct {p0, v0, p1, v1}, Lvq3;-><init>(Landroid/content/Context;IZ)V

    return-object p0

    :sswitch_4e
    new-instance v0, Lwq3;

    iget-object p0, p0, Lxq3;->b:Ljava/lang/Object;

    check-cast p0, Lebf;

    invoke-interface {p0, p1}, Lebf;->p(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    new-instance p1, Ls8n;

    const v1, 0x7f040557

    invoke-direct {p1, p0, v1}, Ls8n;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, p1, v2}, Lwq3;-><init>(Landroid/content/Context;B)V

    return-object v0

    :sswitch_data_64
    .sparse-switch
        0x0 -> :sswitch_4e
        0xe -> :sswitch_3d
        0xf -> :sswitch_c
    .end sparse-switch
.end method

.method public final dismiss()V
    .registers 2

    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lqf;

    if-eqz p0, :cond_d

    sget-object v0, Lhjm;->b:Lhjm;

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0, v0}, Lmej;->Q(Lhjm;)V

    :cond_d
    return-void
.end method

.method public final isAllowed(Lb2l;)Z
    .registers 3

    iget-byte v0, p0, Lxq3;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Lcej;->isAllowed(Lb2l;)Z

    move-result p0

    return p0

    :pswitch_a
    if-eqz p1, :cond_18

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x0

    goto :goto_19

    :cond_18
    const/4 p0, 0x1

    :goto_19
    return p0

    :pswitch_data_1a
    .packed-switch 0xf
        :pswitch_a
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 8

    iget-byte v0, p0, Lxq3;->a:B

    const/4 v1, 0x0

    sget-object v2, Lhjm;->b:Lhjm;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_104

    :pswitch_9
    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    return-void

    :pswitch_d
    iget-object v0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast v0, Lbmn;

    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    sget-object v1, Lru0;->b:Lru0;

    invoke-virtual {v0, v1, v3}, Lbmn;->f(Lru0;Ljava/lang/String;)V

    :cond_1f
    iput-object v3, v0, Lbmn;->f:Lvkn;

    iget-object v0, p0, Lxq3;->b:Ljava/lang/Object;

    check-cast v0, Lzln;

    invoke-interface {v0, p0, p1}, Lzln;->c(Lxq3;Lhjm;)V

    return-void

    :pswitch_29
    iget-object p1, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p1, Lven;

    iput-object v3, p1, Lven;->i:Lxq3;

    iget-object v0, p1, Lven;->f:Lorm;

    iget-object p0, p0, Lxq3;->b:Ljava/lang/Object;

    check-cast p0, Lvb0;

    iget-object p1, p1, Lven;->g:Lru9;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn.pro_adult_page_promo.show_count"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    int-to-long v1, p1

    check-cast v0, Lx5f;

    iget-boolean p1, v0, Lx5f;->h:Z

    if-eqz p1, :cond_61

    iget-object p1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, p1, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->d()Ltd0;

    move-result-object p1

    new-instance v4, Lq5f;

    const/4 v5, 0x1

    invoke-direct {v4, v1, v2, p0, v5}, Lq5f;-><init>(JLvb0;B)V

    invoke-virtual {p1, v4}, Ltd0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_61
    return-void

    :pswitch_62
    sget-object v0, Lhjm;->a:Lhjm;

    if-eq p1, v0, :cond_6f

    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Llz8;

    new-array p1, v1, [B

    invoke-virtual {p0, p1}, Llz8;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6f
    return-void

    :pswitch_70
    if-ne p1, v2, :cond_79

    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lqq8;

    invoke-virtual {p0, v2}, Lqq8;->i(Lhjm;)V

    :cond_79
    return-void

    :pswitch_7a
    if-ne p1, v2, :cond_87

    iget-object p1, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p1, Lrii;

    iget-object p0, p0, Lxq3;->b:Ljava/lang/Object;

    check-cast p0, Lpr;

    invoke-virtual {p1, p0, v2}, Lrii;->o(Lpr;Lhjm;)V

    :cond_87
    return-void

    :pswitch_88
    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p1, Lsa2;

    invoke-virtual {p1}, Lsa2;->e()Z

    move-result p1

    if-eqz p1, :cond_a1

    iget-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p1, Lai;

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lvjh;

    invoke-virtual {p1, p0}, Lai;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a1
    return-void

    :pswitch_a2
    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lojh;

    iget-object p1, p0, Lojh;->c:Lsa2;

    invoke-virtual {p1}, Lsa2;->e()Z

    move-result p1

    if-eqz p1, :cond_e0

    iget-object p0, p0, Lojh;->a:Lyo7;

    iget-object p1, p0, Lyo7;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/api/Callback;

    iget-object v0, p0, Lyo7;->c:Ljava/lang/Object;

    check-cast v0, Lvjh;

    iget-object p0, p0, Lyo7;->d:Ljava/lang/Object;

    check-cast p0, Lqjh;

    new-instance v1, Lpjh;

    iget-object v0, v0, Lvjh;->b:Ljava/lang/Integer;

    sget-object v2, Leo0;->c:Leo0;

    invoke-direct {v1, v3, v2, v3, v0}, Lpjh;-><init>(Lee0;Leo0;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-interface {p1, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    invoke-static {v2, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_e0

    iget-object p0, p0, Lqjh;->c:Lgw3;

    new-instance p1, Lglj;

    const v0, 0x7f14076b

    const/16 v1, 0x1388

    invoke-direct {p1, v0, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Lgw3;->f(Lo93;)V

    :cond_e0
    return-void

    :pswitch_e1
    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lpjg;

    invoke-virtual {p0}, Lpjg;->run()V

    return-void

    :pswitch_e9
    iget-object p1, p0, Lxq3;->b:Ljava/lang/Object;

    check-cast p1, Lx5f;

    iget-object p0, p0, Lxq3;->c:Ljava/lang/Object;

    check-cast p0, Lwb0;

    const/16 v0, 0xb

    invoke-virtual {p1, v0, p0, v3}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    return-void

    :pswitch_f7
    if-ne p1, v2, :cond_102

    iget-object p0, p0, Lxq3;->b:Ljava/lang/Object;

    check-cast p0, Lx5f;

    sget-object p1, Lp90;->d:Lp90;

    invoke-virtual {p0, p1}, Lx5f;->H(Lp90;)V

    :cond_102
    return-void

    nop

    :pswitch_data_104
    .packed-switch 0x1
        :pswitch_f7
        :pswitch_e9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_e1
        :pswitch_a2
        :pswitch_88
        :pswitch_7a
        :pswitch_70
        :pswitch_62
        :pswitch_9
        :pswitch_9
        :pswitch_29
        :pswitch_d
    .end packed-switch
.end method
