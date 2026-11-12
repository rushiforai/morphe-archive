.class public final Las9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr03;


# virtual methods
.method public final a(Landroid/content/Context;Lzcl;Lbx7;)Z
    .registers 5

    iget-object p0, p2, Lzcl;->b:Landroid/os/PersistableBundle;

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p2, p0}, Landroid/os/BaseBundle;->putAll(Landroid/os/PersistableBundle;)V

    new-instance p0, Lwu5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2, p0}, Les9;->a(Ljava/lang/Object;Lcs9;)Les9;

    move-result-object p0

    const/4 p2, 0x0

    if-nez p0, :cond_17

    return p2

    :cond_17
    sget-object p3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    check-cast p3, Lcom/opera/android/OperaApplication;

    iget-object p3, p3, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez p3, :cond_24

    const/4 p3, 0x0

    :cond_24
    invoke-static {p1, p3}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance p3, Lwt2;

    const/4 v0, 0x5

    invoke-direct {p3, p0, v0}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p3}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return p2
.end method

.method public final b(Landroid/content/Context;Lzcl;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method
