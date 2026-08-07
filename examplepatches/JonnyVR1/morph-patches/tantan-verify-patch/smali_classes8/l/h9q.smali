.class public final synthetic Ll/h9q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iput-object p2, p0, Ll/h9q;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p3, p0, Ll/h9q;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iput-boolean p4, p0, Ll/h9q;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iget-object v1, p0, Ll/h9q;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object v2, p0, Ll/h9q;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iget-boolean p0, p0, Ll/h9q;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->D(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Z)V

    return-void
.end method
