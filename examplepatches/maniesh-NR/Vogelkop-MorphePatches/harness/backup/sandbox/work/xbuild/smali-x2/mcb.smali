.class public final synthetic Lmcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp12;


# direct methods
.method public synthetic constructor <init>(Lp12;B)V
    .registers 3

    iput-byte p2, p0, Lmcb;->a:B

    iput-object p1, p0, Lmcb;->b:Lp12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 8

    iget-byte v0, p0, Lmcb;->a:B

    const-class v1, Lz3l;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-class v4, Ld8j;

    const-class v5, Ljt2;

    const/4 v6, 0x0

    iget-object p0, p0, Lmcb;->b:Lp12;

    packed-switch v0, :pswitch_data_1fe

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lg0c;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lg0c;

    new-array v0, v6, [I

    invoke-virtual {p0, v0}, Lg0c;->a([I)V

    return-void

    :pswitch_22
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lpr8;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lpr8;

    check-cast p0, Lqr8;

    iget-object p0, p0, Lqr8;->b:Lgjm;

    new-instance v0, Lys;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_3b
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v4}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    new-array v0, v6, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, v0}, Lg8j;->f([I)V

    return-void

    :pswitch_4d
    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Lexe;

    invoke-direct {v0}, Lexe;-><init>()V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_5a
    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Lwrk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_67
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lqr8;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lqr8;

    iget-object p0, p0, Lqr8;->b:Lgjm;

    new-instance v0, Loyk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_7e
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lt2b;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lt2b;

    check-cast p0, Lu2b;

    iget-object p0, p0, Lu2b;->b:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    new-instance v0, Lm2b;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_9d
    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lgjm;

    new-instance v1, Lmmm;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iget-object v2, p0, Lp12;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/BrowserActivity;

    new-instance v3, Lks6;

    const/16 v4, 0x13

    invoke-direct {v3, p0, v4}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2, v3}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void

    :pswitch_b5
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v4}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    const v0, 0x7f0a099f

    filled-new-array {v0}, [I

    move-result-object v0

    check-cast p0, Lg8j;

    invoke-virtual {p0, v0}, Lg8j;->b([I)V

    return-void

    :pswitch_cc
    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Ltca;

    invoke-direct {v0, v6}, Ltca;-><init>(I)V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_d9
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v5}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    check-cast p0, Lot2;

    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance v0, Ld3b;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_f0
    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Lspn;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_fd
    iget-object v0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    new-instance v1, Lld9;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, v2}, Lld9;-><init>(Ljava/lang/Object;B)V

    sget-boolean p0, Lwi2;->l:Z

    if-nez p0, :cond_124

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    sget-boolean v2, Lwi2;->l:Z

    if-nez v2, :cond_124

    sput-object p0, Lwi2;->j:Lcom/opera/android/settings/SettingsManager;

    sget-object p0, Lu55;->Ro:Lulp;

    sput-object p0, Lwi2;->k:Lulp;

    sput-boolean v3, Lwi2;->l:Z

    :cond_124
    sget-object p0, Lwi2;->i:Lwi2;

    invoke-virtual {p0, v0, v1}, Llj2;->b(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void

    :pswitch_12a
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v5}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    new-array v0, v6, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, v0}, Lot2;->b([I)V

    return-void

    :pswitch_13c
    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Lxyg;

    invoke-direct {v0, v6}, Lxyg;-><init>(I)V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_149
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v4}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    const-class v0, Lts1;

    invoke-virtual {p0, v0, v2}, Lg8j;->l(Ljava/lang/Class;Landroid/os/Bundle;)V

    return-void

    :pswitch_15b
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lsyl;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lsyl;

    invoke-virtual {p0}, Lsyl;->a()V

    return-void

    :pswitch_16b
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lben;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lben;

    new-array v0, v6, [I

    invoke-virtual {p0, v0}, Lben;->a([I)V

    return-void

    :pswitch_17d
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v5}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    new-array v0, v6, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, v0}, Lot2;->a([I)V

    return-void

    :pswitch_18f
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v5}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    check-cast p0, Lot2;

    invoke-virtual {p0}, Lot2;->d()V

    return-void

    :pswitch_19f
    new-instance v0, Lxxh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Lxl3;

    invoke-direct {v0, v2}, Lxl3;-><init>(Ljava/lang/Long;)V

    invoke-virtual {p0, v0, v6}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_1b4
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lom3;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lom3;

    new-array v0, v6, [I

    check-cast p0, Lpm3;

    invoke-virtual {p0, v0}, Lpm3;->a([I)V

    return-void

    :pswitch_1c8
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lz3l;

    sget-object v0, Lx3l;->a:Lx3l;

    invoke-virtual {p0, v0}, Lz3l;->a(Lx3l;)V

    return-void

    :pswitch_1d8
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lz3l;

    sget-object v0, Lx3l;->b:Lx3l;

    invoke-virtual {p0, v0}, Lz3l;->a(Lx3l;)V

    return-void

    :pswitch_1e8
    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "enable_newsfeed"

    invoke-virtual {p0, v3, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_data_1fe
    .packed-switch 0x0
        :pswitch_1e8
        :pswitch_1d8
        :pswitch_1c8
        :pswitch_1b4
        :pswitch_19f
        :pswitch_18f
        :pswitch_17d
        :pswitch_16b
        :pswitch_15b
        :pswitch_149
        :pswitch_13c
        :pswitch_12a
        :pswitch_fd
        :pswitch_f0
        :pswitch_d9
        :pswitch_cc
        :pswitch_b5
        :pswitch_9d
        :pswitch_7e
        :pswitch_67
        :pswitch_5a
        :pswitch_4d
        :pswitch_3b
        :pswitch_22
    .end packed-switch
.end method
