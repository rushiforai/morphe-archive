.class public final synthetic Ll/p290;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;

.field public final synthetic c:Ll/jic0;

.field public final synthetic d:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p290;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;

    iput-object p2, p0, Ll/p290;->b:Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;

    iput-object p3, p0, Ll/p290;->c:Ll/jic0;

    iput-object p4, p0, Ll/p290;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p290;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;

    iget-object v1, p0, Ll/p290;->b:Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;

    iget-object v2, p0, Ll/p290;->c:Ll/jic0;

    iget-object p0, p0, Ll/p290;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescChatListItem;Lcom/p1/mobile/putong/core/data/PrivilegeTopChat;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V

    return-void
.end method
