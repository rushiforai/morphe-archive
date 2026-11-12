.class public final synthetic Lxx1;
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


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 18
    iput-byte p5, p0, Lxx1;->a:B

    iput-object p1, p0, Lxx1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lxx1;->b:Ljava/lang/Object;

    iput-object p3, p0, Lxx1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lxx1;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;B)V
    .registers 6

    .line 19
    iput-byte p5, p0, Lxx1;->a:B

    iput-object p1, p0, Lxx1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lxx1;->d:Ljava/lang/Object;

    iput-object p3, p0, Lxx1;->b:Ljava/lang/Object;

    iput-object p4, p0, Lxx1;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lshf;Lbha;)V
    .registers 6

    const/16 v0, 0xa

    iput-byte v0, p0, Lxx1;->a:B

    sget-object v0, Lenk;->a:Lenk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxx1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxx1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lxx1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lxx1;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lshf;Lbha;B)V
    .registers 6

    .line 22
    const/16 p5, 0xc

    iput-byte p5, p0, Lxx1;->a:B

    sget-object p5, Lenk;->a:Lenk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxx1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxx1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lxx1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lxx1;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lshf;Lmy9;)V
    .registers 6

    .line 20
    const/16 v0, 0xb

    iput-byte v0, p0, Lxx1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxx1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxx1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lxx1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lxx1;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ls2g;Lpy9;Lu3k;Ljava/lang/String;)V
    .registers 6

    .line 21
    const/4 v0, 0x4

    iput-byte v0, p0, Lxx1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxx1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lxx1;->d:Ljava/lang/Object;

    iput-object p3, p0, Lxx1;->e:Ljava/lang/Object;

    iput-object p4, p0, Lxx1;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Lxx1;->a:B

    const-string v2, "Bearer "

    const-string v3, "Authorization"

    const/4 v4, 0x4

    const-string v5, "Required value was null."

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    iget-object v9, v0, Lxx1;->e:Ljava/lang/Object;

    iget-object v10, v0, Lxx1;->d:Ljava/lang/Object;

    iget-object v11, v0, Lxx1;->b:Ljava/lang/Object;

    iget-object v0, v0, Lxx1;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_352

    check-cast v0, Lbf9;

    check-cast v11, Ljava/lang/String;

    check-cast v10, Ljava/lang/String;

    check-cast v9, Lx1b;

    move-object/from16 v1, p1

    check-cast v1, Ltwl;

    iput-object v6, v0, Lbf9;->l:Lzd2;

    iget-object v2, v0, Lbf9;->d:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "device_id"

    iget-object v4, v1, Ltwl;->a:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "device_auth_token"

    iget-object v1, v1, Ltwl;->b:Ljava/lang/String;

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "device_notification_token"

    invoke-interface {v1, v3, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "device_version_token"

    invoke-interface {v1, v3, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "device_capabilities"

    invoke-interface {v2, v1, v9}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v1, v0, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lbf9;->r()I

    move-result v2

    if-lt v2, v7, :cond_78

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_6a
    if-ge v8, v1, :cond_78

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v8, v8, 0x1

    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_6a

    :cond_78
    invoke-virtual {v0}, Lbf9;->z()V

    return-void

    :pswitch_7c
    sget-object v1, Lenk;->a:Lenk;

    check-cast v11, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    check-cast v10, Lshf;

    check-cast v9, Lbha;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    new-instance v12, Lfvh;

    invoke-direct {v12}, Lfvh;-><init>()V

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v13, Lrma;

    invoke-direct {v13, v4}, Lrma;-><init>(B)V

    invoke-virtual {v13, v1, v6}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v13}, Lrma;->d()Lhra;

    move-result-object v1

    sget-object v4, Lfnk;->a:[I

    aget v4, v4, v8

    if-ne v4, v7, :cond_10d

    const-string v4, "api/v1/subscriptions/google_billing/link_accountless_to_user/"

    invoke-virtual {v1, v4}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v1

    if-eqz v1, :cond_109

    iput-object v1, v12, Lfvh;->a:Lhra;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v3, v1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "purchaseToken"

    :try_start_c5
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_cc
    .catch Lorg/json/JSONException; {:try_start_c5 .. :try_end_cc} :catch_104

    sget-object v0, Lrvh;->Companion:Lqvh;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lesd;->e:Lkotlin/text/Regex;

    const-string v2, "application/json"

    invoke-static {v2}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1, v2}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object v0

    invoke-virtual {v12, v0}, Lfvh;->f(Lrvh;)V

    iget-object v0, v10, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lb94;

    invoke-direct {v1, v0, v9, v8}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v10, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    invoke-static {v12, v0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    new-instance v2, Lzg;

    invoke-direct {v2, v1, v8, v10, v12}, Lzg;-><init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v2}, Lv84;->enqueue(Lf94;)V

    goto :goto_110

    :catch_104
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_110

    :cond_109
    invoke-static {v5}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_110

    :cond_10d
    invoke-static {}, Lh9o;->p()V

    :goto_110
    return-void

    :pswitch_111
    check-cast v11, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    check-cast v10, Lshf;

    check-cast v9, Lmy9;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    new-instance v2, Lfvh;

    invoke-direct {v2}, Lfvh;-><init>()V

    invoke-static {v1}, Lw8h;->l(Landroid/net/Uri;)Lhra;

    move-result-object v1

    const-string v3, "api/v1/free_trial/ofa/check_eligibility/premium_beta/"

    invoke-virtual {v1, v3}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v1

    if-eqz v1, :cond_160

    iput-object v1, v2, Lfvh;->a:Lhra;

    invoke-static {v11, v0}, Lw8h;->i(Ljava/lang/String;Ljava/lang/String;)Lpvh;

    move-result-object v1

    const-string v3, "POST"

    invoke-virtual {v2, v3, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, v2}, Lkvh;-><init>(Lfvh;)V

    iget-object v2, v10, Lshf;->b:Ljava/lang/Object;

    check-cast v2, Lumi;

    new-instance v3, Lb94;

    invoke-direct {v3, v2, v9, v8}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, v10, Lshf;->c:Ljava/lang/Object;

    check-cast v2, Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    invoke-virtual {v2, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v1

    new-instance v2, Lp8f;

    const/16 v4, 0x16

    invoke-direct {v2, v4, v3, v0, v11}, Lp8f;-><init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lv84;->enqueue(Lf94;)V

    goto :goto_163

    :cond_160
    invoke-static {v5}, Lqp2;->o(Ljava/lang/String;)V

    :goto_163
    return-void

    :pswitch_164
    sget-object v1, Lenk;->a:Lenk;

    check-cast v11, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    check-cast v10, Lshf;

    check-cast v9, Lbha;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    new-instance v12, Lfvh;

    invoke-direct {v12}, Lfvh;-><init>()V

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v13, Lrma;

    invoke-direct {v13, v4}, Lrma;-><init>(B)V

    invoke-virtual {v13, v1, v6}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v13}, Lrma;->d()Lhra;

    move-result-object v1

    sget-object v4, Lfnk;->a:[I

    aget v4, v4, v8

    if-ne v4, v7, :cond_1d4

    const-string v4, "api/v1/subscriptions/google_billing/accountless/premium_beta/"

    invoke-virtual {v1, v4}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v1

    if-eqz v1, :cond_1d0

    iput-object v1, v12, Lfvh;->a:Lhra;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v3, v1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "X-Purchase-Token"

    invoke-virtual {v12, v1, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, v12}, Lkvh;-><init>(Lfvh;)V

    iget-object v1, v10, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt9f;

    invoke-virtual {v1, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    new-instance v1, Lgnk;

    iget-object v2, v10, Lshf;->b:Ljava/lang/Object;

    check-cast v2, Lumi;

    new-instance v3, Lb94;

    invoke-direct {v3, v2, v9, v8}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v3, v7, v8}, Lgnk;-><init>(Lb94;ZB)V

    invoke-interface {v0, v1}, Lv84;->enqueue(Lf94;)V

    goto :goto_1d7

    :cond_1d0
    invoke-static {v5}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_1d7

    :cond_1d4
    invoke-static {}, Lh9o;->p()V

    :goto_1d7
    return-void

    :pswitch_1d8
    check-cast v0, Lslk;

    check-cast v10, Lu3k;

    move-object v4, v11

    check-cast v4, Ljava/lang/String;

    check-cast v9, Lbha;

    move-object/from16 v1, p1

    check-cast v1, Lh0d;

    iget-object v2, v0, Lslk;->c:Lpy9;

    new-instance v3, Ls2g;

    const/4 v5, 0x7

    invoke-direct {v3, v0, v10, v9, v5}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v0, Lh0d;->c:Lh0d;

    if-ne v1, v0, :cond_1fc

    iget-object v0, v2, Lpy9;->c:Lxbf;

    new-instance v1, Lxx1;

    invoke-direct {v1, v3, v2, v10, v4}, Lxx1;-><init>(Ls2g;Lpy9;Lu3k;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lxbf;->A(Lcom/opera/api/Callback;)V

    goto :goto_21a

    :cond_1fc
    iget-object v5, v2, Lpy9;->b:Lshf;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v10, Lu3k;->a:Ljava/lang/String;

    iget-object v1, v10, Lu3k;->b:Ljava/lang/String;

    new-instance v6, Lny9;

    invoke-direct {v6, v2, v10, v3, v8}, Lny9;-><init>(Lpy9;Lu3k;Ls2g;B)V

    iget-object v2, v5, Lshf;->a:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Lwth;

    move-object v3, v1

    new-instance v1, Lay1;

    const/4 v7, 0x5

    move-object v2, v0

    invoke-direct/range {v1 .. v7}, Lay1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lshf;Lcom/opera/api/Callback;B)V

    invoke-virtual {v8, v1}, Lwth;->w(Lcom/opera/api/Callback;)V

    :goto_21a
    return-void

    :pswitch_21b
    check-cast v0, Lolh;

    check-cast v10, Ld7l;

    check-cast v11, Ljava/lang/String;

    check-cast v9, Lwx;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_23b

    new-instance v2, Leof;

    const/16 v3, 0xc

    invoke-direct {v2, v0, v11, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v10, v11, v8, v2}, Ld7l;->d0(Ljava/lang/String;ZLcom/opera/api/Callback;)V

    :cond_23b
    invoke-virtual {v9, v1}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_23f
    check-cast v0, Ltcl;

    check-cast v11, Lcom/leanplum/ActionContext;

    check-cast v10, Lorm;

    check-cast v9, Lskm;

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    invoke-static {v0, v11, v10, v9, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->g(Ltcl;Lcom/leanplum/ActionContext;Lorm;Lskm;Ltw7;)V

    return-void

    :pswitch_24f
    check-cast v0, Lcom/leanplum/ActionContext;

    check-cast v11, Landroid/content/Context;

    check-cast v10, Lx5f;

    check-cast v9, Lx5f;

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    invoke-static {v0, v11, v10, v9, v1}, Lcom/leanplum/messagetemplates/OperaSheet;->e(Lcom/leanplum/ActionContext;Landroid/content/Context;Lx5f;Lx5f;Ltw7;)V

    return-void

    :pswitch_25f
    check-cast v0, Landroid/content/Context;

    check-cast v11, Lsz4;

    check-cast v10, Lpdf;

    check-cast v9, Lmdf;

    move-object/from16 v1, p1

    check-cast v1, Lw9k;

    invoke-virtual {v10}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v2

    check-cast v2, Loi;

    new-instance v3, Lhu5;

    const/16 v4, 0x1a

    invoke-direct {v3, v9, v1, v4}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v11, v2, v3}, Lyi4;->R(Landroid/content/Context;Lsz4;Loi;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_27c
    check-cast v0, Ls2g;

    check-cast v10, Lpy9;

    check-cast v9, Lu3k;

    move-object/from16 v16, v11

    check-cast v16, Ljava/lang/String;

    move-object/from16 v13, p1

    check-cast v13, Ljava/lang/String;

    if-nez v13, :cond_292

    sget-object v1, Lg4k;->a:Lg4k;

    invoke-virtual {v0, v1}, Ls2g;->run(Ljava/lang/Object;)V

    goto :goto_2b2

    :cond_292
    iget-object v1, v10, Lpy9;->b:Lshf;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v14, v9, Lu3k;->a:Ljava/lang/String;

    iget-object v15, v9, Lu3k;->b:Ljava/lang/String;

    new-instance v2, Lny9;

    invoke-direct {v2, v10, v9, v0, v7}, Lny9;-><init>(Lpy9;Lu3k;Ls2g;B)V

    iget-object v0, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lwth;

    new-instance v12, Lqe9;

    const/16 v19, 0x5

    move-object/from16 v17, v1

    move-object/from16 v18, v2

    invoke-direct/range {v12 .. v19}, Lqe9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v12}, Lwth;->w(Lcom/opera/api/Callback;)V

    :goto_2b2
    return-void

    :pswitch_2b3
    check-cast v0, Lcom/opera/api/Callback;

    check-cast v10, Lpy9;

    move-object v14, v11

    check-cast v14, Ljava/lang/String;

    move-object v15, v9

    check-cast v15, Ljava/lang/String;

    move-object/from16 v13, p1

    check-cast v13, Ljava/lang/String;

    if-nez v13, :cond_2c9

    sget-object v1, Ljy9;->a:Ljy9;

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_2ff

    :cond_2c9
    iget-object v1, v10, Lpy9;->a:Lmcj;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, v1, Lmcj;->a:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v4, "last_eligibility_check"

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v1, v10, Lpy9;->b:Lshf;

    new-instance v2, Lmy9;

    invoke-direct {v2, v10, v15, v0, v7}, Lmy9;-><init>(Lpy9;Ljava/lang/String;Lcom/opera/api/Callback;B)V

    iget-object v0, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lwth;

    new-instance v12, Lay1;

    const/16 v18, 0x6

    move-object/from16 v16, v1

    move-object/from16 v17, v2

    invoke-direct/range {v12 .. v18}, Lay1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lshf;Lcom/opera/api/Callback;B)V

    invoke-virtual {v0, v12}, Lwth;->w(Lcom/opera/api/Callback;)V

    :goto_2ff
    return-void

    :pswitch_300
    move-object v2, v0

    check-cast v2, Lcom/opera/android/BrowserActivity;

    move-object v3, v10

    check-cast v3, Landroid/net/Uri;

    move-object v4, v11

    check-cast v4, Ljava/lang/String;

    move-object v6, v9

    check-cast v6, Lx92;

    move-object/from16 v5, p1

    check-cast v5, Ljava/lang/String;

    new-instance v1, Lay1;

    const/4 v7, 0x1

    invoke-direct/range {v1 .. v7}, Lay1;-><init>(Landroid/content/Context;Ljava/lang/Comparable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v1}, Lcom/opera/android/BrowserActivity;->A0(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_31a
    check-cast v0, Lqb7;

    check-cast v11, Ljava/lang/String;

    check-cast v10, Lamk;

    check-cast v9, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Lff3;

    new-instance v2, Ll45;

    invoke-direct {v2, v0, v11, v10}, Ll45;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lff3;->s0(Lhf3;)V

    invoke-interface {v9, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_332
    check-cast v0, Liy1;

    check-cast v11, Ljava/lang/String;

    check-cast v10, Ljava/io/File;

    check-cast v9, Lux1;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    if-nez v1, :cond_349

    iget-object v0, v0, Liy1;->h:Lgy1;

    const v1, 0x7f140800

    invoke-interface {v0, v1}, Lgy1;->o(I)V

    goto :goto_351

    :cond_349
    new-instance v2, Lv12;

    invoke-direct {v2, v1, v10}, Lv12;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    invoke-virtual {v0, v11, v2, v9}, Liy1;->e(Ljava/lang/String;Lo0g;Lux1;)V

    :goto_351
    return-void

    :pswitch_data_352
    .packed-switch 0x0
        :pswitch_332
        :pswitch_31a
        :pswitch_300
        :pswitch_2b3
        :pswitch_27c
        :pswitch_25f
        :pswitch_24f
        :pswitch_23f
        :pswitch_21b
        :pswitch_1d8
        :pswitch_164
        :pswitch_111
        :pswitch_7c
    .end packed-switch
.end method
