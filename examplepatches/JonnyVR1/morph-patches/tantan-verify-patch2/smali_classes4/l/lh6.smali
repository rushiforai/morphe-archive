.class public final synthetic Ll/lh6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lh6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iput-object p2, p0, Ll/lh6;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lh6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    iget-object p0, p0, Ll/lh6;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->C(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
