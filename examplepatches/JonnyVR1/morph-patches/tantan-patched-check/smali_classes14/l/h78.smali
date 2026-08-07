.class public final synthetic Ll/h78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h78;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p2, p0, Ll/h78;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h78;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object p0, p0, Ll/h78;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->qc(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
