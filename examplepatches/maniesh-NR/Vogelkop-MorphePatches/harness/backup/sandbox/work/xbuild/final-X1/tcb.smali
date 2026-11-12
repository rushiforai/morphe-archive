.class public final Ltcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Ltcb;->a:B

    iput-object p1, p0, Ltcb;->b:Ljava/lang/Object;

    iput-object p2, p0, Ltcb;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lp12;Ls0f;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ltcb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltcb;->b:Ljava/lang/Object;

    iput-object p1, p0, Ltcb;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 14

    iget-byte v0, p0, Ltcb;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, Ltcb;->c:Ljava/lang/Object;

    iget-object p0, p0, Ltcb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_f8

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v3, Llsc;

    invoke-virtual {p0, v3}, Ld7l;->Z(Llsc;)V

    return-void

    :pswitch_1a
    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v1

    invoke-virtual {v1}, Ljtg;->d()Z

    move-result v1

    if-eqz v1, :cond_3d

    new-instance v1, Ledb;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->F0()Lyug;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v0

    check-cast v3, Lltg;

    invoke-direct {v1, p0, v2, v0, v3}, Ledb;-><init>(Lndc;Lyug;Lslk;Lltg;)V

    :cond_3d
    return-void

    :pswitch_3e
    check-cast p0, Lzhj;

    check-cast v3, Landroid/content/Context;

    invoke-virtual {p0, v3}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_46
    check-cast p0, Lcom/opera/android/BrowserActivity;

    check-cast v3, Landroid/content/Intent;

    const-string v0, "com.opera.android.EXTRA_ENABLE_COMPRESSION"

    invoke-virtual {v3, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v3

    const-class v4, Ltc6;

    invoke-static {v3, v4}, Llcp;->o(Landroidx/fragment/app/w;Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object v5

    check-cast v5, Ltc6;

    if-eqz v5, :cond_71

    const-string p0, "data-savings"

    const/4 v1, -0x1

    invoke-virtual {v3, v1, v2, p0}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    new-instance v1, Ly73;

    invoke-direct {v1, v5, v0}, Ly73;-><init>(Ltc6;Z)V

    invoke-virtual {p0, v1}, Ltcc;->a(Lmdc;)V

    goto :goto_9f

    :cond_71
    sget v3, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v1}, Lcom/opera/android/BrowserActivity;->o1(I)V

    new-array v2, v2, [Ln6h;

    new-instance v6, Lwzg;

    const/4 v3, 0x4

    const/4 v5, 0x0

    invoke-direct {v6, v5, v4, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v3, "extra_enable_compression"

    invoke-virtual {v7, v3, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "extra_show_free_data_dialog"

    invoke-virtual {v7, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v5, Lzhj;

    const/4 v10, 0x0

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    const/4 v8, 0x1

    const/16 v9, 0x1003

    const/4 v11, 0x0

    invoke-direct/range {v5 .. v12}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v5, p0}, Lzhj;->c(Landroid/content/Context;)V

    :goto_9f
    return-void

    :pswitch_a0
    check-cast v3, Lp12;

    iget-object v0, v3, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->d:Lx5f;

    check-cast p0, Ls0f;

    iget-object v3, v3, Lp12;->d:Ljava/lang/Object;

    check-cast v3, Lumi;

    iget-object v6, p0, Ls0f;->b:Landroid/os/Bundle;

    if-eqz v6, :cond_ee

    const-string v7, "notification_type"

    invoke-virtual {v6, v7}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ee

    new-instance v6, Lnbh;

    invoke-direct {v6, v0, v3, v4, v5}, Lnbh;-><init>(Landroid/content/Context;Lumi;Lorm;Lskm;)V

    :try_start_d7
    iget-object v3, p0, Ls0f;->b:Landroid/os/Bundle;

    invoke-virtual {v6, v0, v3, v2}, Lnbh;->a(Landroid/content/Context;Landroid/os/Bundle;Z)Lwbh;

    move-result-object v2

    iget-boolean v3, v2, Lwbh;->q:Z

    if-eqz v3, :cond_ee

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Ls0f;->a:J

    sub-long/2addr v3, v5

    iget-boolean v5, v2, Lwbh;->i:Z

    xor-int/2addr v5, v1

    invoke-virtual {v2, v3, v4, v5}, Lwbh;->s(JZ)V
    :try_end_ee
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d7 .. :try_end_ee} :catch_ee

    :catch_ee
    :cond_ee
    invoke-virtual {p0, v0}, Ls0f;->g(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_f7

    invoke-virtual {p0, v0}, Ls0f;->e(Lcom/opera/android/BrowserActivity;)Z

    :cond_f7
    return-void

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_a0
        :pswitch_46
        :pswitch_3e
        :pswitch_1a
    .end packed-switch
.end method
