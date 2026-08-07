.class public final synthetic Ll/r8q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r8q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iput-object p2, p0, Ll/r8q;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p3, p0, Ll/r8q;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r8q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iget-object v1, p0, Ll/r8q;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object p0, p0, Ll/r8q;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->E(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method
