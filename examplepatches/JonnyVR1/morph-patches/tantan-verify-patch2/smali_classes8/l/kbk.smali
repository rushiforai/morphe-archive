.class public final synthetic Ll/kbk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iput-object p2, p0, Ll/kbk;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iput-boolean p3, p0, Ll/kbk;->c:Z

    iput-object p4, p0, Ll/kbk;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kbk;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    iget-object v1, p0, Ll/kbk;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iget-boolean v2, p0, Ll/kbk;->c:Z

    iget-object p0, p0, Ll/kbk;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->M(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;)V

    return-void
.end method
