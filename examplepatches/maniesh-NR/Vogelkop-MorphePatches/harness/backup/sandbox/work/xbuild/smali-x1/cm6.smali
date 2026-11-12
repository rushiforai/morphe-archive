.class public final Lcm6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh8f;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lnx1;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcm6;->a:Ljava/lang/String;

    new-instance p1, Lnx1;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lnx1;-><init>(B)V

    iput-object p1, p0, Lcm6;->b:Lnx1;

    return-void
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 7

    iget-object p1, p0, Lcm6;->b:Lnx1;

    invoke-virtual {p1, p2}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lyl6;

    invoke-virtual {p3}, Lyl6;->g()Z

    move-result p3

    if-eqz p3, :cond_40

    invoke-virtual {p1, p2}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyl6;

    invoke-virtual {p1}, Lyl6;->f()Z

    move-result p1

    if-nez p1, :cond_38

    sget-object p1, Lg8f;->a:Lg8f;

    if-ne p6, p1, :cond_37

    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string p3, "android.intent.action.MAIN"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "android.intent.category.LAUNCHER"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    iget-object p0, p0, Lcm6;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, p5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_37
    return-void

    :cond_38
    new-instance p0, Leva;

    const-string p1, "Already active"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_40
    new-instance p0, Leva;

    const-string p1, "Not supported"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Lcm6;->b:Lnx1;

    invoke-virtual {p0, p1}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyl6;

    invoke-virtual {p0}, Lyl6;->g()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lkk6;)Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Lcm6;->b:Lnx1;

    invoke-virtual {p0, p1}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyl6;

    invoke-virtual {p0}, Lyl6;->f()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
