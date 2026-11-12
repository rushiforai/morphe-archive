.class public final synthetic Lqe9;
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

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 8

    iput-byte p7, p0, Lqe9;->a:B

    iput-object p1, p0, Lqe9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lqe9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lqe9;->d:Ljava/lang/Object;

    iput-object p4, p0, Lqe9;->e:Ljava/lang/Object;

    iput-object p5, p0, Lqe9;->f:Ljava/lang/Object;

    iput-object p6, p0, Lqe9;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 25

    move-object/from16 v0, p0

    iget-byte v1, v0, Lqe9;->a:B

    const-wide/16 v2, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, v0, Lqe9;->g:Ljava/lang/Object;

    iget-object v7, v0, Lqe9;->f:Ljava/lang/Object;

    iget-object v8, v0, Lqe9;->e:Ljava/lang/Object;

    iget-object v9, v0, Lqe9;->d:Ljava/lang/Object;

    iget-object v10, v0, Lqe9;->c:Ljava/lang/Object;

    iget-object v0, v0, Lqe9;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_250

    check-cast v0, Lmyk;

    check-cast v10, Lmgh;

    check-cast v9, Lab;

    move-object v15, v8

    check-cast v15, Lorb;

    move-object/from16 v16, v7

    check-cast v16, Lfi2;

    check-cast v6, Lfi2;

    move-object/from16 v14, p1

    check-cast v14, Lcom/opera/android/oauth2/OperaAccessToken;

    iget-object v1, v10, Lmgh;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    if-eqz v1, :cond_49

    if-nez v14, :cond_38

    const-string v0, "Not signed in"

    invoke-virtual {v9, v0}, Lab;->run(Ljava/lang/Object;)V

    goto :goto_49

    :cond_38
    iget-object v12, v0, Lmyk;->e:Ldi2;

    new-instance v13, Liyk;

    invoke-direct {v13, v6, v9, v4}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lxf1;

    invoke-direct/range {v11 .. v16}, Lxf1;-><init>(Ldi2;Liyk;Lcom/opera/android/oauth2/OperaAccessToken;Lorb;Lfi2;)V

    iput-object v11, v10, Lmgh;->b:Ljava/lang/Object;

    :cond_49
    :goto_49
    return-void

    :pswitch_4a
    check-cast v0, Ljava/lang/String;

    check-cast v10, Ljava/lang/String;

    check-cast v9, Ljava/lang/String;

    check-cast v8, Ljava/lang/String;

    check-cast v7, Lshf;

    check-cast v6, Lny9;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    new-instance v2, Lfvh;

    invoke-direct {v2}, Lfvh;-><init>()V

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lrma;

    const/4 v11, 0x4

    invoke-direct {v3, v11}, Lrma;-><init>(B)V

    invoke-virtual {v3, v1, v5}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v3}, Lrma;->d()Lhra;

    move-result-object v1

    const-string v3, "api/v1/free_trial/ofa/user/start/premium_beta/"

    invoke-virtual {v1, v3}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v1

    if-eqz v1, :cond_e3

    iput-object v1, v2, Lfvh;->a:Lhra;

    const-string v1, "Bearer "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Authorization"

    invoke-virtual {v2, v1, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "device_id"

    invoke-virtual {v0, v10, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "campaign"

    invoke-virtual {v0, v9, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "token"

    invoke-virtual {v0, v8, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "package_name"

    const-string v3, "com.opera.browser.beta"

    invoke-virtual {v0, v3, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Lrvh;->Companion:Lqvh;

    iget-object v0, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lesd;->e:Lkotlin/text/Regex;

    const-string v3, "application/json"

    invoke-static {v3}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v3}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object v0

    const-string v1, "POST"

    invoke-virtual {v2, v1, v0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, v2}, Lkvh;-><init>(Lfvh;)V

    iget-object v1, v7, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Lumi;

    new-instance v2, Lb94;

    invoke-direct {v2, v1, v6, v4}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v7, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt9f;

    invoke-virtual {v1, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    new-instance v1, Lisd;

    const/16 v3, 0x1c

    invoke-direct {v1, v2, v3}, Lisd;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Lv84;->enqueue(Lf94;)V

    goto :goto_e8

    :cond_e3
    const-string v0, "Required value was null."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_e8
    return-void

    :pswitch_e9
    check-cast v0, Lslk;

    move-object v13, v10

    check-cast v13, Ljava/lang/String;

    move-object v14, v9

    check-cast v14, Ljava/lang/String;

    move-object v15, v8

    check-cast v15, Ljava/lang/String;

    move-object/from16 v16, v7

    check-cast v16, Ljava/lang/String;

    move-object/from16 v17, v6

    check-cast v17, Lh1b;

    move-object/from16 v1, p1

    check-cast v1, Lh0d;

    iget-object v12, v0, Lslk;->b:Ltmk;

    new-instance v2, Lzzh;

    const/16 v3, 0x9

    invoke-direct {v2, v0, v3}, Lzzh;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v12, Ltmk;->a:Lmcj;

    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v3, "acked_tokens"

    sget-object v4, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-static {v0, v3, v4}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_127

    invoke-virtual {v2, v5}, Lzzh;->run(Ljava/lang/Object;)V

    goto :goto_155

    :cond_127
    iget-object v0, v12, Ltmk;->i:Ljava/util/LinkedHashSet;

    invoke-interface {v0, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_133

    invoke-virtual {v2, v5}, Lzzh;->run(Ljava/lang/Object;)V

    goto :goto_155

    :cond_133
    invoke-virtual {v12}, Ltmk;->l()V

    sget-object v0, Lh0d;->c:Lh0d;

    iget-object v3, v12, Ltmk;->c:Lxbf;

    if-ne v1, v0, :cond_149

    new-instance v11, Lkmk;

    const/16 v19, 0x0

    move-object/from16 v18, v2

    invoke-direct/range {v11 .. v19}, Lkmk;-><init>(Ltmk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh1b;Lzzh;B)V

    invoke-virtual {v3, v11}, Lxbf;->A(Lcom/opera/api/Callback;)V

    goto :goto_155

    :cond_149
    move-object/from16 v18, v2

    new-instance v11, Lkmk;

    const/16 v19, 0x1

    invoke-direct/range {v11 .. v19}, Lkmk;-><init>(Ltmk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh1b;Lzzh;B)V

    invoke-virtual {v3, v11}, Lxbf;->z(Lcom/opera/api/Callback;)V

    :goto_155
    return-void

    :pswitch_156
    check-cast v0, Lolh;

    check-cast v10, Lcom/opera/android/BrowserActivity;

    move-object v14, v9

    check-cast v14, Ljava/lang/String;

    move-object v13, v8

    check-cast v13, Ljava/lang/String;

    check-cast v7, Landroid/net/Uri;

    check-cast v6, Lxx1;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_172

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v6, v0}, Lxx1;->run(Ljava/lang/Object;)V

    goto :goto_190

    :cond_172
    iget-object v11, v0, Lolh;->a:Lglh;

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v15

    move-object/from16 v17, v6

    invoke-virtual/range {v11 .. v17}, Lglh;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLxx1;)V

    const-string v0, "file"

    invoke-virtual {v7}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_190

    invoke-static {v10, v7}, Llg7;->a(Landroid/content/Context;Landroid/net/Uri;)V

    :cond_190
    :goto_190
    return-void

    :pswitch_191
    move-object v12, v0

    check-cast v12, Lolh;

    check-cast v10, Ld7l;

    move-object v13, v9

    check-cast v13, Lcom/opera/android/BrowserActivity;

    move-object v14, v8

    check-cast v14, Ljava/lang/String;

    move-object v15, v7

    check-cast v15, Ljava/lang/String;

    move-object/from16 v17, v6

    check-cast v17, Lxx1;

    move-object/from16 v16, p1

    check-cast v16, Landroid/net/Uri;

    if-eqz v16, :cond_1bd

    new-instance v11, Lqe9;

    const/16 v18, 0x3

    invoke-direct/range {v11 .. v18}, Lqe9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object/from16 v0, v16

    move-object/from16 v6, v17

    iget-object v1, v10, Ld7l;->j:Le7l;

    invoke-interface {v1, v0, v11}, Lb9l;->x(Landroid/net/Uri;Lcom/opera/api/Callback;)Z

    move-result v0

    if-nez v0, :cond_1c6

    goto :goto_1bf

    :cond_1bd
    move-object/from16 v6, v17

    :goto_1bf
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v6, v0}, Lxx1;->run(Ljava/lang/Object;)V

    :cond_1c6
    return-void

    :pswitch_1c7
    check-cast v0, Landroid/app/Activity;

    check-cast v10, Lcom/leanplum/ActionContext;

    check-cast v9, Lqjh;

    check-cast v8, Lmcj;

    move-object v11, v7

    check-cast v11, Lorm;

    move-object v12, v6

    check-cast v12, Lskm;

    move-object/from16 v13, p1

    check-cast v13, Ltw7;

    move-object v7, v10

    move-object v10, v8

    move-object v8, v7

    move-object v7, v0

    invoke-static/range {v7 .. v13}, Lcom/leanplum/messagetemplates/OperaRateSheet;->a(Landroid/app/Activity;Lcom/leanplum/ActionContext;Lqjh;Lmcj;Lorm;Lskm;Ltw7;)V

    return-void

    :pswitch_1e1
    check-cast v0, Lbf9;

    check-cast v10, Lpc9;

    check-cast v9, Llyf;

    check-cast v8, Llyf;

    check-cast v7, Lw59;

    check-cast v6, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    if-eqz v10, :cond_249

    new-instance v11, Lfvd;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    iget-object v0, v0, Lbf9;->a:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v16

    iget-object v0, v9, Llyf;->a:Ljava/lang/Object;

    move-object/from16 v17, v0

    check-cast v17, Ljava/lang/String;

    iget-object v0, v8, Llyf;->a:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, Ljava/lang/String;

    iget-object v0, v7, Lw59;->c:Ljava/lang/String;

    iget-object v2, v9, Llyf;->b:Ljava/lang/Object;

    move-object/from16 v20, v2

    check-cast v20, Ljava/lang/String;

    iget-object v2, v8, Llyf;->b:Ljava/lang/Object;

    move-object/from16 v21, v2

    check-cast v21, Ljava/lang/String;

    iget-object v2, v7, Lw59;->d:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v22, v2

    invoke-direct/range {v11 .. v22}, Lfvd;-><init>(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v10, Lpc9;->g:Lqie;

    iget-object v2, v10, Lpc9;->b:Lumi;

    new-instance v3, Low3;

    const/4 v4, 0x2

    invoke-direct {v3, v10, v11, v4}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v3}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v3

    new-instance v4, Ldc9;

    const/4 v7, 0x1

    invoke-direct {v4, v10, v7}, Ldc9;-><init>(Lpc9;B)V

    invoke-virtual {v2, v4}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v2

    invoke-virtual {v3, v2}, Lnml;->b(Lnml;)V

    new-instance v2, Loml;

    invoke-direct {v2, v3}, Loml;-><init>(Lnml;)V

    invoke-virtual {v0, v2, v5}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_249
    if-eqz v6, :cond_24e

    invoke-interface {v6, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_24e
    return-void

    nop

    :pswitch_data_250
    .packed-switch 0x0
        :pswitch_1e1
        :pswitch_1c7
        :pswitch_191
        :pswitch_156
        :pswitch_e9
        :pswitch_4a
    .end packed-switch
.end method
