.class public final synthetic Lnw3;
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

    iput-byte p2, p0, Lnw3;->a:B

    iput-object p1, p0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lnw3;->a:B

    iget-object p0, p0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_ce

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_e
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    return-object p0

    :pswitch_13
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object p0

    iget-object p0, p0, Lslk;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwvg;

    invoke-virtual {p0}, Lwvg;->b()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_28
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_2f
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->I:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxt8;

    return-object p0

    :pswitch_3a
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p0

    return-object p0

    :pswitch_3f
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_44
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    return-object p0

    :pswitch_49
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->O:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzv9;

    return-object p0

    :pswitch_54
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p0

    return-object p0

    :pswitch_59
    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_5e
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_65
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_6a
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_71
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_76
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    return-object p0

    :pswitch_7b
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_80
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object p0

    return-object p0

    :pswitch_85
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->T()Lyen;

    move-result-object p0

    return-object p0

    :pswitch_8a
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object p0

    return-object p0

    :pswitch_8f
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object p0

    return-object p0

    :pswitch_94
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->I:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxt8;

    return-object p0

    :pswitch_9f
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object p0

    return-object p0

    :pswitch_a4
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_a9
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_ae
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_b5
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_bc
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_c3
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object p0

    return-object p0

    :pswitch_c8
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_ce
    .packed-switch 0x0
        :pswitch_c8
        :pswitch_c3
        :pswitch_bc
        :pswitch_b5
        :pswitch_ae
        :pswitch_a9
        :pswitch_a4
        :pswitch_9f
        :pswitch_94
        :pswitch_8f
        :pswitch_8a
        :pswitch_85
        :pswitch_80
        :pswitch_7b
        :pswitch_76
        :pswitch_71
        :pswitch_6a
        :pswitch_65
        :pswitch_5e
        :pswitch_59
        :pswitch_54
        :pswitch_49
        :pswitch_44
        :pswitch_3f
        :pswitch_3a
        :pswitch_2f
        :pswitch_28
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method
