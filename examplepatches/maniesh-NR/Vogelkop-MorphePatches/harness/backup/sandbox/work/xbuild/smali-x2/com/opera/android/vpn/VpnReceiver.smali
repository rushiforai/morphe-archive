.class public Lcom/opera/android/vpn/VpnReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static final synthetic a:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.opera.android.VPN_RESUME"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v1, Lcom/opera/android/vpn/VpnReceiver;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "com.opera.android.EXTRA_VPN_EVENT_ORIGIN"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static b(Landroid/content/Context;Z)Landroid/content/Intent;
    .registers 3

    new-instance v0, Landroid/content/Intent;

    if-eqz p1, :cond_7

    const-string p1, "com.opera.android.VPN_PRO_ENABLE"

    goto :goto_9

    :cond_7
    const-string p1, "com.opera.android.VPN_PRO_DISABLE"

    :goto_9
    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class p1, Lcom/opera/android/vpn/VpnReceiver;

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "com.opera.android.EXTRA_VPN_EVENT_ORIGIN"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static c(Lx5f;Lot0;Ljava/lang/String;)V
    .registers 10

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    sparse-switch v0, :sswitch_data_a4

    goto :goto_49

    :sswitch_f
    const-string v0, "com.opera.android.VPN_PRO_ENABLE"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_49

    const/4 p2, 0x5

    goto :goto_4c

    :sswitch_19
    const-string v0, "com.opera.android.VPN_PAUSE_5_MIN"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_49

    const/4 p2, 0x4

    goto :goto_4c

    :sswitch_23
    const-string v0, "com.opera.android.VPN_RETRY"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_49

    const/4 p2, 0x3

    goto :goto_4c

    :sswitch_2d
    const-string v0, "com.opera.android.VPN_RESUME"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_49

    move p2, v1

    goto :goto_4c

    :sswitch_37
    const-string v0, "com.opera.android.VPN_DISCONNECT"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_49

    move p2, v2

    goto :goto_4c

    :sswitch_41
    const-string v0, "com.opera.android.VPN_PRO_DISABLE"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4b

    :cond_49
    :goto_49
    move p2, v4

    goto :goto_4c

    :cond_4b
    move p2, v3

    :goto_4c
    packed-switch p2, :pswitch_data_be

    goto :goto_65

    :pswitch_50
    sget-object p2, Lnt0;->b:Lnt0;

    goto :goto_61

    :pswitch_53
    sget-object p2, Lnt0;->e:Lnt0;

    goto :goto_61

    :pswitch_56
    sget-object p2, Lnt0;->g:Lnt0;

    goto :goto_61

    :pswitch_59
    sget-object p2, Lnt0;->d:Lnt0;

    goto :goto_61

    :pswitch_5c
    sget-object p2, Lnt0;->f:Lnt0;

    goto :goto_61

    :pswitch_5f
    sget-object p2, Lnt0;->c:Lnt0;

    :goto_61
    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_66

    :goto_65
    return-void

    :cond_66
    iget-object v0, p0, Lx5f;->d:Lzpa;

    new-instance v5, Lmt0;

    const/16 v6, 0x98b

    invoke-direct {v5, v6, v4, v1}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v2, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p2

    const/16 v0, 0x2e

    invoke-virtual {p2, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_93

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_93

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, v0, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_9c

    :cond_93
    invoke-static {p2, v0, v2}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, v0, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_9c
    invoke-virtual {v2, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void

    nop

    :sswitch_data_a4
    .sparse-switch
        -0x6cc7a61c -> :sswitch_41
        -0x60e2f7f2 -> :sswitch_37
        -0x5049f761 -> :sswitch_2d
        -0x3c65782a -> :sswitch_23
        0x4e3c3a4d -> :sswitch_19
        0x61899ae7 -> :sswitch_f
    .end sparse-switch

    :pswitch_data_be
    .packed-switch 0x0
        :pswitch_5f
        :pswitch_5c
        :pswitch_59
        :pswitch_56
        :pswitch_53
        :pswitch_50
    .end packed-switch
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 10

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_c8

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    sget-object v0, Lcom/opera/android/vpn/VpnFailedToConnectService;->c:Lbp;

    invoke-virtual {v0, p1}, Lbp;->c0(Landroid/content/Context;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.opera.android.VPN_PRO_ENABLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_8c

    const-string v0, "com.opera.android.VPN_PRO_DISABLE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8c

    const-string v0, "com.opera.android.VPN_PAUSE_5_MIN"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5d

    iget-object v0, p0, Lydn;->f:Lqq8;

    invoke-virtual {v0}, Lqq8;->g()Z

    move-result v0

    if-nez v0, :cond_9f

    iget-object p0, p0, Lydn;->f:Lqq8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    const-wide/32 v5, 0x493e0

    add-long/2addr v3, v5

    invoke-virtual {p0, v3, v4}, Lqq8;->n(J)V

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lydn;

    invoke-virtual {p0, v1}, Lydn;->D(Z)V

    goto :goto_9f

    :cond_5d
    const-string v0, "com.opera.android.VPN_DISCONNECT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6d

    invoke-virtual {p0, v1}, Lydn;->C(Z)V

    goto :goto_9f

    :cond_6d
    const-string v0, "com.opera.android.VPN_RETRY"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    invoke-virtual {p0}, Lydn;->B()V

    goto :goto_9f

    :cond_7d
    iget-object p0, p0, Lydn;->f:Lqq8;

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lqq8;->n(J)V

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lydn;

    invoke-virtual {p0, v2}, Lydn;->D(Z)V

    goto :goto_9f

    :cond_8c
    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_c8

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lydn;->C(Z)V

    :cond_9f
    :goto_9f
    :try_start_9f
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    const-string p1, "com.opera.android.EXTRA_VPN_EVENT_ORIGIN"

    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-eqz p1, :cond_bf

    if-ne p1, v2, :cond_b9

    sget-object p1, Lot0;->c:Lot0;

    goto :goto_c1

    :cond_b9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    :cond_bf
    sget-object p1, Lot0;->b:Lot0;

    :goto_c1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/opera/android/vpn/VpnReceiver;->c(Lx5f;Lot0;Ljava/lang/String;)V
    :try_end_c8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_9f .. :try_end_c8} :catch_c8

    :catch_c8
    :cond_c8
    return-void
.end method
