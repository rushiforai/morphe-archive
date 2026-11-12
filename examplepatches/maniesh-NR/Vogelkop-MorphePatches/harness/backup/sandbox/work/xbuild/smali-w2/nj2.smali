.class public final Lnj2;
.super Lcb;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lnj2;->a:B

    iput-object p1, p0, Lnj2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final h()V
    .registers 1

    return-void
.end method

.method private final i()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-byte v0, p0, Lnj2;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lnj2;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_52

    return-void

    :sswitch_9
    check-cast v2, Li9c;

    invoke-virtual {v2}, Li9c;->c()V

    return-void

    :sswitch_f
    check-cast v2, Lxbf;

    invoke-virtual {p0}, Lnj2;->j()Lh0d;

    move-result-object p0

    invoke-virtual {v2, p0}, Lxbf;->G(Lh0d;)V

    iget-object p0, v2, Lxbf;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_20
    if-ge v1, v0, :cond_2e

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Lcom/opera/api/Callback;

    invoke-virtual {v2, v3}, Lxbf;->A(Lcom/opera/api/Callback;)V

    goto :goto_20

    :cond_2e
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    :sswitch_32
    check-cast v2, Lklk;

    invoke-virtual {v2}, Lklk;->s()V

    return-void

    :sswitch_38
    check-cast v2, Lghj;

    iget-object p0, v2, Lghj;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_40
    if-ge v1, v0, :cond_4e

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Lcom/opera/api/Callback;

    invoke-virtual {v2, v3}, Lghj;->a(Lcom/opera/api/Callback;)V

    goto :goto_40

    :cond_4e
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    :sswitch_data_52
    .sparse-switch
        0x2 -> :sswitch_38
        0x4 -> :sswitch_32
        0x5 -> :sswitch_f
        0x9 -> :sswitch_9
    .end sparse-switch
.end method

.method public final b()V
    .registers 5

    iget-byte v0, p0, Lnj2;->a:B

    iget-object p0, p0, Lnj2;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_5c

    return-void

    :sswitch_8
    check-cast p0, Lmyk;

    invoke-virtual {p0}, Lmyk;->a()V

    :sswitch_d
    return-void

    :sswitch_e
    check-cast p0, Lpj2;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lpj2;->G0(Z)V

    invoke-virtual {p0}, Lryl;->g0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    new-instance v1, Lrxh;

    const v2, 0x7f141156

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    new-instance v2, Lgkj;

    invoke-direct {v2, v0, v0}, Lnz0;-><init>(ZZ)V

    const/4 v3, 0x0

    iput-object v3, v2, Lgkj;->a:Ljava/lang/String;

    iput-object v3, v2, Lgkj;->b:Ljava/lang/String;

    iput-object v3, v2, Lgkj;->c:Ljava/lang/String;

    iput-object v3, v2, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v2, Lgkj;->e:Lekj;

    iput-object v3, v2, Lgkj;->f:Lfkj;

    iput-object v3, v2, Lgkj;->g:Lqp2;

    iput-object v3, v2, Lgkj;->h:Ldkj;

    iput-object v3, v2, Lgkj;->i:Ldkj;

    iput-object v3, v2, Lgkj;->j:Lql;

    const v3, 0x7f140bbb

    iput v3, v2, Lgkj;->k:I

    iput v0, v2, Lgkj;->l:I

    const v0, 0x7f141157

    iput v0, v2, Lgkj;->m:I

    const/4 v0, 0x1

    iput-boolean v0, v2, Lgkj;->n:Z

    iput-object v1, v2, Lgkj;->o:Lpxh;

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v2, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    nop

    :sswitch_data_5c
    .sparse-switch
        0x0 -> :sswitch_e
        0x3 -> :sswitch_d
        0x7 -> :sswitch_8
    .end sparse-switch
.end method

