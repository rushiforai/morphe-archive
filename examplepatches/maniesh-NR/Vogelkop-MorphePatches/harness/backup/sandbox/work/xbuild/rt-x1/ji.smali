.class public final synthetic Lji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 3

    iput-byte p2, p0, Lji;->a:B

    iput-object p1, p0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lji;->a:B

    iget-object p0, p0, Lji;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_110

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->q0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ln6g;

    return-object p0

    :pswitch_12
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object p0

    return-object p0

    :pswitch_17
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_1c
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->R0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvnj;

    return-object p0

    :pswitch_27
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    return-object p0

    :pswitch_30
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_37
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_3e
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_43
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->p0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzgf;

    return-object p0

    :pswitch_4e
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_53
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_58
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_5d
    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_62
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_67
    invoke-static {p0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object p0

    return-object p0

    :pswitch_6c
    invoke-static {p0}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object p0

    return-object p0

    :pswitch_71
    invoke-static {p0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p0

    return-object p0

    :pswitch_76
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->r()Lg89;

    move-result-object p0

    iget-object p0, p0, Lg89;->j:Lode;

    return-object p0

    :pswitch_7f
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->v:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldp6;

    invoke-virtual {p0}, Ldp6;->b()Lole;

    move-result-object p0

    invoke-virtual {p0}, Lole;->t()Lf99;

    move-result-object p0

    invoke-static {p0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object p0

    return-object p0

    :pswitch_96
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->a()Likc;

    move-result-object p0

    return-object p0

    :pswitch_a5
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    sget-object v0, Ld59;->d:Ld59;

    invoke-virtual {p0, v0}, Le59;->b(Ld59;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_b2
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_b9
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_c0
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_c7
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->A()Loue;

    move-result-object p0

    return-object p0

    :pswitch_ce
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->A()Loue;

    move-result-object p0

    return-object p0

    :pswitch_d5
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->A()Loue;

    move-result-object p0

    return-object p0

    :pswitch_dc
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->b()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_ed
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object p0

    invoke-virtual {p0}, Lbf9;->t()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_fa
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_data_110
    .packed-switch 0x0
        :pswitch_fa
        :pswitch_ed
        :pswitch_dc
        :pswitch_d5
        :pswitch_ce
        :pswitch_c7
        :pswitch_c0
        :pswitch_b9
        :pswitch_b2
        :pswitch_a5
        :pswitch_96
        :pswitch_7f
        :pswitch_76
        :pswitch_71
        :pswitch_6c
        :pswitch_67
        :pswitch_62
        :pswitch_5d
        :pswitch_58
        :pswitch_53
        :pswitch_4e
        :pswitch_43
        :pswitch_3e
        :pswitch_37
        :pswitch_30
        :pswitch_27
        :pswitch_1c
        :pswitch_17
        :pswitch_12
    .end packed-switch
.end method
