.class public final synthetic Ll/am7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/am7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/am7;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/am7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/am7;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/e;->g5(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method
