.class public final synthetic Ll/q9q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Ljava/lang/String;Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    iput-object p2, p0, Ll/q9q;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/q9q;->c:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q9q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    iget-object v1, p0, Ll/q9q;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/q9q;->c:Ll/clz;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->L0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;Ljava/lang/String;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method
