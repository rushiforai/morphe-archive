.class public final synthetic Llw3;
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

    iput-byte p2, p0, Llw3;->a:B

    iput-object p1, p0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Llw3;->a:B

    iget-object p0, p0, Llw3;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_102

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object p0

    return-object p0

    :pswitch_c
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object p0

    return-object p0

    :pswitch_11
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object p0, p0, Llpe;->c:Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf8f;

    return-object p0

    :pswitch_22
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->R:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/history/HistoryManager;

    return-object p0

    :pswitch_2d
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->a()Likc;

    move-result-object p0

    return-object p0

    :pswitch_3a
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_3f
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->o:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsi3;

    iget-object p0, p0, Lsi3;->t:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lri3;

    return-object p0

    :pswitch_52
    invoke-static {p0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object p0

    return-object p0

    :pswitch_57
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object p0

    invoke-virtual {p0}, Lr65;->m()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_64
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object p0

    return-object p0

    :pswitch_69
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->b1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsom;

    return-object p0

    :pswitch_74
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->K0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpqi;

    return-object p0

    :pswitch_7f
    invoke-static {p0}, Lcqp;->e0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_84
    new-instance v0, Lbxk;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lbxk;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_90
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    return-object p0

    :pswitch_95
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p0

    return-object p0

    :pswitch_9a
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->B:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwc7;

    return-object p0

    :pswitch_a5
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->O()Lv3m;

    move-result-object p0

    return-object p0

    :pswitch_aa
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->k()Lsl6;

    move-result-object p0

    return-object p0

    :pswitch_af
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->x:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh0a;

    iget-object p0, p0, Lh0a;->d:Lode;

    return-object p0

    :pswitch_ba
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->h:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvk6;

    return-object p0

    :pswitch_c5
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    return-object p0

    :pswitch_ca
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p0

    return-object p0

    :pswitch_cf
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_d4
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_db
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p0

    return-object p0

    :pswitch_e0
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object p0

    return-object p0

    :pswitch_e5
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_ec
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_f1
    sget-object v0, Lebb;->c:Lebb;

    invoke-static {p0}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object p0

    invoke-virtual {p0}, Lu59;->H()Lt59;

    move-result-object p0

    iget-wide v0, p0, Lt59;->b:J

    invoke-static {v0, v1}, Lj06;->m(J)Lebb;

    move-result-object p0

    return-object p0

    :pswitch_data_102
    .packed-switch 0x0
        :pswitch_f1
        :pswitch_ec
        :pswitch_e5
        :pswitch_e0
        :pswitch_db
        :pswitch_d4
        :pswitch_cf
        :pswitch_ca
        :pswitch_c5
        :pswitch_ba
        :pswitch_af
        :pswitch_aa
        :pswitch_a5
        :pswitch_9a
        :pswitch_95
        :pswitch_90
        :pswitch_84
        :pswitch_7f
        :pswitch_74
        :pswitch_69
        :pswitch_64
        :pswitch_57
        :pswitch_52
        :pswitch_3f
        :pswitch_3a
        :pswitch_2d
        :pswitch_22
        :pswitch_11
        :pswitch_c
    .end packed-switch
.end method
