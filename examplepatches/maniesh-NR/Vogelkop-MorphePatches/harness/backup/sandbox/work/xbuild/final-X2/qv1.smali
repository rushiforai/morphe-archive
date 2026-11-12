.class public final synthetic Lqv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxv1;


# direct methods
.method public synthetic constructor <init>(Lxv1;B)V
    .registers 3

    iput-byte p2, p0, Lqv1;->a:B

    iput-object p1, p0, Lqv1;->b:Lxv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Lqv1;->a:B

    const/4 v3, 0x2

    const/4 v4, 0x7

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object v0, v0, Lqv1;->b:Lxv1;

    packed-switch v1, :pswitch_data_450

    iget-object v1, v0, Lxv1;->e:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le00;

    new-instance v6, Llpe;

    iget-object v7, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v8, Lvml;->e:Lwjh;

    sget-object v9, Lngh;->a:Lr16;

    new-instance v9, Lmpe;

    new-instance v11, Lbi;

    const/16 v10, 0x13

    invoke-direct {v11, v1, v10}, Lbi;-><init>(Ljava/lang/Object;B)V

    new-instance v12, Ljv1;

    const/16 v1, 0x12

    invoke-direct {v12, v0, v1}, Ljv1;-><init>(Lxv1;B)V

    new-instance v13, Ljv1;

    const/16 v1, 0x14

    invoke-direct {v13, v0, v1}, Ljv1;-><init>(Lxv1;B)V

    new-instance v14, Llld;

    invoke-static {v7}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v1

    invoke-direct {v14, v1, v4}, Llld;-><init>(Ljava/lang/Object;B)V

    new-instance v15, Lix5;

    const/16 v1, 0xc

    invoke-direct {v15, v1}, Lix5;-><init>(B)V

    new-instance v1, Luu1;

    invoke-direct {v1, v4}, Luu1;-><init>(B)V

    new-instance v4, Llv1;

    invoke-direct {v4, v0, v3}, Llv1;-><init>(Lxv1;B)V

    new-instance v3, Liab;

    invoke-direct {v3, v7, v5}, Ls75;-><init>(Landroid/content/Context;I)V

    new-instance v10, Liab;

    const/4 v2, 0x4

    invoke-direct {v10, v7, v2}, Ls75;-><init>(Landroid/content/Context;I)V

    new-instance v2, Lhga;

    invoke-direct {v2, v7, v5}, Lhga;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Ljv1;

    move-object/from16 v17, v1

    const/16 v1, 0x15

    invoke-direct {v5, v0, v1}, Ljv1;-><init>(Lxv1;B)V

    new-instance v1, Ljv1;

    move-object/from16 v20, v2

    const/16 v2, 0x16

    invoke-direct {v1, v0, v2}, Ljv1;-><init>(Lxv1;B)V

    new-instance v2, Lpjn;

    move-object/from16 v22, v1

    invoke-static {v7}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v1

    move-object/from16 v18, v3

    const/4 v3, 0x4

    invoke-direct {v2, v1, v3}, Lpjn;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ljv1;

    const/16 v3, 0x17

    invoke-direct {v1, v0, v3}, Ljv1;-><init>(Lxv1;B)V

    new-instance v3, Luu1;

    move-object/from16 v24, v1

    const/16 v1, 0x8

    invoke-direct {v3, v1}, Luu1;-><init>(B)V

    move-object/from16 v23, v2

    move-object/from16 v25, v3

    move-object/from16 v21, v5

    move-object/from16 v19, v10

    move-object/from16 v16, v17

    move-object/from16 v17, v4

    move-object v10, v9

    invoke-direct/range {v10 .. v25}, Lmpe;-><init>(Lbi;Ljv1;Ljv1;Llld;Lix5;Luu1;Llv1;Liab;Liab;Lhga;Ljv1;Ljv1;Lpjn;Ljv1;Luu1;)V

    iget-object v10, v0, Lxv1;->r1:Lj4c;

    iget-object v1, v0, Lxv1;->h0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lbr6;

    new-instance v12, Ljv1;

    const/16 v1, 0x18

    invoke-direct {v12, v0, v1}, Ljv1;-><init>(Lxv1;B)V

    invoke-direct/range {v6 .. v12}, Llpe;-><init>(Landroid/content/Context;Lwjh;Lmpe;Lj4c;Lbr6;Ljv1;)V

    return-object v6

    :pswitch_b4
    new-instance v1, Lbr6;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v3, Ljv1;

    const/16 v4, 0x11

    invoke-direct {v3, v0, v4}, Ljv1;-><init>(Lxv1;B)V

    invoke-direct {v1, v2, v3}, Lbr6;-><init>(Landroid/content/Context;Ljv1;)V

    return-object v1

    :pswitch_c3
    new-instance v1, Lete;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    invoke-direct {v1, v0, v2, v3}, Lete;-><init>(Landroid/content/Context;Lumi;Lx5f;)V

    return-object v1

    :pswitch_d3
    new-instance v1, Loue;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Loue;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_dd
    new-instance v1, La5l;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v3, Lvml;->d:Lumi;

    iget-object v0, v0, Lxv1;->o1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwun;

    invoke-direct {v1, v2, v3, v0}, La5l;-><init>(Landroid/content/Context;Lumi;Lwun;)V

    return-object v1

    :pswitch_ef
    new-instance v1, Lfqe;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v3, Lvml;->d:Lumi;

    iget-object v0, v0, Lxv1;->u:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltm5;

    invoke-direct {v1, v2, v3, v0}, Lfqe;-><init>(Landroid/content/Context;Lumi;Ltm5;)V

    return-object v1

    :pswitch_101
    new-instance v1, Lepd;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-direct {v1, v0}, Lepd;-><init>(Lx5f;)V

    return-object v1

    :pswitch_10f
    new-instance v1, Lwld;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-direct {v1, v0}, Lsc;-><init>(Lx5f;)V

    return-object v1

    :pswitch_11d
    new-instance v2, Ltjg;

    iget-object v3, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v4, Lvml;->d:Lumi;

    iget-object v1, v0, Lxv1;->Y:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ldjg;

    iget-object v0, v0, Lxv1;->Z:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lzkd;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v7, v0, Ld6j;->c:Lx5f;

    invoke-direct/range {v2 .. v7}, Ltjg;-><init>(Landroid/content/Context;Lumi;Ldjg;Lzkd;Lx5f;)V

    return-object v2

    :pswitch_13f
    new-instance v1, Lzkd;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    new-instance v3, Lmv1;

    invoke-direct {v3, v0, v6}, Lmv1;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v2, v3}, Lzkd;-><init>(Lx5f;Lmv1;)V

    return-object v1

    :pswitch_152
    new-instance v1, Lvv1;

    invoke-direct {v1, v0}, Lvv1;-><init>(Lxv1;)V

    return-object v1

    :pswitch_158
    new-instance v2, Lsnc;

    iget-object v1, v0, Lxv1;->i:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lnx5;

    iget-object v4, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v5, Ljv1;

    const/16 v1, 0xf

    invoke-direct {v5, v0, v1}, Ljv1;-><init>(Lxv1;B)V

    sget-object v6, Lvml;->e:Lwjh;

    iget-object v7, v0, Lxv1;->K:Lj4c;

    new-instance v8, Lvk1;

    const/16 v1, 0x10

    invoke-direct {v8, v1}, Lvk1;-><init>(B)V

    iget-object v9, v0, Lxv1;->d0:Lj4c;

    iget-object v10, v0, Lxv1;->j0:Lj4c;

    iget-object v11, v0, Lxv1;->l0:Lj4c;

    invoke-static {v4}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v12

    iget-object v13, v0, Lxv1;->P0:Lj4c;

    sget-object v14, Lvml;->d:Lumi;

    iget-object v0, v4, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpe;

    iget-object v15, v0, Llpe;->u:Lplh;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    move-object/from16 v16, v0

    invoke-direct/range {v2 .. v16}, Lsnc;-><init>(Lnx5;Landroid/content/Context;Ljv1;Lwjh;Lj4c;Lvk1;Lj4c;Lj4c;Lj4c;Lxnh;Lj4c;Lumi;Lplh;Lx5f;)V

    return-object v2

    :pswitch_19b
    new-instance v1, Lm9c;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-direct {v1, v0}, Lm9c;-><init>(Landroid/content/Context;)V

    return-object v1

    :pswitch_1a3
    new-instance v1, Lnzk;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-direct {v1, v0}, Lnzk;-><init>(Landroid/content/Context;)V

    return-object v1

    :pswitch_1ab
    new-instance v1, Latb;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    iget-object v0, v0, Lxv1;->c1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnzk;

    invoke-direct {v1, v2, v3, v0}, Latb;-><init>(Landroid/content/Context;Lx5f;Lnzk;)V

    return-object v1

    :pswitch_1c1
    sget v1, Lf4b;->f:I

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Ltjh;->a(Landroid/content/Context;)Ltjh;

    move-result-object v1

    new-instance v2, Lf4b;

    new-instance v4, Lvg4;

    const/16 v7, 0x8

    invoke-direct {v4, v0, v7}, Lvg4;-><init>(Landroid/content/Context;B)V

    new-instance v0, Ld4b;

    invoke-direct {v0, v1, v6}, Ld4b;-><init>(Ltjh;B)V

    new-instance v6, Ld4b;

    invoke-direct {v6, v1, v5}, Ld4b;-><init>(Ltjh;B)V

    new-instance v5, Ld4b;

    invoke-direct {v5, v1, v3}, Ld4b;-><init>(Ltjh;B)V

    invoke-direct {v2, v4, v0, v6, v5}, Lf4b;-><init>(Lvg4;Ld4b;Ld4b;Ld4b;)V

    return-object v2

    :pswitch_1e5
    new-instance v1, Lv1a;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v0, v0, Lxv1;->i:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnx5;

    invoke-direct {v1, v2, v0}, Lv1a;-><init>(Lru9;Lnx5;)V

    return-object v1

    :pswitch_1f9
    new-instance v1, Le00;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Le00;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_203
    new-instance v1, Lh0a;

    iget-object v2, v0, Lxv1;->i0:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llpe;

    iget-object v2, v2, Llpe;->s:Lplh;

    invoke-static {v2}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v2

    iget-object v3, v0, Lxv1;->y:Lj4c;

    iget-object v0, v0, Lxv1;->P0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v1, v2, v3, v0}, Lh0a;-><init>(Lhx5;Lj4c;Lcom/opera/android/settings/SettingsManager;)V

    return-object v1

    :pswitch_221
    new-instance v1, Lzv9;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Lzv9;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_22b
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    const-string v1, "flow_touch_mgr"

    invoke-virtual {v0, v1, v6}, Lcom/opera/android/OperaApplication;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0

    :pswitch_234
    iget-object v1, v0, Lxv1;->N:Lj4c;

    sget-object v9, Lvml;->d:Lumi;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1, v9}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    new-instance v7, Lbf9;

    iget-object v8, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v10

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v11

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v12

    iget-object v13, v0, Lxv1;->N:Lj4c;

    iget-object v14, v0, Lxv1;->x:Lt1;

    invoke-direct/range {v7 .. v14}, Lbf9;-><init>(Landroid/content/Context;Lumi;Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;Lj4c;Lt1;)V

    new-instance v1, Lmxl;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-direct {v1, v7, v2}, Lmxl;-><init>(Lbf9;Lx5f;)V

    invoke-virtual {v7, v1}, Lbf9;->b(Lhxl;)V

    new-instance v1, Luv1;

    invoke-direct {v1, v0, v6}, Luv1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7, v1}, Lbf9;->b(Lhxl;)V

    return-object v7

    :pswitch_26c
    new-instance v1, Lsom;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lsom;-><init>(Landroid/content/Context;Ldb;Li53;)V

    return-object v1

    :pswitch_27c
    new-instance v4, Lg89;

    iget-object v1, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    new-instance v3, Lnv1;

    invoke-direct {v3, v0, v5}, Lnv1;-><init>(Lxv1;B)V

    new-instance v7, Lesg;

    sget-object v0, Lvml;->d:Lumi;

    invoke-direct {v7, v1, v0}, Lesg;-><init>(Landroid/content/Context;Lumi;)V

    new-instance v8, Lov1;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    new-instance v9, Lydj;

    invoke-direct {v9, v1, v6}, Lydj;-><init>(Landroid/content/Context;B)V

    move-object v5, v2

    move-object v6, v3

    invoke-direct/range {v4 .. v9}, Lg89;-><init>(Lx5f;Lnv1;Lesg;Lov1;Lydj;)V

    return-object v4

    :pswitch_2a2
    new-instance v1, Le59;

    invoke-direct {v1}, Le59;-><init>()V

    new-instance v2, Luw1;

    iget-object v4, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v5, Lvml;->d:Lumi;

    const v7, 0x7f1401bf

    const v8, 0x7f1401c1

    const v9, 0x7f1401c0

    const v10, 0x7f1401be

    invoke-static {v4, v9, v10, v7, v8}, Lx1p;->h(Landroid/content/Context;IIII)Lj59;

    move-result-object v7

    invoke-direct {v2, v4, v5, v7, v6}, Luw1;-><init>(Landroid/content/Context;Lumi;Lj59;B)V

    sget-object v6, Ld59;->a:Ld59;

    invoke-virtual {v1, v6, v2}, Le59;->a(Ld59;Lc59;)V

    new-instance v2, Luw1;

    invoke-static {v4}, Lj59;->a(Landroid/content/Context;)Lj59;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v8, v6, Lj59;->b:Ljava/lang/String;

    iget-object v9, v6, Lj59;->a:Ljava/lang/String;

    iget-object v10, v6, Lj59;->c:Ljava/lang/String;

    iget-object v11, v6, Lj59;->d:Ljava/lang/String;

    iget-object v13, v6, Lj59;->f:Ljava/lang/String;

    iget-object v14, v6, Lj59;->g:Ljava/lang/String;

    iget-object v15, v6, Lj59;->h:Ljava/lang/String;

    new-instance v7, Lj59;

    const-string v12, "215901376228"

    invoke-direct/range {v7 .. v15}, Lj59;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v6, 0x3

    invoke-direct {v2, v4, v5, v7, v6}, Luw1;-><init>(Landroid/content/Context;Lumi;Lj59;B)V

    sget-object v6, Ld59;->c:Ld59;

    invoke-virtual {v1, v6, v2}, Le59;->a(Ld59;Lc59;)V

    new-instance v2, Lme9;

    iget-object v6, v0, Lxv1;->M:Lj4c;

    invoke-direct {v2, v4, v5, v6}, Lme9;-><init>(Landroid/content/Context;Lumi;Lj4c;)V

    sget-object v6, Ld59;->b:Ld59;

    invoke-virtual {v1, v6, v2}, Le59;->a(Ld59;Lc59;)V

    new-instance v2, Ln9c;

    new-instance v6, Lqq6;

    iget-object v0, v0, Lxv1;->p1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llz6;

    new-instance v7, Lr9i;

    iget-object v8, v0, Llz6;->d:Lbon;

    invoke-virtual {v0}, Llz6;->a()Lpad;

    move-result-object v9

    iget-object v10, v0, Llz6;->j:Lzyk;

    invoke-virtual {v10}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lqp6;

    new-instance v11, Ld06;

    iget-object v0, v0, Llz6;->c:Lw7j;

    invoke-direct {v11, v0}, Ld06;-><init>(Ljava/lang/Object;)V

    invoke-direct {v7, v8, v9, v10, v11}, Lr9i;-><init>(Lbon;Lpad;Lqp6;Ld06;)V

    invoke-direct {v6, v7}, Lqq6;-><init>(Lr9i;)V

    invoke-direct {v2, v4, v5, v6}, Ln9c;-><init>(Landroid/content/Context;Lumi;Lqq6;)V

    sget-object v0, Ld59;->d:Ld59;

    invoke-virtual {v1, v0, v2}, Le59;->a(Ld59;Lc59;)V

    new-instance v0, Luw1;

    invoke-static {v4}, Lj59;->a(Landroid/content/Context;)Lj59;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "fcm"

    invoke-direct {v0, v4, v5, v2, v6}, Luw1;-><init>(Landroid/content/Context;Lumi;Lj59;Ljava/lang/String;)V

    sget-object v2, Ld59;->e:Ld59;

    invoke-virtual {v1, v2, v0}, Le59;->a(Ld59;Lc59;)V

    new-instance v0, Luw1;

    const v2, 0x7f140a4f

    const v6, 0x7f140a52

    const v7, 0x7f140a50

    const v8, 0x7f140a4e

    invoke-static {v4, v7, v8, v2, v6}, Lx1p;->h(Landroid/content/Context;IIII)Lj59;

    move-result-object v2

    invoke-direct {v0, v4, v5, v2, v3}, Luw1;-><init>(Landroid/content/Context;Lumi;Lj59;B)V

    sget-object v2, Ld59;->g:Ld59;

    invoke-virtual {v1, v2, v0}, Le59;->a(Ld59;Lc59;)V

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v0

    invoke-virtual {v0}, Ljtg;->b()Z

    move-result v0

    if-eqz v0, :cond_374

    new-instance v0, Ln9c;

    iget-object v2, v4, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->c:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/account/push/AccountPushManager;

    invoke-direct {v0, v4, v5, v2}, Ln9c;-><init>(Landroid/content/Context;Lumi;Lcom/opera/android/account/push/AccountPushManager;)V

    sget-object v2, Ld59;->f:Ld59;

    invoke-virtual {v1, v2, v0}, Le59;->a(Ld59;Lc59;)V

    :cond_374
    return-object v1

    :pswitch_375
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v1

    new-instance v2, Lau8;

    invoke-direct {v2, v0}, Lau8;-><init>(Landroid/content/Context;)V

    new-instance v0, Lxue;

    invoke-direct {v0, v1}, Lxue;-><init>(Lfqe;)V

    iget-object v1, v2, Lau8;->b:Ljava/util/EnumMap;

    sget-object v3, Lcue;->c:Lcue;

    invoke-virtual {v1, v3, v0}, Ljava/util/EnumMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v2

    :pswitch_38d
    new-instance v1, Lxt8;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lxt8;-><init>(Landroid/content/Context;Lydn;Lcom/opera/android/settings/SettingsManager;)V

    return-object v1

    :pswitch_39d
    new-instance v1, Lcom/opera/android/favorites/e;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->d:Lx5f;

    iget-object v3, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v3, v3, Lxv1;->g1:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcul;

    new-instance v4, Lvzk;

    sget-object v5, Lvml;->d:Lumi;

    new-instance v6, Le84;

    invoke-direct {v6, v2, v5}, Le84;-><init>(Landroid/content/Context;Lumi;)V

    new-instance v7, Ltd2;

    invoke-direct {v7, v5}, Ltd2;-><init>(Lumi;)V

    new-instance v5, Lpp6;

    invoke-direct {v5, v2}, Lpp6;-><init>(Landroid/content/Context;)V

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v6, v4, Lvzk;->a:Ljava/lang/Object;

    iput-object v7, v4, Lvzk;->b:Ljava/lang/Object;

    iput-object v5, v4, Lvzk;->c:Ljava/lang/Object;

    iget-object v0, v0, Lxv1;->U0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzzj;

    invoke-direct {v1, v3, v4, v0}, Lcom/opera/android/favorites/e;-><init>(Lcul;Lvzk;Lzzj;)V

    return-object v1

    :pswitch_3df
    new-instance v7, Lg77;

    sget-object v1, Lvml;->d:Lumi;

    sget-object v2, Lxne;->b:Lii;

    new-instance v3, Lk5o;

    iget-object v6, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v6}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v8

    new-instance v9, Ljv1;

    const/16 v10, 0x19

    invoke-direct {v9, v0, v10}, Ljv1;-><init>(Lxv1;B)V

    invoke-direct {v3, v8, v9}, Lk5o;-><init>(Le3j;Ljv1;)V

    invoke-direct {v7, v1, v2, v3}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lr9i;

    new-instance v3, Ljava/io/File;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v8

    const-string v9, "favorite-catalog"

    invoke-direct {v3, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v2, v3, v1}, Lr9i;-><init>(Ljava/io/File;Lumi;)V

    new-instance v3, Lrq8;

    new-instance v8, Llld;

    invoke-static {v6}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v9

    invoke-direct {v8, v9, v4}, Llld;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Luu1;

    const/16 v4, 0x9

    invoke-direct {v9, v4}, Luu1;-><init>(B)V

    new-instance v10, Ljv1;

    const/16 v4, 0x1b

    invoke-direct {v10, v0, v4}, Ljv1;-><init>(Lxv1;B)V

    new-instance v11, Ljv1;

    const/16 v4, 0x1c

    invoke-direct {v11, v0, v4}, Ljv1;-><init>(Lxv1;B)V

    new-instance v12, Ljv1;

    const/16 v4, 0x1d

    invoke-direct {v12, v0, v4}, Ljv1;-><init>(Lxv1;B)V

    new-instance v13, Lrb;

    invoke-direct {v13, v6, v1, v5}, Lrb;-><init>(Landroid/content/Context;Lumi;B)V

    move-object v6, v2

    move-object v5, v3

    invoke-direct/range {v5 .. v13}, Lrq8;-><init>(Lr9i;Lg77;Llld;Luu1;Ljv1;Ljv1;Ljv1;Lrb;)V

    return-object v5

    :pswitch_43c
    new-instance v1, Lxb;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v3

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lxb;-><init>(Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;)V

    return-object v1

    :pswitch_data_450
    .packed-switch 0x0
        :pswitch_43c
        :pswitch_3df
        :pswitch_39d
        :pswitch_38d
        :pswitch_375
        :pswitch_2a2
        :pswitch_27c
        :pswitch_26c
        :pswitch_234
        :pswitch_22b
        :pswitch_221
        :pswitch_203
        :pswitch_1f9
        :pswitch_1e5
        :pswitch_1c1
        :pswitch_1ab
        :pswitch_1a3
        :pswitch_19b
        :pswitch_158
        :pswitch_152
        :pswitch_13f
        :pswitch_11d
        :pswitch_10f
        :pswitch_101
        :pswitch_ef
        :pswitch_dd
        :pswitch_d3
        :pswitch_c3
        :pswitch_b4
    .end packed-switch
.end method
