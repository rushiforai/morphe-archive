.class public final synthetic Lay1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/Comparable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    .line 17
    iput-byte p6, p0, Lay1;->a:B

    iput-object p1, p0, Lay1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lay1;->d:Ljava/lang/Object;

    iput-object p3, p0, Lay1;->b:Ljava/lang/Object;

    iput-object p4, p0, Lay1;->e:Ljava/lang/Object;

    iput-object p5, p0, Lay1;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    .line 18
    iput-byte p6, p0, Lay1;->a:B

    iput-object p1, p0, Lay1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lay1;->d:Ljava/lang/Object;

    iput-object p3, p0, Lay1;->e:Ljava/lang/Object;

    iput-object p4, p0, Lay1;->b:Ljava/lang/Object;

    iput-object p5, p0, Lay1;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lshf;Lcom/opera/api/Callback;B)V
    .registers 7

    .line 19
    iput-byte p6, p0, Lay1;->a:B

    iput-object p1, p0, Lay1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lay1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lay1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lay1;->e:Ljava/lang/Object;

    iput-object p5, p0, Lay1;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lmyk;Ljava/lang/String;Lji2;Lji2;Lmgh;)V
    .registers 7

    const/4 v0, 0x7

    iput-byte v0, p0, Lay1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lay1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lay1;->b:Ljava/lang/Object;

    iput-object p3, p0, Lay1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lay1;->e:Ljava/lang/Object;

    iput-object p5, p0, Lay1;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Lay1;->a:B

    const-string v5, "application/json"

    const-string v6, "package_name"

    const-string v7, "device_id"

    const-string v9, "com.opera.browser.beta"

    const-string v10, "Bearer "

    const-string v11, "Authorization"

    const-string v12, "Required value was null."

    const-string v13, "POST"

    const/4 v14, 0x0

    const/4 v15, 0x0

    iget-object v3, v0, Lay1;->f:Ljava/lang/Object;

    iget-object v2, v0, Lay1;->e:Ljava/lang/Object;

    const/16 v18, 0x1

    iget-object v4, v0, Lay1;->d:Ljava/lang/Object;

    iget-object v8, v0, Lay1;->b:Ljava/lang/Object;

    iget-object v0, v0, Lay1;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_308

    check-cast v0, Lmyk;

    check-cast v8, Ljava/lang/String;

    check-cast v4, Lji2;

    check-cast v2, Lji2;

    check-cast v3, Lmgh;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v8}, Lmyk;->c(Ljava/lang/String;)V

    iget-object v5, v0, Lmyk;->i:Llyk;

    if-eqz v5, :cond_3d

    invoke-virtual {v5}, Llyk;->cancel()V

    :cond_3d
    new-instance v5, Llyk;

    new-instance v6, Ljri;

    const/16 v7, 0x15

    invoke-direct {v6, v4, v1, v7}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v5, v0, v6, v2, v14}, Llyk;-><init>(Lmyk;Ljava/lang/Runnable;Lcom/opera/api/Callback;Ljava/lang/String;)V

    iput-object v5, v0, Lmyk;->i:Llyk;

    iput-object v5, v3, Lmgh;->b:Ljava/lang/Object;

    iget-object v15, v0, Lmyk;->b:Ldb;

    const/16 v17, 0x0

    const/16 v20, 0x0

    const/16 v18, 0x0

    move-object/from16 v16, v1

    move-object/from16 v19, v8

    invoke-virtual/range {v15 .. v20}, Ldb;->i(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_5d
    check-cast v8, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    check-cast v2, Lshf;

    check-cast v3, Lmy9;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    new-instance v5, Lfvh;

    invoke-direct {v5}, Lfvh;-><init>()V

    invoke-static {v1}, Lw8h;->l(Landroid/net/Uri;)Lhra;

    move-result-object v1

    const-string v6, "api/v1/free_trial/ofa/user/check_eligibility/premium_beta/"

    invoke-virtual {v1, v6}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v1

    if-eqz v1, :cond_b3

    iput-object v1, v5, Lfvh;->a:Lhra;

    invoke-virtual {v10, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v11, v1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v4}, Lw8h;->i(Ljava/lang/String;Ljava/lang/String;)Lpvh;

    move-result-object v1

    invoke-virtual {v5, v13, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, v5}, Lkvh;-><init>(Lfvh;)V

    iget-object v5, v2, Lshf;->b:Ljava/lang/Object;

    check-cast v5, Lumi;

    new-instance v6, Lb94;

    invoke-direct {v6, v5, v3, v15}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, v2, Lshf;->c:Ljava/lang/Object;

    check-cast v2, Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    invoke-virtual {v2, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v1

    new-instance v2, Lp8f;

    const/16 v3, 0x16

    invoke-direct {v2, v3, v6, v4, v0}, Lp8f;-><init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lv84;->enqueue(Lf94;)V

    goto :goto_b6

    :cond_b3
    invoke-static {v12}, Lqp2;->o(Ljava/lang/String;)V

    :goto_b6
    return-void

    :pswitch_b7
    check-cast v8, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    check-cast v2, Lshf;

    check-cast v3, Lny9;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    new-instance v10, Lfvh;

    invoke-direct {v10}, Lfvh;-><init>()V

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v11, Lrma;

    const/4 v15, 0x4

    invoke-direct {v11, v15}, Lrma;-><init>(B)V

    invoke-virtual {v11, v1, v14}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v11}, Lrma;->d()Lhra;

    move-result-object v1

    const-string v11, "api/v1/free_trial/ofa/start/premium_beta/"

    invoke-virtual {v1, v11}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v1

    if-eqz v1, :cond_133

    iput-object v1, v10, Lfvh;->a:Lhra;

    const-string v1, "campaign"

    invoke-static {v7, v8, v1, v0}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v0

    const-string v1, "token"

    invoke-virtual {v0, v4, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v9, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lrvh;->Companion:Lqvh;

    iget-object v0, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lesd;->e:Lkotlin/text/Regex;

    invoke-static {v5}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v4}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object v0

    invoke-virtual {v10, v13, v0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, v10}, Lkvh;-><init>(Lfvh;)V

    iget-object v1, v2, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Lumi;

    new-instance v4, Lb94;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v3, v5}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v2, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt9f;

    invoke-virtual {v1, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    new-instance v1, Lisd;

    const/16 v2, 0x1c

    invoke-direct {v1, v4, v2}, Lisd;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Lv84;->enqueue(Lf94;)V

    goto :goto_136

    :cond_133
    invoke-static {v12}, Lqp2;->o(Ljava/lang/String;)V

    :goto_136
    return-void

    :pswitch_137
    check-cast v8, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    check-cast v2, Lshf;

    check-cast v3, Lbha;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    new-instance v15, Lfvh;

    invoke-direct {v15}, Lfvh;-><init>()V

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 p0, v0

    new-instance v0, Lrma;

    move-object/from16 v16, v4

    const/4 v4, 0x4

    invoke-direct {v0, v4}, Lrma;-><init>(B)V

    invoke-virtual {v0, v1, v14}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v0}, Lrma;->d()Lhra;

    move-result-object v0

    const-string v1, "/api/v1/free_trial/ofa/transfer/"

    invoke-virtual {v0, v1}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v0

    if-eqz v0, :cond_1d9

    iput-object v0, v15, Lfvh;->a:Lhra;

    invoke-virtual {v10, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v11, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_175
    invoke-static/range {p0 .. p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_17c
    .catch Lorg/json/JSONException; {:try_start_175 .. :try_end_17c} :catch_1d4

    const-string v1, "subscription_id"

    :try_start_17e
    invoke-static/range {v16 .. v16}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_185
    .catch Lorg/json/JSONException; {:try_start_17e .. :try_end_185} :catch_1cf

    :try_start_185
    invoke-static {v9}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_18c
    .catch Lorg/json/JSONException; {:try_start_185 .. :try_end_18c} :catch_1ca

    sget-object v1, Lrvh;->Companion:Lqvh;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lesd;->e:Lkotlin/text/Regex;

    invoke-static {v5}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v4}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object v0

    invoke-virtual {v15, v13, v0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, v15}, Lkvh;-><init>(Lfvh;)V

    iget-object v1, v2, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Lumi;

    new-instance v4, Lb94;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v3, v5}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v2, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt9f;

    invoke-virtual {v1, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    new-instance v1, Lyhe;

    const/16 v2, 0x1b

    invoke-direct {v1, v4, v2}, Lyhe;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Lv84;->enqueue(Lf94;)V

    goto :goto_1dc

    :catch_1ca
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1dc

    :catch_1cf
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1dc

    :catch_1d4
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1dc

    :cond_1d9
    invoke-static {v12}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1dc
    return-void

    :pswitch_1dd
    move v5, v15

    check-cast v0, Lmdh;

    check-cast v4, Landroid/content/Context;

    check-cast v2, Ltta;

    check-cast v8, Lpde;

    check-cast v3, Ltt2;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    new-instance v6, Lydh;

    iget-object v0, v0, Lmdh;->f:Lcq5;

    invoke-virtual {v0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8f;

    invoke-virtual {v0}, Lf8f;->c()Z

    move-result v0

    if-eqz v0, :cond_202

    const/4 v0, 0x3

    goto :goto_203

    :cond_202
    const/4 v0, 0x2

    :goto_203
    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v7

    invoke-static {v4}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    iget-object v8, v2, Ltta;->h:Lsta;

    iget v9, v8, Lsta;->a:I

    shl-int/lit8 v7, v7, 0x1

    sub-int/2addr v4, v7

    iget v2, v2, Ltta;->c:I

    move v11, v2

    move/from16 v7, v18

    :goto_221
    const/16 v12, 0x10

    if-ge v7, v12, :cond_230

    add-int v12, v11, v9

    add-int/2addr v12, v2

    if-gt v12, v4, :cond_230

    add-int v12, v9, v2

    add-int/2addr v11, v12

    add-int/lit8 v7, v7, 0x1

    goto :goto_221

    :cond_230
    move/from16 v11, v18

    if-le v7, v11, :cond_23e

    add-int/lit8 v11, v7, -0x1

    mul-int/2addr v2, v7

    sub-int/2addr v4, v2

    div-int/2addr v4, v11

    iget v2, v8, Lsta;->b:I

    invoke-static {v4, v9, v2}, Ldjh;->c(III)I

    :cond_23e
    new-instance v2, Lghf;

    new-instance v4, Lkw3;

    const/16 v8, 0x17

    invoke-direct {v4, v8}, Lkw3;-><init>(B)V

    new-instance v8, Lkw3;

    const/16 v9, 0x18

    invoke-direct {v8, v9}, Lkw3;-><init>(B)V

    new-instance v9, Lkw3;

    const/16 v11, 0x19

    invoke-direct {v9, v11}, Lkw3;-><init>(B)V

    const/16 v11, 0x8

    invoke-direct {v2, v4, v8, v9, v11}, Lghf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v6, v0, v7, v2}, Lydh;-><init>(IILghf;)V

    invoke-virtual {v6, v1}, Lydh;->E(Ljava/util/List;)V

    iget-object v0, v6, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v13, v5

    move v15, v13

    :cond_268
    :goto_268
    if-ge v15, v1, :cond_27b

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v15, v15, 0x1

    check-cast v2, Lhq8;

    invoke-virtual {v2}, Lhq8;->j()Z

    move-result v2

    if-nez v2, :cond_268

    add-int/lit8 v13, v13, 0x1

    goto :goto_268

    :cond_27b
    new-instance v9, Lb0k;

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v9 .. v14}, Lb0k;-><init>(IIIII)V

    invoke-virtual {v3, v9}, Ltt2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_287
    move-object v10, v0

    check-cast v10, Landroid/content/Context;

    move-object v11, v4

    check-cast v11, Lcom/leanplum/ActionContext;

    move-object v12, v8

    check-cast v12, Ljava/lang/String;

    move-object v13, v2

    check-cast v13, Lorm;

    move-object v14, v3

    check-cast v14, Lskm;

    move-object/from16 v15, p1

    check-cast v15, Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-static/range {v10 .. v15}, Lcom/leanplum/messagetemplates/OperaSheet;->a(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lorm;Lskm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V

    return-void

    :pswitch_29e
    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v4, Landroid/net/Uri;

    check-cast v8, Ljava/lang/String;

    check-cast v2, Ljava/lang/String;

    check-cast v3, Lx92;

    move-object/from16 v1, p1

    check-cast v1, Lz92;

    new-instance v5, Ly92;

    invoke-direct {v5, v1, v4, v8, v2}, Ly92;-><init>(Lz92;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0, v1, v3}, Lcom/opera/android/BrowserActivity;->i1(Ljava/util/List;Lx92;)V

    return-void

    :pswitch_2bb
    check-cast v0, Lcom/opera/api/Callback;

    move-object v10, v4

    check-cast v10, Liy1;

    move-object v12, v2

    check-cast v12, Ljava/io/File;

    move-object v11, v8

    check-cast v11, Ljava/lang/String;

    move-object v13, v3

    check-cast v13, Lux1;

    move-object/from16 v1, p1

    check-cast v1, Lm32;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_302

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2fe

    new-instance v9, Lqn;

    const/4 v14, 0x2

    invoke-direct/range {v9 .. v14}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v10, Liy1;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lwx1;

    const/4 v2, 0x2

    invoke-direct {v0, v12, v2}, Lwx1;-><init>(Ljava/io/File;B)V

    invoke-virtual {v1, v0}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    new-instance v1, Lz3;

    const/16 v2, 0x18

    invoke-direct {v1, v9, v2}, Lz3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    goto :goto_307

    :cond_2fe
    invoke-static {}, Lh9o;->p()V

    goto :goto_307

    :cond_302
    sget-object v1, Ldy1;->a:Ldy1;

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_307
    return-void

    :pswitch_data_308
    .packed-switch 0x0
        :pswitch_2bb
        :pswitch_29e
        :pswitch_287
        :pswitch_1dd
        :pswitch_137
        :pswitch_b7
        :pswitch_5d
    .end packed-switch
.end method
