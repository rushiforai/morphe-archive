.class public final synthetic Ll/r1q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r1q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    iput-object p2, p0, Ll/r1q;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r1q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    iget-object p0, p0, Ll/r1q;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
