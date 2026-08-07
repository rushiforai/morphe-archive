.class public final synthetic Ll/q290;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q290;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;

    iput-object p2, p0, Ll/q290;->b:Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q290;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;

    iget-object p0, p0, Ll/q290;->b:Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;Ljava/lang/Boolean;)V

    return-void
.end method
