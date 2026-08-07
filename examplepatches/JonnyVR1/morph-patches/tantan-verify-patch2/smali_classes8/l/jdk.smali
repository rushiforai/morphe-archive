.class public final synthetic Ll/jdk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;

    iput-object p2, p0, Ll/jdk;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jdk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;

    iget-object p0, p0, Ll/jdk;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->e(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
