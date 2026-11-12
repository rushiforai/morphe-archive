.class public final synthetic La0o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;B)V
    .registers 3

    iput-byte p2, p0, La0o;->a:B

    iput-object p1, p0, La0o;->b:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, La0o;->a:B

    iget-object v0, v0, La0o;->b:Lxbf;

    packed-switch v1, :pswitch_data_130

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    new-instance v8, Lt1;

    const/16 v3, 0x11

    invoke-direct {v8, v4, v3}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v11, Lt1;

    const/16 v3, 0x12

    invoke-direct {v11, v4, v3}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v3, Lzg;

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v3, v5}, Lzg;-><init>(Ljava/lang/ref/WeakReference;)V

    new-instance v1, Lsz4;

    invoke-direct {v1, v3}, Lsz4;-><init>(Lg91;)V

    new-instance v13, Lxbf;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object v14

    new-instance v3, Lc0o;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object v5

    new-instance v6, Lox3;

    const/16 v7, 0x9

    invoke-direct {v6, v2, v7}, Lox3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v7, Lyl6;

    sget-object v9, Lvml;->d:Lumi;

    invoke-direct {v7, v4, v9}, Lyl6;-><init>(Landroid/content/Context;Lumi;)V

    iget-object v9, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v9, v9, Lxv1;->m0:Lj4c;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lldf;

    new-instance v10, Ljjg;

    const/16 v12, 0x10

    invoke-direct {v10, v1, v12}, Ljjg;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v1, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lmi;

    invoke-virtual {v1}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v12

    invoke-direct/range {v3 .. v12}, Lc0o;-><init>(Landroid/content/Context;Lr65;Lox3;Lyl6;Lt1;Lldf;Ljjg;Lt1;Lcom/opera/android/settings/SettingsManager;)V

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object v9

    iget-object v1, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lmi;

    invoke-virtual {v1}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v10

    iget-object v0, v0, Lxbf;->e:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Lj4c;

    const/16 v12, 0x16

    move-object v7, v3

    move-object v5, v13

    move-object v6, v14

    invoke-direct/range {v5 .. v12}, Lxbf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v5

    :pswitch_8a
    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/startup/WelcomeActivity;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_93
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Lxbf;->c:Ljava/lang/Object;

    move-object v15, v1

    check-cast v15, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v15}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lcom/opera/android/OperaApplication;

    new-instance v1, Lb0o;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v9

    new-instance v10, La0o;

    const/4 v2, 0x2

    invoke-direct {v10, v0, v2}, La0o;-><init>(Lxbf;B)V

    iget-object v11, v3, Lcom/opera/android/OperaApplication;->x:Lj4c;

    iget-object v12, v3, Lcom/opera/android/OperaApplication;->z:Lg92;

    iget-object v2, v0, Lxbf;->d:Ljava/lang/Object;

    move-object v13, v2

    check-cast v13, Ltzn;

    iget-object v2, v0, Lxbf;->f:Ljava/lang/Object;

    move-object v14, v2

    check-cast v14, Lj4c;

    iget-object v2, v3, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llpe;

    iget-object v2, v2, Llpe;->k:Lcq5;

    move-object/from16 v16, v10

    iget-object v10, v3, Lcom/opera/android/OperaApplication;->B:Lj4c;

    move-object v4, v2

    new-instance v2, Lpw3;

    const/4 v7, 0x0

    const/16 v8, 0x12

    move-object v5, v4

    const-class v4, Lcom/opera/android/OperaApplication;

    move-object v6, v5

    const-string v5, "pushedContentManager"

    move-object/from16 v17, v6

    const-string v6, "getPushedContentManager()Lcom/opera/android/startup/PushedContentManager;"

    invoke-direct/range {v2 .. v8}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v5, v11

    new-instance v11, Lwv1;

    const/4 v3, 0x4

    invoke-direct {v11, v2, v3}, Lwv1;-><init>(Lb6h;B)V

    iget-object v2, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v2, Lxbf;

    iget-object v3, v2, Lxbf;->b:Ljava/lang/Object;

    check-cast v3, Lmi;

    invoke-virtual {v3}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    move-object v7, v13

    new-instance v13, La0o;

    const/4 v4, 0x3

    invoke-direct {v13, v0, v4}, La0o;-><init>(Lxbf;B)V

    iget-object v0, v2, Lxbf;->e:Ljava/lang/Object;

    check-cast v0, Lj4c;

    move-object v2, v1

    move-object v6, v12

    move-object v8, v14

    move-object/from16 v4, v16

    move-object v14, v0

    move-object v12, v3

    move-object v3, v9

    move-object/from16 v9, v17

    invoke-direct/range {v2 .. v15}, Lb0o;-><init>(Lj4c;La0o;Lj4c;Lg92;Ltzn;Lj4c;Lcq5;Lj4c;Lwv1;Lcom/opera/android/settings/SettingsManager;La0o;Lcom/opera/android/Lazy;Lcom/opera/android/startup/WelcomeActivity;)V

    return-object v2

    :pswitch_108
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lmdf;

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->d:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->g:Lwsf;

    invoke-direct {v2, v0, v3, v4, v1}, Lmdf;-><init>(Ltcc;Lx5f;Lx5f;Lwsf;)V

    return-object v2

    :pswitch_data_130
    .packed-switch 0x0
        :pswitch_108
        :pswitch_93
        :pswitch_8a
    .end packed-switch
.end method
