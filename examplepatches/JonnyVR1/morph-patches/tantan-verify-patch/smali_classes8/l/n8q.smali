.class public final synthetic Ll/n8q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

.field public final synthetic b:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n8q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iput-object p2, p0, Ll/n8q;->b:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n8q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    iget-object p0, p0, Ll/n8q;->b:Ll/clz;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->r(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method