.method public final c()V
    .registers 3

    iget-byte v0, p0, Lnj2;->a:B

    iget-object v1, p0, Lnj2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_52

    :pswitch_7
    return-void

    :pswitch_8
    check-cast v1, Li9c;

    invoke-virtual {v1}, Li9c;->c()V

    return-void

    :pswitch_e
    check-cast v1, Lsom;

    iget-object p0, v1, Lsom;->f:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last_signin"

    invoke-static {p0, v0}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    return-void

    :pswitch_22
    check-cast v1, Lgyk;

    invoke-virtual {v1}, Lgyk;->a()V

    return-void

    :pswitch_28
    check-cast v1, Lxbf;

    invoke-virtual {p0}, Lnj2;->j()Lh0d;

    move-result-object p0

    invoke-virtual {v1, p0}, Lxbf;->G(Lh0d;)V

    return-void

    :pswitch_32
    check-cast v1, Lklk;

    invoke-virtual {v1}, Lklk;->s()V

    return-void

    :pswitch_38
    check-cast v1, Lyij;

    const/4 p0, -0x1

    invoke-virtual {v1, p0}, Landroid/app/Activity;->setResult(I)V

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_42
    check-cast v1, Lghj;

    iget-object p0, v1, Lghj;->e:Lfhj;

    if-eqz p0, :cond_50

    iget-boolean p0, p0, Lfhj;->b:Z

    const/4 v0, 0x1

    if-ne p0, v0, :cond_50

    const/4 p0, 0x0

    iput-object p0, v1, Lghj;->e:Lfhj;

    :cond_50
    :pswitch_50
    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_50
        :pswitch_7
        :pswitch_42
        :pswitch_38
        :pswitch_32
        :pswitch_28
        :pswitch_22
        :pswitch_7
        :pswitch_e
        :pswitch_8
    .end packed-switch
.end method

.method public final d(Z)V
    .registers 4

    iget-byte v0, p0, Lnj2;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lnj2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_46

    :pswitch_8
    return-void

    :pswitch_9
    if-eqz p1, :cond_11

    check-cast p0, Li9c;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Li9c;->e(Z)V

    :cond_11
    return-void

    :pswitch_12
    check-cast p0, Lsom;

    iget-object p0, p0, Lsom;->f:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "last_signin"

    invoke-static {p0, p1}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void

    :pswitch_22
    check-cast p0, Lmyk;

    invoke-virtual {p0}, Lmyk;->a()V

    return-void

    :pswitch_28
    check-cast p0, Lxbf;

    sget-object p1, Lh0d;->a:Lh0d;

    invoke-virtual {p0, p1}, Lxbf;->G(Lh0d;)V

    iput-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    return-void

    :pswitch_32
    check-cast p0, Lklk;

    invoke-virtual {p0}, Lklk;->s()V

    return-void

    :pswitch_38
    check-cast p0, Lghj;

    iget-object p1, p0, Lghj;->e:Lfhj;

    if-eqz p1, :cond_44

    iget-boolean p1, p1, Lfhj;->b:Z

    if-nez p1, :cond_44

    iput-object v1, p0, Lghj;->e:Lfhj;

    :cond_44
    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x2
        :pswitch_38
        :pswitch_8
        :pswitch_32
        :pswitch_28
        :pswitch_8
        :pswitch_22
        :pswitch_12
        :pswitch_9
    .end packed-switch
.end method

.method public final f()V
    .registers 3

    iget-byte v0, p0, Lnj2;->a:B

    iget-object v1, p0, Lnj2;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_1a

    return-void

    :sswitch_8
    check-cast v1, Lxbf;

    invoke-virtual {p0}, Lnj2;->j()Lh0d;

    move-result-object p0

    invoke-virtual {v1, p0}, Lxbf;->G(Lh0d;)V

    return-void

    :sswitch_12
    check-cast v1, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;

    sget p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->W:I

    invoke-virtual {v1}, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->N0()V

    return-void

    :sswitch_data_1a
    .sparse-switch
        0x1 -> :sswitch_12
        0x5 -> :sswitch_8
    .end sparse-switch
.end method

.method public final j()Lh0d;
    .registers 2

    iget-object p0, p0, Lnj2;->b:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ldb;

    invoke-virtual {p0}, Ldb;->f()Z

    move-result v0

    if-nez v0, :cond_11

    sget-object p0, Lh0d;->a:Lh0d;

    return-object p0

    :cond_11
    invoke-virtual {p0}, Ldb;->d()Z

    move-result p0

    if-eqz p0, :cond_1a

    sget-object p0, Lh0d;->b:Lh0d;

    return-object p0

    :cond_1a
    sget-object p0, Lh0d;->c:Lh0d;

    return-object p0
.end method
