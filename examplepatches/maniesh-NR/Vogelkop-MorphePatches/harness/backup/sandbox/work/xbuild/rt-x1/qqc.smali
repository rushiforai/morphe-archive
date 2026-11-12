.class public Lqqc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh8f;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lqqc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 13

    move-object v3, p4

    check-cast v3, Ll1b;

    invoke-virtual {p0, v3}, Lqqc;->e(Ll1b;)Ltc2;

    move-result-object p1

    if-eqz p1, :cond_15b

    new-instance v0, Lmz9;

    const/16 v5, 0xa

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    sget-object p0, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {p0, v0}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_15c

    sget-object p0, Lg8f;->a:Lg8f;

    if-eq p6, p0, :cond_26

    return-void

    :cond_26
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    sget-object p2, Lhqc;->b:Lhqc;

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string p3, "livescore_destination"

    if-eqz p2, :cond_3c

    const-string p2, "base"

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_ab

    :cond_3c
    instance-of p2, p1, Lkqc;

    const-string p5, "livescore_id"

    if-eqz p2, :cond_57

    const-string p2, "football_match"

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, p1

    check-cast p2, Lkqc;

    iget-wide v4, p2, Lkqc;->b:J

    invoke-virtual {p0, p5, v4, v5}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    const-string p3, "livescore_play_audio"

    iget-boolean p2, p2, Lkqc;->c:Z

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_ab

    :cond_57
    instance-of p2, p1, Liqc;

    if-eqz p2, :cond_69

    const-string p2, "basketball_match"

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, p1

    check-cast p2, Liqc;

    iget-wide p2, p2, Liqc;->b:J

    invoke-virtual {p0, p5, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    goto :goto_ab

    :cond_69
    instance-of p2, p1, Lmqc;

    if-eqz p2, :cond_81

    const-string p2, "onboarding_follow_teams"

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, p1

    check-cast p2, Lmqc;

    iget-object p2, p2, Lmqc;->b:Ljava/lang/Long;

    if-eqz p2, :cond_ab

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    invoke-virtual {p0, p5, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    goto :goto_ab

    :cond_81
    instance-of p2, p1, Ljqc;

    if-eqz p2, :cond_9a

    const-string p2, "competition"

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, p1

    check-cast p2, Ljqc;

    iget-wide v4, p2, Ljqc;->b:J

    invoke-virtual {p0, p5, v4, v5}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    const-string p3, "livescore_phase_name"

    iget-object p2, p2, Ljqc;->c:Ljava/lang/String;

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ab

    :cond_9a
    instance-of p2, p1, Llqc;

    if-eqz p2, :cond_157

    const-string p2, "football_team"

    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, p1

    check-cast p2, Llqc;

    iget-wide p2, p2, Llqc;->b:J

    invoke-virtual {p0, p5, p2, p3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    :cond_ab
    :goto_ab
    const-string p2, "enable_carousel"

    invoke-interface {p4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    if-eqz p3, :cond_b8

    invoke-virtual {p0, p2, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_b8
    invoke-static {v2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p2

    const-string p3, "android.intent.action.MAIN"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "android.intent.category.LAUNCHER"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const-string p0, "DESTINATION_VIEW_ID"

    const/16 p3, 0x20

    invoke-virtual {p2, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "ACTION_DESTINATION_VIEW"

    invoke-virtual {p2, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    iget-byte p0, v1, Lqqc;->a:B

    const-string p2, "follow"

    const/4 p3, 0x3

    const/4 p4, 0x0

    packed-switch p0, :pswitch_data_170

    goto :goto_156

    :pswitch_e2
    check-cast p1, Lkqc;

    invoke-virtual {v1, v3}, Lqqc;->f(Ll1b;)Z

    move-result p0

    if-eqz p0, :cond_156

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p2, p0, Lcom/opera/android/OperaApplication;->t:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnx5;

    new-instance p5, Lfb9;

    const/16 p6, 0xf

    invoke-direct {p5, p0, p1, p4, p6}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p2, p4, p4, p5, p3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_156

    :pswitch_105
    check-cast p1, Llqc;

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_156

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p2, p0, Lcom/opera/android/OperaApplication;->t:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnx5;

    new-instance p5, Lfb9;

    const/16 p6, 0xe

    invoke-direct {p5, p0, p1, p4, p6}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p2, p4, p4, p5, p3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_156

    :pswitch_12e
    check-cast p1, Ljqc;

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_156

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p2, p0, Lcom/opera/android/OperaApplication;->t:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnx5;

    new-instance p5, Lfb9;

    const/16 p6, 0xd

    invoke-direct {p5, p0, p1, p4, p6}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p2, p4, p4, p5, p3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_156
    :goto_156
    return-void

    :cond_157
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_15b
    move-object v1, p0

    :cond_15c
    new-instance p0, Leva;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    const-string p2, " not supported."

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_data_170
    .packed-switch 0x1
        :pswitch_12e
        :pswitch_105
        :pswitch_e2
    .end packed-switch
.end method

.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 5

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p1

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    const/16 p3, 0x400

    invoke-virtual {p1, p3}, Lwnh;->b(I)Z

    move-result p3

    const/high16 v0, 0x8000000

    invoke-virtual {p1, v0}, Lwnh;->b(I)Z

    move-result p1

    if-nez p3, :cond_1b

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_1b
    invoke-virtual {p0, p2}, Lqqc;->e(Ll1b;)Ltc2;

    move-result-object p0

    if-nez p0, :cond_24

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_24
    iget-boolean p0, p0, Ltc2;->a:Z

    if-eqz p0, :cond_2d

    if-nez p1, :cond_2d

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_2d
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final d(Landroid/content/Context;Ltc2;Ll1b;)V
    .registers 4

    return-void
.end method

.method public final e(Ll1b;)Ltc2;
    .registers 5

    iget-byte p0, p0, Lqqc;->a:B

    const-string v0, "id"

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_70

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_15

    invoke-static {p0}, Lkotlin/text/StringsKt;->k0(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    goto :goto_16

    :cond_15
    move-object p0, v1

    :goto_16
    if-eqz p0, :cond_2e

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    new-instance p0, Lkqc;

    const-string v2, "play_audio"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    invoke-direct {p0, v0, v1, p1}, Lkqc;-><init>(JZ)V

    move-object v1, p0

    :cond_2e
    return-object v1

    :pswitch_2f
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_3c

    invoke-static {p0}, Lkotlin/text/StringsKt;->k0(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    goto :goto_3d

    :cond_3c
    move-object p0, v1

    :goto_3d
    if-eqz p0, :cond_48

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    new-instance v1, Llqc;

    invoke-direct {v1, p0, p1}, Llqc;-><init>(J)V

    :cond_48
    return-object v1

    :pswitch_49
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_56

    invoke-static {p0}, Lkotlin/text/StringsKt;->k0(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    goto :goto_57

    :cond_56
    move-object p0, v1

    :goto_57
    if-eqz p0, :cond_6b

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    new-instance p0, Ljqc;

    const-string v2, "phaseName"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, v0, v1, p1}, Ljqc;-><init>(JLjava/lang/String;)V

    move-object v1, p0

    :cond_6b
    return-object v1

    :pswitch_6c
    sget-object p0, Lhqc;->b:Lhqc;

    return-object p0

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_6c
        :pswitch_49
        :pswitch_2f
    .end packed-switch
.end method

.method public f(Ll1b;)Z
    .registers 2

    const-string p0, "follow"

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
