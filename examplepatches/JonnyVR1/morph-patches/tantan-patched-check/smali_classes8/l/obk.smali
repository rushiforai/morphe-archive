.class public final synthetic Ll/obk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/obk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iput-object p2, p0, Ll/obk;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/obk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iget-object p0, p0, Ll/obk;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->i(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V

    return-void
.end method
