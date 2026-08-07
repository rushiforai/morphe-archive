.class public final synthetic Ll/bc6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bc6;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bc6;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    check-cast p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->u(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;Lcom/p1/mobile/putong/core/data/InsertConversationUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
