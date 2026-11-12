.class public final Ly4g;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Lx5f;

.field public final c:Lw6f;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lydn;Lqim;Lx5f;Ltcc;)V
    .registers 7

    const/4 p1, 0x1

    iput-byte p1, p0, Ly4g;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance p1, Lgzg;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lgzg;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ly4g;->e:Ljava/lang/Object;

    .line 30
    iput-object p2, p0, Ly4g;->c:Lw6f;

    .line 31
    iput-object p3, p0, Ly4g;->d:Ljava/lang/Object;

    .line 32
    iput-object p4, p0, Ly4g;->b:Lx5f;

    .line 33
    invoke-virtual {p5, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public constructor <init>(Lzwk;Lcom/opera/android/settings/SettingsManager;Lx5f;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Ly4g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lx4g;

    invoke-direct {v0, p0}, Lx4g;-><init>(Ly4g;)V

    iput-object v0, p0, Ly4g;->e:Ljava/lang/Object;

    new-instance v0, Lj25;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lj25;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ly4g;->f:Ljava/lang/Object;

    iput-object p1, p0, Ly4g;->c:Lw6f;

    iput-object p2, p0, Ly4g;->d:Ljava/lang/Object;

    iput-object p3, p0, Ly4g;->b:Lx5f;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 5

    iget-object v0, p0, Ly4g;->c:Lw6f;

    check-cast v0, Lydn;

    invoke-static {v0}, Lbg7;->b(Lydn;)I

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, p0, Ly4g;->d:Ljava/lang/Object;

    check-cast v1, Lqim;

    iget-object v2, p0, Ly4g;->f:Ljava/lang/Object;

    check-cast v2, Lbg7;

    if-nez v2, :cond_36

    new-instance v2, Lbg7;

    iget-object v3, p0, Ly4g;->b:Lx5f;

    invoke-direct {v2, p0, v0, v1, v3}, Lbg7;-><init>(Ly4g;Lydn;Lqim;Lx5f;)V

    iput-object v2, p0, Ly4g;->f:Ljava/lang/Object;

    iget-object p0, v1, Lqim;->c:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v2, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_28
    iget-object v0, p0, Ly4g;->f:Ljava/lang/Object;

    check-cast v0, Lbg7;

    if-eqz v0, :cond_36

    sget-object v1, Lhjm;->b:Lhjm;

    invoke-virtual {v0, v1}, Ld63;->finish(Lhjm;)V

    const/4 v0, 0x0

    iput-object v0, p0, Ly4g;->f:Ljava/lang/Object;

    :cond_36
    return-void
.end method

.method public final S()V
    .registers 7

    iget-object v0, p0, Ly4g;->c:Lw6f;

    check-cast v0, Lzwk;

    iget-boolean v0, v0, Lzwk;->b:Z

    if-eqz v0, :cond_29

    const/4 v0, 0x3

    invoke-static {v0}, Lzwk;->c(I)Z

    move-result v0

    iget-object v1, p0, Ly4g;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    const-string v2, "enable_sync"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_22

    invoke-static {}, Lzwk;->f()Z

    move-result v1

    if-eqz v1, :cond_22

    move v1, v2

    goto :goto_23

    :cond_22
    const/4 v1, 0x0

    :goto_23
    iget-object p0, p0, Ly4g;->b:Lx5f;

    iget-boolean v3, p0, Lx5f;->h:Z

    if-nez v3, :cond_2a

    :cond_29
    return-void

    :cond_2a
    iget-object v3, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v3

    const/16 v5, 0x1e

    if-eqz v1, :cond_46

    if-eqz v0, :cond_3d

    sget-object v0, Lim0;->b:Lim0;

    goto :goto_3f

    :cond_3d
    sget-object v0, Lim0;->c:Lim0;

    :goto_3f
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v5, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_4e

    :cond_46
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lim0;->d:Lim0;

    invoke-virtual {v3, v5, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :goto_4e
    invoke-virtual {p0, v4}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-byte p1, p0, Ly4g;->a:B

    packed-switch p1, :pswitch_data_2c

    iget-object p1, p0, Ly4g;->c:Lw6f;

    check-cast p1, Lydn;

    iget-object p0, p0, Ly4g;->e:Ljava/lang/Object;

    check-cast p0, Lgzg;

    invoke-virtual {p1, p0}, Lydn;->b(Ltdn;)V

    return-void

    :pswitch_11
    iget-object p1, p0, Ly4g;->c:Lw6f;

    check-cast p1, Lzwk;

    iget-object v0, p0, Ly4g;->e:Ljava/lang/Object;

    check-cast v0, Lx4g;

    invoke-virtual {p1, v0}, Lzwk;->a(Lywk;)V

    iget-object p1, p0, Ly4g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Ly4g;->f:Ljava/lang/Object;

    check-cast v0, Lj25;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0}, Ly4g;->S()V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 5

    iget-byte v0, p0, Ly4g;->a:B

    iget-object v1, p0, Ly4g;->e:Ljava/lang/Object;

    iget-object v2, p0, Ly4g;->c:Lw6f;

    packed-switch v0, :pswitch_data_32

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Lydn;

    check-cast v1, Lgzg;

    invoke-virtual {v2, v1}, Lydn;->A(Ltdn;)V

    return-void

    :pswitch_18
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Lzwk;

    check-cast v1, Lx4g;

    invoke-virtual {v2, v1}, Lzwk;->j(Lywk;)V

    iget-object p1, p0, Ly4g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ly4g;->f:Ljava/lang/Object;

    check-cast p0, Lj25;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
