.class public final synthetic Ll/e9q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

.field public final synthetic b:Ll/clz;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/ChatGroupMember;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iput-object p2, p0, Ll/e9q;->b:Ll/clz;

    iput-object p3, p0, Ll/e9q;->c:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p4, p0, Ll/e9q;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/e9q;->e:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iget-object v1, p0, Ll/e9q;->b:Ll/clz;

    iget-object v2, p0, Ll/e9q;->c:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object v3, p0, Ll/e9q;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/e9q;->e:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->n(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method
