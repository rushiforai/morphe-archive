.class public final Ljt3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Lx5f;

.field public final c:Ltni;

.field public final d:Lhw3;

.field public final e:Lqb7;

.field public final f:Lfd;

.field public final g:Lkze;

.field public h:Lb2l;

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;Lx5f;Lx5f;Lxnh;Lk6l;Ltni;Lbq3;Lkze;Lnue;Lhw3;Lkze;Let3;Likc;Lew3;Ldw3;Lj4c;Lqim;Landroid/view/View;Lzu3;Lpt3;Ldw3;Lcom/opera/android/Lazy;)V
    .registers 38

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v11, p3

    iput-object v11, p0, Ljt3;->a:Lx5f;

    move-object/from16 v0, p4

    iput-object v0, p0, Ljt3;->b:Lx5f;

    iput-object v10, p0, Ljt3;->c:Ltni;

    move-object/from16 v0, p11

    iput-object v0, p0, Ljt3;->d:Lhw3;

    new-instance v12, Lqb7;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    new-instance v0, Llt3;

    const/4 v13, 0x0

    invoke-direct {v0, v12, v13}, Llt3;-><init>(Lqb7;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v12, Lqb7;->a:Ljava/lang/Object;

    new-instance v0, Llt3;

    const/4 v8, 0x1

    invoke-direct {v0, v12, v8}, Llt3;-><init>(Lqb7;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v12, Lqb7;->b:Ljava/lang/Object;

    new-instance v0, Lmt3;

    invoke-direct {v0, p1, v13}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v12, Lqb7;->c:Ljava/lang/Object;

    new-instance v6, Lbo3;

    const/4 v0, 0x7

    invoke-direct {v6, v12, v0}, Lbo3;-><init>(Ljava/lang/Object;B)V

    const/4 v7, 0x7

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    iput-object v12, p0, Ljt3;->e:Lqb7;

    new-instance v3, Lfd;

    new-instance v0, Lwhf;

    const/16 v2, 0xd

    invoke-direct {v0, p0, v2}, Lwhf;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v3, v0}, Lfd;-><init>(Lwhf;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/OperaApplication;

    new-instance v0, Lwj9;

    new-instance v2, Ldt3;

    invoke-direct {v2, p0, v13}, Ldt3;-><init>(Ljt3;B)V

    move-object v1, p1

    move-object/from16 v5, p20

    move-object v4, v3

    move-object/from16 v3, p8

    invoke-direct/range {v0 .. v5}, Lwj9;-><init>(Lcom/opera/android/BrowserActivity;Ldt3;Lbq3;Lfd;Lzu3;)V

    move-object v3, v4

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Lwj9;

    move-object v2, p1

    move-object/from16 v4, p17

    invoke-direct/range {v0 .. v5}, Lwj9;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lfd;Lj4c;Lzu3;)V

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Lk99;

    new-instance v2, Let3;

    invoke-direct {v2, v7, v13}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct {v0, p1, v2, v3, v5}, Lk99;-><init>(Lcom/opera/android/BrowserActivity;Let3;Lfd;Lzu3;)V

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Ll35;

    invoke-direct {v0, p1, v3, v5}, Ll35;-><init>(Lcom/opera/android/BrowserActivity;Lfd;Lzu3;)V

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Lwj9;

    new-instance v2, Ldt3;

    invoke-direct {v2, p0, v8}, Ldt3;-><init>(Ljt3;B)V

    move-object/from16 v4, p2

    move-object/from16 v5, p5

    move-object v6, v3

    move-object/from16 v3, p10

    invoke-direct/range {v0 .. v6}, Lwj9;-><init>(Lcom/opera/android/BrowserActivity;Ldt3;Lnue;Lcom/opera/android/settings/SettingsManager;Lxnh;Lfd;)V

    move-object v3, v6

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Ll35;

    new-instance v2, Ldt3;

    const/4 v4, 0x2

    invoke-direct {v2, p0, v4}, Ldt3;-><init>(Ljt3;B)V

    move-object/from16 v4, p9

    invoke-direct {v0, p1, v2, v4, v3}, Ll35;-><init>(Lcom/opera/android/BrowserActivity;Ldt3;Lkze;Lfd;)V

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Lhv0;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v4

    const-class v2, Ld8j;

    iget-object v5, p1, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v5, v2}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Ld8j;

    move-object v2, p1

    move-object/from16 v5, p2

    move-object/from16 v7, p21

    move-object/from16 v8, p23

    invoke-direct/range {v0 .. v8}, Lhv0;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lfd;Lj4c;Lcom/opera/android/settings/SettingsManager;Ld8j;Lpt3;Lcom/opera/android/Lazy;)V

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Lmy0;

    move-object/from16 v2, p16

    move-object/from16 v4, p22

    invoke-direct {v0, p1, v3, v2, v4}, Lmy0;-><init>(Lcom/opera/android/BrowserActivity;Lfd;Ldw3;Ldw3;)V

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Lpqc;

    move-object v2, p1

    move-object/from16 v4, p13

    move-object v5, v3

    move-object/from16 v3, p12

    invoke-direct/range {v0 .. v5}, Lpqc;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lkze;Let3;Lfd;)V

    move-object v3, v5

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    new-instance v0, Lo2i;

    move-object/from16 v2, p14

    move-object/from16 v4, p15

    invoke-direct {v0, p1, v2, v4, v3}, Lo2i;-><init>(Lcom/opera/android/BrowserActivity;Likc;Lew3;Lfd;)V

    invoke-virtual {v3, v0}, Lfd;->a(Lid;)V

    iput-object v3, p0, Ljt3;->f:Lfd;

    new-instance v0, Lkze;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ljt3;->g:Lkze;

    new-instance v0, Lqz;

    const/4 v2, 0x3

    invoke-direct {v0, p0, v2}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9, v0}, Lk6l;->b(La2l;)V

    new-instance v0, Lgt3;

    invoke-direct {v0, p0}, Lgt3;-><init>(Ljt3;)V

    invoke-virtual {v9, v0}, Lk6l;->c(Lj6l;)V

    new-instance v0, Lht3;

    invoke-direct {v0, v13}, Lht3;-><init>(B)V

    invoke-virtual {v9, v0}, Lk6l;->a(La2l;)Lf6l;

    new-instance v0, Lit3;

    invoke-direct {v0, p0, v13}, Lit3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v10, v0}, Ltni;->a(Lsni;)V

    iget-object v0, v9, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0}, Ljt3;->a(Lb2l;)V

    new-instance p0, Ligi;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    new-instance v1, Lft3;

    move-object/from16 v2, p18

    invoke-direct {v1, v2, v13}, Lft3;-><init>(Lqim;B)V

    move-object/from16 p4, p0

    move-object/from16 p5, p19

    move-object/from16 p8, v0

    move-object/from16 p9, v1

    move-object/from16 p7, v3

    move-object/from16 p10, v11

    move-object/from16 p6, v12

    invoke-direct/range {p4 .. p10}, Ligi;-><init>(Landroid/view/View;Lqb7;Lfd;Lru9;Lft3;Lx5f;)V

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)V
    .registers 4

    if-eqz p1, :cond_2c

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-boolean v1, v0, Ld7l;->m:Z

    if-nez v1, :cond_2c

    iput-object p1, p0, Ljt3;->h:Lb2l;

    invoke-virtual {v0}, Ld7l;->o0()Z

    move-result p1

    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Ljt3;->i:Z

    iget-object v0, p0, Ljt3;->c:Ltni;

    iget-boolean v0, v0, Ltni;->b:Z

    if-nez p1, :cond_1d

    if-nez v0, :cond_1d

    const/4 p1, 0x1

    goto :goto_1e

    :cond_1d
    const/4 p1, 0x0

    :goto_1e
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object v0, p0, Ljt3;->g:Lkze;

    invoke-static {v0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    iget-object p0, p0, Ljt3;->f:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    :cond_2c
    return-void
.end method
