.class public final synthetic Ll/pq6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Ljava/lang/String;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pq6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    iput-object p2, p0, Ll/pq6;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pq6;->c:Ll/x20;

    iput-object p4, p0, Ll/pq6;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pq6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    iget-object v1, p0, Ll/pq6;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/pq6;->c:Ll/x20;

    iget-object p0, p0, Ll/pq6;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->S0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Ljava/lang/String;Ll/x20;Ll/x20;)V

    return-void
.end method
