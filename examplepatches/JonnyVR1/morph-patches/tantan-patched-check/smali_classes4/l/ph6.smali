.class public final synthetic Ll/ph6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ph6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iput-object p2, p0, Ll/ph6;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/ph6;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    iput-object p4, p0, Ll/ph6;->d:Ll/y20;

    iput-object p5, p0, Ll/ph6;->e:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p6, p0, Ll/ph6;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ph6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iget-object v1, p0, Ll/ph6;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/ph6;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    iget-object v3, p0, Ll/ph6;->d:Ll/y20;

    iget-object v4, p0, Ll/ph6;->e:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v5, p0, Ll/ph6;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Ll/pf60;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->m(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ll/pf60;)V

    return-void
.end method
