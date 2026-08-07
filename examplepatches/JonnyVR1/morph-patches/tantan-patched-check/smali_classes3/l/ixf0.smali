.class public final synthetic Ll/ixf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ixf0;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    iput-object p2, p0, Ll/ixf0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ixf0;->a:Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    iget-object p0, p0, Ll/ixf0;->b:Ll/x20;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->a(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;Ll/x20;)V

    return-void
.end method
