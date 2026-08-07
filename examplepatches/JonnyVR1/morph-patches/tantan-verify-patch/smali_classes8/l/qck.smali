.class public final synthetic Ll/qck;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

.field public final synthetic c:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qck;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    iput-object p2, p0, Ll/qck;->b:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    iput-object p3, p0, Ll/qck;->c:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qck;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    iget-object v1, p0, Ll/qck;->b:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    iget-object p0, p0, Ll/qck;->c:Lcom/p1/mobile/putong/data/BubbleInfo;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->d(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V

    return-void
.end method
