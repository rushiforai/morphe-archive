.class public Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const-string v0, "e_sys_phone_auth_popup_allowed_button"

    .line 2
    .line 3
    const-string v1, "p_sys_phone_auth_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public b(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "on"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "off"

    .line 7
    .line 8
    :goto_0
    const-string v0, "no_longer_ask"

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    filled-new-array {p1}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "e_sys_phone_auth_popup_denied_button"

    .line 19
    .line 20
    const-string v1, "p_sys_phone_auth_popup_view"

    .line 21
    .line 22
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
