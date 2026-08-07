.class public final synthetic Ll/un6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/un6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/un6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    check-cast p1, Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
