.class public Ll/jz20;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/x20;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/jz20;->a:Ll/x20;

    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/x20;
    .locals 1

    .line 1
    sget-object v0, Ll/jz20;->a:Ll/x20;

    .line 2
    .line 3
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;->b2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    sget p1, Ll/z7c0;->h:I

    .line 25
    .line 26
    sget v0, Ll/z7c0;->c:I

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {p0, p1}, Ll/sx20;->I(Lcom/p1/mobile/android/app/Act;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/hpo;->F(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sput-object p2, Ll/jz20;->a:Ll/x20;

    .line 16
    .line 17
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;->a2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    sget p1, Ll/z7c0;->h:I

    .line 25
    .line 26
    sget p2, Ll/z7c0;->c:I

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {p0, p1, p2}, Ll/sx20;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
