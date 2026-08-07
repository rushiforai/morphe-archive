.class public final synthetic Ll/ao6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ao6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ao6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->C(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)V

    return-void
.end method
