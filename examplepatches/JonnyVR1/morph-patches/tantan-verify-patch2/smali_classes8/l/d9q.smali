.class public final synthetic Ll/d9q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

.field public final synthetic b:Ll/clz;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;ZLcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iput-object p2, p0, Ll/d9q;->b:Ll/clz;

    iput-boolean p3, p0, Ll/d9q;->c:Z

    iput-object p4, p0, Ll/d9q;->d:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iput-object p5, p0, Ll/d9q;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/d9q;->f:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/d9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iget-object v1, p0, Ll/d9q;->b:Ll/clz;

    iget-boolean v2, p0, Ll/d9q;->c:Z

    iget-object v3, p0, Ll/d9q;->d:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iget-object v4, p0, Ll/d9q;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/d9q;->f:Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;ZLcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
