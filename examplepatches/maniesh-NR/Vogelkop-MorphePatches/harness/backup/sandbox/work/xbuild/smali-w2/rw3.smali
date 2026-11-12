.class public final Lrw3;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lrw3;->e:B

    iput-object p1, p0, Lrw3;->f:Ltw3;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Lrw3;->e:B

    const/4 v2, 0x3

    iget-object v0, v0, Lrw3;->f:Ltw3;

    packed-switch v1, :pswitch_data_156

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {v2}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v10

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->W:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsnc;

    new-instance v3, Lw6o;

    iget-object v2, v1, Lsnc;->a:Ljv1;

    invoke-virtual {v2}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Ll45;

    iget-object v5, v1, Lsnc;->g:Lxnc;

    invoke-virtual {v1}, Lsnc;->a()Lfs6;

    move-result-object v6

    iget-object v2, v1, Lsnc;->m:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lvs6;

    iget-object v2, v2, Lvs6;->b:Lgmc;

    iget-object v2, v2, Lgmc;->t:Lrlh;

    invoke-static {v2}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v7

    iget-object v2, v1, Lsnc;->z:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lrs6;

    iget-object v2, v1, Lsnc;->l:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrnc;

    invoke-virtual {v2, v0}, Lrnc;->a(Lndc;)Ltn;

    move-result-object v9

    iget-object v11, v1, Lsnc;->c:Lvk1;

    iget-object v12, v1, Lsnc;->F:Lt1;

    iget-object v0, v1, Lsnc;->b:Lwjh;

    iget-object v0, v0, Lwjh;->d:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Ljg8;

    iget-object v14, v1, Lsnc;->d:Lx5f;

    invoke-direct/range {v3 .. v14}, Lw6o;-><init>(Ll45;Lxnc;Lfs6;Lhx5;Lrs6;Ltn;Lddc;Lvk1;Lt1;Ljg8;Lx5f;)V

    return-object v3

    :pswitch_6d
    new-instance v1, Lr02;

    iget-object v2, v0, Ltw3;->c:Lumi;

    invoke-direct {v1, v2}, Lr02;-><init>(Lumi;)V

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->h0:Lkze;

    new-instance v2, Lbo3;

    const/16 v3, 0x8

    invoke-direct {v2, v1, v3}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lpb;

    const/16 v4, 0x1b

    invoke-direct {v3, v2, v4}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lekc;->k(Lf7f;)V

    return-object v1

    :pswitch_8a
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lurn;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v1

    iget-object v0, v0, Ltw3;->e0:Lzv3;

    invoke-direct {v2, v1, v0}, Lurn;-><init>(Lj4c;Lzv3;)V

    return-object v2

    :pswitch_a0
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v4, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v3, Lxg7;

    new-instance v5, Lnw3;

    const/16 v6, 0x11

    invoke-direct {v5, v1, v6}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v6, Lnw3;

    const/16 v7, 0x12

    invoke-direct {v6, v1, v7}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v7, v4, Lcom/opera/android/BrowserActivity;->h0:Lkze;

    iget-object v8, v0, Ltw3;->e:Lzv3;

    new-instance v9, Lsw3;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10}, Lsw3;-><init>(Ltw3;B)V

    new-instance v10, Lsw3;

    const/4 v11, 0x1

    invoke-direct {v10, v0, v11}, Lsw3;-><init>(Ltw3;B)V

    iget-object v11, v0, Ltw3;->a:Lhx3;

    iget-object v12, v11, Lhx3;->q:Lfx3;

    move-object v13, v12

    new-instance v12, Lsw3;

    const/4 v14, 0x2

    invoke-direct {v12, v0, v14}, Lsw3;-><init>(Ltw3;B)V

    move-object v14, v13

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v13

    move-object v15, v14

    iget-object v14, v0, Ltw3;->f0:Lrw3;

    move-object/from16 v16, v15

    iget-object v15, v0, Ltw3;->X:Lrw3;

    move-object/from16 p0, v3

    new-instance v3, Lsw3;

    invoke-direct {v3, v0, v2}, Lsw3;-><init>(Ltw3;B)V

    iget-object v2, v0, Ltw3;->c0:Lzv3;

    iget-object v11, v11, Lhx3;->p:Lfx3;

    iget-object v0, v0, Ltw3;->r0:Lzv3;

    move-object/from16 v19, v0

    new-instance v0, Lnw3;

    move-object/from16 v17, v2

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Lnw3;

    move-object/from16 v20, v0

    const/16 v0, 0x14

    invoke-direct {v2, v1, v0}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object/from16 v21, v2

    move-object/from16 v18, v11

    move-object/from16 v11, v16

    move-object/from16 v16, v3

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v21}, Lxg7;-><init>(Lcom/opera/android/BrowserActivity;Lnw3;Lnw3;Lkze;Lzv3;Lsw3;Lsw3;Lcom/opera/android/Lazy;Lsw3;Lj4c;Lrw3;Lrw3;Lsw3;Lzv3;Lcom/opera/android/Lazy;Lzv3;Lnw3;Lnw3;)V

    return-object v3

    :pswitch_110
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->J:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llz6;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v4

    new-instance v3, Lpz6;

    new-instance v5, Lxm5;

    iget-object v0, v1, Llz6;->i:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lau6;

    invoke-direct {v5, v0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1}, Llz6;->b()Lwx6;

    move-result-object v6

    new-instance v7, Lga6;

    invoke-virtual {v1}, Llz6;->d()Loz6;

    move-result-object v0

    invoke-direct {v7, v0, v2}, Lga6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Llz6;->a()Lpad;

    move-result-object v8

    new-instance v9, Lxz6;

    iget-object v0, v1, Llz6;->e:Lx5f;

    invoke-direct {v9, v0}, Lxz6;-><init>(Lx5f;)V

    invoke-direct/range {v3 .. v9}, Lpz6;-><init>(Lddc;Lxm5;Lwx6;Lga6;Lpad;Lxz6;)V

    return-object v3

    nop

    :pswitch_data_156
    .packed-switch 0x0
        :pswitch_110
        :pswitch_a0
        :pswitch_8a
        :pswitch_6d
    .end packed-switch
.end method
