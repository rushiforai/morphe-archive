.class public final Lzqi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lmri;

.field public final b:Lmrk;

.field public final c:Lxd5;


# direct methods
.method public constructor <init>(Lumi;Lxd5;Landroid/view/ViewGroup;Lfbf;Lj4c;Lcom/opera/android/settings/SettingsManager;Liv7;Lk6l;Lipk;Lwcd;Landroid/content/ClipboardManager;Lpde;Lwt3;Lqim;Lyz9;Llg;Lm6m;Ls28;Lode;Lx5f;Lx5f;Ldbf;Lqdh;Lbr6;Losf;Lmdh;Li53;Lnr8;Lqr8;Lnv2;Lgjm;Lnwf;Lm0a;Lhw3;Lky1;Ljv3;Lx77;Ljv3;Lzv3;Lcom/opera/android/Lazy;Lhw3;)V
    .registers 91

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p14

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lzqi;->c:Lxd5;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v4

    new-instance v5, Lmrk;

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v6

    new-instance v7, Lole;

    invoke-direct {v7, v1}, Lole;-><init>(Lxd5;)V

    iget-object v1, v7, Lole;->a:Ljava/lang/Object;

    move-object v8, v1

    check-cast v8, Lpde;

    invoke-virtual/range {p13 .. p13}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljbf;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v24, v1

    check-cast v24, Libf;

    iget-object v1, v2, Lqim;->e:Lysj;

    iget-object v7, v3, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Llpe;

    iget-object v9, v9, Llpe;->q:Lplh;

    new-instance v10, Lot8;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v11

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v12

    iget-object v12, v12, Lslk;->i:Lkze;

    iget-object v3, v3, Lcom/opera/android/OperaApplication;->v:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldp6;

    invoke-virtual {v3}, Ldp6;->b()Lole;

    move-result-object v3

    invoke-virtual {v3}, Lole;->t()Lf99;

    move-result-object v3

    invoke-static {v3}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v3

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Llpe;

    iget-object v7, v7, Llpe;->x:Lplh;

    invoke-static {v7}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v7

    invoke-direct {v10, v11, v12, v3, v7}, Lot8;-><init>(Ljtg;Lkze;Lhx5;Lhx5;)V

    move-object/from16 v13, p1

    move-object/from16 v7, p5

    move-object/from16 v15, p6

    move-object/from16 v16, p7

    move-object/from16 v17, p8

    move-object/from16 v20, p9

    move-object/from16 v21, p10

    move-object/from16 v22, p11

    move-object/from16 v23, p12

    move-object/from16 v36, p15

    move-object/from16 v28, p17

    move-object/from16 v29, p18

    move-object/from16 v12, p19

    move-object/from16 v25, p20

    move-object/from16 v27, p21

    move-object/from16 v14, p22

    move-object/from16 v31, p23

    move-object/from16 v32, p24

    move-object/from16 v26, p25

    move-object/from16 v30, p26

    move-object/from16 v18, p27

    move-object/from16 v19, p28

    move-object/from16 v33, p29

    move-object/from16 v34, p30

    move-object/from16 v35, p31

    move-object/from16 v11, p32

    move-object/from16 v37, p33

    move-object/from16 v38, p34

    move-object/from16 v39, p35

    move-object/from16 v41, p36

    move-object/from16 v42, p37

    move-object/from16 v43, p38

    move-object/from16 v44, p39

    move-object/from16 v45, p40

    move-object/from16 v47, p41

    move-object/from16 v40, v1

    move-object/from16 v46, v9

    move-object/from16 v48, v10

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    invoke-direct/range {v5 .. v48}, Lmrk;-><init>(Ltcc;Lj4c;Lpde;Landroid/view/ViewGroup;Lfbf;Lnwf;Lode;Lumi;Ldbf;Lcom/opera/android/settings/SettingsManager;Liv7;Lk6l;Li53;Lnr8;Lipk;Lwcd;Landroid/content/ClipboardManager;Lpde;Libf;Lx5f;Losf;Lx5f;Lm6m;Ls28;Lmdh;Lqdh;Lbr6;Lqr8;Lnv2;Lgjm;Lyz9;Lm0a;Lhw3;Lky1;Lysj;Ljv3;Lx77;Ljv3;Lzv3;Lcom/opera/android/Lazy;Lplh;Lhw3;Lot8;)V

    iput-object v5, v0, Lzqi;->b:Lmrk;

    new-instance v1, Lmri;

    new-instance v3, Lz0a;

    const/4 v5, 0x1

    move-object/from16 v6, p8

    invoke-direct {v3, v6, v5}, Lz0a;-><init>(Lk6l;B)V

    new-instance v5, Lcbf;

    const/4 v6, 0x2

    invoke-direct {v5, v14, v6}, Lcbf;-><init>(Ldbf;B)V

    move-object/from16 v6, p16

    invoke-direct {v1, v6, v4, v3, v5}, Lmri;-><init>(Llg;Lq6e;Lz0a;Lcbf;)V

    iput-object v1, v0, Lzqi;->a:Lmri;

    iput-object v2, v1, Lo73;->f:Lqim;

    return-void
.end method
