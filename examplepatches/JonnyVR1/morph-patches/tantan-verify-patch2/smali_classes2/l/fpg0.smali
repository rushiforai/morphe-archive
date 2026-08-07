.class public final Ll/fpg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/a/a$a;


# instance fields
.field public final synthetic a:Ll/pgg0;


# direct methods
.method public constructor <init>(Ll/pgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fpg0;->a:Ll/pgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string p1, "WXGame"

    .line 2
    .line 3
    const-string v0, "\u89e6\u53d1\u4e86\uff1aGameViewOnAttachedToWindowReload"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/fpg0;->a:Ll/pgg0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/pgg0;->h:Ll/qkg0;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/qkg0;->a:Ll/mzg0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/mzg0;->h:Ll/slg0;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    check-cast p0, Ll/wyg0;

    .line 21
    .line 22
    iget-object p0, p0, Ll/wyg0;->m:Ll/bfg0;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->getUIHandler()Landroid/os/Handler;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/dug0;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/dug0;-><init>(Ll/bfg0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
