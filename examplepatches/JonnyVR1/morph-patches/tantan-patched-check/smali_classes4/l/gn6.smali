.class public final synthetic Ll/gn6;
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

    iput-object p1, p0, Ll/gn6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gn6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->t2()V

    return-void
.end method
