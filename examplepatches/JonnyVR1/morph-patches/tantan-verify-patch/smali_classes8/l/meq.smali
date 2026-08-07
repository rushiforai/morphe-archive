.class public final synthetic Ll/meq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/meq;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/meq;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/meq;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/meq;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/meq;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/meq;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/meq;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/meq;->d:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->e(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
