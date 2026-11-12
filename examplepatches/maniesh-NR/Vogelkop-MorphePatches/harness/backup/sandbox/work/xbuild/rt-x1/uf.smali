.class public final synthetic Luf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyjj;
.implements Lnl5;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lswl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    iput-byte p6, p0, Luf;->a:B

    iput-object p1, p0, Luf;->b:Ljava/lang/Object;

    iput-object p2, p0, Luf;->c:Ljava/lang/Object;

    iput-object p3, p0, Luf;->d:Ljava/lang/Object;

    iput-object p4, p0, Luf;->e:Ljava/lang/Object;

    iput-object p5, p0, Luf;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(I)V
    .registers 7

    iget-object v0, p0, Luf;->b:Ljava/lang/Object;

    check-cast v0, Lvl8;

    iget-object v1, p0, Luf;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Luf;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Luf;->e:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object p0, p0, Luf;->f:Ljava/lang/Object;

    check-cast p0, Lim8;

    const/4 v4, 0x1

    if-eq p1, v4, :cond_18

    const/4 v4, 0x0

    :cond_18
    iget-object p1, v0, Lvl8;->a:Ljava/util/HashMap;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3b

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_30

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_30
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3b
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lim8;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 10

    iget-object v0, p0, Luf;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lkze;

    iget-object v0, p0, Luf;->c:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lr2;

    iget-object v0, p0, Luf;->d:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lxj;

    iget-object v0, p0, Luf;->e:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lso3;

    iget-object p0, p0, Luf;->f:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Lli;

    new-instance v1, Ltf;

    const p0, 0x7f0d00a0

    const/4 v0, 0x0

    invoke-static {p1, p0, p1, v0}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_30

    new-instance v2, Lcq3;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-direct {v2, p0, v0}, Lcq3;-><init>(Landroid/view/View;B)V

    invoke-direct/range {v1 .. v7}, Ltf;-><init>(Lcq3;Lkze;Lr2;Lxj;Lso3;Lli;)V

    return-object v1

    :cond_30
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 13

    iget-object v0, p0, Luf;->b:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lmab;

    iget-object v0, p0, Luf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Luf;->d:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Lr0k;

    iget-object v1, p0, Luf;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/Locale;

    iget-object p0, p0, Luf;->f:Ljava/lang/Object;

    check-cast p0, Lx5f;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_79

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lqop;

    invoke-virtual {v10}, Lqop;->b()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object p1, Lqcc;->c:Lqcc;

    invoke-virtual {p0, p1}, Lqcc;->d(Lqcc;)Z

    move-result p0

    if-nez p0, :cond_44

    return-void

    :cond_44
    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    iget v7, v6, Lmab;->e:I

    new-instance v8, Lkab;

    const/4 p1, 0x0

    invoke-direct {v8, v6, p1}, Lkab;-><init>(Lmab;B)V

    new-instance v9, Llab;

    invoke-direct {v9, v6, p0, p1}, Llab;-><init>(Lmab;Lx5f;B)V

    new-instance v5, Lz8e;

    invoke-direct {v5, v6, p1}, Lz8e;-><init>(Landroidx/fragment/app/Fragment;B)V

    new-instance v1, Lu85;

    iget v4, v10, Lqop;->a:I

    invoke-direct/range {v1 .. v9}, Lu85;-><init>(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)V

    invoke-virtual {v1, v10}, Lu85;->h(Lqop;)V

    iput-object v1, v6, Lmab;->d:Lu85;

    return-void

    :cond_79
    invoke-virtual {v6, v3, v1, p0}, Lmab;->f0(Lr0k;Ljava/util/Locale;Lx5f;)V

    return-void
.end method

.method public final run()Lqwl;
    .registers 14

    iget-byte v0, p0, Luf;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Luf;->f:Ljava/lang/Object;

    iget-object v3, p0, Luf;->e:Ljava/lang/Object;

    iget-object v4, p0, Luf;->d:Ljava/lang/Object;

    iget-object v5, p0, Luf;->c:Ljava/lang/Object;

    iget-object p0, p0, Luf;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_76

    move-object v7, p0

    check-cast v7, Lle9;

    move-object v9, v5

    check-cast v9, Ljava/lang/String;

    move-object v10, v4

    check-cast v10, Ljava/util/List;

    move-object v11, v3

    check-cast v11, Lrl;

    move-object v12, v2

    check-cast v12, Lvk2;

    iget-object p0, v7, Lle9;->d:Loji;

    invoke-virtual {p0}, Loji;->r()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_2d

    new-instance v6, Llwl;

    invoke-direct/range {v6 .. v12}, Llwl;-><init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lrl;Lvk2;)V

    move-object v1, v6

    :cond_2d
    return-object v1

    :pswitch_2e
    check-cast p0, Lle9;

    check-cast v5, [B

    check-cast v4, Lpwl;

    move-object v8, v3

    check-cast v8, Ljava/lang/Runnable;

    move-object v9, v2

    check-cast v9, Lcom/opera/api/Callback;

    iget-object v0, p0, Lle9;->d:Loji;

    move-object v2, v5

    move-object v5, v4

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Loji;->z()Ljava/security/PrivateKey;

    move-result-object v0

    if-eqz v4, :cond_74

    if-eqz v0, :cond_74

    iget-object v3, v5, Lpwl;->f:Ljava/security/PublicKey;

    const/4 v6, 0x1

    invoke-static {v6, v2, v3}, Lp36;->b(I[BLjava/security/Key;)[B

    move-result-object v2

    if-eqz v2, :cond_74

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const-string v3, "SHA512withRSA/PSS"

    invoke-static {v0, v3, v2}, Lp36;->d(Ljava/security/PrivateKey;Ljava/lang/String;[B)[B

    move-result-object v3

    if-nez v3, :cond_6a

    const-string v3, "SHA512withRSA"

    invoke-static {v0, v3, v2}, Lp36;->d(Ljava/security/PrivateKey;Ljava/lang/String;[B)[B

    move-result-object v3

    :cond_6a
    move-object v7, v3

    if-eqz v7, :cond_74

    new-instance v2, Lae9;

    move-object v3, p0

    invoke-direct/range {v2 .. v9}, Lae9;-><init>(Lle9;Ljava/lang/String;Lpwl;Ljava/lang/String;[BLjava/lang/Runnable;Lcom/opera/api/Callback;)V

    move-object v1, v2

    :cond_74
    return-object v1

    nop

    :pswitch_data_76
    .packed-switch 0x4
        :pswitch_2e
    .end packed-switch
.end method
