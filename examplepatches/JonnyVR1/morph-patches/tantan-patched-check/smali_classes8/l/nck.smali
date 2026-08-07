.class public final synthetic Ll/nck;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nck;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    iput-object p2, p0, Ll/nck;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nck;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    iget-object p0, p0, Ll/nck;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
