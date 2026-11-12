.class public Lny0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh8f;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lny0;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 9

    iget-byte p1, p0, Lny0;->a:B

    const-string p3, "android.intent.category.LAUNCHER"

    const-string p5, "android.intent.action.MAIN"

    packed-switch p1, :pswitch_data_fa

    move-object p1, p4

    check-cast p1, Ll1b;

    invoke-virtual {p0, p1}, Lny0;->d(Ll1b;)Ls88;

    move-result-object p0

    sget-object p1, Lg8f;->a:Lg8f;

    if-ne p6, p1, :cond_66

    const-string p1, "source"

    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string p6, "campaign"

    invoke-interface {p4, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    sget-object p6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-instance v0, Lkotlin/Pair;

    const-string v1, "ESIM_ATTRIBUTION_RESOLVED"

    invoke-direct {v0, v1, p6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p6, Lkotlin/Pair;

    const-string v1, "ESIM_SOURCE"

    invoke-direct {p6, v1, p1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Lkotlin/Pair;

    const-string v1, "ESIM_CAMPAIGN"

    invoke-direct {p1, v1, p4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v0, p6, p1}, [Lkotlin/Pair;

    move-result-object p1

    invoke-static {p1}, Lic4;->m([Lkotlin/Pair;)Landroid/os/Bundle;

    move-result-object p1

    if-eqz p0, :cond_4a

    const-string p4, "esim_destination"

    invoke-virtual {p1, p4, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_4a
    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, p5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const-string p1, "DESTINATION_VIEW_ID"

    const/16 p3, 0x2d

    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "ACTION_DESTINATION_VIEW"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_66
    return-void

    :pswitch_67
    sget-object p0, Lg8f;->a:Lg8f;

    if-ne p6, p0, :cond_75

    new-instance p0, Lh22;

    check-cast p4, Ll1b;

    invoke-direct {p0, p4}, Lh22;-><init>(Ll1b;)V

    invoke-static {p2, p0}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    :cond_75
    return-void

    :pswitch_76
    sget-object p0, Lg8f;->a:Lg8f;

    if-ne p6, p0, :cond_f8

    const-string p0, "q"

    invoke-interface {p4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string p1, "s"

    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p0, :cond_e6

    if-eqz p1, :cond_e6

    sget-object p3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p2

    iget-object p2, p2, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_a6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_b8

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    move-object p4, p3

    check-cast p4, Leri;

    instance-of p4, p4, Ll42;

    if-eqz p4, :cond_a6

    goto :goto_b9

    :cond_b8
    const/4 p3, 0x0

    :goto_b9
    check-cast p3, Leri;

    instance-of p2, p3, Ll42;

    if-eqz p2, :cond_f8

    move-object p2, p3

    check-cast p2, Ll42;

    invoke-virtual {p2, p0, p1}, Ll42;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p2, Ll6e;->d:Ljava/lang/String;

    const/4 p2, 0x1

    invoke-static {p2, p1, p0}, Lzg;->o(ILjava/lang/String;Ljava/lang/String;)Lzg;

    move-result-object p0

    if-eqz p0, :cond_f8

    sget-object p1, Lp6l;->a:Lp6l;

    sget-object p4, Lcti;->a:Lhv5;

    invoke-static {p0, p3, p4, p1}, Lcti;->a(Lzg;Leri;Lbti;Lp6l;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Llqm;->r:Llqm;

    invoke-static {p0, p1, p2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    new-instance p1, Lay3;

    invoke-direct {p1, p0}, Lay3;-><init>(Lvx3;)V

    invoke-static {p1}, Lac8;->b(Ljava/lang/Object;)V

    goto :goto_f8

    :cond_e6
    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, p5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "ACTION_SHOW_OMNIBAR_WITH_ASK_AI"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_f8
    :goto_f8
    return-void

    nop

    :pswitch_data_fa
    .packed-switch 0x0
        :pswitch_76
        :pswitch_67
    .end packed-switch
.end method

.method public b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 6

    iget-byte p0, p0, Lny0;->a:B

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_66

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->v:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldp6;

    invoke-virtual {p0}, Ldp6;->b()Lole;

    move-result-object p0

    invoke-virtual {p0}, Lole;->t()Lf99;

    move-result-object p0

    invoke-static {p0, p3}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_23
    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance p2, Lwr;

    const/4 v1, 0x3

    invoke-direct {p2, p1, v0, v1}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p0, p2, p3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_34
    const-string p0, "q"

    invoke-virtual {p2, p0}, Ll1b;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_55

    const-string p0, "s"

    invoke-virtual {p2, p0}, Ll1b;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_55

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance p2, Lwr;

    const/4 v1, 0x1

    invoke-direct {p2, p1, v0, v1}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p0, p2, p3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_65

    :cond_55
    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance p2, Lwr;

    const/4 v1, 0x2

    invoke-direct {p2, p1, v0, v1}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p0, p2, p3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    :goto_65
    return-object p0

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_34
        :pswitch_23
    .end packed-switch
.end method

.method public d(Ll1b;)Ls88;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method
