.class public final synthetic Ll/tbk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iput-object p2, p0, Ll/tbk;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iget-object p0, p0, Ll/tbk;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->K(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method
