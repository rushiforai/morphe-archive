.class public final synthetic Ldw3;
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

    iput-byte p2, p0, Ldw3;->a:B

    iput-object p1, p0, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ldw3;->a:B

    iget-object p0, p0, Ldw3;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_13e

    invoke-static {p0}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object p0

    :pswitch_e
    sget-object v0, Lpcl;->c:Lpcl;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const-string v2, "eula_accepted.gdpr"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_36

    invoke-static {p0}, Ljpo;->D(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_28

    new-instance v0, Lpcl;

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    goto :goto_36

    :cond_28
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v1, "personalized_ads"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_36

    sget-object v0, Lpcl;->b:Lpcl;

    :cond_36
    :goto_36
    return-object v0

    :pswitch_37
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object p0

    iget-object v0, p0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3e
    iget-object v1, p0, Ljk5;->e:Ljava/lang/String;
    :try_end_40
    .catchall {:try_start_3e .. :try_end_40} :catchall_48

    monitor-exit v0

    if-nez v1, :cond_47

    invoke-virtual {p0}, Ljk5;->a()Ljava/lang/String;

    move-result-object v1

    :cond_47
    return-object v1

    :catchall_48
    move-exception p0

    monitor-exit v0

    throw p0

    :pswitch_4b
    sget-object v0, Lhs3;->a:Ln9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_55
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->W:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsnc;

    iget-object p0, p0, Lsnc;->n:Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf3j;

    return-object p0

    :pswitch_68
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->W:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsnc;

    iget-object p0, p0, Lsnc;->k:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxoc;

    return-object p0

    :pswitch_7b
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->W:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsnc;

    iget-object p0, p0, Lsnc;->j:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcs6;

    return-object p0

    :pswitch_8e
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_95
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->v()Lfs6;

    move-result-object p0

    return-object p0

    :pswitch_9a
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p0

    return-object p0

    :pswitch_9f
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    iget-object p0, p0, Lfqe;->f:Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :pswitch_ac
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_b1
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_b8
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bookmarks/h;

    return-object p0

    :pswitch_bf
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    return-object p0

    :pswitch_c4
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->U0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzzj;

    return-object p0

    :pswitch_cf
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_d6
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_db
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->G:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrq8;

    return-object p0

    :pswitch_e6
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_ed
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    return-object p0

    :pswitch_f2
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object p0

    return-object p0

    :pswitch_f7
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->x:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh0a;

    iget-object p0, p0, Lh0a;->d:Lode;

    return-object p0

    :pswitch_102
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object p0, p0, Llpe;->s:Lplh;

    invoke-static {p0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object p0

    return-object p0

    :pswitch_111
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_118
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_11f
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_126
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_12d
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_132
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object p0, p0, Llpe;->c:Lcq5;

    return-object p0

    nop

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_132
        :pswitch_12d
        :pswitch_126
        :pswitch_11f
        :pswitch_118
        :pswitch_111
        :pswitch_102
        :pswitch_f7
        :pswitch_f2
        :pswitch_ed
        :pswitch_e6
        :pswitch_db
        :pswitch_d6
        :pswitch_cf
        :pswitch_c4
        :pswitch_bf
        :pswitch_b8
        :pswitch_b1
        :pswitch_ac
        :pswitch_9f
        :pswitch_9a
        :pswitch_95
        :pswitch_8e
        :pswitch_7b
        :pswitch_68
        :pswitch_55
        :pswitch_4b
        :pswitch_37
        :pswitch_e
    .end packed-switch
.end method
