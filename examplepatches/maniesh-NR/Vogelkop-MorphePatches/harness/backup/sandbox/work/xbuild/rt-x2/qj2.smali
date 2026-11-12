.class public final synthetic Lqj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lqj2;->a:B

    iput-object p1, p0, Lqj2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 23

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    iget-byte v3, v0, Lqj2;->a:B

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, -0x1

    iget-object v0, v0, Lqj2;->b:Ljava/lang/Object;

    packed-switch v3, :pswitch_data_412

    check-cast v0, Lkotlin/jvm/functions/Function1;

    if-ne v1, v8, :cond_2d

    if-eqz v2, :cond_1f

    const-string v1, "android.speech.extra.RESULTS"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_20

    :cond_1f
    move-object v1, v7

    :goto_20
    if-eqz v1, :cond_29

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljava/lang/String;

    :cond_29
    invoke-interface {v0, v7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_30

    :cond_2d
    invoke-interface {v0, v7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_30
    return-void

    :pswitch_31
    check-cast v0, Lo32;

    if-ne v1, v8, :cond_38

    invoke-virtual {v0}, Lo32;->run()V

    :cond_38
    return-void

    :pswitch_39
    check-cast v0, Liyk;

    if-ne v1, v8, :cond_6c

    if-eqz v2, :cond_6c

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v3

    if-eqz v3, :cond_60

    invoke-virtual {v3}, Landroid/content/ClipData;->getItemCount()I

    move-result v2

    :goto_4e
    if-ge v6, v2, :cond_69

    invoke-virtual {v3, v6}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_5d

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5d
    add-int/lit8 v6, v6, 0x1

    goto :goto_4e

    :cond_60
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_69

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_69
    invoke-virtual {v0, v1}, Liyk;->run(Ljava/lang/Object;)V

    :cond_6c
    return-void

    :pswitch_6d
    check-cast v0, Lcom/opera/api/Callback;

    if-ne v1, v8, :cond_80

    if-eqz v2, :cond_80

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_80

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_80
    return-void

    :pswitch_81
    check-cast v0, Lhv3;

    if-ne v1, v8, :cond_309

    if-eqz v2, :cond_309

    const-string v1, "scan-result"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    const/16 v3, 0x8

    const-string v8, ""

    if-eqz v1, :cond_214

    const-string v9, "raw-value"

    invoke-virtual {v1, v9}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_9c

    move-object v9, v8

    :cond_9c
    const-string v10, "value-type"

    invoke-virtual {v1, v10}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v10

    sget-object v11, Lgmi;->d:Lh58;

    const-string v12, "format"

    invoke-virtual {v1, v12}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v11, v1}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgmi;

    invoke-static {v9, v10, v1}, Ly4h;->e(Ljava/lang/String;ILgmi;)Lhmi;

    move-result-object v1

    iget-object v9, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v10, v1, Lhmi;->d:Lfmi;

    iget-object v1, v1, Lhmi;->c:Lgmi;

    instance-of v11, v10, Lbmi;

    if-eqz v11, :cond_e5

    iget-object v11, v9, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v11, :cond_c3

    move-object v11, v7

    :cond_c3
    invoke-virtual {v11, v6}, Lgbf;->m(Z)V

    check-cast v10, Lbmi;

    iget-object v10, v10, Lbmi;->a:Ljava/lang/String;

    const-string v11, "fido:/"

    invoke-static {v10, v11, v5}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_214

    :try_start_d2
    new-instance v5, Landroid/content/Intent;

    const-string v11, "android.intent.action.VIEW"

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v5, v11, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v9, v5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_e0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_d2 .. :try_end_e0} :catch_e0

    :catch_e0
    invoke-virtual {v0, v4, v1, v3}, Lhv3;->a(ILgmi;I)V

    goto/16 :goto_214

    :cond_e5
    instance-of v11, v10, Lemi;

    if-eqz v11, :cond_105

    iget-object v5, v9, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v5, :cond_ee

    move-object v5, v7

    :cond_ee
    invoke-virtual {v5, v6}, Lgbf;->m(Z)V

    check-cast v10, Lemi;

    iget-object v5, v10, Lemi;->b:Ll1o;

    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x1e

    if-lt v10, v11, :cond_214

    :try_start_fb
    invoke-static {v5, v9}, Lt0h;->r(Ll1o;Landroid/app/Activity;)V
    :try_end_fe
    .catch Ljava/lang/IllegalArgumentException; {:try_start_fb .. :try_end_fe} :catch_214
    .catch Ljava/lang/IllegalStateException; {:try_start_fb .. :try_end_fe} :catch_214

    const/16 v5, 0x9

    invoke-virtual {v0, v4, v1, v5}, Lhv3;->a(ILgmi;I)V

    goto/16 :goto_214

    :cond_105
    instance-of v11, v10, Lcmi;

    const/4 v12, 0x3

    if-eqz v11, :cond_123

    iget-object v13, v9, Lcom/opera/android/BrowserActivity;->d0:Lwth;

    check-cast v10, Lcmi;

    iget-object v14, v10, Lcmi;->a:Ljava/lang/String;

    const/16 v19, 0x0

    const/16 v18, 0x0

    const/4 v15, 0x7

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-virtual/range {v13 .. v19}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    iget v4, v10, Lcmi;->b:I

    invoke-virtual {v0, v12, v1, v4}, Lhv3;->a(ILgmi;I)V

    goto/16 :goto_214

    :cond_123
    instance-of v11, v10, Ldmi;

    if-eqz v11, :cond_20f

    iget-object v11, v9, Lcom/opera/android/BrowserActivity;->x:Lumi;

    check-cast v10, Ldmi;

    iget-object v10, v10, Ldmi;->a:Ljava/lang/String;

    new-instance v13, Liu2;

    const/4 v14, 0x7

    invoke-direct {v13, v0, v14}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9, v11, v10, v5, v13}, Lc09;->t(Landroid/content/Context;Lumi;Ljava/lang/String;ZLcom/opera/api/Callback;)Z

    move-result v11

    if-eqz v11, :cond_146

    iget-object v5, v9, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v5, :cond_13e

    move-object v5, v7

    :cond_13e
    invoke-virtual {v5, v6}, Lgbf;->m(Z)V

    invoke-virtual {v0, v4, v1, v3}, Lhv3;->a(ILgmi;I)V

    goto/16 :goto_214

    :cond_146
    iget-object v11, v9, Lcom/opera/android/BrowserActivity;->Y0:Lzyk;

    invoke-virtual {v11}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lulg;

    iget-object v13, v11, Lulg;->b:Lbml;

    invoke-virtual {v13}, Lno7;->i()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Laml;

    iget-object v13, v13, Laml;->e:Ljava/lang/String;

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_16c

    const-string v14, "https://"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_16c

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_1a6

    :cond_16c
    iget-object v9, v9, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v9, :cond_171

    move-object v9, v7

    :cond_171
    invoke-virtual {v9, v10}, Lgbf;->k(Ljava/lang/String;)V

    iget-object v9, v9, Lgbf;->t:Lbpd;

    invoke-virtual {v9}, Lbpd;->y()Lupm;

    move-result-object v9

    invoke-interface {v9}, Lupm;->g()Lxbf;

    move-result-object v9

    new-instance v10, Lwbf;

    iget-object v11, v9, Lxbf;->e:Ljava/lang/Object;

    check-cast v11, Lesk;

    invoke-interface {v11}, Lesk;->get()Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Lsko;->s(Ljava/lang/Object;)V

    sget-object v11, Lrkk;->b:Lrkk;

    sget-object v13, Llqm;->i:Llqm;

    invoke-direct {v10, v9, v11, v6, v13}, Lwbf;-><init>(Lxbf;Lj7h;ILlqm;)V

    invoke-virtual {v10}, Lwbf;->b()V

    iget-object v9, v10, Lwbf;->d:Llbf;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eq v9, v5, :cond_1a2

    if-eq v9, v4, :cond_1a1

    move v4, v5

    goto :goto_1a2

    :cond_1a1
    move v4, v12

    :cond_1a2
    :goto_1a2
    invoke-virtual {v0, v4, v1, v3}, Lhv3;->a(ILgmi;I)V

    goto :goto_214

    :cond_1a6
    iget-object v5, v11, Lulg;->d:Lji;

    invoke-virtual {v5}, Lji;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-nez v5, :cond_1be

    iput-object v7, v11, Lulg;->f:Lokhttp3/internal/connection/RealCall;

    new-instance v5, Lq2g;

    const/4 v10, 0x6

    const-string v12, "Error: No leanplum token, are Opera notifications disabled?"

    invoke-direct {v5, v11, v12, v10}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v5}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_203

    :cond_1be
    iget-object v12, v11, Lulg;->f:Lokhttp3/internal/connection/RealCall;

    if-eqz v12, :cond_1c5

    invoke-interface {v12}, Lv84;->cancel()V

    :cond_1c5
    iget-object v12, v11, Lulg;->a:Lii;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lt9f;

    new-instance v13, Lfvh;

    invoke-direct {v13}, Lfvh;-><init>()V

    invoke-virtual {v13, v10}, Lfvh;->h(Ljava/lang/String;)V

    const-string v10, "leanplum-fcm-token"

    invoke-virtual {v13, v10, v5}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, v11, Lulg;->c:Lm9c;

    invoke-virtual {v5}, Lm9c;->b()Ljava/lang/String;

    move-result-object v5

    const-string v10, "leanplum-id"

    invoke-virtual {v13, v10, v5}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "leanplum-app-id"

    const-string v10, "app_sxoB1f2yjpKREigcunDkrki2Lxy1KG5wdgEe6QsHmnk"

    invoke-virtual {v13, v5, v10}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "leanplum-device-model"

    invoke-static {}, Lcom/leanplum/internal/Util;->getDeviceModel()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v13, v5, v10}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Lkvh;

    invoke-direct {v5, v13}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v12, v5}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v5

    iput-object v5, v11, Lulg;->f:Lokhttp3/internal/connection/RealCall;

    invoke-interface {v5, v11}, Lv84;->enqueue(Lf94;)V

    :goto_203
    iget-object v5, v9, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v5, :cond_208

    move-object v5, v7

    :cond_208
    invoke-virtual {v5, v6}, Lgbf;->m(Z)V

    invoke-virtual {v0, v4, v1, v3}, Lhv3;->a(ILgmi;I)V

    goto :goto_214

    :cond_20f
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_323

    :catch_214
    :cond_214
    :goto_214
    const-string v1, "google-lens-image-data"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v1

    if-eqz v1, :cond_323

    const-string v4, "google-lens-image-width"

    invoke-virtual {v2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const-string v5, "google-lens-image-height"

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v9, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v9}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v0

    iget-object v0, v0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_245
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_263

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Leri;

    sget-object v11, Leti;->a:Lq6e;

    if-nez v10, :cond_258

    move v11, v6

    goto :goto_25a

    :cond_258
    instance-of v11, v10, Lf1a;

    :goto_25a
    if-eqz v11, :cond_245

    invoke-interface {v10}, Leri;->c()Z

    move-result v10

    if-eqz v10, :cond_245

    goto :goto_264

    :cond_263
    move-object v5, v7

    :goto_264
    check-cast v5, Leri;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v9}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v11

    if-eqz v11, :cond_323

    if-eqz v5, :cond_323

    new-instance v0, Landroid/util/Size;

    invoke-direct {v0, v4, v2}, Landroid/util/Size;-><init>(II)V

    new-instance v10, Landroid/util/Size;

    invoke-direct {v10, v4, v2}, Landroid/util/Size;-><init>(II)V

    iget-object v2, v9, Lcom/opera/android/BrowserActivity;->B:Lcom/opera/android/browser/BrowserContainer;

    if-eqz v2, :cond_27f

    move-object v7, v2

    :cond_27f
    invoke-virtual {v7}, Landroid/view/View;->isLaidOut()Z

    move-result v2

    if-nez v2, :cond_28b

    new-instance v2, Landroid/util/Size;

    invoke-direct {v2, v6, v6}, Landroid/util/Size;-><init>(II)V

    goto :goto_2c5

    :cond_28b
    invoke-virtual {v9}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v2

    iget-object v2, v2, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget-object v2, v2, Lzy4;->a:Lb7f;

    iget-object v2, v2, Lb7f;->b:Ljava/lang/Object;

    check-cast v2, Ldtl;

    iget v4, v2, Ldtl;->a:I

    iget v2, v2, Ldtl;->c:I

    add-int/2addr v4, v2

    invoke-virtual {v9}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    new-instance v6, Landroid/util/Size;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v10

    int-to-float v10, v10

    div-float/2addr v10, v2

    float-to-double v12, v10

    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-int v10, v12

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v7

    sub-int/2addr v7, v4

    int-to-float v4, v7

    div-float/2addr v4, v2

    float-to-double v12, v4

    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-int v2, v12

    invoke-direct {v6, v10, v2}, Landroid/util/Size;-><init>(II)V

    move-object v2, v6

    :goto_2c5
    invoke-interface {v5, v1, v0, v2, v8}, Leri;->g([BLandroid/util/Size;Landroid/util/Size;Ljava/lang/String;)Llsc;

    move-result-object v0

    move-object v1, v11

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v10

    const/4 v12, 0x0

    sget-object v13, Llqm;->l:Llqm;

    const/4 v14, 0x0

    invoke-virtual/range {v9 .. v14}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    move-result-object v1

    iget-object v2, v0, Lksc;->i:Lorg/chromium/content_public/common/ResourceRequestBody;

    if-eqz v2, :cond_2f2

    iget-object v2, v0, Lksc;->a:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Lic4;->v(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_2f2

    new-instance v2, Lqz;

    invoke-direct {v2, v0, v3}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Ld7l;->e0(La2l;)V

    :cond_2f2
    invoke-virtual {v1, v0}, Ld7l;->Z(Llsc;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v9}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lx5f;->S(I)V

    goto :goto_323

    :cond_309
    if-ne v1, v5, :cond_323

    if-eqz v2, :cond_323

    const-string v1, "error-message"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_323

    iget-object v0, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object v0

    new-instance v2, Lqxh;

    invoke-direct {v2, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {v0, v2}, Ljoh;->h(Lysj;Lpxh;)V

    :cond_323
    :goto_323
    return-void

    :pswitch_324
    check-cast v0, Lvdf;

    invoke-virtual {v0}, Lvdf;->run()V

    return-void

    :pswitch_32a
    check-cast v0, Lf6g;

    if-eqz v1, :cond_355

    if-eqz v2, :cond_355

    invoke-virtual {v2}, Landroid/content/Intent;->getFlags()I

    move-result v3

    and-int/2addr v3, v4

    if-ne v3, v4, :cond_33d

    if-ne v1, v8, :cond_33d

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    :cond_33d
    iget-object v1, v0, Lf6g;->y:Lbjf;

    if-eqz v7, :cond_352

    invoke-virtual {v0}, Lf6g;->J0()Lm6g;

    move-result-object v0

    iget-object v0, v0, Lm6g;->g:Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, LJ/N;->MK6CSGnD(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_355

    :cond_352
    invoke-virtual {v1, v6}, Lbjf;->a(Z)V

    :cond_355
    :goto_355
    return-void

    :pswitch_356
    check-cast v0, Lhpd;

    invoke-virtual {v0}, Lhpd;->run()V

    return-void

    :pswitch_35c
    check-cast v0, Lfge;

    if-ne v1, v8, :cond_384

    if-eqz v2, :cond_384

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_384

    const-string v1, "content"

    invoke-virtual {v2}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_384

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, v0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1, v5}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    invoke-virtual {v0, v1, v7}, Lfge;->H0(Landroid/net/Uri;Ljava/lang/String;)V

    :cond_384
    return-void

    :pswitch_385
    check-cast v0, Lf3b;

    if-ne v1, v8, :cond_38c

    invoke-virtual {v0}, Lf3b;->invoke()Ljava/lang/Object;

    :cond_38c
    return-void

    :pswitch_38d
    check-cast v0, Lp2b;

    if-ne v1, v8, :cond_394

    invoke-virtual {v0}, Lp2b;->invoke()Ljava/lang/Object;

    :cond_394
    return-void

    :pswitch_395
    check-cast v0, Lp2b;

    if-ne v1, v8, :cond_39c

    invoke-virtual {v0}, Lp2b;->invoke()Ljava/lang/Object;

    :cond_39c
    return-void

    :pswitch_39d
    check-cast v0, Lp2b;

    if-ne v1, v8, :cond_3a4

    invoke-virtual {v0}, Lp2b;->invoke()Ljava/lang/Object;

    :cond_3a4
    return-void

    :pswitch_3a5
    check-cast v0, Ld2b;

    if-ne v1, v8, :cond_3ac

    invoke-virtual {v0}, Ld2b;->invoke()Ljava/lang/Object;

    :cond_3ac
    return-void

    :pswitch_3ad
    check-cast v0, Lilm;

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    if-eq v1, v8, :cond_3b4

    move v5, v6

    :cond_3b4
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lilm;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_3bc
    check-cast v0, Lim3;

    if-eqz v1, :cond_3fe

    if-eqz v2, :cond_3fe

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    if-ne v1, v8, :cond_3ef

    if-eqz v3, :cond_3ef

    invoke-virtual {v2}, Landroid/content/Intent;->getFlags()I

    move-result v1

    and-int/2addr v1, v4

    if-ne v1, v4, :cond_3ef

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    iget-object v1, v1, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lwx;

    const/16 v4, 0x12

    invoke-direct {v3, v0, v1, v4}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v2, v3}, LJ/N;->M6usCwUF(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3fe

    :cond_3ef
    iget-object v0, v0, Lltl;->n:Lqm9;

    new-instance v1, Lglj;

    const v2, 0x7f14071a

    const/16 v3, 0x1388

    invoke-direct {v1, v2, v3}, Lglj;-><init>(II)V

    invoke-virtual {v0, v1}, Lqm9;->f(Lo93;)V

    :cond_3fe
    :goto_3fe
    return-void

    :pswitch_3ff
    check-cast v0, Lsj2;

    iget-object v2, v0, Lsj2;->d:Ljava/lang/Object;

    check-cast v2, Lrj2;

    if-ne v1, v8, :cond_40e

    invoke-interface {v2}, Lrj2;->Y()V

    invoke-virtual {v0}, Lsj2;->i()V

    goto :goto_411

    :cond_40e
    invoke-interface {v2}, Lrj2;->c0()V

    :goto_411
    return-void

    :pswitch_data_412
    .packed-switch 0x0
        :pswitch_3ff
        :pswitch_3bc
        :pswitch_3ad
        :pswitch_3a5
        :pswitch_39d
        :pswitch_395
        :pswitch_38d
        :pswitch_385
        :pswitch_35c
        :pswitch_356
        :pswitch_32a
        :pswitch_324
        :pswitch_81
        :pswitch_6d
        :pswitch_39
        :pswitch_31
    .end packed-switch
.end method
