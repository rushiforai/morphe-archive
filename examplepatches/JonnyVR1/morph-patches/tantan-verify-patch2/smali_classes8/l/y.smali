.class public final synthetic Ll/y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;->c(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatMessageAnalysisItem;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
