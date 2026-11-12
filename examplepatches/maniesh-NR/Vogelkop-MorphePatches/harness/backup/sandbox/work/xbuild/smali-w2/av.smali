.class public final Lav;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh8f;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lav;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 7

    iget-byte p0, p0, Lav;->a:B

    const-string p1, "android.intent.category.LAUNCHER"

    const-string p5, "android.intent.action.MAIN"

    packed-switch p0, :pswitch_data_e4

    sget-object p0, Lg8f;->a:Lg8f;

    if-ne p6, p0, :cond_1f

    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, p5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "ACTION_SHOW_OMNIBAR"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_1f
    return-void

    :pswitch_20
    const-string p0, "cat"

    invoke-interface {p4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string p1, "enable_news"

    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    sget-object p2, Lg8f;->a:Lg8f;

    if-ne p6, p2, :cond_40

    new-instance p2, Laqe;

    invoke-direct {p2, p0, p1}, Laqe;-><init>(Ljava/lang/String;Z)V

    invoke-static {p2}, Lac8;->a(Ljava/lang/Object;)V

    :cond_40
    return-void

    :pswitch_41
    sget-object p0, Lg8f;->a:Lg8f;

    if-ne p6, p0, :cond_64

    const-string p0, "source"

    invoke-interface {p4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string p1, "campaign"

    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/16 p2, 0x9

    invoke-static {p2, p0, p1}, Lbtb;->c(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Let2;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Let2;-><init>(Ljava/lang/String;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_64
    return-void

    :pswitch_65
    if-nez p3, :cond_8f

    const-string p0, "activate"

    invoke-interface {p4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string p3, "true"

    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    sget-object p3, Lg8f;->a:Lg8f;

    if-ne p6, p3, :cond_8e

    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p3

    invoke-virtual {p3, p5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p3, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.opera.android.FREE_DATA"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.opera.android.EXTRA_ENABLE_COMPRESSION"

    invoke-virtual {p3, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p2, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_8e
    return-void

    :cond_8f
    new-instance p0, Lfva;

    const-string p1, "Invalid deep link source: "

    invoke-static {p3, p1}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_9b
    const-string p0, "ofa_cb"

    invoke-interface {p4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_ae

    invoke-static {p0}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_af

    :cond_ae
    const/4 p0, 0x0

    :goto_af
    if-eqz p0, :cond_c4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_c4

    sget-object p1, Lg8f;->a:Lg8f;

    if-ne p6, p1, :cond_c3

    new-instance p1, Lsk5;

    invoke-direct {p1, p0}, Lsk5;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lac8;->b(Ljava/lang/Object;)V

    :cond_c3
    return-void

    :cond_c4
    new-instance p0, Leva;

    const-string p1, "ofa_cb argument missing"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_cc
    sget-object p0, Lg8f;->a:Lg8f;

    if-ne p6, p0, :cond_e2

    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, p5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "ACTION_ADD_SPEED_DIAL"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_e2
    return-void

    nop

    :pswitch_data_e4
    .packed-switch 0x0
        :pswitch_cc
        :pswitch_9b
        :pswitch_65
        :pswitch_41
        :pswitch_20
    .end packed-switch
.end method
