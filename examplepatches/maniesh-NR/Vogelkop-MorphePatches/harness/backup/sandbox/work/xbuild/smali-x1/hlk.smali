.class public final Lhlk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lknf;
.implements Ltdn;


# instance fields
.field public final a:Lpde;

.field public final b:Lshf;

.field public final c:Ljava/lang/String;

.field public final d:Lslk;

.field public final e:Lydn;

.field public final f:Lxb;

.field public final g:Ljtg;

.field public final h:Lebh;

.field public final i:Lgmk;

.field public final j:Lru9;

.field public final k:Lo4g;

.field public final l:Lcom/opera/android/browser/OperaPageRootView;

.field public final m:Lfwf;

.field public final n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;Lslk;Lydn;Lxb;Ljtg;Lebh;Lgmk;Lru9;)V
    .registers 37

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    move-object/from16 v4, p8

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lhlk;->a:Lpde;

    move-object/from16 v7, p3

    iput-object v7, v0, Lhlk;->c:Ljava/lang/String;

    iput-object v2, v0, Lhlk;->d:Lslk;

    move-object/from16 v7, p5

    iput-object v7, v0, Lhlk;->e:Lydn;

    iput-object v3, v0, Lhlk;->f:Lxb;

    move-object/from16 v7, p7

    iput-object v7, v0, Lhlk;->g:Ljtg;

    iput-object v4, v0, Lhlk;->h:Lebh;

    iput-object v5, v0, Lhlk;->i:Lgmk;

    iput-object v6, v0, Lhlk;->j:Lru9;

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v7

    const v8, 0x7f0d03d7

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v7, v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    const v8, 0x7f0a0036

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v14, v11

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_156

    const v8, 0x7f0a019d

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v15, v11

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_156

    const v8, 0x7f0a022b

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v16, v11

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_156

    const v8, 0x7f0a0269

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v17, v11

    check-cast v17, Landroid/widget/ScrollView;

    if-eqz v17, :cond_156

    const v8, 0x7f0a05df

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v18, v11

    check-cast v18, Lcom/google/android/material/button/MaterialButton;

    if-eqz v18, :cond_156

    const v8, 0x7f0a07cc

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v19, v11

    check-cast v19, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v19, :cond_156

    const v8, 0x7f0a0859

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v20, v11

    check-cast v20, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v20, :cond_156

    const v8, 0x7f0a0886

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v21, v11

    check-cast v21, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v21, :cond_156

    const v8, 0x7f0a0887

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v22, v11

    check-cast v22, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v22, :cond_156

    const v8, 0x7f0a0a38

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v23, v11

    check-cast v23, Lcom/google/android/material/button/MaterialButton;

    if-eqz v23, :cond_156

    const v8, 0x7f0a0af3

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v24, v11

    check-cast v24, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v24, :cond_156

    const v8, 0x7f0a0cc0

    invoke-static {v8, v7}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v25, v11

    check-cast v25, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v25, :cond_156

    new-instance v12, Lo4g;

    move-object v13, v7

    check-cast v13, Lcom/opera/android/browser/OperaPageRootView;

    invoke-direct/range {v12 .. v25}, Lo4g;-><init>(Lcom/opera/android/browser/OperaPageRootView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/ScrollView;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object/from16 v11, v17

    move-object/from16 v7, v18

    move-object/from16 v8, v23

    iput-object v12, v0, Lhlk;->k:Lo4g;

    new-instance v9, Lshf;

    invoke-direct {v9, v1, v11}, Lshf;-><init>(Lpde;Landroid/widget/ScrollView;)V

    iput-object v9, v0, Lhlk;->b:Lshf;

    iput-object v13, v0, Lhlk;->l:Lcom/opera/android/browser/OperaPageRootView;

    new-instance v1, Lfwf;

    invoke-virtual/range {p1 .. p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v9

    invoke-direct {v1, v9}, Lfwf;-><init>(Ltcc;)V

    iput-object v1, v0, Lhlk;->m:Lfwf;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const-wide/16 v11, 0x0

    move-object/from16 v13, p1

    invoke-static {v13, v9, v11, v12}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v9, v0, Lhlk;->n:Ljava/lang/String;

    iget-object v2, v2, Lslk;->i:Lkze;

    new-instance v9, Lflk;

    invoke-direct {v9, v0, v10}, Lflk;-><init>(Lhlk;B)V

    invoke-virtual {v2, v1, v9}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v3, Lxb;->e:Ljze;

    new-instance v3, Lflk;

    const/4 v9, 0x1

    invoke-direct {v3, v0, v9}, Lflk;-><init>(Lhlk;B)V

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v5, Lgmk;->a:Lkze;

    new-instance v3, Lflk;

    const/4 v5, 0x2

    invoke-direct {v3, v0, v5}, Lflk;-><init>(Lhlk;B)V

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    if-eqz v4, :cond_131

    iget-object v2, v4, Lebh;->a:Lode;

    new-instance v3, Lflk;

    const/4 v4, 0x3

    invoke-direct {v3, v0, v4}, Lflk;-><init>(Lhlk;B)V

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    :cond_131
    new-instance v2, Lx53;

    invoke-direct {v2, v0}, Lx53;-><init>(Lhlk;)V

    invoke-virtual {v6, v2}, Lru9;->a(Ln1;)V

    invoke-virtual {v1}, Lfwf;->getLifecycle()Ltcc;

    move-result-object v1

    new-instance v3, Lqs2;

    invoke-direct {v3, v6, v2}, Lqs2;-><init>(Lru9;Ln1;)V

    invoke-virtual {v1, v3}, Ltcc;->a(Lmdc;)V

    new-instance v1, Lglk;

    invoke-direct {v1, v0, v10}, Lglk;-><init>(Lhlk;B)V

    invoke-virtual {v7, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lglk;

    invoke-direct {v1, v0, v9}, Lglk;-><init>(Lhlk;B)V

    invoke-virtual {v8, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_156
    invoke-virtual {v7}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v9
.end method

.method public static c(J)Ljava/lang/String;
    .registers 4

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gtz v0, :cond_9

    const-string p0, ""

    return-object p0

    :cond_9
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    sget-object p0, Lyjb;->a:Lf30;

    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/text/SimpleDateFormat;

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final B()Likc;
    .registers 1

    iget-object p0, p0, Lhlk;->a:Lpde;

    return-object p0
.end method

.method public final C()V
    .registers 1

    invoke-virtual {p0}, Lhlk;->g()V

    return-void
.end method

.method public final E()V
    .registers 1

    return-void
.end method

.method public final F()V
    .registers 1

    return-void
.end method

.method public final a()V
    .registers 1

    return-void
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lhlk;->m:Lfwf;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lfwf;->a(Z)V

    iget-object v0, p0, Lhlk;->e:Lydn;

    invoke-virtual {v0, p0}, Lydn;->b(Ltdn;)V

    invoke-virtual {p0}, Lhlk;->y()V

    invoke-virtual {p0}, Lhlk;->g()V

    return-void
.end method

.method public final e()V
    .registers 3

    iget-object v0, p0, Lhlk;->m:Lfwf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lfwf;->a(Z)V

    iget-object v0, p0, Lhlk;->e:Lydn;

    invoke-virtual {v0, p0}, Lydn;->A(Ltdn;)V

    return-void
.end method

.method public final f()Z
    .registers 1

    iget-object p0, p0, Lhlk;->g:Ljtg;

    invoke-virtual {p0}, Ljtg;->b()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final g()V
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lhlk;->k:Lo4g;

    iget-object v2, v1, Lo4g;->f:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lhlk;->c(J)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v1, Lo4g;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v0, Lhlk;->n:Ljava/lang/String;

    invoke-static {v2, v3}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v1, Lo4g;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "Android "

    const-string v6, ", "

    invoke-static {v5, v3, v6, v4}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v0, Lhlk;->f:Lxb;

    iget-object v2, v2, Lxb;->e:Ljze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldpf;

    new-instance v3, Lyhe;

    const/16 v4, 0x1a

    invoke-direct {v3, v0, v4}, Lyhe;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Ldpf;->a(Lhpf;)V

    iget-object v2, v1, Lo4g;->h:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v0, Lhlk;->i:Lgmk;

    iget-object v3, v3, Lgmk;->a:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Luvg;

    iget-byte v3, v3, Luvg;->a:B

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v1, Lo4g;->k:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v0, Lhlk;->d:Lslk;

    iget-object v4, v3, Lslk;->i:Lkze;

    iget-object v5, v3, Lslk;->b:Ltmk;

    iget-object v6, v5, Ltmk;->a:Lmcj;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lwvg;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iget v8, v4, Lwvg;->e:I

    iget-object v9, v4, Lwvg;->h:Ljmk;

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v10

    const/4 v11, 0x6

    const-string v12, "None"

    if-eqz v10, :cond_83

    const-string v8, "Not available"

    goto :goto_a6

    :cond_83
    if-eqz v8, :cond_a4

    const/4 v10, 0x2

    if-eq v8, v10, :cond_a1

    const/4 v10, 0x3

    if-eq v8, v10, :cond_9e

    const/4 v10, 0x4

    if-eq v8, v10, :cond_9b

    const/4 v10, 0x5

    if-eq v8, v10, :cond_98

    if-eq v8, v11, :cond_95

    move-object v8, v12

    goto :goto_a6

    :cond_95
    const-string v8, "Expired"

    goto :goto_a6

    :cond_98
    const-string v8, "Paused"

    goto :goto_a6

    :cond_9b
    const-string v8, "Canceled"

    goto :goto_a6

    :cond_9e
    const-string v8, "Active"

    goto :goto_a6

    :cond_a1
    const-string v8, "Pending"

    goto :goto_a6

    :cond_a4
    const-string v8, "Loading"

    :goto_a6
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v4, Lwvg;->a:Ljava/lang/String;

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v10

    const-string v13, ""

    if-eqz v10, :cond_b5

    move-object v8, v13

    goto :goto_bb

    :cond_b5
    const-string v10, "ID: "

    invoke-virtual {v10, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :goto_bb
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-wide v14, v4, Lwvg;->c:J

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v8

    if-nez v8, :cond_d0

    invoke-static {v14, v15}, Lhlk;->c(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_d2

    :cond_d0
    move-object v8, v13

    goto :goto_d8

    :cond_d2
    const-string v10, "Expire time: "

    invoke-virtual {v10, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :goto_d8
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v6, Lmcj;->a:Ljava/lang/Object;

    check-cast v8, Lb59;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/SharedPreferences;

    const-string v10, "last_request"

    const-wide/16 v14, 0x0

    invoke-interface {v8, v10, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v8

    const-string v10, "never"

    if-eqz v8, :cond_f7

    move-object v8, v13

    goto :goto_10d

    :cond_f7
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v11, "Last request: "

    invoke-direct {v8, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static/range {v16 .. v17}, Lhlk;->c(J)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11, v10}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_10d
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, v6, Lmcj;->a:Ljava/lang/Object;

    check-cast v6, Lb59;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    const-string v8, "last_response"

    invoke-interface {v6, v8, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v6

    if-eqz v6, :cond_128

    move-object v6, v13

    goto :goto_13e

    :cond_128
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "Last response: "

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static/range {v16 .. v17}, Lhlk;->c(J)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v10}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_13e
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v6

    if-nez v6, :cond_14b

    iget-object v4, v4, Lwvg;->g:Lck8;

    if-nez v4, :cond_153

    :cond_14b
    move-object/from16 v18, v12

    move-object v4, v13

    move-object/from16 v19, v4

    move-wide/from16 v16, v14

    goto :goto_1c1

    :cond_153
    move-wide/from16 v16, v14

    iget-wide v14, v4, Lck8;->c:J

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object v8, v12

    iget-wide v11, v4, Lck8;->d:J

    cmp-long v4, v14, v16

    if-lez v4, :cond_186

    new-instance v4, Ljava/text/SimpleDateFormat;

    move-object/from16 v18, v8

    const-string v8, "yyMMdd"

    move-object/from16 v19, v13

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v8, v13}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v8, "UTC"

    invoke-static {v8}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v14, v15}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_18f

    :cond_186
    move-object/from16 v18, v8

    move-object/from16 v19, v13

    const-string v4, "000000"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_18f
    const-string v4, "_"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    cmp-long v4, v11, v16

    if-lez v4, :cond_1ae

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v8, "MMdd_HHmm"

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v8, v13}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v11, v12}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1b3

    :cond_1ae
    const-string v4, "0000_0000"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1b3
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, "CID: "

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_1c1
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-nez v9, :cond_1c9

    move-object/from16 v4, v19

    goto :goto_1df

    :cond_1c9
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Source: "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v9, Ljmk;->a:Ljava/lang/String;

    const-string v8, "none"

    invoke-static {v6, v8}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_1df
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Lo00;

    const/4 v6, 0x7

    invoke-direct {v4, v6}, Lo00;-><init>(B)V

    new-instance v6, Lzlb;

    const/4 v8, 0x0

    invoke-direct {v6, v7, v4, v8}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    const-string v4, "\n"

    invoke-static {v4, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v1, Lo4g;->l:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iget-object v7, v0, Lhlk;->e:Lydn;

    invoke-virtual {v7}, Lydn;->p()Lwdn;

    move-result-object v9

    iget-boolean v9, v9, Lwdn;->a:Z

    const-string v11, "Off"

    const-string v12, "On"

    const-string v13, "Not supported"

    if-nez v9, :cond_212

    move-object v9, v13

    goto :goto_21b

    :cond_212
    iget-object v9, v7, Lydn;->d:Lvdn;

    iget-boolean v9, v9, Lvdn;->a:Z

    if-eqz v9, :cond_21a

    move-object v9, v12

    goto :goto_21b

    :cond_21a
    move-object v9, v11

    :goto_21b
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Lydn;->p()Lwdn;

    move-result-object v9

    iget-boolean v9, v9, Lwdn;->a:Z

    const-string v14, "vpn_pro.kill_switch.on"

    iget-object v15, v0, Lhlk;->j:Lru9;

    if-nez v9, :cond_22d

    move-object/from16 v9, v19

    goto :goto_258

    :cond_22d
    iget-object v9, v15, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v9, v14, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_238

    const-string v9, "VpnPro: disabled by user"

    goto :goto_258

    :cond_238
    invoke-virtual {v7}, Lydn;->p()Lwdn;

    move-result-object v9

    invoke-virtual {v9}, Lwdn;->a()Z

    move-result v9

    if-nez v9, :cond_245

    const-string v9, "VpnPro: not supported"

    goto :goto_258

    :cond_245
    iget-object v9, v7, Lydn;->c:Lgfn;

    invoke-interface {v9}, Lgfn;->isEnabled()Z

    move-result v9

    if-eqz v9, :cond_250

    const-string v9, "available"

    goto :goto_252

    :cond_250
    const-string v9, "unavailable"

    :goto_252
    const-string v8, "VpnPro: "

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    :goto_258
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v7, Lydn;->d:Lvdn;

    iget-object v8, v8, Lvdn;->b:Lefn;

    if-eqz v8, :cond_26a

    iget-object v8, v7, Lydn;->F:Lren;

    if-eqz v8, :cond_26a

    invoke-interface {v8}, Lren;->b()Ljava/lang/String;

    move-result-object v8

    goto :goto_26b

    :cond_26a
    const/4 v8, 0x0

    :goto_26b
    if-nez v8, :cond_270

    move-object/from16 v8, v19

    goto :goto_276

    :cond_270
    const-string v9, "Connection: "

    invoke-virtual {v9, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :goto_276
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v7, Lydn;->d:Lvdn;

    iget-object v8, v8, Lvdn;->c:Lhfn;

    const-string v9, "Error code: "

    if-eqz v8, :cond_290

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-short v8, v8, Lhfn;->a:S

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_29b

    :cond_290
    iget v7, v7, Lydn;->J:I

    if-eqz v7, :cond_299

    invoke-static {v7, v9}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_29b

    :cond_299
    move-object/from16 v7, v19

    :goto_29b
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v7, Lo00;

    const/16 v8, 0x8

    invoke-direct {v7, v8}, Lo00;-><init>(B)V

    new-instance v8, Lzlb;

    const/4 v9, 0x0

    invoke-direct {v8, v6, v7, v9}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v4, v8}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v1, Lo4g;->j:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, v3, Lslk;->d:Lode;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v7

    if-eqz v7, :cond_2cc

    move-object/from16 v11, v19

    goto :goto_2d8

    :cond_2cc
    if-nez v3, :cond_2d1

    const-string v11, "Unknown"

    goto :goto_2d8

    :cond_2d1
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2d8

    move-object v11, v12

    :cond_2d8
    :goto_2d8
    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v3, v5, Ltmk;->a:Lmcj;

    iget-object v3, v3, Lmcj;->a:Ljava/lang/Object;

    check-cast v3, Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-string v5, "last_push"

    move-wide/from16 v7, v16

    invoke-interface {v3, v5, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-virtual {v0}, Lhlk;->f()Z

    move-result v3

    if-eqz v3, :cond_2f8

    move-object/from16 v3, v19

    goto :goto_30e

    :cond_2f8
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Last: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v7, v8}, Lhlk;->c(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v10}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_30e
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lo00;

    const/16 v5, 0x9

    invoke-direct {v3, v5}, Lo00;-><init>(B)V

    new-instance v5, Lzlb;

    const/4 v9, 0x0

    invoke-direct {v5, v6, v3, v9}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v4, v5}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v1, Lo4g;->i:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, v0, Lhlk;->h:Lebh;

    if-nez v0, :cond_330

    move-object v12, v13

    const/4 v9, 0x0

    goto :goto_38a

    :cond_330
    iget-object v0, v0, Lebh;->a:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh1b;

    if-eqz v0, :cond_387

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_387

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Lh1b;->u(I)La1b;

    move-result-object v0

    :goto_34a
    invoke-virtual {v0}, Lq4;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_376

    invoke-virtual {v0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Luah;

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object v7, v5, Luah;->e:Lh1b;

    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    iget-boolean v5, v5, Luah;->f:Z

    if-eqz v5, :cond_365

    const-string v5, "acknowledged"

    goto :goto_367

    :cond_365
    const-string v5, "pending"

    :goto_367
    filled-new-array {v7, v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v7, "%s: %s"

    invoke-static {v6, v7, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v9, 0x0

    goto :goto_34a

    :cond_376
    new-instance v0, Lo00;

    const/4 v5, 0x6

    invoke-direct {v0, v5}, Lo00;-><init>(B)V

    new-instance v5, Lzlb;

    const/4 v9, 0x0

    invoke-direct {v5, v3, v0, v9}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v4, v5}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v12

    goto :goto_38a

    :cond_387
    const/4 v9, 0x0

    move-object/from16 v12, v18

    :goto_38a
    invoke-static {v2, v12}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v0, v1, Lo4g;->d:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iget-object v1, v15, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v1, v14, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_39d

    const v1, 0x7f140699

    goto :goto_3a0

    :cond_39d
    const v1, 0x7f140582

    :goto_3a0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhlk;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getView()Lcom/opera/android/browser/OperaPageRootView;
    .registers 1

    iget-object p0, p0, Lhlk;->l:Lcom/opera/android/browser/OperaPageRootView;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 1

    const-string p0, "Subscription"

    return-object p0
.end method

.method public final o()V
    .registers 1

    return-void
.end method

.method public final q()V
    .registers 1

    return-void
.end method

.method public final r()V
    .registers 5

    iget-object p0, p0, Lhlk;->b:Lshf;

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_25

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmnf;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lmnf;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget p0, p0, Lmnf;->b:I

    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/view/View;->setPadding(IIII)V

    :cond_25
    return-void
.end method

.method public final s()V
    .registers 1

    invoke-virtual {p0}, Lhlk;->g()V

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method

.method public final u()V
    .registers 1

    return-void
.end method

.method public final w()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final y()V
    .registers 1

    invoke-virtual {p0}, Lhlk;->g()V

    iget-object p0, p0, Lhlk;->h:Lebh;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lebh;->c()V

    :cond_a
    return-void
.end method

.method public final z()Ljava/lang/String;
    .registers 1

    const-string p0, "opera://subscription"

    return-object p0
.end method
