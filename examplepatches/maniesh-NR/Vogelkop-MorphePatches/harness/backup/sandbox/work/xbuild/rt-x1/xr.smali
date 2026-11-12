.class public final Lxr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh8f;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lxr;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Landroid/content/Context;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    instance-of v0, p0, Lcom/opera/android/OperaApplication;

    if-eqz v0, :cond_b

    check-cast p0, Lcom/opera/android/OperaApplication;

    goto :goto_c

    :cond_b
    const/4 p0, 0x0

    :goto_c
    if-eqz p0, :cond_24

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object p0

    iget-object p0, p0, Lyi2;->d:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 13

    iget-byte p1, p0, Lxr;->a:B

    const-string p3, "Adding widget is not supported"

    packed-switch p1, :pswitch_data_136

    sget-object p0, Lg8f;->a:Lg8f;

    if-ne p6, p0, :cond_4a

    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "android.intent.action.MAIN"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "android.intent.category.LAUNCHER"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "campaign"

    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string p3, "source"

    invoke-interface {p4, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    const-string p5, "target"

    invoke-interface {p4, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    const-string p5, "CAMPAIGN_ID"

    invoke-virtual {p0, p5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p5, "SOURCE_ID"

    invoke-virtual {p1, p5, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p3, "TARGET_ID"

    invoke-virtual {p1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "ACTION_PREMIUM_ONBOARDING"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_4a
    return-void

    :pswitch_4b
    check-cast p4, Ll1b;

    invoke-static {p4}, Luup;->A(Ll1b;)Ljava/io/Serializable;

    move-result-object p0

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p0, Ljava/lang/String;

    invoke-static {p4}, Luup;->B(Ll1b;)Ljava/io/Serializable;

    move-result-object p1

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    sget-object p3, Lg8f;->a:Lg8f;

    if-ne p6, p3, :cond_6f

    new-instance p3, Lcug;

    invoke-direct {p3, p0, p1, p4}, Lcug;-><init>(Ljava/lang/String;ILl1b;)V

    invoke-static {p2, p3}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    :cond_6f
    return-void

    :pswitch_70
    sget p0, Leif;->a:I

    invoke-static {p2}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_b0

    invoke-static {p2}, Lxr;->d(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_a8

    sget p0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->b:I

    const-class p0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-static {p2, p0}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_96

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-lez p1, :cond_96

    new-instance p0, Leva;

    const-string p1, "User already has widget installed"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_96
    sget-object p1, Lg8f;->a:Lg8f;

    if-ne p6, p1, :cond_a7

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0d02bf

    const p3, 0x7f0d0388

    invoke-static {p1, p0, p2, p3}, Lkfo;->c0(Landroid/content/Context;Ljava/lang/Class;II)V

    :cond_a7
    return-void

    :cond_a8
    new-instance p0, Leva;

    const-string p1, "Widget is not available"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_b0
    new-instance p0, Leva;

    invoke-direct {p0, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_b6
    sget p0, Leif;->a:I

    invoke-static {p2}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_e1

    invoke-static {p2}, Lcom/opera/android/BrowserAppWidget;->e(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_d9

    sget-object p0, Lg8f;->a:Lg8f;

    if-ne p6, p0, :cond_d8

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p2}, Lcom/opera/android/BrowserAppWidget;->d(Landroid/content/Context;)I

    move-result p1

    const p2, 0x7f0d039e

    const-class p3, Lcom/opera/android/BrowserAppWidget;

    invoke-static {p0, p3, p1, p2}, Lkfo;->c0(Landroid/content/Context;Ljava/lang/Class;II)V

    :cond_d8
    return-void

    :cond_d9
    new-instance p0, Leva;

    const-string p1, "User already have widget installed"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_e1
    new-instance p0, Leva;

    invoke-direct {p0, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_e7
    new-instance v0, Ls3;

    move-object v3, p4

    check-cast v3, Ll1b;

    const/4 v5, 0x1

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Ls3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    sget-object p0, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {p0, v0}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_12e

    sget p0, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;->b:I

    sget p0, Leif;->a:I

    const-class p0, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;

    invoke-static {v2, p0}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_11b

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-lez p1, :cond_11b

    new-instance p0, Leva;

    const-string p1, "User has already added the AI widget."

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_11b
    sget-object p1, Lg8f;->a:Lg8f;

    if-ne p6, p1, :cond_12d

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v2}, Lk1g;->t(Landroid/content/Context;)I

    move-result p2

    const p3, 0x7f0d0460

    invoke-static {p1, p0, p2, p3}, Lkfo;->c0(Landroid/content/Context;Ljava/lang/Class;II)V

    :cond_12d
    return-void

    :cond_12e
    new-instance p0, Leva;

    const-string p1, "AddAiWidgetOfaLinkCallback not supported."

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_data_136
    .packed-switch 0x0
        :pswitch_e7
        :pswitch_b6
        :pswitch_70
        :pswitch_4b
    .end packed-switch
.end method

.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lxr;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_e8

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p1

    invoke-virtual {p1}, Ljtg;->d()Z

    move-result p1

    if-nez p1, :cond_1d

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_34

    :cond_1d
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object p0

    iget-object p0, p0, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "premium_giveaway_available"

    invoke-interface {p0, p1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    xor-int/2addr p0, v2

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    :goto_34
    return-object p0

    :pswitch_35
    instance-of v0, p3, Ldug;

    if-eqz v0, :cond_48

    move-object v0, p3

    check-cast v0, Ldug;

    iget v4, v0, Ldug;->v:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_48

    sub-int/2addr v4, v5

    iput v4, v0, Ldug;->v:I

    goto :goto_4f

    :cond_48
    new-instance v0, Ldug;

    check-cast p3, Lnt5;

    invoke-direct {v0, p0, p3}, Ldug;-><init>(Lxr;Lnt5;)V

    :goto_4f
    iget-object p0, v0, Ldug;->t:Ljava/lang/Object;

    sget-object p3, Lpx5;->a:Lpx5;

    iget v4, v0, Ldug;->v:I

    if-eqz v4, :cond_63

    if-ne v4, v2, :cond_5d

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_ac

    :cond_5d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_b8

    :cond_63
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {p2}, Luup;->A(Ll1b;)Ljava/io/Serializable;

    move-result-object p0

    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_73

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_b8

    :cond_73
    invoke-static {p2}, Luup;->B(Ll1b;)Ljava/io/Serializable;

    move-result-object p0

    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_80

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_b8

    :cond_80
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p1

    invoke-virtual {p1}, Ljtg;->c()Z

    move-result p1

    if-nez p1, :cond_95

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_b8

    :cond_95
    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Ls6d;->a:Ld7a;

    iget-object p1, p1, Ld7a;->e:Ld7a;

    new-instance p2, Lagb;

    const/16 v4, 0xe

    invoke-direct {p2, v4, v1, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v2, v0, Ldug;->v:I

    invoke-static {p1, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p3, :cond_ac

    move-object v1, p3

    goto :goto_b8

    :cond_ac
    :goto_ac
    check-cast p0, Lqtg;

    iget p0, p0, Lqtg;->a:I

    const/4 p1, 0x2

    if-ne p0, p1, :cond_b4

    move v2, v3

    :cond_b4
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    :goto_b8
    return-object v1

    :pswitch_b9
    sget p0, Leif;->a:I

    invoke-static {p1}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_c7

    invoke-static {p1}, Lxr;->d(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_c8

    :cond_c7
    move v2, v3

    :cond_c8
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_cd
    sget p0, Leif;->a:I

    invoke-static {p1}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_d8
    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance p2, Lwr;

    invoke-direct {p2, p1, v1, v3}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p0, p2, p3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_e8
    .packed-switch 0x0
        :pswitch_d8
        :pswitch_cd
        :pswitch_b9
        :pswitch_35
    .end packed-switch
.end method

.method public final c(Landroid/content/Context;Lkk6;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lxr;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_92

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object p0

    iget-object p1, p0, Lm9c;->b:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string p2, "premium"

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3a

    iget-object p0, p0, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "premium_subscription_source"

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "ofa_free_trial"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3b

    :cond_3a
    move v2, v3

    :cond_3b
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_40
    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance v0, Lty7;

    invoke-direct {v0, p1, v1, v2}, Lty7;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p0, v0, p2}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_50
    sget p0, Leif;->a:I

    invoke-static {p1}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_68

    sget p0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->b:I

    const-class p0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-static {p1, p0}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_68

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-gtz p0, :cond_69

    :cond_68
    move v2, v3

    :cond_69
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_6e
    sget p0, Leif;->a:I

    invoke-static {p1}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_7c

    invoke-static {p1}, Lcom/opera/android/BrowserAppWidget;->e(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_7d

    :cond_7c
    move v2, v3

    :cond_7d
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_82
    sget-object v0, Lvml;->e:Lwjh;

    iget-object v0, v0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Ljg8;

    new-instance v2, Lvr;

    invoke-direct {v2, p0, p1, v1, v3}, Lvr;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v2, p2}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_82
        :pswitch_6e
        :pswitch_50
        :pswitch_40
    .end packed-switch
.end method
