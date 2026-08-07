.class public final synthetic Ll/wzq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wzq;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wzq;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->e(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    return-void
.end method
