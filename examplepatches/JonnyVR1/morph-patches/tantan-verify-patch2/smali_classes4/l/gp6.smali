.class public final synthetic Ll/gp6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gp6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->C0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Lrx/Notification;)V

    return-void
.end method
