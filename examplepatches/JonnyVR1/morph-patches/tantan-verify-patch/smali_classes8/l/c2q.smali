.class public final synthetic Ll/c2q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;

    check-cast p1, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemAiChatGuideMessage;Lcom/p1/mobile/putong/core/data/AIChatAnalysis;)V

    return-void
.end method
