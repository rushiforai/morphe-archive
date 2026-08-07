.class public final synthetic Ll/lfw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nfw;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GreetingItem;


# direct methods
.method public synthetic constructor <init>(Ll/nfw;Lcom/p1/mobile/putong/core/data/GreetingItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lfw;->a:Ll/nfw;

    iput-object p2, p0, Ll/lfw;->b:Lcom/p1/mobile/putong/core/data/GreetingItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lfw;->a:Ll/nfw;

    iget-object p0, p0, Ll/lfw;->b:Lcom/p1/mobile/putong/core/data/GreetingItem;

    check-cast p1, Lcom/p1/mobile/putong/data/Detect;

    invoke-static {v0, p0, p1}, Ll/nfw;->e0(Ll/nfw;Lcom/p1/mobile/putong/core/data/GreetingItem;Lcom/p1/mobile/putong/data/Detect;)V

    return-void
.end method
