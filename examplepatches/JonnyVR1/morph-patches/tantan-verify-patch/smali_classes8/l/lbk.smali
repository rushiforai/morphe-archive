.class public final synthetic Ll/lbk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method
